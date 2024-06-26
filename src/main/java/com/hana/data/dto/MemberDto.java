package com.hana.data.dto;

import lombok.*;

import java.util.List;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private String memberid;
    private String membernm;
    private String membertel;
    private String memberpwd;
    private String memberaddr;
    private String memberemail;
    private int snsagree;
    private String memberzipcode;
    private String memberaddrdetail;

}