package com.kbstar.service;

import com.kbstar.dto.RecipeComment;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RecipeCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipeCommentService implements KBService<Integer, RecipeComment> {
    @Autowired
    RecipeCommentMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param recipeComment
     */
    @Override
    public void register(RecipeComment recipeComment) throws Exception {
        mapper.insert(recipeComment);
    }

    @Override
    public void remove(Integer recipecommentpin) throws Exception {
        mapper.delete(recipecommentpin);
    }

    @Override
    public void modify(RecipeComment recipeComment) throws Exception {
        mapper.update(recipeComment);
    }

    @Override
    public RecipeComment get(Integer recipecommentpin) throws Exception {
        return mapper.select(recipecommentpin);
    }

    @Override
    public List<RecipeComment> get() throws Exception {
        return mapper.selectall();
    }


    public List<RecipeComment> getRecipeAllComment(Integer recipepin) throws Exception {
        return mapper.selectRecipeAllComment(recipepin);
    }

}