package com.hana.controller;


import com.hana.data.dto.MemberDto;
import com.hana.data.dto.QnaDto;
import com.hana.data.dto.ReviewlistDto;
import com.hana.data.dto.ServiceDto;
import com.hana.service.QnaService;
import com.hana.service.ReviewService;
import com.hana.service.ServiceService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
@Slf4j
public class QnaController {
    String dir = "qna/";

    final QnaService qnaService;

    final ServiceService serviceService;


    @RequestMapping("")
    public String qna(Model model) {
        model.addAttribute("center", dir+"list");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model,
                           HttpSession httpSession,
                           @RequestParam("serviceId") String svcid) throws Exception {
        ServiceDto serviceDto = serviceService.get(svcid);

        model.addAttribute("svc", serviceDto);
        model.addAttribute("menu", serviceDto.getImgurl());
        model.addAttribute("center", dir + "center");
        model.addAttribute("subcenter", "add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,
                          QnaDto qnaDto, HttpSession httpSession){
        try {
            qnaService.add(qnaDto);
            httpSession.setAttribute("id", qnaDto.getMemberid());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/qna/list";
    }

    @RequestMapping("/addgeneral")
    public String addgeneral(Model model) {
        model.addAttribute("currentDiv", "Contact");
        model.addAttribute("submenu", "서비스 문의등록");
        model.addAttribute("center", dir + "center");
        model.addAttribute("subcenter", "addgeneral");
        return "index";
    }
    @RequestMapping("/addgeneralimpl")
    public String addgenralimpl(Model model,
                                QnaDto qnaDto, HttpSession httpSession){

        try {
            qnaService.add(qnaDto);
            httpSession.setAttribute("id", qnaDto.getMemberid());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/qna/list";
    }

    @RequestMapping("/list")
    public String list(Model model) {
        //Data를 DB에서 조회한다.
        List<QnaDto> lists = null;
        try {
            lists = qnaService.get();
            model.addAttribute("qna", lists);
            model.addAttribute("currentDiv", "Contact");
            model.addAttribute("submenu", "문의하기");
            model.addAttribute("center", dir + "center");
            model.addAttribute("subcenter", "list");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }


    @RequestMapping("/detail")
    public String detail(Model model,
                         @RequestParam("qnaid") int qnaid, HttpSession httpSession) {
        QnaDto qnaDto = null;
        try {
            qnaDto = qnaService.seldet(qnaid);

            model.addAttribute("qnadetail", qnaDto);
            model.addAttribute("currentDiv", "Contact");
            model.addAttribute("submenu", "문의등록");
            model.addAttribute("center", dir + "center");
            model.addAttribute("subcenter",  "detail");
        } catch (Exception e) {
            model.addAttribute("center", "registerfail");
        }
        return "index";
    }



    @RequestMapping("/updateimpl")
    public String updateimpl(QnaDto qnaDto, Model model) {

        try {
            qnaService.modify(qnaDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("center", dir + "detail");
        return "redirect:/qna/detail?qnaid=" + qnaDto.getQnaid();

    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(@RequestParam("qnaid") int qnaid, Model model) {
        try {
            qnaService.delqna(qnaid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/qna/list";
    }
}
