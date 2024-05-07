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

        <a href="<c:url value="/admin/dashboard"/>">
            <div style="display:flex !important; align-items:center;">
                <img src="/img/mainlogo.png" alt="mainlogo" style="height:82px;width:5rem;"/>
                <h1 class="logo ml-2">Only Binary</h1>
            </div>
        </a>

        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <h3>관리자 페이지</h3>

    </div>
</header><!-- End Header -->