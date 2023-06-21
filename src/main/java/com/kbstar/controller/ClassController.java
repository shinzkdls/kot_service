package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.*;
import com.kbstar.util.FileUploadUtil;
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
@RequestMapping("/cookingclass")
public class ClassController {
    String dir = "cookingclass/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    ClassService classService;
    @Autowired
    ClassCommentService commentService;
    @Autowired
    CustService custService;
    @Autowired
    ClassJoinInfoService classJoinInfoService;
    @Autowired
    PaymentService paymentService;


    @RequestMapping("/class")
    public String get(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, ClassBasic classBasic) throws Exception {
        PageInfo<ClassBasic> c;
        try {
            c = new PageInfo<>(classService.getPage(pageNo, classBasic), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", c);
        model.addAttribute("sortinfo", classBasic);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, ClassBasic classBasic) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping(value = "/addImpl")
    public String addImpl(Model model,
                          ClassBasic classBasic,
                          String zipcode, String address1, String address2,
                          MultipartFile img) throws Exception {
        classBasic.setAddress(address1 + " " + address2 + " (" + zipcode + ")");
        classService.register(classBasic);
        FileUploadUtil.saveFile(img, imgdir, classService.pingetter() + "_thumb.jpg");
        model.addAttribute("center", dir + "add");
        return "index";
    }


    @RequestMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String classtitle) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        try {
            c = new PageInfo<>(classService.getSearch(pageNo, classtitle), 5);
            clist = c.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("classtitle", classtitle);
        model.addAttribute("center", dir + "class");
        return "index";
    }

//    @RequestMapping("/searchlocation")
//    public String searchlocation(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String location) throws Exception {
//        PageInfo<ClassBasic> c;
//        List<ClassBasic> clist;
//        try {
//            if (location != null && location.equals("*")) {
//                clist = classService.get();
//                c = new PageInfo<>(clist, 5);
//            } else {
//                c = new PageInfo<>(classService.getLocation(pageNo, location), 5);
//                clist = c.getList();
//            }
//        } catch (Exception e) {
//            throw new Exception(e.getMessage());
//        }
//        model.addAttribute("target", "class");
//        model.addAttribute("clist", clist);
//        model.addAttribute("cpage", c);
//        model.addAttribute("location", location);
//        model.addAttribute("center", dir + "class");
//        return "index";
//    }
//
//    @RequestMapping("/searchtype")
//    public String searchtype(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String type) throws Exception {
//        PageInfo<ClassBasic> c;
//        List<ClassBasic> clist;
//        try {
//            if (type != null && type.equals("*")) {
//                clist = classService.get();
//                c = new PageInfo<>(clist, 5);
//            } else {
//                c = new PageInfo<>(classService.getLocation(pageNo, type), 5);
//                clist = c.getList();
//            }
//        } catch (Exception e) {
//            throw new Exception(e.getMessage());
//        }
//        model.addAttribute("target", "class");
//        model.addAttribute("clist", clist);
//        model.addAttribute("cpage", c);
//        model.addAttribute("type", type);
//        model.addAttribute("center", dir + "class");
//        return "index";
//    }

    @RequestMapping("/searchlocationtype")
    public String searchlocationtype(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String location, String type, String sort) throws Exception {
        log.info("aaaaaaaaaaaaa 로 들어옴 ");
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        log.info("----------------------------" + sort);
        try {
            c = new PageInfo<>(classService.getPage_category(pageNo, location, type, sort), 5);
            clist = c.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("location", location);
        model.addAttribute("type", type);
        model.addAttribute("sort", sort);
        model.addAttribute("center", dir + "class");
        return "index";
    }


    @RequestMapping("/detail")
    public String get(Model model, Integer classpin) throws Exception {
        ClassBasic classBasic = null;
        List<ClassComment> comment = null;
        classBasic = classService.get(classpin);
        Cust classcust = custService.get(classBasic.getCustid());
        comment = commentService.getClassAllComment(classpin);
        model.addAttribute("classdetail", classBasic);
        model.addAttribute("classComment", comment);
        model.addAttribute("classcust", classcust);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/commentImpl")
    public String commentImpl(Model model, ClassComment classComment, HttpSession session) throws Exception {
        try {
            commentService.register(classComment);
        } catch (Exception e) {
            throw new Exception("등록 오류");
        }
        return "redirect:/cookingclass/detail?classpin=" + classComment.getClasspin();
    }

    @RequestMapping("/commentDel")
    public String commentDel(ClassComment classComment, ClassBasic classBasic) throws Exception {
        commentService.remove(classComment.getClasscommentpin());
        return "redirect:/cookingclass/detail?classpin=" + classBasic.getClasspin();
    }

    @RequestMapping("/mapImpl")
    public String mapImpl(Model model, HttpSession session) throws Exception {
        ClassBasic classBasic = null;
        model.addAttribute("address", classBasic.getAddress());
        return "redirect:/cookingclass/detail";
    }

    @RequestMapping("/joinImpl")
    public String joinImpl(HttpSession session, Integer classpinJoin, Integer custpinJoin, String joinstatus,
                           Integer amount, String paymentstatus) throws Exception {
        try {
            ClassJoinInfo cji = new ClassJoinInfo();
            cji.setClasspin(classpinJoin);
            cji.setCustpin(custpinJoin);
            cji.setJoinstatus(joinstatus);
            classJoinInfoService.register(cji);

            Payment payment = new Payment();
            payment.setClasspin(classpinJoin);
            payment.setCustpin(custpinJoin);
            payment.setAmount(amount);
            payment.setPaymentstatus(paymentstatus);
            paymentService.register(payment);
        } catch (Exception e) {
            throw new Exception("클래스 신청에 실패하였습니다.");
        }
        return "redirect:/";
    }

//    @RequestMapping("/ocrimpl")
//    public String ocrimpl(Model model, Ncp ncp) throws ParseException {
//
//        // img 저장
//        FileUploadUtil.saveOcrFile(ncp.getImg(), imgpath);
//        // NCP 에 요청
//        String imgname = ncp.getImg().getOriginalFilename();
//        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);
//        Map map = OCRUtil.getData(result);
//        log.info(map.values().toString());
//
//        model.addAttribute("result", map);
//        model.addAttribute("center", "/cookingclass/detail");
//        return "index";
//    }
}

