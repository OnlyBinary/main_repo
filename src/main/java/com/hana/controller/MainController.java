package com.hana.controller;

import com.hana.data.KeyStore;
import com.hana.util.AirPollutionUtil;
import com.hana.util.PublicServiceUtil;
import com.hana.util.WeatherUtil;
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

    @Value("${app.key.whkey}")
    String whkey;

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

    @RequestMapping("/getweather")
    @ResponseBody
    public Object getweather() throws IOException, ParseException {
        return WeatherUtil.getWeatherByCoordinates("37.56061111","127.039", whkey);
    }

    @RequestMapping("/getwhforcast")
    @ResponseBody
    public Object getwhforcast() throws IOException, ParseException {
        return WeatherUtil.getWeatherForecastByCoordinates("37.56061111","127.039", whkey);
    }

    @RequestMapping("/getairpollution")
    @ResponseBody
    public Object getairpollution() throws IOException, ParseException {
        return AirPollutionUtil.getAirPollution("37.56061111","127.039", whkey);
    }

    @RequestMapping("/weather")
    public String weather(Model model) {
        model.addAttribute("center", "weather");
        return "index";
    }
}
