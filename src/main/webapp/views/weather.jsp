
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/weather.css">
<script type="module">
    function getFormattedDate() {
        const date = new Date(); // 현재 날짜와 시간을 가진 Date 객체 생성

        const year = date.getFullYear();
        const month = date.getMonth() + 1;
        const day = date.getDate();

        const formattedMonth = month < 10 ? "0"+month : month;
        const formattedDay = day < 10 ? "0"+day : day;
        return year+"-"+formattedMonth+"-"+formattedDay;
    }

    function applyWeatherClass(weatherId) {
        let weatherClass = '';
        if (weatherId >= 200 && weatherId < 300) {
            weatherClass = 'stormy';
        } else if (weatherId >= 300 && weatherId < 600) {
            weatherClass = 'rainy';
        } else if (weatherId >= 600 && weatherId < 700) {
            weatherClass = 'snowy';
        } else if (weatherId >= 700 && weatherId < 800) {
            weatherClass = 'foggy';
        } else if (weatherId === 800) {
            weatherClass = 'sunny';
        } else if (weatherId > 800 && weatherId < 900) {
            weatherClass = 'cloudy';
        }
        return weatherClass;
    }

    const weatherDescKo = {
        201: '가벼운 비를 동반한 천둥구름',
        200: '비를 동반한 천둥구름',
        202: '폭우를 동반한 천둥구름',
        210: '약한 천둥구름',
        211: '천둥구름',
        212: '강한 천둥구름',
        221: '불규칙적 천둥구름',
        230: '약한 연무를 동반한 천둥구름',
        231: '연무를 동반한 천둥구름',
        232: '강한 안개비를 동반한 천둥구름',
        300: '가벼운 안개비',
        301: '안개비',
        302: '강한 안개비',
        310: '가벼운 적은비',
        311: '적은비',
        312: '강한 적은비',
        313: '소나기와 안개비',
        314: '강한 소나기와 안개비',
        321: '소나기',
        500: '악한 비',
        501: '중간 비',
        502: '강한 비',
        503: '매우 강한 비',
        504: '극심한 비',
        511: '우박',
        520: '약한 소나기 비',
        521: '소나기 비',
        522: '강한 소나기 비',
        531: '불규칙적 소나기 비',
        600: '가벼운 눈',
        601: '눈',
        602: '강한 눈',
        611: '진눈깨비',
        612: '소나기 진눈깨비',
        615: '약한 비와 눈',
        616: '비와 눈',
        620: '약한 소나기 눈',
        621: '소나기 눈',
        622: '강한 소나기 눈',
        701: '박무',
        711: '연기',
        721: '연무',
        731: '모래 먼지',
        741: '안개',
        751: '모래',
        761: '먼지',
        762: '화산재',
        771: '돌풍',
        781: '토네이도',
        800: '구름 한 점 없는 맑은 하늘',
        801: '약간의 구름이 낀 하늘',
        802: '드문드문 구름이 낀 하늘',
        803: '구름이 거의 없는 하늘',
        804: '구름으로 뒤덮인 흐린 하늘',
        900: '토네이도',
        901: '태풍',
        902: '허리케인',
        903: '한랭',
        904: '고온',
        905: '바람부는',
        906: '우박',
        951: '바람이 거의 없는',
        952: '약한 바람',
        953: '부드러운 바람',
        954: '중간 세기 바람',
        955: '신선한 바람',
        956: '센 바람',
        957: '돌풍에 가까운 센 바람',
        958: '돌풍',
        959: '심각한 돌풍',
        960: '폭풍',
        961: '강한 폭풍',
        962: '허리케인',
    };

    let weather = {
        init: function () {
            $.ajax({
                url:'<c:url value="/getweather"/>',
                success:(result)=>{
                    console.log(result)
                    let wid = result.weather[0].id
                    result.weather[0].description = weatherDescKo[wid]
                    let weatherIcon = result.weather[0].icon;
                    let iconUrl = "http://openweathermap.org/img/w/"+weatherIcon+".png";
                    let weatherClass = applyWeatherClass(wid);
                    this.display(result, iconUrl, weatherClass);
                }
            });
        },
        display: function(result, iconUrl, weatherClass){
            let card = $('#weather-card');
            card.removeClass().addClass('card rounded p-2 ' + weatherClass);
            $('#w0').html(result.name);
            $('#desc').html(result.weather[0].description);
            $('#wtem').html(result.main.temp+'°');
            $('#wskin').html('체감온도:' + result.main.feels_like);
            $('#wlh').html(Math.round(result.main.temp_min)+'°'+"/"+Math.round(result.main.temp_max) + '°');
            $('#wicon').html("<img src=" + iconUrl + " width=100 height=100>");
        }
    };
    let weather2 = {
        init: function () {
            $.ajax({
                url: '<c:url value="/getwhforcast"/>',
                type: 'GET',
                success: (result) => {
                    console.log(result.list);
                    this.display(result.list);
                }
            });
        },
        display: function(list) {
            const targetDate = getFormattedDate(); // 표시하려는 날짜
            console.log(getFormattedDate());
            let content = `<table class='table'>
                            <tr>
                                <th>Date</th>
                                <th>Weather</th>
                                <th>Temperature</th>
                                <th>Feels Like</th>
                                <th>Min Temp</th>
                                <th>Max Temp</th>
                                <th>Pressure</th>
                                <th>Humidity</th>
                                <th>Wind</th>
                            </tr>`;
            list.forEach((forecast, index) => {
                // if (index < 5) {
                const forecastDate = forecast.dt_txt.split(" ")[0]

                if (forecastDate === targetDate) {
                    content += `<tr>
                                    <td>\${new Date(forecast.dt * 1000).toLocaleString()}</td>
                                    <td>\${forecast.weather[0].main} - ${forecast.weather[0].description}</td>
                                    <td>\${forecast.main.temp}°C</td>
                                    <td>\${forecast.main.feels_like}°C</td>
                                    <td>\${forecast.main.temp_min}°C</td>
                                    <td>\${forecast.main.temp_max}°C</td>
                                    <td>\${forecast.main.pressure} hPa</td>
                                    <td>\${forecast.main.humidity}%</td>
                                    <td>\${forecast.wind.speed} m/s from ${forecast.wind.deg} degrees</td>
                                </tr>`;
                }
            });
            content += '</table>';
            $('#forecast-container').html(content);
        }
    };
    let airPollution = {
        init: function () {
            $.ajax({
                url: '<c:url value="/getairpollution"/>', // Make sure the URL is correctly pointing to your API endpoint
                success: (result) => {
                    console.log(result); // Log the result to verify data structure
                    this.display(result);
                }
            });
        },
        display: function(result){
            let pm2_5 = result.list[0].components.pm2_5; // Accessing PM2.5
            let pm10 = result.list[0].components.pm10;   // Accessing PM10
            $('#pm25').html("초미세먼지: "+ pm2_5 +"µg/m³");
            $('#pm10').html("미세먼지: "+ pm10 +"µg/m³");
        }
    };
    $(function () {
        weather.init()
        weather2.init();
        airPollution.init();
    });
</script>

<%-- 위젯 --%>
<script src='//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/d3.min.js'></script>
<script>
    window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];
    window.myWidgetParam.push({id: 11,cityid: '1835847',appid: '5ae7c11283db62206e0b6552195f7bce',units: 'metric',containerid: 'openweathermap-widget-11',  });
    (function() {
        var script = document.createElement('script');
        script.async = true;script.charset = "utf-8";script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(script, s);
    })();
</script>
<%-- 위젯 --%>

<div class="container">
    <div id="weather-card" class="p-2" style="border: 1.5px solid black;">
        <div class="d-flex align-items-center">
            <div class="d-flex flex-column align-items-center p-2"
                 style="width: auto; border: 1.5px solid black; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                  background-color: white; margin: 20px; padding: 15px;">
                <div class="d-flex align-items-center justify-content-center p-2">
                    <img src="img/weatherPoint.png" alt="Weather Point" width="30" height="30">
                    <h4 id="w0"></h4>
                </div>
                <h5 id="wicon" class="p-2"></h5>
            </div>
            <div>
                <h5 id="dwsc"></h5>
                <h5 id="wtem"></h5>
                <h5 id="wlh"></h5>
                <h5 id="wskin"></h5>
            </div>
            <div class="container">
                <h2>Air Pollution Data</h2>
                <h5 id="pm25">PM2.5: Loading...</h5>
                <h5 id="pm10">PM10: Loading...</h5>
            </div>
        </div>
    </div>

    <div id="forecast-container"></div> <!-- Container for weather forecasts -->
    <div id="openweathermap-widget-11"></div>
</div>
