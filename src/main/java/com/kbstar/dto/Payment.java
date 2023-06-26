package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Payment {
    private Integer paymentpin;
    private Integer classpin;
    private Integer custpin;
    private Integer amount;
    private String paymentstatus;
    private Date paydate;
    private Integer logincustpin;
}
