package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
    private int noticepin;
    private int adminpin;
    private String noticetitle;
    private String noticecontent;
    private Date noticedate;
}
