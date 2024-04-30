package com.hana.data.dto;

import lombok.*;

import java.sql.Date;
import java.util.List;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class InterestlistDto {
    private String memberid;
    private String svcid;
    private Date regdate;
    private List<ServiceDto> serviceList;
}

