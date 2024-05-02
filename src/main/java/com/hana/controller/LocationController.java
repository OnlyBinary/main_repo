package com.hana.controller;

import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/location")
@RequiredArgsConstructor
public class LocationController {

    final ServiceService serviceService;

    String dir = "cardview/";

    @RequestMapping("/{loc}")
    public String location(@PathVariable String loc, Model model) {
        List<ServiceDto> locationList = null;

        try {
            locationList = serviceService.getByDetail(loc, "location");

//            model.addAttribute("locnm", loc);
            model.addAttribute("menu", loc);
            model.addAttribute("currentDiv", "지역구별");

            model.addAttribute("data", locationList);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }
}
