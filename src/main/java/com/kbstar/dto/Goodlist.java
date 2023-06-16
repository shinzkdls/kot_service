package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Goodlist {
    private Integer custpin;
    private Integer recipepin;
    private Date gooddate;
}
