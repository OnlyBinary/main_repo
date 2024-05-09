<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/2/24
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let movePage = {
        init: function (url) {
            window.location.href="http://172.16.21.242"+url+"?pageNo=1";
            console.log("http://127.0.0.1"+url);
        }
    };
    $(function () {
        // movePage.init();
    })
</script>
<jsp:include page="cardviewheader.jsp"/>
<div class="container mt-5 mb-5 d-flex w-100 flex-wrap">
    <c:forEach var="l" items="${list}" varStatus="status">
        <c:if test="${status.index % 5 == 0}">
            <div class="col-md-4 mt-2">
                <div class="h-100 p-5 text-bg-primary rounded-3">
                    <h2>${l}</h2>
                    <button class="btn btn-outline-light" type="button" onclick="movePage.init('<c:url value="${urlList.get(status.index)}"/>')"> &rarr; 바로가기</button>
                </div>
            </div>
        </c:if>
        <c:if test="${status.index % 5 == 1}">
            <div class="col-md-4 mt-2">
                <div class="h-100 p-5 text-bg-secondary rounded-3">
                    <h2>${l}</h2>
                    <button class="btn btn-outline-light" type="button" onclick="movePage.init('<c:url value="${urlList.get(status.index)}"/>')"> &rarr; 바로가기</button>
                </div>
            </div>
        </c:if>
        <c:if test="${status.index % 5 == 2}">
            <div class="col-md-4 mt-2">
                <div class="h-100 p-5 text-bg-success rounded-3">
                    <h2>${l}</h2>
                    <button class="btn btn-outline-light" type="button" onclick="movePage.init('<c:url value="${urlList.get(status.index)}"/>')"> &rarr; 바로가기</button>
                </div>
            </div>
        </c:if>
        <c:if test="${status.index % 5 == 3}">
            <div class="col-md-4 mt-2">
                <div class="h-100 p-5 text-bg-info rounded-3">
                    <h2>${l}</h2>
                    <button class="btn btn-outline-dark" type="button" onclick="movePage.init('<c:url value="${urlList.get(status.index)}"/>')"> &rarr; 바로가기</button>
                </div>
            </div>
        </c:if>
        <c:if test="${status.index % 5 == 4}">
            <div class="col-md-4 mt-2">
                <div class="h-100 p-5 text-bg-warning rounded-3">
                    <h2>${l}</h2>
                    <button class="btn btn-outline-dark" type="button" onclick="movePage.init('<c:url value="${urlList.get(status.index)}"/>')"> &rarr; 바로가기</button>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>
