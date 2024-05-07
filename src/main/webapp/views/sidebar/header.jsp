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


            <a href="<c:url value="/"/>">
                <div style="display:flex !important; align-items:center;">
                <img src="/img/mainlogo.png" alt="mainlogo" style="height:82px;width:5rem;"/>
                <h1 class="logo ml-2">Only Binary</h1>
                </div>
            </a>

        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar">
            <ul>
<%--                <li><a class="nav-link scrollto active" href="#hero">Home</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#about">About</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#services">Services</a></li>--%>
                <%--          <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>--%>
                <%--          <li><a class="nav-link scrollto" href="#team">Team</a></li>--%>
                <li class="dropdown"><a href="/contents/main"><span>컨텐츠별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a class="nav-link scrollto " href="<c:url value="/contents/gongan"/>">공간시설</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/contents/edulec"/>">교육강좌</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/contents/culexper"/>">문화체험</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/contents/medical"/>">진료복지</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/contents/sportsfacilities"/>">체육시설</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="/target/main"><span>서비스대상별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a class="nav-link scrollto " href="<c:url value="/target/family"/>">가족</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/target/adult"/>">성인</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/target/teenager"/>">청소년</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/target/child"/>">어린이</a></li>
                        <li><a class="nav-link scrollto " href="<c:url value="/target/etc"/>">기타</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span>지역구별</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <%--              <li><a href="#">서울 북부</a></li>--%>
                        <li class="dropdown"><a href="#"><span>서울 중부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/location/동대문구">동대문구</a></li>
                                <li><a href="/location/성동구">성동구</a></li>
                                <li><a href="/location/용산구">용산구</a></li>
                                <li><a href="/location/종로구">종로구</a></li>
                                <li><a href="/location/중구">중구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 동부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/location/강동구">강동구</a></li>
                                <li><a href="/location/광진구">광진구</a></li>
                                <li><a href="/location/송파구">송파구</a></li>
                                <li><a href="/location/중랑구">중랑구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 서부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/location/강서구">강서구</a></li>
                                <li><a href="/location/구로구">구로구</a></li>
                                <li><a href="/location/금천구">금천구</a></li>
                                <li><a href="/location/마포구">마포구</a></li>
                                <li><a href="/location/서대문구">서대문구</a></li>
                                <li><a href="/location/양천구">양천구</a></li>
                                <li><a href="/location/영등포구">영등포구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 남부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/location/강남구">강남구</a></li>
                                <li><a href="/location/관악구">관악구</a></li>
                                <li><a href="/location/동작구">동작구</a></li>
                                <li><a href="/location/서초구">서초구</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>서울 북부</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/location/강북구">강북구</a></li>
                                <li><a href="/location/노원구">노원구</a></li>
                                <li><a href="/location/도봉구">도봉구</a></li>
                                <li><a href="/location/성북구">성북구</a></li>
                            </ul>
                        </li>
                        <%--              <li><a href="#">Drop Down 2</a></li>--%>
                        <%--              <li><a href="#">Drop Down 3</a></li>--%>
                        <%--              <li><a href="#">Drop Down 4</a></li>--%>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="<c:url value="/qna/list"/>">Contact</a></li>
                <c:choose>
                    <c:when test="${sessionScope.id == null}">
                        <li><a href="<c:url value="/login"/>" style="font-size: 12px;">로그인</a></li>
                        <li><a href="<c:url value="/register"/>" style="font-size: 12px;">회원가입</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value="/mypage"/>" style="font-size: 12px;">마이페이지</a></li>
                        <li><a href="<c:url value="/logout"/>" style="font-size: 12px;">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
        </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->