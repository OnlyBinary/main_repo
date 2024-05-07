<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/24/24
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="ko">
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/modals/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <%--kakao map API--%>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9e1c6a20d65fd94d833f6984f6e0f2ba&libraries=services"></script>

</head>
<style>
    #map {
        /*width: 80%;*/
        height: 100vh;
    }
    #placeList {
        height: 100%;
        list-style: none;

    }

    #placeList .item {position:relative;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placeList .item span {display: block;margin-top:4px;}
    #placeList .info .jibun {padding-left:0px;}
    #placeList .info .gray {color: #8a8a8a;}
    #placeList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placeList .item h5, #placeList .item .info { text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placeList .item .info {padding: 10px 0 10px 0px;}
    #placeList .item .marker_1 {background-position: 0 -10px;}

    .modal-title {
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .modal-sheet .modal-dialog {
        width: 380px;
        transition: bottom .75s ease-in-out;
    }
    .modal-sheet .modal-footer {
        padding-bottom: 2rem;
    }
</style>
<spring:eval var="kakaoKey" expression="@keyStore.kakaoServiceKey"/>
<link rel="stylesheet" href="<c:url value="/css/kakaotest.css"/>">
<%-- jQuery --%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%--kakao map API--%>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>

<script>
    let geo2 = {

        map: null,
        fragment: null,
        mapdisplay: function(){
            <%--console.log(<%=KeyStore.kakaoServiceKey%>);--%>
            // console.log('map');
            geo2.map = new kakao.maps.Map(
                document.getElementById('map'),
                {
                    center: new kakao.maps.LatLng(37.5447611, 127.0564625), // 지도 중심좌표
                    level: 8 // 지도 확대 레벨
                }
            );

            let marker_position = new kakao.maps.LatLng(37.5447611, 127.0564625);
            this.displayGpsMarker(marker_position);
            this.go(37.5447611, 127.0564625); // 경도 위도 입력하면 주변 검색 넘겨서 띄우기

            // 우측 상단에 map control 추가
            var mapTypeControl = new kakao.maps.MapTypeControl();
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        },
        // 이동
        go: function(lat, lng) {
            let moveLatLon = new kakao.maps.LatLng(lat,lng);
            this.map.panTo(moveLatLon);

            // 마커 새로고침
            this.displayGpsMarker(moveLatLon);
            // this.getServiceData();
        },
        getServiceData: function() {
            $.ajax({
                url: '/getPublicServiceData',
                success: function(data) {
                    geo2.display(data);
                }
            })
        },
        displayGpsMarker:function(locPosition) {
            let marker = new kakao.maps.Marker({
                position: locPosition
            });
            marker.setMap(this.map);
        },
        displayStoreGpsMarker: function(place, address) {
            let overlay;
            let dataLoc = new kakao.maps.LatLng(place.lat, place.lng);

            let content = '<div class="wrap" style="position: absolute;left: 0;bottom: 40px;width: 200px;height: 100px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: \'Malgun Gothic\', dotum, \'돋움\', sans-serif;line-height: 1.5;">' +
                '<div class="info" style="width: 286px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;">' +
                '<div class="title" style="padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;">' +
                '<div>' + place.svcnm + '</div>' +
                // '<div style="float:right;margin:15px 10px 0 0;font-size:12px;font-color:red;text-align:center">위생등급: <h2>' + hgAsgnLv + '</h2></div>' +
                '</div>' +
                '<div class="body" style="position: relative;overflow: hidden;">' +
                '<div class="desc" style="position: relative;margin: 10px 10px 10px 10px;height: 100px;">' +
                // '<div class="jibun" style="font-size: 11px;color: #888;margin-top: -2px;">' + place.MAXCLASSNM + '>' + place.MINCLASSNM + '</div>' +
                '<div class="ellipsis" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">장소) ' + place.placenm + '</div>' +
                '<div class="ellipsis" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">주소) ' + address + '</div>' +
                // '<button type="button" onClick="window.location.href = \'' + place.place_url + '\'" style="margin:5px 0px 0px 10px;height:25px;width:150px;">카카오맵에서 보기</button>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';

            let el = document.createElement('li');
            el.innerHTML = '<div class="h-100 p-3 mb-2 text-bg-light rounded-3">'+
                '<h5>' + place.svcnm + '</h5>'+
                '<ul style="list-style:none!important;">' +
                '<li><strong>' + '장소' + '</strong>' + ': ' + place.placenm + '</li>' +
                '<li><strong>' + '주소' + '</strong>' + ': ' + address + '</li>' +
                '</ul>' +
            '</div>';
            el.className = 'item';

            fragment.appendChild(el);

            let markerImageSrc;
            // 무료와 유료에 따라 다른 마커 이미지 사용
            if (place.payatnm === "무료") {
                markerImageSrc = '/img/free.png'; // 무료 마커 이미지
            } else {
                markerImageSrc = '/img/cash.webp'; // 유료 마커 이미지
            }

            let markerImage = new kakao.maps.MarkerImage(markerImageSrc, new kakao.maps.Size(35, 35));
            let marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(place.lat, place.lng),
                image: markerImage
            });

            marker.setMap(geo2.map);

            kakao.maps.event.addListener(marker, 'mouseover', function () {
                overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: geo2.map,
                    position: dataLoc,
                    xAnchor: 0.5,
                    yAnchor: 0.91
                });
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
                overlay.setMap(null);
            });

            el.onmouseover = function () {
                overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: geo2.map,
                    position: dataLoc,
                    xAnchor: 0.3,
                    yAnchor: 0.91
                });
            };

            el.onmouseout = function () {
                overlay.setMap(null);
            }

            // 리스트 클릭시 이벤트 추가
            let url = '/service?detail=' + place.svcid;
            kakao.maps.event.addListener(marker, 'click', function(){
                window.location.href=url;
                // window.open(place.place_url);
            });

            el.addEventListener('click', function() {
                window.location.href = url;
            });

        },
        display: function (geoData) {
            console.log(geoData);
            let listEl = document.querySelector("#placeList");
            fragment = document.createDocumentFragment();
            $(geoData).each(function (index, item) {
                let geocoder = new kakao.maps.services.Geocoder();

                let coord= new kakao.maps.LatLng(item.lat, item.lng);
                let callback = function (result, status) {
                    if (status == kakao.maps.services.Status.OK) {
                        geo2.displayStoreGpsMarker(item, result[0].address.address_name);
                        if (index === geoData.length - 1) {
                            listEl.appendChild(fragment);
                        }
                    }
                }
                geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
            });
        }
    };
    let showList = {
        init: function(id) {
            document.querySelectorAll('.content').forEach(function(el) {
                el.style.display='none';
            });
            document.getElementById(id).style.display='block';
            let text = "";

            if (id === 'content1') text = '컨텐츠별';
            else if (id === 'content2') text = '서비스대상별';
            else if (id === 'content3') text = '지역구별';

            $('#cateBtn').text(text);
        },
        allList: function() {
            document.querySelectorAll('.content').forEach(function(el) {
                el.style.display='none';
            });
            $('#cateBtn').text("전체");
            geo2.getServiceData();
        }
    }
    let changeContentList = {
        content: function(data) {
            // maxclassnm = data 가져와서 geo2.display()
            $.ajax({
                url: '<c:url value="/getContentListData"/>',
                data: {'detail': data, 'category': 'content'},
                success: function(result) {
                    // console.log(result);
                    changeContentList.initialization(result);
                }
            })
        },
        target: function(data) {
            $.ajax({
                url: '<c:url value="/getContentListData"/>',
                data: {'detail': data, 'category': 'target'},
                success: function(result) {
                    changeContentList.initialization(result);
                }
            })
        },
        location: function(data) {
          $.ajax({
              url: '<c:url value="/getContentListData"/>',
              data: {'detail': data, 'category': 'location'},
              success: function(result) {
                  changeContentList.initialization(result);
              }
          })
        },
        initialization: function(data) {
            // 기존 지도 초기화
            document.querySelector("#map").innerHTML = '';
            geo2.mapdisplay(); // 기본지도 띄어주기
            // 옆에 목록 초기화
            document.querySelector("#placeList").innerHTML = '';
            geo2.display(data); // 마커 찍어주기
        }
    }
    $(function() {
        geo2.mapdisplay();
        showList.init(0);
        let currentPosition = parseInt($("#quickmenu").css("top"));
        $(window).scroll(function() {
            let position = $(window).scrollTop();
            $("#quickmenu").stop().animate({"top":position+currentPosition+"px"}, 1000);
        });
    })
</script>
<body>
<div class="container">
    <div style="display: flex;" class="mb-5">
        <div class="col-1" id="quickmenu" style="padding:0px;z-index:1;">
            <div class="dropdown">
                <button id="cateBtn" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="width:100%;">
                    선택
                </button>
                <div class="dropdown-menu">
                    <%-- 클릭하면 가져와서 값 뿌려주기 -> onclick --%>
                    <a class="dropdown-item" onclick="showList.allList()">전체</a>
                    <a class="dropdown-item" onclick="showList.init('content1')">컨텐츠별</a>
                    <a class="dropdown-item" onclick="showList.init('content2')">서비스대상별</a>
                    <a class="dropdown-item" onclick="showList.init('content3')">지역구별</a>
                </div>
            </div>
            <div id="content1" class="content">
                <div onclick="changeContentList.content('공간시설')">공간시설</div>
                <div onclick="changeContentList.content('교육강좌')">교육강좌</div>
                <div onclick="changeContentList.content('문화체험')">문화체험</div>
                <div onclick="changeContentList.content('진료복지')">진료복지</div>
                <div onclick="changeContentList.content('체육시설')">체육시설</div>
            </div>
            <div id="content2" class="content">
                <div onclick="changeContentList.target('가족')">가족</div>
                <div onclick="changeContentList.target('성인')">성인</div>
                <div onclick="changeContentList.target('청소년')">청소년</div>
                <div onclick="changeContentList.target('어린이')">어린이</div>
                <div onclick="changeContentList.target('')">기타</div>
            </div>
            <div id="content3" class="content">
                <div class="dropdown">
                    <button class="btn btn-default" type="button" data-toggle="dropdown">
                        서울중부
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li onclick="changeContentList.location('동대문구')"><a tabindex="-1">동대문구</a></li>
                        <li onclick="changeContentList.location('성동구')"><a tabindex="-1">성동구</a></li>
                        <li onclick="changeContentList.location('용산구')"><a tabindex="-1">용산구</a></li>
                        <li onclick="changeContentList.location('종로구')"><a tabindex="-1">종로구</a></li>
                        <li onclick="changeContentList.location('중구')"><a tabindex="-1">중구</a></li>
                    </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-default" type="button" data-toggle="dropdown">
                        서울동부
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li onclick="changeContentList.location('강동구')"><a tabindex="-1">강동구</a></li>
                        <li onclick="changeContentList.location('광진구')"><a tabindex="-1">광진구</a></li>
                        <li onclick="changeContentList.location('송파구')"><a tabindex="-1">송파구</a></li>
                        <li onclick="changeContentList.location('중랑구')"><a tabindex="-1">중랑구</a></li>
                    </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-default" type="button" data-toggle="dropdown">
                        서울서부
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li onclick="changeContentList.location('강서구')"><a tabindex="-1">강서구</a></li>
                        <li onclick="changeContentList.location('구로구')"><a tabindex="-1">구로구</a></li>
                        <li onclick="changeContentList.location('금천구')"><a tabindex="-1">금천구</a></li>
                        <li onclick="changeContentList.location('마포구')"><a tabindex="-1">마포구</a></li>
                        <li onclick="changeContentList.location('서대문구')"><a tabindex="-1">서대문구</a></li>
                        <li onclick="changeContentList.location('양천구')"><a tabindex="-1">양천구</a></li>
                        <li onclick="changeContentList.location('영등포구')"><a tabindex="-1">영등포구</a></li>
                    </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-default" type="button" data-toggle="dropdown">
                        서울남부
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li onclick="changeContentList.location('강남구')"><a tabindex="-1">강남구</a></li>
                        <li onclick="changeContentList.location('관악구')"><a tabindex="-1">관악구</a></li>
                        <li onclick="changeContentList.location('동작구')"><a tabindex="-1">동작구</a></li>
                        <li onclick="changeContentList.location('서초구')"><a tabindex="-1">서초구</a></li>
                    </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-default" type="button" data-toggle="dropdown">
                        서울북부
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li onclick="changeContentList.location('강북구')"><a tabindex="-1">강북구</a></li>
                        <li onclick="changeContentList.location('노원구')"><a tabindex="-1">노원구</a></li>
                        <li onclick="changeContentList.location('도봉구')"><a tabindex="-1">도봉구</a></li>
                        <li onclick="changeContentList.location('성북구')"><a tabindex="-1">성북구</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-3" style="overflow:scroll;height:100vh;" >
            <ul id="placeList"></ul>
        </div>
        <div class="col-8" id="map"></div>
    </div>
</div>
</body>
