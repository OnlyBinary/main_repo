
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .info p {
        margin-bottom: 20px; /* Increase the margin-bottom value to increase spacing between rows */
        line-height: 3; /* Adjust line height to make the cells taller */
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
<h1 style="text-align:center;">Contact</h1>
<div class="container mb-3">
    <table class="table table-striped" style="margin-top: 30px" id ="board_table">
        <thead>
        <tr>
            <th style="text-align:center;">글번호</th>
            <th style="text-align:center;">제목</th>
            <th style="text-align:center;">분류</th>
            <th>아이디</th>
            <th>등록일시</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${qna}" varStatus="status">
            <tr>
                <td style="text-align:center;">${status.index + 1}</td>
                <td style="width: 40%;text-align:center;"><a href="<c:url value="/qna/detail?qnaid=${c.qnaid}"/>">${c.title}</a></td>
                <td style="text-align:center;">
                    <c:if test="${c.svcid == '0'}">
                        서비스 문의
                    </c:if>
                    <c:if test="${c.svcid != '0'}">
                        행사관련 문의
                    </c:if>
                </td>
                <td>${c.memberid}</td>
                <td>${c.regdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="<c:url value="/qna/addgeneral"/>" style="display:flex;justify-content: right;">
        <button id="btn_qna" style="margin-left: 10px" class="btn btn-success">문의하기</button>
    </a>
</div>
