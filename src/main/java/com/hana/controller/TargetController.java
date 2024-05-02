package com.hana.controller;

import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

// 대상별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/target")
@RequiredArgsConstructor
public class TargetController {

    final ServiceService serviceService;

    String dir = "cardview/";

    // 컨텐츠 종류별 메인
    @RequestMapping("/main")
    public String targetMain(Model model) {
//        String[] map = {"공간시설"};
        // 각각 리스트 명과 url 리스트
        List<String> list = new ArrayList<>();
        list.add("가족");
        list.add("성인");
        list.add("청소년");
        list.add("유아");
        list.add("기타");
        List<String> urlList = new ArrayList<>();
        urlList.add("/target/family");
        urlList.add("/target/adult");
        urlList.add("/target/teenager");
        urlList.add("/target/child");
        urlList.add("/target/etc");
        model.addAttribute("list", list);
        model.addAttribute("urlList", urlList);

        // 대표 메뉴 보여주기
        model.addAttribute("menu", "컨텐츠별");
        model.addAttribute("currentDiv", "메인");
        // 컨텐츠 메인
        model.addAttribute("center", dir + "cardviewmain");
        return "index";
    }

    // 가족
    @RequestMapping("/family")
    public String family(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("가족", "target");

            // 메뉴단
            model.addAttribute("menu", "가족");
            model.addAttribute("currentDiv", "서비스대상별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 성인
    @RequestMapping("/adult")
    public String adult(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("성인", "target");

            // 메뉴단
            model.addAttribute("menu", "성인");
            model.addAttribute("currentDiv", "서비스대상별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 청소년
    @RequestMapping("/teenager")
    public String teenager(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("청소년", "target");

            // 메뉴단
            model.addAttribute("menu", "청소년");
            model.addAttribute("currentDiv", "서비스대상별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 어린이
    @RequestMapping("/child")
    public String child(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("유아", "target");

            // 메뉴단
            model.addAttribute("menu", "유아");
            model.addAttribute("currentDiv", "서비스대상별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

    // 기타
    @RequestMapping("/etc")
    public String etc(Model model) {
        List<ServiceDto> list = null;

        try {
            list = serviceService.getByDetail("기타", "target");

            // 메뉴단
            model.addAttribute("menu", "기타");
            model.addAttribute("currentDiv", "서비스대상별");

            // 카드뷰 데이터 뿌려주기
            model.addAttribute("data", list);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }
}
