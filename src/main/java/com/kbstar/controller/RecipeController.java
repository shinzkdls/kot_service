package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.*;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.PushNotificationUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@SpringBootTest
@RequestMapping("/recipe")
public class RecipeController {

    @Autowired
    RecipeService recipeService;
    @Autowired
    IngredientService ingredientService;
    @Autowired
    RecipeStepService recipeStepService;
    @Autowired
    RecipeCommentService commentService;
    @Autowired
    GoodlistService goodlistService;
    @Autowired
    SubscribeService subscribeService;
    @Autowired
    CustService custService;
    @Autowired
    PushNotificationUtil pushNotificationUtil;
    String dir = "recipe/";
    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/all")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, RecipeBasic recipeBasic, HttpSession session) {
        PageInfo<RecipeBasic> p;
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust != null)
            recipeBasic.setLogincustpin(cust.getCustpin());
        try {
            p = new PageInfo<>(recipeService.getPage(pageNo, recipeBasic), 5);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("rlist", p);
        model.addAttribute("recipesortinfo", recipeBasic);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String get(Model model, Integer recipepin, HttpSession session) throws Exception {
        RecipeBasic recipe = null;
        List<RecipeIngredient> ingredient = null;
        List<RecipeStep> step = null;
        List<RecipeComment> comment = null;
        Cust sessioncust = (Cust) session.getAttribute("logincust");
        recipe = recipeService.get(recipepin);
        if (sessioncust != null)
            recipe.setLogincustlike(goodlistService.searchgood(recipepin, sessioncust.getCustpin()));
        Cust cust = custService.get(recipe.getCustid());
        ingredient = ingredientService.getRecipeAllIngredient(recipepin);
        step = recipeStepService.getRecipeAllStep(recipepin);
        comment = commentService.getRecipeAllComment(recipepin);

        model.addAttribute("recipecust", cust);
        model.addAttribute("recipedetail", recipe);
        model.addAttribute("ingredientList", ingredient);
        model.addAttribute("recipeStep", step);
        model.addAttribute("recipeComment", comment);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, RecipeBasic recipeBasic) throws Exception {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Model model, RecipeBasic recipeBasic, MultipartFile img,
                          int ingredientnumber,
                          String name1, String quantity1,
                          String name2, String quantity2,
                          String name3, String quantity3,
                          String name4, String quantity4,
                          String name5, String quantity5,

                          int stepnumber,
                          String stepdesc1, MultipartFile simg1,
                          String stepdesc2, MultipartFile simg2,
                          String stepdesc3, MultipartFile simg3,
                          String stepdesc4, MultipartFile simg4,
                          String stepdesc5, MultipartFile simg5) throws Exception {

        recipeService.register(recipeBasic);
        FileUploadUtil.saveFile(img, imgdir, recipeService.pingetter() + "_thumb.jpg");
        FileUploadUtil.saveFile(img, imgdir, recipeService.pingetter() + "_fin.jpg");

        String name[] = {name1, name2, name3, name4, name5};
        String quantity[] = {quantity1, quantity2, quantity3, quantity4, quantity5};

        String stpedesc[] = {stepdesc1, stepdesc2, stepdesc3, stepdesc4, stepdesc5};
        MultipartFile stepimg[] = {simg1, simg2, simg3, simg4, simg5};

        RecipeIngredient ri = new RecipeIngredient();
        for (int i = 1; i <= ingredientnumber; i++) {
            ri.setIngredientnumber(i);
            ri.setName(name[i - 1]);
            ri.setQuantity(quantity[i - 1]);
            ingredientService.register(ri);
        }

        RecipeStep rs = new RecipeStep();
        for (int i = 1; i <= stepnumber; i++) {
            rs.setStep(i);
            rs.setStepdesc(stpedesc[i - 1]);
            rs.setStepimg(recipeService.pingetter() + "_step" + i + ".jpg");
            recipeStepService.register(rs);
            FileUploadUtil.saveFile(stepimg[i - 1], imgdir, recipeService.pingetter() + "_step" + i + ".jpg");
        }

        return "redirect:/recipe/all?type=&ingredients1=&recipetitle=";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer recipepinDel) throws Exception {
        RecipeBasic recipeBasic = new RecipeBasic();
        recipeBasic.setRecipepin(recipepinDel);
        recipeService.remove(recipeBasic.getRecipepin());
        return "redirect:/recipe/all";
    }

    @RequestMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String recipetitle) throws Exception {
        PageInfo<RecipeBasic> p;
        List<RecipeBasic> recipeList = null;
        try {
            p = new PageInfo<>(recipeService.getSearch(pageNo, recipetitle), 5);
            recipeList = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("cpage", p);
        model.addAttribute("recipetitle", recipetitle);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/searchIngreType")
    public String searchIngreType(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String ingredients1, String type) throws Exception {
        List<RecipeBasic> l = null;
        PageInfo<RecipeBasic> p;
        try {
            p = new PageInfo<>(recipeService.getPage_category(pageNo, ingredients1, type), 5);
            l = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", l);
        model.addAttribute("cpage", p);
        model.addAttribute("ingredients1", ingredients1);
        model.addAttribute("type", type);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/commentImpl")
    public String commentImpl(RecipeComment recipeComment, HttpSession session) throws Exception {
        String userToken = "eJqBEpgeRYey1KxcQ5d88W:APA91bFb566XCq2SThdatny14tx4iyJfbsjxE5dBjR1cQJ8we0H2lvzYWWFAW2d2WL98A_ycCiFIjVV94Dkdr1_GrqvLxvV1Hpi0jgSHoPcjrToJPhd1zX-l48QJIMBVu1sEOWN3d_Yg";
        String imgUrl = "https://www.w3schools.com/css/img_5terre.jpg";
        try {
            commentService.register(recipeComment);
            pushNotificationUtil.sendTargetMessage("A comment is registered on your recipe.", recipeComment.getContent(), "/register", userToken);
        } catch (Exception e) {
            throw new Exception("등록 오류");
        }
        return "redirect:/recipe/detail?recipepin=" + recipeComment.getRecipepin();
    }

    @RequestMapping("/commentDel")
    public String commentDel(RecipeComment recipeComment, RecipeBasic recipeBasic) throws Exception {
        commentService.remove(recipeComment.getRecipecommentpin());
        return "redirect:/recipe/detail?recipepin=" + recipeBasic.getRecipepin();
    }

    @RequestMapping("/likeImpl")
    public String likeImpl(Model model, Integer custpinlike, Integer recipepinlike, HttpSession session) throws Exception {
        try {
            Goodlist goodlist = new Goodlist();
            goodlist.setCustpin(custpinlike);
            goodlist.setRecipepin(recipepinlike);
            goodlistService.register(goodlist);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
            // e.printStackTrace();
        }
        return "redirect:/recipe/detail?recipepin=" + recipepinlike;
    }

    @RequestMapping("/likeDel")
    public String likeDel(Model model, Integer custpinlike, Integer recipepinlike, HttpSession session) throws Exception {
        try {
            Goodlist goodlist = new Goodlist();
            goodlist.setCustpin(custpinlike);
            goodlist.setRecipepin(recipepinlike);
            goodlistService.removegood(goodlist);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
            // e.printStackTrace();
        }
        return "redirect:/recipe/detail?recipepin=" + recipepinlike;
    }

    @RequestMapping("/subImpl")
    public String subImpl(Model model, Integer custpinmy, Integer subcustpin, HttpSession session) throws Exception {
        try {
            Subscribe subscribe = new Subscribe();
            subscribe.setCustpin(custpinmy);
            subscribe.setSubcustpin(subcustpin);
            subscribeService.register(subscribe);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
            // e.printStackTrace();
        }
        return "redirect:/apply/mypage";
    }
}
