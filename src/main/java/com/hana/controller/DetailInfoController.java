package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// 지역구별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/service")
public class DetailInfoController {

    // 지도로 찾아보기 -> 행사 상세정보
    @RequestMapping("")
    public String serviceDetailShow(@RequestParam("detail") String serviceId, Model model) {
        // DB에서 serviceId로 조회해서 dto 가져오기
        model.addAttribute("serviceId", serviceId);
        model.addAttribute("prevMenu", "지도로 찾아보기");
        model.addAttribute("center", "temp");
        return "index";
    }

    // 카드 뷰 -> 행사 상세정보
}
