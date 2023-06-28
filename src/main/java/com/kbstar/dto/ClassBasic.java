package com.kbstar.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassBasic {
    private Integer classpin;
    private int custpin;
    private String custid;
    private String nickname;
    private String type;
    private String location;
    private String cooking;
    private String thumbnailimg;
    private int amount;
    private int classtime;
    private int personal;
    private String classtitle;
    private String classdesc;
    private String address;
    private String classdate;
    private int sort;
    private int logincustpin;
    private String logincustjoin;
    private Integer joincount;

    public ClassBasic(int classpin, String thumbnailimg, String location, String cooking, String classtitle, String address, String classdate
            , int classtime, int personal, int amount, int logincustpin, String logincustjoin) {
        this.classpin = classpin;
        this.thumbnailimg = thumbnailimg;
        this.location = location;
        this.cooking = cooking;
        this.classtitle = classtitle;
        this.address = address;
        this.classdate = classdate;
        this.classtime = classtime;
        this.personal = personal;
        this.amount = amount;
        this.logincustpin = logincustpin;
        this.logincustjoin = logincustjoin;
    }

}
