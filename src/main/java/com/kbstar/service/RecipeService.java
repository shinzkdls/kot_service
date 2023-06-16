package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RecipeService implements KBService<Integer, RecipeBasic> {
    @Autowired
    RecipeMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param recipeBasic
     */
    @Override
    public void register(RecipeBasic recipeBasic) throws Exception {
        mapper.insert(recipeBasic);
    }

    @Override
    public void remove(Integer recipepin) throws Exception {
        mapper.delete(recipepin);
    }

    @Override
    public void modify(RecipeBasic recipeBasic) throws Exception {
        mapper.update(recipeBasic);
    }


    @Override
    public RecipeBasic get(Integer recipepin) throws Exception {
        return mapper.select(recipepin);
    }

    //    @Transactional(readOnly = true)
    @Override
    public List<RecipeBasic> get() throws Exception {
        return mapper.selectall();
    }

    public Page<RecipeBasic> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 6); // 6 : 한화면에 출력되는 개수
        return mapper.getpage();
    }

    public Page<RecipeBasic> getPage_category(int pageNo, String ingredients1, String type) throws Exception {
        PageHelper.startPage(pageNo, 6);
        return mapper.getpage_category(ingredients1, type);
    }

    public Page<RecipeBasic> getSearch(int pageNo, String recipetitle) throws Exception {
        PageHelper.startPage(pageNo, 6); // 6 : 한화면에 출력되는 개수
        return mapper.getsearch(recipetitle);
    }

    public int pingetter() throws Exception{
        return mapper.pingetter();
    };

    public List<RecipeBasic> getMyRecipe(String custid) throws Exception {
        return mapper.getMyRecipe(custid);
    }

    //        이나은
    public List<RecipeBasic> ranking() throws Exception {
        List<Integer> recipepin=mapper.ranking();
        List<RecipeBasic> recipeRanking = new ArrayList<>();
        for (Integer pin: recipepin) {
            recipeRanking.add(mapper.select(pin));
        }
        return recipeRanking;
    }
    public List<RecipeBasic> latestRecipe() throws Exception {
        List<RecipeBasic> recipeList =mapper.latestRecipe();
        return recipeList;
    }
    public List<RecipeBasic> subscribeRecipe() throws Exception {
        List<RecipeBasic> subscribeList =mapper.subscribeRecipe();
        return subscribeList;
    }

}