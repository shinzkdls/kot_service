package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassJoinInfo {
    private int classpin;
    private int custpin;
    private int joinstatus;
    private Date joindate;
}
