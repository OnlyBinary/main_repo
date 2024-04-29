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
<section id="hero" class="d-flex align-items-center">

    <div class="container">
        <div class="row">
            <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center">
                <h1>Seoul, My Soul</h1>
                <h2>마음이 모이면 서울이 됩니다</h2>
                <div class="d-flex">
                    <a href="#about" class="btn-get-started scrollto">지도로 서비스 조회</a>
                    <%--            <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>--%>
                </div>
                <%--          <div class="row footer-newsletter justify-content-center">--%>
                <%--            <div class="col-lg-6">--%>
                <%--              <form action="" method="post">--%>
                <%--                <input type="email" name="email" placeholder="Enter your Email"><input type="submit" value="Subscribe">--%>
                <%--              </form>--%>
                <%--            </div>--%>
                <%--          </div>--%>
                <%--          <div class="col-lg-5">--%>
                <%--            <form action="#" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="300">--%>
                <%--              <input type="text" class="form-control" placeholder="Enter email address">--%>
                <%--              <input type="submit" class="btn btn-primary" value="Sign up">--%>
                <%--            </form>--%>
                <%--          </div>--%>
            </div>
            <%--        <div class="col-lg-6 order-1 order-lg-2 hero-img">--%>
            <%--          <img src="/img/hero-img.png" class="img-fluid animated" alt="">--%>
            <%--        </div>--%>
            <%--        carousel --%>
            <div id="demo" class="col-lg-6 carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/ex1.jpg" alt="Los Angeles" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="img/ex2.jpg" alt="Chicago" width="1100" height="500">
                    </div>
                    <%--            <div class="carousel-item">--%>
                    <%--              <img src="ny.jpg" alt="New York" width="1100" height="500">--%>
                    <%--            </div>--%>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
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
                        <h4 class="title"><a href="">서비스 대상별 서비스 조회</a></h4>
                        <p class="description"></p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-clipboard-data"></i></div>
                        <h4 class="title"><a href="">컨텐츠별 서비스 조회</a></h4>
                        <p class="description">서울시에서 제공하는 공간시설, 교육강좌, 문화체험, 진료복지, 체육시설 서비스를 카테고리별로 조회할 수 있습니다 </p>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End Featured Services Section -->

</main><!-- End #main -->
