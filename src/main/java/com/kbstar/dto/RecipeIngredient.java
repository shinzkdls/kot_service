package com.kbstar.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RecipeIngredient {
    private Integer ingredientnumber;
    private Integer recipepin;
    private String name;
    private String quantity;
}
