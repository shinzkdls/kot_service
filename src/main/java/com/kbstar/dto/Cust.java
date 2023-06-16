package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    private int custpin;
    private String custid;
    private String custname;
    private char linkedlogin;
    private String nickname;
    private String introduction;
    private String password;
    private char gender;
    private String phone;
    private String email;
    private String location;
    private Date signdate;
    private String profileimgname;
}
