package com.kbstar.controller;

import com.kbstar.dto.ClassBasic;
import com.kbstar.dto.Ncp;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
public class NcpController {
    @Value("${uploadimgdir}")
    String imgpath;

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, HttpSession session, Ncp ncp) throws ParseException {
        ClassBasic classBasic = null;

        // img 저장
        FileUploadUtil.saveOcrFile(ncp.getImg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData(result);
        log.info(map.values().toString());

        model.addAttribute("result", map);
        model.addAttribute("center", "ocr");
        return "redirect:/cookingclass/detail";
    }
}

