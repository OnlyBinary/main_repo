package com.hana.data.dto;

import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewlistDto {
    private String svcid;
    private String memberid;
    private int score;
    private String review;
}