package com.hana.controller;


import com.hana.data.dto.ReviewlistDto;
import com.hana.data.dto.ServiceDto;
import com.hana.service.ReviewService;
import com.hana.service.ServiceService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {
    String dir = "review/";

    final ReviewService reviewService;
    final ServiceService serviceService;


    @RequestMapping("/add")
    public String register(Model model,
                           HttpSession httpSession,
                           @RequestParam("serviceId") String svcid) throws Exception {
        String memid = (String) httpSession.getAttribute("id");

        ServiceDto serviceDto = serviceService.get(svcid);

        model.addAttribute("svcnm", serviceDto.getSvcnm());
        model.addAttribute("svcid", serviceDto.getSvcid());
        model.addAttribute("id", memid);
        model.addAttribute("center", dir + "add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,
                          ReviewlistDto reviewlistDto, HttpSession httpSession){
        try {
            reviewService.add(reviewlistDto);
            httpSession.setAttribute("id", reviewlistDto.getMemberid());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/service?detail="+reviewlistDto.getSvcid();
    }
}
