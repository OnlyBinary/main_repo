<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-04-30
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .info p {
        margin-bottom: 20px; /* Increase the margin-bottom value to increase spacing between rows */
        line-height: 3; /* Adjust line height to make the cells taller */
    }
    .favorites-title {
        margin-bottom: 100px; /* Adjust the margin bottom as needed */
    }
    .favorites-icon {
        margin-bottom: 10px; /* 하트 아이콘과 테이블 사이에 여백을 만들려면 마진 오른쪽 값을 조정하세요. */
    }
    a {
         color: #777; /* 링크 색상을 검정색으로 지정 */
         text-decoration: none; /* 밑줄 제거 */
     }
</style>

<script>
    let list = {
        init: function () {
        }
    };
    $(function () {
        list.init();
    });
</script>

<!-- ======= Breadcrumbs ======= -->
<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2 class = "custom-heading">문의하기</h2>
            <ol>
                <li><a href="<c:url value="/"/>">Home</a></li>
                <li>문의하기</li>
            </ol>
        </div>

    </div>
</section><!-- End Breadcrumbs -->

<div class="container">
    <a href="<c:url value="/qna/addgeneral"/>">
        <button id="btn_qna" style="margin-left: 10px" class="btn btn-success">문의하기</button>
    </a>
    <table class="table table-striped" style="margin-top: 30px" id ="board_table">
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>아이디</th>
            <th>등록일시</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${qna}" varStatus="status">
            <tr>
            <td>${status.index + 1}</td>
            <td style="width: 40%"><a href="<c:url value="/qna/detail?qnaid=${c.qnaid}"/>">${c.title}</a></td>
            <td>${c.memberid}</td>
            <td>${c.regdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
