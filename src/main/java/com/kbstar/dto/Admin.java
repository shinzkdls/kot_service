package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Admin {
    private int adminpin;
    private String adminid;
    private String adminname;
    private String password;
    private Date createdate;
}
