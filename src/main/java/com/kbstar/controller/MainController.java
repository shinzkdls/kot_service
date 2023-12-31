package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.ClassBasic;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Notice;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.service.ClassService;
import com.kbstar.service.GoodlistService;
import com.kbstar.service.NoticeService;
import com.kbstar.service.RecipeService;
import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Slf4j
@Controller
public class MainController {

    @Autowired
    RecipeService recipeService;
    @Autowired
    ClassService classService;
    @Autowired
    ChatgptService chatgptService;
    @Autowired
    NoticeService noticeService;
    @Autowired
    GoodlistService goodlistService;

    @RequestMapping("/")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, HttpSession session) throws Exception {

        // 네이버 날씨 크롤링
        String url = "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=서울날씨";
        Document doc = null;
        HashMap<String, Object> weather = new HashMap<>();
        String pa="";
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Elements element = doc.select("ul.week_list");
        List a = element.select("span.date");
        List b = element.select("span.rainfall");
        List c = element.select("div.cell_weather").select("span.blind");
        List d = element.select("div.cell_temperature").select("span.lowest");
        List dd = element.select("div.cell_temperature").select("span.highest");

        weather.put("date",(a.get(0).toString().replaceAll("<[^>]+>", "").substring(0, 4)));
        weather.put("rain",(b.get(0).toString().replaceAll("<[^>]+>", "")));
        weather.put("desc",(c.get(0).toString().replaceAll("<[^>]+>", "")));
        weather.put("lowest",(d.get(0).toString().replaceAll("<[^>]+>", "").substring(4, 7)));
        weather.put("highest",(dd.get(0).toString().replaceAll("<[^>]+>", "").substring(4, 7)));

        // 강수확률 70 이상시, 파전 recipe 출력 || 최고온도 28도 이상시, 빙수&아이스바 출력
        // 그 외에는 파전, 빙수, 아이스바 제외한 레시피 랜덤 출력
        String rainValue = (String) weather.get("rain");
        String highestValue = (String) weather.get("highest");
        rainValue = rainValue.replaceAll("%", "");
        highestValue = highestValue.replaceAll("°", "");

        try {
            int rain = Integer.parseInt(rainValue);
            int highest = Integer.parseInt(highestValue);
            if (rain >= 70) {
                RecipeBasic recipeBasic = null;
                recipeBasic = recipeService.get(20229);
                model.addAttribute("recipeBasic", recipeBasic);
            } else if (highest > 28) {
                List<RecipeBasic> allRecipes = recipeService.get();
                List<RecipeBasic> filteredRecipes = allRecipes.stream()
                        .filter(recipe -> recipe.getRecipepin() == 20244 || recipe.getRecipepin() == 20261)
                        .collect(Collectors.toList());
                Random random = new Random();
                int randomIndex = random.nextInt(filteredRecipes.size());
                RecipeBasic recipeBasic = filteredRecipes.get(randomIndex);
                model.addAttribute("recipeBasic", recipeBasic);
            } else {
                List<RecipeBasic> allRecipes = recipeService.get();
                List<RecipeBasic> filteredRecipes = allRecipes.stream()
                        .filter(recipe -> recipe.getRecipepin() != 20229 || recipe.getRecipepin() != 20244 || recipe.getRecipepin() != 20261)
                        .collect(Collectors.toList());
                Random random = new Random();
                int randomIndex = random.nextInt(filteredRecipes.size());
                RecipeBasic recipeBasic = filteredRecipes.get(randomIndex);
                model.addAttribute("recipeBasic", recipeBasic);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        // 네이버 날씨 크롤링 end

        // 레시피 랭킹
        List<RecipeBasic> recipeRanking = recipeService.ranking();
        List<ClassBasic> classList = classService.latestClass();
        List<RecipeBasic> recipeList = recipeService.latestRecipe();
        List<RecipeBasic> subscribeList = null;
        Cust logincust = (Cust) session.getAttribute("logincust");

        if (logincust != null) {
        subscribeList = recipeService.subscribeRecipe(logincust.getCustpin());}
        // 레시피 랭킹 end

        // notice
        PageInfo<Notice> p;
        try {
            p = new PageInfo<>(noticeService.getPage(pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        // notice end

        //log.info("------------------------------");
        //log.info("Weather date: {}", weather.get("date"));
        //log.info("Weather desc: {}", weather.get("desc"));
        //log.info("Weather desc: {}", weather.get("highest"));
        model.addAttribute("center", "center");
        model.addAttribute("classList", classList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("subscribeList", subscribeList);
        model.addAttribute("recipeRanking", recipeRanking);
        model.addAttribute("nlist", p);
        model.addAttribute("weather", weather);
        return "index";
    }



    @RequestMapping("/gptchatbot")
    public String gptchatbot(Model model) throws Exception {
        model.addAttribute("center", "gptchatbot");
        return "index";
    }

    @RequestMapping("/gptchatting")
    @ResponseBody
    public Object gptchatting(String question) throws Exception {
        log.info("챗지티피 시작하자!!");
        String answer ="";
        try {
            answer = chatgptService.sendMessage(question + "20자 이내로 답변줘");
        } catch (Exception e){
            e.printStackTrace();
        }
        log.info("============= 대답 출력: ");
        log.info(answer);
        String imageUrl = chatgptService.imageGenerate("boy");
        log.info(imageUrl);  // image url

        JSONArray ja = new JSONArray();
        JSONObject jo = new JSONObject();

        jo.put("question", question);
        jo.put("answer", answer);
        ja.add(jo);

        return ja;
    }
}

