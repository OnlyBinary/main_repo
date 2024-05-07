package com.hana.data.dto;

import lombok.*;

import java.sql.Date;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {
    private int qnaid;
    private String memberid;
	private String svcid;
	private String title;
	private String content;
    private Date regdate;
	private String adminans;
	private int openyn;
	private String password;
}