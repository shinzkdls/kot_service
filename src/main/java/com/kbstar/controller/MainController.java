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
        List e = element.select("div.cell_temperature").select("span.highest");

        weather.put("date",(a.get(0).toString().replaceAll("<[^>]+>", "").substring(0, 4)));
        weather.put("rain",(b.get(0).toString().replaceAll("<[^>]+>", "")));
        weather.put("desc",(c.get(0).toString().replaceAll("<[^>]+>", "")));
        weather.put("lowest",(d.get(0).toString().replaceAll("<[^>]+>", "")));
        weather.put("highest",(e.get(0).toString().replaceAll("<[^>]+>", "")));
        if(pa.equals("pa")) {
            RecipeBasic recipeBasic = null;
            recipeBasic = recipeService.get(20204);
            model.addAttribute("recipeBasic", recipeBasic);
        }
// 네이버 날씨 크롤링 end

// 레시피 랭킹
        List<RecipeBasic> recipeRanking =recipeService.ranking();
        List<ClassBasic> classList =classService.latestClass();
        List<RecipeBasic> recipeList =recipeService.latestRecipe();
        List<RecipeBasic> subscribeList =recipeService.subscribeRecipe();
// 레시피 랭킹 end

        model.addAttribute("center", "center");
        model.addAttribute("classList", classList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("subscribeList", subscribeList);
        model.addAttribute("recipeRanking", recipeRanking);
        model.addAttribute("weather", weather);
        return "index";
    }
}

