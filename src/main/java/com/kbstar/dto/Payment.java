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
    private int paymentpin;
    private int classpin;
    private int custpin;
    private int amount;
    private String paymentstatus;
    private Date paydate;
}
