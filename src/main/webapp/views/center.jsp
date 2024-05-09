<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/27/24
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let center = {
        init: function () {
        }
    };
    $(function () {
        center.init();
    })
</script>
<!-- ======= Hero Section ======= -->
<section id="hero" style="padding-top:0px!important;" class="d-flex align-items-center">
    <div class="container">
        <h3 class="font-weight-bold" style="font-family:'nanumgothic';">인기 행사 TOP 3</h3>
        <%-- carousel --%>
        <div class="row" style="display:flex;">
            <div id="demo" class="carousel slide col-lg-8" data-ride="carousel">
                <!-- The slideshow -->
                <div class="carousel-inner" style="display:flex;">
                    <c:forEach var="i" items="${imageList}" varStatus="status">
                        <div class="carousel-item${status.first ? ' active' : ''}"
                             onclick="window.location.href='/service?detail=${i.svcid}'">
                            <p><span class="badge badge-danger">${status.index+1}위</span>
                                <span class="badge badge-light">${i.svcnm}</span></p>
                            <img src="${i.imgurl}" alt="${i.svcnm}" style="opacity: 0.2;width:100%;height:30rem;">
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-4 d-flex align-items-center justify-content-center">
                <div class="text-center">
                    <h1>Seoul, My Soul</h1>
                    <h2>마음이 모이면 서울이 됩니다</h2>
                    <div class="d-flex justify-content-center">
                        <a href="<c:url value="/map"/>" class="btn-get-started scrollto">지도로 서비스 조회</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<main id="main">
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services">
        <div class="container mb-5">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-laptop"></i></div>
                        <h4 class="title"><a href="/location/main">지역구별 서비스 조회</a></h4>
                        <p class="description">가고싶은 지역구를 선택하세요! 해당 지역구에서 제공하는 서비스를 조회할 수 있습니다</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-card-checklist"></i></div>
                        <h4 class="title"><a href="/target/main">서비스 대상별 서비스 조회</a></h4>
                        <p class="description"></p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-clipboard-data"></i></div>
                        <h4 class="title"><a href="/contents/main">컨텐츠별 서비스 조회</a></h4>
                        <p class="description">서울시에서 제공하는 공간시설, 교육강좌, 문화체험, 진료복지, 체육시설 서비스를 카테고리별로 조회할 수 있습니다 </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>