package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.data.dto.ReviewlistDto;
import com.hana.data.dto.ServiceDto;
import com.hana.service.ReviewService;
import com.hana.service.ServiceService;
import com.hana.util.PublicServiceUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

// 지역구별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/service")
@RequiredArgsConstructor
public class DetailInfoController {

    final ServiceService serviceService;
    final ReviewService reviewService;
    final KeyStore keyStore;

    // 지도로 찾아보기 -> 행사 상세정보
    @RequestMapping("")
    public String serviceDetailShow(@RequestParam("detail") String serviceId, Model model) {
        // DB에서 serviceId로 조회해서 dto 가져오기
        ServiceDto serviceDto = null;
        List<ReviewlistDto> reviewlistDto = null;

        try {
            serviceDto = serviceService.get(serviceId);
            reviewlistDto = reviewService.selrev(serviceId);
            Object serviceDetailData = PublicServiceUtil.getServiceDetailData(keyStore.publicServiceKey, "1", "1", serviceId);

            model.addAttribute("service", serviceDto);
            model.addAttribute("review", reviewlistDto);
            // 서비스 상세정보
            model.addAttribute("detail", serviceDetailData);
            model.addAttribute("prevMenu", "지도로 찾아보기");
            model.addAttribute("center", "temp");
            model.addAttribute("lat", serviceDto.getLat());
            model.addAttribute("lng", serviceDto.getLng());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 카드 뷰 -> 행사 상세정보
}
