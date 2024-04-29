package com.hana.data.dto;

import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminDto {
    private String adminid;
    private String adminpwd;
}

