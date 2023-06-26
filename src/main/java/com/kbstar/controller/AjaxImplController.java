package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Ncp;
import com.kbstar.service.CustService;
import com.kbstar.util.ChatbotUtil;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@Slf4j
public class AjaxImplController {
    @Autowired
    ChatgptService chatgptService;

    @Autowired
    CustService custService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Value("${uploadimgdir}")
    String imgdir;
    @Value("${uploadimgdir}")
    String imgpath;

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;
        Cust cust = null;
        cust = custService.get(id);
        if (cust != null) {
            result = 1;
        }
        return result;
    }

    @RequestMapping("/loginimpl")
    public Object loginimpl(String custid, String password) throws Exception {
        int result = 0;
        Cust cust = null;
        cust = custService.get(custid);
        if (cust != null && encoder.matches(password, cust.getPassword())) {
            result = 1;
        }
        return result;
    }

    @RequestMapping("/saveimg")
    public String saveimg(MultipartFile file){
        String filename = file.getOriginalFilename();
        FileUploadUtil.saveProfFile(file, imgdir);
        return filename;
    }
    @RequestMapping("/askToGPT")
    public String askToGPT(String q){
        log.info(q);
        String str = chatgptService.sendMessage(q);
        log.info("------------------------------------");
        log.info(str);
        return str;
    }

    @RequestMapping("/ocrimpl")
    public Object ocrimpl(Model model, HttpSession session, Ncp ncp) throws ParseException {
        //System.out.println("getimg-------------------------------");
        //System.out.println(ncp.getBizimg());
        // img 저장
        FileUploadUtil.saveOcrFile(ncp.getBizimg(), imgpath);
        // NCP 에 요청
        String imgname = ncp.getBizimg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData(result);
        return map;
    }

}
