package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RecipeComment {
    private int recipecommentpin;
    private int recipepin;
    private int custpin;
    private String custid;
    private String nickname;
    private String content;
    private Date recipecommentdate;
    private String profileimgname;
}
