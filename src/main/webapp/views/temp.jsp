<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="/css/weather.css">
<link rel="stylesheet" href="/css/kakaoparking.css">
<style>
  #like {
    width:20px;
    fill:#ddd;
  }
  #like.active{
    fill:red;
  }
</style>
<script>
  function redirectToMap() {
    let url = "https://map.kakao.com/link/to/${service.placenm},${lat},${lng}";
    window.open(url, '_blank'); // 새 창(탭)에서 URL 열기
  }
  function moveToWeather() {
    // const weatherSection = document.getElementById('weather-card');
    const weatherSection = document.getElementById('weather-details');
    if (weatherSection) {
      weatherSection.scrollIntoView({ behavior: 'smooth' });
    }
  }
  function moveToParkingLot() {
    const parkingSection = document.getElementById('parking-lot');
    if (parkingSection) {
      parkingSection.scrollIntoView({ behavior: 'smooth' });
    }
  }
  function moveToReview() {
    const reviewSection = document.getElementById('review-list');
    if (reviewSection) {
      reviewSection.scrollIntoView({ behavior: 'smooth' });
    }
  }
</script>
<%--날씨정보 script--%>
<script type="module">
  function getFormattedNowDate() {
    const date = new Date(); // 현재 날짜와 시간을 가진 Date 객체 생성

    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();

    const formattedMonth = month < 10 ? "0"+month : month;
    const formattedDay = day < 10 ? "0"+day : day;
    return year+"-"+formattedMonth+"-"+formattedDay;
  }

  function formatDate(dateString) {
    const date = new Date(dateString);

    const options = {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: 'numeric',
      hour12: true,
      minute: '2-digit'
    };

    const formatter = new Intl.DateTimeFormat('ko-KR', options);
    return formatter.format(date);
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
          let iconUrl = "http://openweathermap.org/img/w/"+weatherIcon+".png";
          let weatherClass = applyWeatherClass(wid);
          this.display(result, iconUrl, weatherClass);
        }
      });
    },
    display: function(result, iconUrl, weatherClass){
      // let card = $('#weather-card');
      // card.removeClass().addClass('card rounded p-2 ' + weatherClass);
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
          this.display(result.list);
          console.log(result.list)
        }
      });
    },
    display: function(list) {
      const targetDate = getFormattedNowDate(); // 표시하려는 날짜
      // 날짜 데이터를 드롭다운 메뉴에 추가
      let dates = list.map(forecast => forecast.dt_txt.split(" ")[0]);
      dates = [...new Set(dates)];  // 중복 제거

      let content = `<table class='table'>
                            <tr>
                              <th>
                              <div class="dropdown">
                                <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dateDisplayButton">
                                  날짜
                                </button>
                                <ul class="dropdown-menu" id="dateDropdownMenu"></ul>
                              </div>
                              </th>
                              <th>날씨</th>
                              <th>온도</th>
                              <th>체감온도</th>
                              <th>최저온도</th>
                              <th>최고온도</th>
                              <th>기압</th>
                              <th>습도</th>
                              <th>풍속</th>
                            </tr>`;
      list.forEach((forecast) => {
        const forecastDate = forecast.dt_txt.split(" ")[0]
        if (forecastDate === targetDate) {
          content += `<tr>
                                    <td>\${formatDate(forecast.dt_txt)}</td>
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
      dates.forEach((date) => {
        $('#dateDropdownMenu').append('<li><a class="dropdown-item" href="#">' + date + '</a></li>');
      });
      // 드롭다운 메뉴 선택 이벤트
      $('#dateDropdownMenu').on('click', 'a', function(e) {
        e.preventDefault();
        const selectedDate = $(this).text();
        refreshTable(selectedDate);
        $('#selectedDate').text(selectedDate);
      });

      // 테이블 데이터 리프레시 함수
      function refreshTable(date) {
        // 모든 테이블 데이터를 초기화
        $('#forecast-container tbody tr:gt(0)').remove();

        // 선택된 날짜에 해당하는 데이터를 필터링하여 테이블에 추가
        const filteredData = list.filter(forecast => forecast.dt_txt.split(" ")[0] == date);

        filteredData.forEach(forecast => {
          $('#forecast-container tbody').append(`
      <tr>
        <td>\${formatDate(forecast.dt_txt)}</td>
        <td><img src="http://openweathermap.org/img/w/\${forecast.weather[0].icon}.png" width="50" height="50"></td>
        <td>\${forecast.main.temp}°C</td>
        <td>\${forecast.main.feels_like}°C</td>
        <td>\${forecast.main.temp_min}°C</td>
        <td>\${forecast.main.temp_max}°C</td>
        <td>\${forecast.main.pressure} hPa</td>
        <td>\${forecast.main.humidity}%</td>
        <td>\${forecast.wind.speed} m/s</td>
      </tr>`);
        });
      }
    }
  };
  let airPollution = {
    init: function () {
      $.ajax({
        url: '<c:url value="/getairpollution"/>', // Make sure the URL is correctly pointing to your API endpoint
        data:{"lat":${lat}, "lng": ${lng}},
        success: (result) => {
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
  let likeClick = {
    init: function() {
      // 처음에 접속할 때 해당 게시글을 좋아하는지 아닌지 데이터 가져와서 초기상태 설정
      let likeBtn = document.querySelector("#like");
      $.ajax({
        url: '/service/getLikeData',
        data: {"serviceId": '${service.svcid}', "memberId": '${sessionScope.id}'},
        success:function(data) {
          if (data === true) {
            likeBtn.classList.toggle('active');
          }
        }
      });
      likeClick.display();

      // 하트 버튼 클릭 이벤트 리스너
      likeBtn.addEventListener('click', function() {
        // 로그인 안하면 좋아요 안눌리게
        if ('${sessionScope.id}'==="" || '${sessionScope.id}'==null) {
          alert("로그인 후 이용해주세요");
          return;
        }
        if (likeBtn.classList.contains('active')) {
          likeBtn.classList.remove('active');
          // 해당 유저의 해당 게시글 좋아요 취소 쿼리
          alert('나의 관심행사에서 등록 해제되었습니다.');
          likeClick.dislike();
        } else {
          likeBtn.classList.toggle('active');
          // 해당 유저의 해당 게시글 좋아요 쿼리
          alert("나의 관심행사에 등록되었습니다.");
          likeClick.like();
        }
      });
    },
    like: function() {
      $.ajax({
        url: '/service/dolike',
        data: {"serviceId": '${service.svcid}', "memberId": '${sessionScope.id}'},
        success: function() {
          likeClick.display();
        }
      });
    },
    dislike: function() {
      $.ajax({
        url: '/service/dodislike',
        data: {"serviceId": '${service.svcid}', "memberId": '${sessionScope.id}'},
        success: function() {
          likeClick.display();
        }
      });
    },
    display: function() {
      // 해당 게시글에 대한 좋아요수 만 가져와서 하트 옆에 출력
      $.ajax({
        url: '/service/getLikeCntData',
        data: {"serviceId": '${service.svcid}'},
        success: function(data) {
          $('#likeCnt').text(data);
        }
      })
    }
  }
  let increaseCnt = {
    init: function() {
      $.ajax({
        url: '/service/increaseCnt',
        data: {"serviceId": '${service.svcid}'}
      })
    }
  }
  $(function () {
    weather.init()
    weather2.init();
    airPollution.init();
    likeClick.init();
    increaseCnt.init();
  });
</script>
<main id="main">
  <!-- header bar -->
  <section id="breadcrumbs" style="margin-top:0px!important;" class="breadcrumbs">
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
  </section>
  <!-- 정보 페이지 시작 -->
  <section id="portfolio-details" class="portfolio-details">
    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-8">
          <div class="portfolio-details-slider swiper">
            <div class="swiper-wrapper align-items-center">
              <div class="swiper-slide">
                <img src="${service.imgurl}" alt="">
              </div>
            </div>
            <div class="swiper-pagination"></div>
          </div>
          <div>
            ${detail.ListPublicReservationDetail.row[0].NOTICE}
          </div>
        </div>
        <div class="col-lg-4">
          <!-- 행사 관련 간략 정보 -->
          <div class="portfolio-description" style="padding-top:0px!important;">
            <h5 class="mb-3">${service.svcnm}</h5>
            <p>가격 : ${service.payatnm}</p>
            <p>지역 : ${service.areanm}</p>
            <p>장소 : ${service.placenm}</p>
            <p>행사기간: ${service.svcstr.toString().split("T")[0]} ~ ${service.svcfin.toString().split("T")[0]}</p>
            <p>접수기간: ${service.rcptstr} ~ ${service.rcptfin}</p>
            <p>대상 : ${service.usertgtinfo}</p>
          </div>
          <div id="likeBtn">
            <span id="likeMsg" class="mr-1">좋아요</span>
            <svg id="like" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
            <h4 id="likeCnt"></h4>
          </div>
          <button style="width:102%;font-weight: bold;" class="btn btn-success mb-2"
          onclick={window.open("https://yeyak.seoul.go.kr/web/reservation/selectReservView.do?rsv_svc_id="+'${service.svcid}')}>홈페이지 이동</button>
          <div style="display:flex;">
            <button style="width:100%;font-weight: bold;" class="btn btn-success mb-2 col-lg-6 mr-2" onclick="redirectToMap();">길찾기</button>
            <button style="width:100%;font-weight: bold;" class="btn btn-success mb-2 col-lg-6" onclick="moveToWeather();">날씨보기</button>
          </div>

          <div style="display:flex;">
            <button style="width:100%;font-weight: bold;" class="btn btn-success mb-2 col-lg-6 mr-2" onclick="moveToParkingLot();">근처 주차장 정보</button>
            <button id="btn_qna" style="width:100%;font-weight: bold;"
                    class="btn btn-success mb-2 col-lg-6"
                    onclick={window.location.href="/qna/add?serviceId=${service.svcid}"}>
              문의하기
            </button>
          </div>
          <!-- 관심 등록 버튼 -->
          <button style="width:102%;font-weight: bold;" class="btn btn-success mb-2" id="btn_review" onclick="moveToReview();">리뷰보기</button>
        </div>
      </div>
    </div>
  </section>
  <!-- 날씨 정보 -->
  <section id="weather-details">
    <div class="portfolio-info">
      <div class="container">
        <div id="weather-card" class="p-2">
          <div>
            <div class="d-flex align-items-center p-2">
              <img src="img/weatherPoint.png" alt="Weather Point" width="30" height="30">
              <h4 id="w0"></h4>
            </div>
          </div>
          <div class="d-flex justify-content-center">
            <div class="d-flex align-items-center">
              <div class="d-flex flex-column align-items-center p-2">
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
        </div>
        <div class="d-flex justify-content-end">
          <div id="selectedDate">날짜 선택</div>
        </div>
        <div id="forecast-container"></div>
      </div>
    </div>
  </section>
  <!-- 주차장 정보 -->
  <section id = "parking-lot">
      <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <div id="menu_wrap" class="bg_white" style="z-index: 1000">
          <div class="option">
            <div>
              <form onsubmit="searchPlaces(); return false;">
                <input hidden="" type="text" id="keyword" value="${service.areanm} + 주차장" size="15">
                <button hidden type="submit">검색하기</button>
              </form>
            </div>
          </div>
          <hr>
          <ul id="placesList"></ul>
          <div id="pagination"></div>
        </div>
    </div>
  </section>
  <!-- 리뷰 정보 -->
  <section id="review-list" class="testimonials section-bg">
    <div class="container">
      <div class="section-title" style="display:flex;align-items:center;padding:15px 15px 15px 0!important;">
        <h3 style="text-align:left;" class="mr-4">리뷰보기</h3>
        <div style = "text-align: left;">
          <c:choose>
            <c:when test="${sessionScope.id != null}">
              <a href="<c:url value="/review/add?serviceId=${service.svcid}"/>">
                <button class="btn btn-success">리뷰등록</button>
              </a>
          </c:when>
            <c:when test="${sessionScope.id == null}">
            <a href="<c:url value="/login"/>">
              <button class="btn btn-success">리뷰등록</button>
            </a>
            </c:when>
          </c:choose>
        </div>
      </div>
      <h5 style="text-align:left!important;" class="ml-3 mb-3">${review.size()} comments</h5>
      <div class="comments">
        <c:forEach var="c" items="${review}">
          <div class="comment mb-2">
            <div class="d-flex">
              <div class="comment-img" style="margin-right:1rem;">
                <img src="/img/about.png" style="width:60px;" alt="">
              </div>
              <div>
                <div style="display:flex;align-items:center;">
                  <h5 style="text-align:left!important;" class="mr-2">${c.memberid}</h5>
                  <c:if test="${c.score ==1}"><span>⭐</span></c:if>
                  <c:if test="${c.score ==2}"><span>⭐⭐</span></c:if>
                  <c:if test="${c.score ==3}"><span>⭐⭐⭐</span></c:if>
                  <c:if test="${c.score ==4}"><span>⭐⭐⭐⭐</span></c:if>
                  <c:if test="${c.score ==5}"><span>⭐⭐⭐⭐⭐</span></c:if>
                </div>
                <time datetime="2020-01-01">${c.regdate}</time>
                <p style="width: 100%;" class="mt-2">
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>${c.content}
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    </section><!-- End Testimonials Section -->
</main><!-- End #main -->
<script>
  const latitude = ${lat};  // JSP EL(Expression Language)을 사용하여 값을 주입
  const longitude = ${lng};
  const area = ${service.areanm};
</script>
<spring:eval var="kakaoKey" expression="@keyStore.kakaoServiceKey"/>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>
<script src="<c:url value="/js/kakao.js" />"></script>