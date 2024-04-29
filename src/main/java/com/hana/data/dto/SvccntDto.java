package com.hana.data.dto;

import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SvccntDto {
    private String svcid;
    private int cnt;
}

