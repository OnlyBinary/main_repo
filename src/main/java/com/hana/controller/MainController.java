package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.data.dto.InterestlistDto;
import com.hana.data.dto.MemberDto;
import com.hana.service.InterestlistService;
import com.hana.service.MemberService;
import com.hana.util.AirPollutionUtil;
import com.hana.util.PublicServiceUtil;
import com.hana.util.WeatherUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class MainController {

    @Value("${app.key.whkey}")
    String whkey;

    final KeyStore keyStore;

    final MemberService memberService;
    final InterestlistService interestlistService;


    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id,
                                        @RequestParam("pwd") String pwd,
                            HttpSession httpSession) {
        MemberDto memberDto = null;
        try {
            memberDto = memberService.get(id);
            if (memberDto == null) {
                throw new Exception();
            }
            if (memberDto != null && !memberDto.getMemberpwd().equals(pwd)) { //raw와 암호화된 pwd 비교
                throw new Exception();
            }
            httpSession.setAttribute("id", id);
        } catch (Exception e) {
            model.addAttribute("center","login");
            return "index";
        }
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "index";
    }
    @RequestMapping("/mypage")
    public String mypage(Model model, HttpSession httpSession) {
        MemberDto memberDto = null;
        List<InterestlistDto> interestlistDto = null;
        String id = (String) httpSession.getAttribute("id");

        try {
            memberDto = memberService.get(id);
            interestlistDto = interestlistService.selint(id);

            model.addAttribute("member", memberDto);
            model.addAttribute("interest", interestlistDto);
            model.addAttribute("center", "mypage");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               MemberDto memberDto, HttpSession httpSession){

        try {
            memberService.add(memberDto);
            httpSession.setAttribute("id", memberDto.getMemberid());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @ResponseBody
    @RequestMapping("/registercheckid")
    public Object registercheckid(@RequestParam("id") String id) throws Exception {
        String result = "0";
        MemberDto memberDto = memberService.get(id);
        if(memberDto == null){
            result = "1";
        }
        return result;
    }



@RequestMapping("/getweather")
    @ResponseBody
    public Object getweather(@RequestParam("lat") String lat, @RequestParam("lng") String lng) throws IOException, ParseException {
        return WeatherUtil.getWeatherByCoordinates(lat,lng, whkey);
    }

    @RequestMapping("/getwhforcast")
    @ResponseBody
    public Object getwhforcast(@RequestParam("lat") String lat, @RequestParam("lng") String lng) throws IOException, ParseException {
        return WeatherUtil.getWeatherForecastByCoordinates(lat,lng, whkey);
    }

    @RequestMapping("/getairpollution")
    @ResponseBody
    public Object getairpollution(@RequestParam("lat") String lat, @RequestParam("lng") String lng) throws IOException, ParseException {
        return AirPollutionUtil.getAirPollution(lat,lng, whkey);
    }

    @RequestMapping("/weather")
    public String weather(Model model) {
        model.addAttribute("center", "weather");
        return "index";
    }
}
