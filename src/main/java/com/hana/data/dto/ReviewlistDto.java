package com.hana.data.dto;

import lombok.*;

import java.sql.Date;
import java.util.List;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewlistDto {
    private String svcid;
    private String memberid;
    private String content;
    private int score;
    private Date regdate;
    private List<ServiceDto> serviceList;
}