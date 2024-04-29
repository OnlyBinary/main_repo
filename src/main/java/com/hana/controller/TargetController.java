package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 대상별 컨텐츠 조회 컨트롤러
@Controller
@RequestMapping("/target")
public class TargetController {

    // 가족
    @RequestMapping("/family")
    public String family(Model model) {
        model.addAttribute("currentDiv", "서비스 대상별");
        model.addAttribute("menu", "가족");
        model.addAttribute("center", "cardview");
        return "index";
    }

    // 성인
    @RequestMapping("/adult")
    public String adult(Model model) {
        model.addAttribute("currentDiv", "서비스 대상별");
        model.addAttribute("menu", "성인");
        model.addAttribute("center", "cardview");
        return "index";
    }

    // 청소년
    @RequestMapping("/teenager")
    public String teenager(Model model) {
        model.addAttribute("currentDiv", "서비스 대상별");
        model.addAttribute("menu", "청소년");
        model.addAttribute("center", "cardview");
        return "index";
    }

    // 어린이
    @RequestMapping("/child")
    public String child(Model model) {
        model.addAttribute("currentDiv", "서비스 대상별");
        model.addAttribute("menu", "어린이");
        model.addAttribute("center", "cardview");
        return "index";
    }

    // 기타
    @RequestMapping("/etc")
    public String etc(Model model) {
        model.addAttribute("currentDiv", "서비스 대상별");
        model.addAttribute("menu", "기타");
        model.addAttribute("center", "cardview");
        return "index";
    }
}
