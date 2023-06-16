package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BanText {
    private int bantextpin;
    private int adminpin;
    private String adminid;
    private String status;
    private Date bantextdate;
}
