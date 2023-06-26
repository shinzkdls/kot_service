package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
public class NcpController {
    @Value("${uploadimgdir}")
    String imgpath;

//    @RequestMapping("/ocrimpl")
//    public String ocrimpl(Model model, HttpSession session, Ncp ncp) throws ParseException {
//        // img 저장
//        FileUploadUtil.saveOcrFile(ncp.getBizimg(), imgpath);
//        // NCP 에 요청
//        String imgname = ncp.getBizimg().getOriginalFilename();
//        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
//        Map map = OCRUtil.getData(result);
//        //log.info(map.values().toString());
//        model.addAttribute("result", map);
//        model.addAttribute("center", "cookingclass/add");
//        return "index";
//    }
}



