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
        <%-- carousel --%>
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- The slideshow -->
            <div class="carousel-inner" style="display:flex;">
                <c:forEach var="i" items="${imageList}" varStatus="status">
                    <div class="carousel-item${status.first ? ' active' : ''}"
                         onclick="window.location.href='/service?detail=${i.svcid}'">
                        <img src="${i.imgurl}" alt="${i.svcnm}" style="opacity: 0.2;width:100%;height:30rem;">
<%--                        <h5 style="position:absolute;top:0px;left:0px;">${i.svcnm}</h5>--%>
                    </div>
                </c:forEach>
                <div class="container mt-auto mb-auto" style="z-index:1;display:flex;">
                    <div class="col-md-6"></div>
                    <div class="col-md-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
                    style="vertical-align:bottom;">
                        <h1>Seoul, My Soul</h1>
                        <h2>마음이 모이면 서울이 됩니다</h2>
                        <div class="d-flex">
                            <a href="<c:url value="/map"/>" class="btn-get-started scrollto">지도로 서비스 조회</a>
                            <%--            <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section><!-- End Hero -->

<main id="main">

    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services">
        <div class="container mb-5">

            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-laptop"></i></div>
                        <h4 class="title"><a href="">지역구별 서비스 조회</a></h4>
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
    <!-- End Featured Services Section -->

</main>
<!-- End #main -->
