package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {
    String dir = "chat/";


    @RequestMapping("/chatWithAdmin")
    public String chatWithAdmin(Model model) {
        model.addAttribute("center", dir + "chatWithAdmin");
        return "index";
    }
    @RequestMapping("/howToUse")
    public String howToUse(Model model) {
        // model.addAttribute("center", dir + "howToUse");
        return "chat/howToUse";
    }
    @RequestMapping("/chatGPT")
    public String chatGPT(Model model) {
        return "chat/chatGPT";
    }

}

