<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 4/27/24
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let header = {
        init: function () {
        }
    };
    $(function () {
        header.init();
    })
</script>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

        <img src="/img/mainlogo.png" alt="mainlogo" style="height:82px;width:5rem;"/>
        <h1 class="logo"><a href="index.html">Only Binary</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar">
            <ul>
<%--                <li><a class="nav-link scrollto active" href="#hero">Home</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#about">About</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#services">Services</a></li>--%>
                <%--          <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#team">Team</a></li>--%>
                <li class="dropdown"><a href="#"><span>컨텐츠별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a class="nav-link scrollto " href="#portfolio">공간시설</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">교육강좌</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">문화체험</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">진료복지</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">체육시설</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span>서비스대상별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a class="nav-link scrollto " href="#portfolio">가족</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">성인</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">청소년</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">어린이</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">기타</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span>지역구별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <%--              <li><a href="#">서울 북부</a></li>--%>
                        <li class="dropdown"><a href="#"><span>서울 중부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">동대문구</a></li>
                                <li><a href="#">성동구</a></li>
                                <li><a href="#">용산구</a></li>
                                <li><a href="#">종로구</a></li>
                                <li><a href="#">중구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 동부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">강동구</a></li>
                                <li><a href="#">광진구</a></li>
                                <li><a href="#">송파구</a></li>
                                <li><a href="#">중랑구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 서부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">강서구</a></li>
                                <li><a href="#">구로구</a></li>
                                <li><a href="#">금천구</a></li>
                                <li><a href="#">마포구</a></li>
                                <li><a href="#">서대문구</a></li>
                                <li><a href="#">양천구</a></li>
                                <li><a href="#">영등포구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 남부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">강남구</a></li>
                                <li><a href="#">관악구</a></li>
                                <li><a href="#">동작구</a></li>
                                <li><a href="#">서초구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 북부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">강북구</a></li>
                                <li><a href="#">노원구</a></li>
                                <li><a href="#">도봉구</a></li>
                                <li><a href="#">성북구</a></li>
                            </ul>
                        </li>
                        <%--              <li><a href="#">Drop Down 2</a></li>--%>
                        <%--              <li><a href="#">Drop Down 3</a></li>--%>
                        <%--              <li><a href="#">Drop Down 4</a></li>--%>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
                <li><a class="getstarted scrollto" href="#about">로그인</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->