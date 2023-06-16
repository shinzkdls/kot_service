package com.kbstar.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RecipeStep {
    private int step;
    private int recipepin;
    private String stepdesc;
    private String stepimg;
}
