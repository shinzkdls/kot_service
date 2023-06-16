package com.kbstar.mapper;

import com.kbstar.dto.RecipeComment;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RecipeCommentMapper extends KBMapper<Integer, RecipeComment> {
    List<RecipeComment> selectRecipeAllComment(Integer recipepin) throws Exception;
}
