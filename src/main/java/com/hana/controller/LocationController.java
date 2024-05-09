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

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/location")
@RequiredArgsConstructor
public class LocationController {

    final ServiceService serviceService;

    String dir = "cardview/";

    @RequestMapping("/main")
    public String locationMain(Model model) {
        List<String> list = new ArrayList<>();
        list.add("강남구");
        list.add("강동구");
        list.add("강북구");
        list.add("강서구");
        list.add("관악구");
        list.add("광진구");
        list.add("구로구");
        list.add("금천구");
        list.add("노원구");
        list.add("도봉구");
        list.add("동대문구");
        list.add("동작구");
        list.add("마포구");
        list.add("서대문구");
        list.add("서초구");
        list.add("성동구");
        list.add("성북구");
        list.add("송파구");
        list.add("양천구");
        list.add("영등포구");
        list.add("용산구");
        list.add("종로구");
        list.add("중구");
        list.add("중랑구");
        List<String> urlList = new ArrayList<>();
        urlList.add("/location/강남구");
        urlList.add("/location/강동구");
        urlList.add("/location/강북구");
        urlList.add("/location/강서구");
        urlList.add("/location/관악구");
        urlList.add("/location/광진구");
        urlList.add("/location/구로구");
        urlList.add("/location/금천구");
        urlList.add("/location/노원구");
        urlList.add("/location/도봉구");
        urlList.add("/location/동대문구");
        urlList.add("/location/동작구");
        urlList.add("/location/마포구");
        urlList.add("/location/서대문구");
        urlList.add("/location/서초구");
        urlList.add("/location/성동구");
        urlList.add("/location/성북구");
        urlList.add("/location/송파구");
        urlList.add("/location/양천구");
        urlList.add("/location/영등포구");
        urlList.add("/location/용산구");
        urlList.add("/location/종로구");
        urlList.add("/location/중구");
        urlList.add("/location/중랑구");
        model.addAttribute("list", list);
        model.addAttribute("urlList", urlList);
        model.addAttribute("center", dir + "cardviewmain");
        model.addAttribute("submenu", "지역구별");
        model.addAttribute("currentDiv", "메인");
        return "index";
    }

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
