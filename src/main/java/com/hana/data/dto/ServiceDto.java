package com.hana.data.dto;

import lombok.*;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ServiceDto {
    private String svcid;
    private String svcnm;
    private String placenm;
    private String payatnm;
    private String usertgtinfo;
    private String areanm;
    private double lat;
    private String imgurl;
    private double lng;
//    private String detail;
    private String tel;
    private LocalDateTime svcstr;
    private LocalDateTime svcfin;
    private Date rcptstr;
    private Date rcptfin;
    private Time svcstrtime;
    private Time svcfintime;
    private String maxclassnm;
    private String minclassnm;
}
