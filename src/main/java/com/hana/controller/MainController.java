package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.util.PublicServiceUtil;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class MainController {

    final KeyStore keyStore;

    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
//        model.addAttribute("center", "login Page");
        return "index";
    }
}
