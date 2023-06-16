package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassComment {
    private int classcommentpin;
    private int classpin;
    private int custpin;
    private String custid;
    private String nickname;
    private String content;
    private Date classcommentdate;
    private String profileimgname;
}
