package com.kbstar.service;

import com.kbstar.dto.RecipeStep;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RecipeStepMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipeStepService implements KBService<Integer, RecipeStep> {
    @Autowired
    RecipeStepMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param recipeStep
     */
    @Override
    public void register(RecipeStep recipeStep) throws Exception {
        mapper.insert(recipeStep);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(RecipeStep recipeStep) throws Exception {

    }

    @Override
    public RecipeStep get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<RecipeStep> get() throws Exception {
        return null;
    }

    public List<RecipeStep> getRecipeAllStep(Integer recipepin) throws Exception {
        return mapper.selectRecipeAllStep(recipepin);
    }
}