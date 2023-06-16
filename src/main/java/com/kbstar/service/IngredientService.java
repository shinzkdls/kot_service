package com.kbstar.service;

import com.kbstar.dto.RecipeIngredient;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.IngredientMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IngredientService implements KBService<Integer, RecipeIngredient> {
    @Autowired
    IngredientMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param recipeIngredient
     */
    @Override
    public void register(RecipeIngredient recipeIngredient) throws Exception {
        mapper.insert(recipeIngredient);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(RecipeIngredient recipeIngredient) throws Exception {

    }

    @Override
    public RecipeIngredient get(Integer recipepin) throws Exception {
        return null;
    }

    @Override
    public List<RecipeIngredient> get() throws Exception {
        return null;
    }


    public List<RecipeIngredient> getRecipeAllIngredient(Integer recipepin) throws Exception {
        return mapper.selectRecipeAllIngredient(recipepin);

    }
}