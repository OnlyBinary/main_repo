package com.hana.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserRecentViewDto {
    private String memberid;
    private String svcid;
    private Date recentdate;
    private List<ServiceDto> serviceList;
}
