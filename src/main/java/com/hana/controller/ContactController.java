package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// Contact 컨트롤러
@Controller
@RequestMapping("/contact")
public class ContactController {

    @RequestMapping("")
    public String contactMain(Model model) {
//        model.addAttribute("center", "contact main page");
        return "index";
    }
}
