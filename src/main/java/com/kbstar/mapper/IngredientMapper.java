package com.kbstar.mapper;

import com.kbstar.dto.RecipeIngredient;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface IngredientMapper extends KBMapper<Integer, RecipeIngredient> {
    List<RecipeIngredient> selectRecipeAllIngredient(Integer recipepin) throws Exception;

}
