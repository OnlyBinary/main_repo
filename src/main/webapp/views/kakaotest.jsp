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
<link rel="stylesheet" href="/css/kakaotest.css">
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
            this.getServiceData();
        },
        getServiceData: function() {
            $.ajax({
                url: '/getPublicServiceData',
                success: function(data) {
                    geo2.display(data.tvYeyakCOllect.row);
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
            let dataLoc = new kakao.maps.LatLng(place.Y, place.X);

            let content3 = '<div class="card" style="width:200px">' +
                '<img class="card-img-top" src="' + place.IMGURL + '" alt="Card image" style="height:200px">' +
                '<div class="card-body">' +
                '<h6 class="card-title">' + place.SVCNM + '</h6>' +
                '<a href="#" class="btn btn-primary">' + 'See Profile' + '</a>' +
                '</div>' +
                '</div>';

            let content2 = '<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog" id="modalSheet">' +
                '<div class="modal-dialog" role="document">' +
                '<div class="modal-content rounded-4 shadow">' +
                '<div class="modal-header border-bottom-0">' +
                '<h4 class="modal-title fs-5 col-10">' + place.SVCNM + '</h4>' +
                '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>' +
                '</div>' +
                // '<div class="modal-body py-0">' +
                // '<p>' + 'This is a modal sheet, a variation of the modal that docs itself to the bottom of the viewport like the newer share sheets in iOS.' + '</p>' +
                // '</div>' +
                '<div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">' +
                '<h6>' + place.MAXCLASSNM + ' > ' + place.MINCLASSNM + '</h6>' +
                '<h5>' + '장소) ' + place.PLACENM + '</h5>' +
                '<h5>' + '주소) ' + address + '</h5>' +
                // '<button type="button" class="btn btn-lg btn-primary">' + 'Save Changes' + '</button>' +
                // '<button type="button" class="btn btn-lg btn-secondary" data-bs-dismiss="modal">' + 'Close' + '</button>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';

            let content = '<div class="wrap" style="position: absolute;left: 0;bottom: 40px;width: 200px;height: 100px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: \'Malgun Gothic\', dotum, \'돋움\', sans-serif;line-height: 1.5;">' +
                '<div class="info" style="width: 286px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;">' +
                '<div class="title" style="padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;">' +
                '<div>' + place.SVCNM + '</div>' +
                // '<div style="float:right;margin:15px 10px 0 0;font-size:12px;font-color:red;text-align:center">위생등급: <h2>' + hgAsgnLv + '</h2></div>' +
                '</div>' +
                '<div class="body" style="position: relative;overflow: hidden;">' +
                '<div class="desc" style="position: relative;margin: 10px 10px 10px 10px;height: 100px;">' +
                '<div class="jibun" style="font-size: 11px;color: #888;margin-top: -2px;">' + place.MAXCLASSNM + '>' + place.MINCLASSNM + '</div>' +
                '<div class="ellipsis" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">장소) ' + place.PLACENM + '</div>' +
                '<div class="ellipsis" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">주소) ' + address + '</div>' +
                // '<button type="button" onClick="window.location.href = \'' + place.place_url + '\'" style="margin:5px 0px 0px 10px;height:25px;width:150px;">카카오맵에서 보기</button>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';

            let el = document.createElement('li');
            // el.innerHTML =
            //     '<div class="info">' +
            //     '<h5>' + place.SVCNM + '</h5>' +
            //     '<span>' + place.PLACENM + '</span>' +
            //     '<span class="jibun gray">' + address + '</span>' +
            //     '</div>';
            el.innerHTML = '<div class="portfolio-details portfolio-info">'+
                '<h5>' + place.SVCNM + '</h5>'+
                '<ul>' +
                '<li><strong>' + '장소' + '</strong>' + ': ' + place.PLACENM + '</li>' +
                '<li><strong>' + '주소' + '</strong>' + ': ' + address + '</li>' +
                '</ul>' +
            '</div>';
            el.className = 'item';

            fragment.appendChild(el);

            let marker = new kakao.maps.Marker({
                position: dataLoc
            });

            marker.setMap(geo2.map);

            kakao.maps.event.addListener(marker, 'mouseover', function () {
                overlay = new kakao.maps.CustomOverlay({
                    content: content2,
                    map: geo2.map,
                    position: dataLoc,
                    xAnchor: 0.5,
                    yAnchor: 0.91
                });
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
                overlay.setMap(null);
            });

            // kakao.maps.event.addListener(marker, 'click', function(){
            //     // window.location.href=place.place_url;
            //     window.open(place.place_url);
            // });

            el.onmouseover = function () {
                overlay = new kakao.maps.CustomOverlay({
                    content: content2,
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

        },
        display: function (geoData) {
            let listEl = document.querySelector("#placeList");
            fragment = document.createDocumentFragment();

            $(geoData).each(function (index, item) {
                let geocoder = new kakao.maps.services.Geocoder();

                let coord = new kakao.maps.LatLng(item.Y, item.X);
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
    $(function() {
        geo2.mapdisplay();
    })
</script>
<body>
<div class="container">
<%--    <div style="width: 100%;">--%>
<%--        <!-- Example single danger button -->--%>
<%--        <div class="btn-group">--%>
<%--            <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                Action--%>
<%--            </button>--%>
<%--            <ul class="dropdown-menu">--%>
<%--                <li><a class="dropdown-item" href="#">Action</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Another action</a></li>--%>
<%--                <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
<%--                <li><hr class="dropdown-divider"></li>--%>
<%--                <li><a class="dropdown-item" href="#">Separated link</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div style="display: flex;">
        <div class="col-3" style="overflow:scroll;">
            <ul id="placeList"></ul>
        </div>

        <div class="col-9" id="map"></div>
    </div>
</div>

</body>
