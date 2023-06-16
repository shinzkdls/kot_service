package com.kbstar.controller;

import com.kbstar.dto.Magic;
import com.kbstar.service.MagicService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Random;

@Slf4j
@Controller
@RequestMapping("/magic")
public class MagicConchShellController {
    @Value("${key}")
    String key;
    @Autowired
    MagicService magicService;

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","magicConchShell");
        model.addAttribute("key",key);
        return "index";
    }

    @RequestMapping("/ajax")
    @ResponseBody
    public JSONObject Ajax() throws Exception {
        JSONObject jo = new JSONObject();
        List<Magic> list=magicService.getMagic();

        Random r = new Random();
        Magic result =list.get(r.nextInt(list.size())); //가져온 magic 중 하나 랜덤 지정
        jo.put("title",result.getTitle());

        String url = (result.getType().equals("c")) ? //클래스인지 레시피인지 구분해서 url 생성
                ("/cookingclass/detail?classpin="+result.getPin()) : ("/recipe/detail?recipepin="+result.getPin());
        jo.put("url",url);

        return jo;
    }
}
