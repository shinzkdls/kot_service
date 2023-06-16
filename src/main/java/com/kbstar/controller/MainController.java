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
//        네이버 날씨 크롤링
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
        List c= element.select("div.cell_weather").select("span.blind");
        List<String> icon = new ArrayList<>();
        List<String> date = new ArrayList<>();
        List<String> rain = new ArrayList<>();
        List<String> desc = new ArrayList<>();
        for (int i = 0; i <3; i++) {
            date.add(a.get(i).toString().replaceAll("<[^>]+>", "").substring(0, 5)+"오전");
            date.add(a.get(i).toString().replaceAll("<[^>]+>", "").substring(0, 5)+"오후");
        };
        for (int i = 0; i <6; i++) {
            rain.add(b.get(i).toString().replaceAll("<[^>]+>", ""));
            desc.add(c.get(i).toString().replaceAll("<[^>]+>", ""));

            switch (c.get(i).toString().replaceAll("<[^>]+>", "")) {
                case "맑음":
                    icon.add("sun");
                    break;
                case "흐림":
                    icon.add("cloud");
                    break;
                case "구름많음":
                    icon.add("clouds");
                    break;
                case "구름많고 한때 소나기":
                    icon.add("cloud-showers");
                    pa="pa";
                    break;
                case "소나기":
                    icon.add("cloud-showers");
                    pa="pa";
                    break;
                case "천둥번개":
                    icon.add("bolt");
                    break;
                case "안개":
                    icon.add("cloud-fog");
                    break;
                case "눈":
                    icon.add("snowflake");
                    break;
                case "비":
                    icon.add("cloud-showers");
                    pa="pa";
                    break;
                default:
                    icon.add("sun");
                    break;
            }
        }
        weather.put("date",date);
        weather.put("rain",rain);
        weather.put("desc",desc);
        weather.put("icon",icon);
        if(pa.equals("pa")) {
            RecipeBasic recipeBasic = null;
            recipeBasic = recipeService.get(20204);
            model.addAttribute("recipeBasic", recipeBasic);
        }

//        네이버 날씨 크롤링 end
//        레시피 랭킹
        List<RecipeBasic> recipeRanking =recipeService.ranking();
        List<ClassBasic> classList =classService.latestClass();
        List<RecipeBasic> recipeList =recipeService.latestRecipe();
        List<RecipeBasic> subscribeList =recipeService.subscribeRecipe();

//        레시피 랭킹 end


        model.addAttribute("center", "center");
        model.addAttribute("classList", classList);
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("subscribeList", subscribeList);
        model.addAttribute("recipeRanking", recipeRanking);
        model.addAttribute("weather", weather);
        return "index";
    }

}

