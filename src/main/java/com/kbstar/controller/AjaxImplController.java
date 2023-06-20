package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import com.kbstar.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class AjaxImplController {

    @Autowired
    CustService custService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Value("${uploadimgdir}")
    String imgdir;

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


}
