package com.kbstar.mapper;

import com.kbstar.dto.RecipeStep;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RecipeStepMapper extends KBMapper<Integer, RecipeStep> {
    List<RecipeStep> selectRecipeAllStep(Integer recipepin) throws Exception;
}
