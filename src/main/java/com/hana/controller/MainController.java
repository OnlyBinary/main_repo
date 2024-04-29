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

    @RequestMapping("/kakaotest")
    public String kakaoTest(Model model) {
        model.addAttribute("kakaoServiceKey", keyStore.kakaoServiceKey);
        model.addAttribute("center", "kakaotest");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/getPublicServiceData")
    public Object getPublicServiceData() throws IOException, ParseException {
        JSONObject serviceData = (JSONObject) PublicServiceUtil.getServiceData(keyStore.publicServiceKey, "1", "20");
        return serviceData;
    }

    @RequestMapping("/cate")
    public String tempCate(Model model) {
        model.addAttribute("center", "temp");
        return "index";
    }

    @RequestMapping("/card")
    public String tempCardView(Model model) {
        model.addAttribute("center", "cardview");
        return "index";
    }
}
