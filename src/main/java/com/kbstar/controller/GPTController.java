package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/gpt")
public class GPTController {
    @Value("${chatgpt.api-key}")
    String key;

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","gpt");
        model.addAttribute("key", key);
        return "index";
    }
}
