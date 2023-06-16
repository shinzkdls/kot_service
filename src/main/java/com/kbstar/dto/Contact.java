package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Contact {
    private int contactpin;
    private int custpin;
    private String custname;
    private String email;
    private String contacttitle;
    private String contactcontent;
    private Date contactdate;
    private String answer;
    private int adminpin;
    private String adminid;
    private String answercontent;
    private Date answerdate;
}
