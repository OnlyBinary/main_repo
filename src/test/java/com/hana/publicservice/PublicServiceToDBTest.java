package com.hana.publicservice;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hana.data.KeyStore;
import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import com.hana.util.KakaoServiceUtil;
import com.hana.util.PublicServiceUtil;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

@SpringBootTest
public class PublicServiceToDBTest {

    @Autowired
    KeyStore keyStore;

    @Autowired
    ServiceService serviceService;

    @Test
    void contextLoads() throws IOException, ParseException {
        // 먼저 하나만 받아와서 전체 개수 출력
        JSONObject serviceData = (JSONObject) PublicServiceUtil.getServiceData(keyStore.publicServiceKey, "1501", "2169");
        JSONObject collect = (JSONObject) serviceData.get("tvYeyakCOllect");
        JSONArray rows = (JSONArray) collect.get("row");

        for (Object row : rows) {
            JSONObject obj = (JSONObject) row;
            double lat;
            double lng;

            ServiceDto testServiceDto = null;

            try {
                testServiceDto = serviceService.get(obj.get("SVCID").toString());
                if (testServiceDto != null) continue;
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 공공서비스 api에서 좌표 값이 업으면 kakao api 에서 값을 받아와서 저장해주기
            if (obj.get("X") == "") {
//                System.out.println(obj.get("PLACENM"));
                Object placenm = obj.get("PLACENM");

                JSONObject serviceData1 = (JSONObject) KakaoServiceUtil.getServiceData(keyStore.kakaoApiServiceKey, placenm.toString().split(" ")[0]);

                JSONArray documents = (JSONArray) serviceData1.get("documents");
                JSONObject o = (JSONObject) documents.get(0);

                // 카카오맵 API 좌표값 활용
//                lat = (double) o.get("x");
                lat = Double.parseDouble(o.get("x").toString());
                lng = Double.parseDouble(o.get("y").toString());
            } else {
                // 공공서비스 API 좌표값 활용
                lat = Double.parseDouble(obj.get("Y").toString());
                lng = Double.parseDouble(obj.get("X").toString());
            }

            String areanm = "";
            // 지역구명이 안넘어오는 경우
            if (obj.get("areanm") == null) {
                Object placenm = obj.get("PLACENM");
                JSONObject serviceData1 = (JSONObject) KakaoServiceUtil.getServiceData(keyStore.kakaoApiServiceKey, placenm.toString().split(" ")[0]);
                JSONArray documents = (JSONArray) serviceData1.get("documents");
                System.out.println(documents);
                if (documents != null && !documents.isEmpty()) {
                    JSONObject o = (JSONObject) documents.get(0);
                    areanm = o.get("address_name").toString().split(" ")[1];
                }
            } else {
                areanm = obj.get("areanm").toString();
            }

            System.out.println(areanm);

            // TODO -> usertgtinfo 칼럼 길이 수정

            try {
                // String -> LocalDateTime Format
                String svcstrString = obj.get("SVCOPNBGNDT").toString();
                String svcfinString = obj.get("SVCOPNENDDT").toString();
                String rcptstrString = obj.get("RCPTBGNDT").toString();
                String rcptfinString = obj.get("RCPTENDDT").toString();

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");


                LocalDateTime svcstr = LocalDateTime.parse(svcstrString, formatter);
                LocalDateTime svcfin = LocalDateTime.parse(svcfinString, formatter);
                LocalDateTime rcptstrLocal = LocalDateTime.parse(rcptstrString, formatter);
                LocalDateTime rcptfinLocal = LocalDateTime.parse(rcptfinString, formatter);

                java.sql.Date rcptstr = java.sql.Date.valueOf(rcptstrLocal.toLocalDate());
                java.sql.Date rcptfin = java.sql.Date.valueOf(rcptfinLocal.toLocalDate());

                // String -> SimpleDateFormat
                Date minDate = null;
                Date maxDate = null;

                // 시작, 종료 시간 parsing
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
                if (!obj.get("V_MIN").toString().equals("") && !obj.get("V_MAX").toString().equals("")) {
                    minDate = simpleDateFormat.parse(obj.get("V_MIN").toString());
                    maxDate = simpleDateFormat.parse(obj.get("V_MAX").toString());
                } else {
                    minDate = simpleDateFormat.parse("00:00");
                    maxDate = simpleDateFormat.parse("00:00");
                }

                Time minTime = new Time(minDate.getTime());
                Time maxTime = new Time(maxDate.getTime());

//                System.out.println(obj.get("SVCOPNBGNDT").toString());
                ServiceDto serviceDto = ServiceDto.builder().svcid(obj.get("SVCID").toString())
                        .svcnm(obj.get("SVCNM").toString())
                        .placenm(obj.get("PLACENM").toString())
                        .payatnm(obj.get("PAYATNM").toString())
                        .usertgtinfo(obj.get("USETGTINFO").toString())
                        .areanm(areanm)
                        .lat(lat).imgurl(obj.get("IMGURL").toString()).lng(lng)
//                        .detail(obj.get("DTLCONT").toString())
                        .tel(obj.get("TELNO").toString())
                        .svcstr(svcstr).svcfin(svcfin).rcptstr(rcptstr).rcptfin(rcptfin)
                        .svcstrtime(minTime).svcfintime(maxTime)
                        .maxclassnm(obj.get("MAXCLASSNM").toString())
                        .minclassnm(obj.get("MINCLASSNM").toString())
                        .build();
//                System.out.println(serviceDto.toString());
                serviceService.add(serviceDto);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }
}
