package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.*;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.PushNotificationUtil;
import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

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
        model.addAttribute("center", dir + "howToUse");
        return "index";
    }
    @RequestMapping("/chatGPT")
    public String chatGPT(Model model) {
        model.addAttribute("center", dir + "chatGPT");
        return "chatGPT";
    }

}

