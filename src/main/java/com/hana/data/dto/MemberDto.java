package com.hana.data.dto;

import lombok.*;

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
}