package com.kbstar.controller;

import com.kbstar.dto.ClassBasic;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.service.ClassService;
import com.kbstar.service.RecipeService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/")
    public String main(Model model) throws Exception {
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

        // 강수량 60 이상시, 파전 recipe 출력. 그 외에는 파전 제외한 레시피 랜덤 출력
        String rainValue = (String) weather.get("rain");
        rainValue = rainValue.replaceAll("%", "");

        try {
            int rain = Integer.parseInt(rainValue);
            if (rain >= 60) {
                RecipeBasic recipeBasic = null;
                recipeBasic = recipeService.get(20204);
                model.addAttribute("recipeBasic", recipeBasic);
            } else {
                List<RecipeBasic> allRecipes = recipeService.get();
                List<RecipeBasic> filteredRecipes = allRecipes.stream()
                        .filter(recipe -> recipe.getRecipepin() != 20204)
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
        List<RecipeBasic> subscribeList = recipeService.subscribeRecipe();
        // 레시피 랭킹 end
        log.info("------------------------------");
        log.info("Weather date: {}", weather.get("date"));
        log.info("Weather desc: {}", weather.get("desc"));
        model.addAttribute("center", "center");
        model.addAttribute("classList", classList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("subscribeList", subscribeList);
        model.addAttribute("recipeRanking", recipeRanking);
        model.addAttribute("weather", weather);
        return "index";
    }
}

