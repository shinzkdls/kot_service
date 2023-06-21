package com.kbstar.controller;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.ParseException;


@Slf4j
@Controller
@SpringBootTest
@RequestMapping("/gpt")
public class GPTController {
    @Value("${chatgpt.api-key}")
    String key;
    @Autowired
    ChatgptService chatgptService;

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","gpt");
        model.addAttribute("key", key);
        return "index";
    }

    public void contextLoads() throws ParseException {
        chatgptService.sendMessage("한국에서 가장 유명한것이 뭐니");
    }
}
