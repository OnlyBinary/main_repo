<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/weather.css">
<style>
  #like {
    width:20px;
    /*height:20vh;*/
    fill:#ddd;
  }
  #like.active{
    fill:red;
  }
</style>
<script>
  let likeClick = {
    init: function() {
      let likeBtn = document.querySelector("#like");
      // 처음에 접속할 때 해당 게시글을 좋아하는지 아닌지 데이터 가져와서 초기상태 설정
      // 해당 게시글에 대한 좋아요수 만 가져와서 하트 옆에 출력
      likeBtn.addEventListener('click', function() {
        if (likeBtn.classList.contains('active')) {
          likeBtn.classList.remove('active');
          alert('좋아요가 취소되었습니다.');
          // 해당 유저의 해당 게시글 좋아요 취소 쿼리
        } else {
          likeBtn.classList.toggle('active');
          alert("해당 게시글을 좋아합니다.");
          // 해당 유저의 해당 게시글 좋아요 쿼리
        }
      });
    }
  }
  $(function() {
    // console.log();
    likeClick.init();
  })
</script>
<script>
  function redirectToMap() {
    let url = "https://map.kakao.com/link/to/${service.placenm},${lat},${lng}";
    console.log(url);
    window.open(url, '_blank'); // 새 창(탭)에서 URL 열기
  }
  function moveToWeather() {
    // const weatherSection = document.getElementById('weather-card');
    const weatherSection = document.getElementById('weather-details');
    if (weatherSection) {
      weatherSection.scrollIntoView({ behavior: 'smooth' });
    }
  }
</script>

<%--날씨정보 script--%>
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
        data:{"lat":${lat}, "lng": ${lng}},
        success:(result)=>{
          let wid = result.weather[0].id
          result.weather[0].description = weatherDescKo[wid]
          let weatherIcon = result.weather[0].icon;
          console.log(weatherIcon)
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
      $('#wskin').html('체감온도:' + result.main.feels_like + "°");
      $('#wlh').html("<span class='temp-value temp-min'>" + Math.round(result.main.temp_min) + "°</span>/" +
              "<span class='temp-value temp-max'>" + Math.round(result.main.temp_max) + "°</span>");
      $('#wicon').html("<img src=" + iconUrl + " width=100 height=100>");
    }
  };
  let weather2 = {
    init: function () {
      $.ajax({
        url: '<c:url value="/getwhforcast"/>',
        data:{"lat":${lat}, "lng": ${lng}},
        type: 'GET',
        success: (result) => {
          console.log("결과: ",result.list);
          this.display(result.list);
        }
      });
    },
    display: function(list) {
      const targetDate = getFormattedDate(); // 표시하려는 날짜
      let content = `<table class='table'>
                            <tr>
                              <th>날짜</th>
                              <th>날씨</th>
                              <th>온도</th>
                              <th>체감온도</th>
                              <th>최저온도</th>
                              <th>최고온도</th>
                              <th>기압</th>
                              <th>습도</th>
                              <th>풍속</th>
                            </tr>`;
      list.forEach((forecast, index) => {
        // if (index < 5) {
        const forecastDate = forecast.dt_txt.split(" ")[0]
        console.log(forecastDate)
        console.log(forecast.dt_txt.split(" ")[0])
        console.log(forecastDate === forecast.dt_txt.split(" ")[0])
        if (forecastDate === targetDate) {
          content += `<tr>
                                    <td>\${new Date(forecast.dt * 1000).toLocaleString()}</td>
                                    <td><img src="http://openweathermap.org/img/w/\${forecast.weather[0].icon}.png" width="50" height="50"></td>
                                    <td>\${forecast.main.temp}°C</td>
                                    <td>\${forecast.main.feels_like}°C</td>
                                    <td>\${forecast.main.temp_min}°C</td>
                                    <td>\${forecast.main.temp_max}°C</td>
                                    <td>\${forecast.main.pressure} hPa</td>
                                    <td>\${forecast.main.humidity}%</td>
                                    <td>\${forecast.wind.speed} m/s</td>
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
        data:{"lat":${lat}, "lng": ${lng}},
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

<main id="main">

  <!-- ======= Breadcrumbs ======= -->
  <section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

      <div class="d-flex justify-content-between align-items-center">
        <h4>${service.svcnm}</h4>
        <ol>
          <li><a href="index.html">Home</a></li>
          <li>${prevMenu}</li>
          <li>행사 상세정보</li>
        </ol>
      </div>

    </div>
  </section><!-- End Breadcrumbs -->

  <!-- ======= Portfolio Details Section ======= -->
  <section id="portfolio-details" class="portfolio-details">
    <div class="container">

      <div class="row gy-4">

        <div class="col-lg-8">
          <div class="portfolio-details-slider swiper">
            <div class="swiper-wrapper align-items-center">

              <div class="swiper-slide">
                <img src="${service.imgurl}" alt="">
              </div>

<%--              <div class="swiper-slide">--%>
<%--                <img src="assets/img/portfolio/portfolio-2.jpg" alt="">--%>
<%--              </div>--%>

<%--              <div class="swiper-slide">--%>
<%--                <img src="assets/img/portfolio/portfolio-3.jpg" alt="">--%>
<%--              </div>--%>

            </div>
            <div class="swiper-pagination"></div>
          </div>
          <div>
            ${detail.ListPublicReservationDetail.row[0].NOTICE}
<%--            ${detail.ListPublicReservationDetail.row[0].DTLCONT}--%>
<%--            ${service.detail}--%>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="portfolio-description" style="padding-top:0px!important;">
            <h5>${service.svcnm}</h5>
            <p>가격 : ${service.payatnm}</p>
            <p>지역 : ${service.areanm}</p>
            <p>장소 : ${service.placenm}</p>
            <p>행사기간: ${service.svcstr} ~ ${service.svcfin}</p>
            <p>접수기간: ${service.rcptstr} ~ ${service.rcptfin}</p>
            <p>대상 : ${service.usertgtinfo}</p>
          </div>
          <button style="width:100%;" class="btn btn-success mb-2">홈페이지 이동</button>
          <button style="width:100%;" class="btn btn-success mb-2" onclick="redirectToMap();">길찾기</button>
          <button style="width:100%;" class="btn btn-success mb-2" onclick="moveToWeather();">날씨보기</button>
          <div style="display:flex;">
            <svg id="like" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
            <p class="ml-1" style="align-items: center;">1,200</p>
          </div>

          <div style="overflow:scroll;">
            <div class="portfolio-info">
              <h3>근처 주차장 정보</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-info">
              <h3>교통정보</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Portfolio Details Section -->

  <section id="weather-details">
    <div class="portfolio-info">
      <h3>날씨, 미세먼지, 모기예보</h3>
      <div class="container">
        <div id="weather-card" class="p-2">
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
            <div class="d-flex flex-column">
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
        <div id="forecast-container"></div>

      </div>
    </div>
  </section>


</main><!-- End #main -->