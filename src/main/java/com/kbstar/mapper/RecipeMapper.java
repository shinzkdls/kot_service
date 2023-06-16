package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Mapper
public interface RecipeMapper extends KBMapper<Integer, RecipeBasic> {

    Page<RecipeBasic> getpage() throws Exception;

    Page<RecipeBasic> getpage_category(String ingredients1, String type) throws Exception;

    Page<RecipeBasic> getsearch(String recipetitle) throws Exception;
    Page<RecipeBasic> gettype(String type) throws Exception;

    Page<RecipeBasic> getsituation(String situation) throws Exception;

    //        이나은
    List<Integer> ranking() throws Exception;
    List<RecipeBasic> latestRecipe() throws Exception;
    List<RecipeBasic> subscribeRecipe() throws Exception;

    @Transactional(readOnly = true)
    public List<RecipeBasic> getAllIngredient(Integer integer) throws Exception;

    public int pingetter() throws Exception;
    public List<RecipeBasic> getMyRecipe(String custid) throws Exception;

}
