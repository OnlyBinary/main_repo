package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import com.hana.util.PublicServiceUtil;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// 지도로 조회하기 컨트롤러
@Controller
@RequiredArgsConstructor
public class MapController {

    final KeyStore keyStore;

    final ServiceService serviceService;

    @RequestMapping("/map")
    public String map(Model model) {
//        model.addAttribute("kakaoServiceKey", keyStore.kakaoServiceKey);
        model.addAttribute("center", "kakaotest");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/getPublicServiceData")
    public Object getPublicServiceData() throws IOException, ParseException {
//        JSONObject serviceData = (JSONObject) PublicServiceUtil.getServiceData(keyStore.publicServiceKey, "1", "20");
//        JSONObject serviceData = null;
        List<ServiceDto> serviceDtoList = new ArrayList<>();
        try {
            serviceDtoList = serviceService.get();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return serviceDtoList;
    }

    @ResponseBody
    @RequestMapping("/getContentListData")
    public Object getContentListData(@RequestParam("detail") String detail, @RequestParam("category") String category) {
        List<ServiceDto> serviceDtoList = new ArrayList<>();

        try {
            serviceDtoList = serviceService.getByDetail(detail, category);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return serviceDtoList;
    }
}
