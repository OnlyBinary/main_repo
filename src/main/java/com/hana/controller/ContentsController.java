package com.hana.controller;

import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 컨텐츠 종류별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/contents")
@RequiredArgsConstructor
public class ContentsController {

    final ServiceService serviceService;

    String dir = "cardview/";

    // 컨텐츠 종류별 메인
    @RequestMapping("/main")
    public String contentsMain(Model model) {
//        String[] map = {"공간시설"};
        // 각각 리스트 명과 url 리스트
        List<String> list = new ArrayList<>();
        list.add("공간시설");
        list.add("교육강좌");
        list.add("문화체험");
        list.add("진료복지");
        list.add("체육시설");
        List<String> urlList = new ArrayList<>();
        urlList.add("/contents/gongan");
        urlList.add("/contents/edulec");
        urlList.add("/contents/culexper");
        urlList.add("/contents/medical");
        urlList.add("/contents/sportsfacilities");
        model.addAttribute("list", list);
        model.addAttribute("urlList", urlList);

        // 대표 메뉴 보여주기
        model.addAttribute("menu", "컨텐츠별");
        model.addAttribute("currentDiv", "메인");
        // 컨텐츠 메인
        model.addAttribute("center", dir + "cardviewmain");
        return "index";
    }

    // 공간시설
    @RequestMapping("/gongan")
    public String gongan(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("공간시설", "content");

            // 메뉴단
            model.addAttribute("menu", "공간시설");
            model.addAttribute("currentDiv", "컨텐츠별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 교육강좌
    @RequestMapping("/edulec")
    public String edulec(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("교육강좌", "content");

            // 메뉴단
            model.addAttribute("menu", "교육강좌");
            model.addAttribute("currentDiv", "컨텐츠별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 문화체험
    @RequestMapping("/culexper")
    public String culexper(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("문화체험", "content");

            // 메뉴단
            model.addAttribute("menu", "문화체험");
            model.addAttribute("currentDiv", "문화체험");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 진료복지
    @RequestMapping("/medical")
    public String medical(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("진료복지", "content");

            // 메뉴단
            model.addAttribute("menu", "진료복지");
            model.addAttribute("currentDiv", "컨텐츠별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 체육시설
    @RequestMapping("/sportsfacilities")
    public String sportsfacilities(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("체육시설", "content");

            // 메뉴단
            model.addAttribute("menu", "체육시설");
            model.addAttribute("currentDiv", "컨텐츠별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }
}
