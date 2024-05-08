<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/2/24
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let cardviewheader = {
        init: function () {
        }
    };
    $(function () {
        cardviewheader.init();
    })
</script>
<!-- Blog Page Title & Breadcrumbs -->
<div data-aos="fade" class="page-title">
    <c:if test="${menu != null}">
        <div class="heading">
            <div class="container">
                <div class="row d-flex justify-content-center text-center">
                    <div class="col-lg-12">
    <%--                    <h1>${menu}</h1>--%>
                        <img style="width:100%;" src="/img/slogun/${menu}.png">
    <%--                    <p class="mb-0">Odio et unde deleniti. Deserunt numquam exercitationem. Officiis quo odio sint voluptas consequatur ut a odio voluptatem. Sit dolorum debitis veritatis natus dolores. Quasi ratione sint. Sit quaerat ipsum dolorem.</p>--%>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <nav class="breadcrumbs" style="margin-top:0px!important;">
        <div class="container">
            <ol>
                <li><a href="index.html">Home</a></li>
                <li>${currentDiv}</li>
                <li class="current">${submenu}</li>
            </ol>
        </div>
    </nav>
</div><!-- End Page Title -->