package com.hana.controller;

import com.github.pagehelper.PageInfo;
import com.hana.data.dto.ServiceDto;
import com.hana.service.ServiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/location")
@RequiredArgsConstructor
public class LocationController {

    final ServiceService serviceService;

    String dir = "cardview/";

    @RequestMapping("/{loc}")
    public String location(@PathVariable String loc, Model model, @RequestParam("pageNo") int pageNo) {
        List<ServiceDto> locationList = null;
        PageInfo<ServiceDto> pageInfo;

        try {
            locationList = serviceService.getByDetail(loc, "location");
            pageInfo = new PageInfo<>(serviceService.getPageLocation(pageNo, loc), locationList.size()/21 + 1);

//            model.addAttribute("locnm", loc);
            model.addAttribute("menu", loc);
            model.addAttribute("submenu", loc);
            model.addAttribute("currentDiv", "지역구별");

            model.addAttribute("data", pageInfo);
            model.addAttribute("target", "/location/"+loc);
            model.addAttribute("center", dir + "cardview");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }
}
