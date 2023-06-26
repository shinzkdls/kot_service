package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Subscribe {
    private Integer custpin;
    private Integer subcustpin;
    private String subcustprofileimgname;
    private String subcustintroduction;
    private String subcustid;
    private String subcustnickname;
    private Date subdate;
}
