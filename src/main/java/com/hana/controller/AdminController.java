package com.hana.controller;

import com.hana.data.dto.MemberDto;
import com.hana.data.dto.QnaDto;
import com.hana.data.dto.ReviewlistDto;
import com.hana.data.dto.ServiceDto;
import com.hana.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

    String dir = "admin/";

    final ServiceService serviceService;
    final MemberService memberService;
    final ReviewService reviewService;
    final QnaService qnaService;

    @RequestMapping("")
    public String adminMain(Model model) {
        model.addAttribute("center",  "adminlogin");
        return dir + "adminindex";
    }

    @RequestMapping("/dashboard")
    public String adminDashBoard(Model model) {
        List<ServiceDto> serviceDtoList = null;
        List<ReviewlistDto> reviewListDtos = null;

        try {
            serviceDtoList = serviceService.selectTopFive();
            reviewListDtos = reviewService.get();
            model.addAttribute("serviceDtoList", serviceDtoList);
            model.addAttribute("reviewListDtos", reviewListDtos);
            model.addAttribute("center", "admincenter");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dir + "adminindex";
    }

    @RequestMapping("/management/member")
    public String memberManage(Model model) {
        List<MemberDto> memberDtoList = null;

        try {
            memberDtoList = memberService.get();

            model.addAttribute("memberDtoList", memberDtoList);
            model.addAttribute("center", "management/adminmember");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dir + "adminindex";
    }

    @RequestMapping("/management/qna")
    public String qnaManage(Model model) {
        List<QnaDto> qnaDtoList = null;

        try {
            qnaDtoList = qnaService.get();

            model.addAttribute("qnaDtoList", qnaDtoList);
            model.addAttribute("center", "management/adminqna");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dir + "adminindex";
    }

    @RequestMapping("/management/service")
    public String serviceManage(Model model) {
        List<ServiceDto> serviceDtoList = null;

        try {
            serviceDtoList = serviceService.selectOrderByDate();

            model.addAttribute("serviceDtoList", serviceDtoList);
            model.addAttribute("center", "management/adminservice");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dir + "adminindex";
    }

    @ResponseBody
    @RequestMapping("/management/service/delete")
    public Object deleteService(@RequestParam("serviceId") String serviceId) {
        try {
            serviceService.del(serviceId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ok";
    }
}
