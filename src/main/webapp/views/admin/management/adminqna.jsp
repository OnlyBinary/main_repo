<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/7/24
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let admindetail = {
        init: function () {
        }
    };
    $(function () {
        admindetail.init();
    })
</script>
<html>
<div class="container">
    <div class="col-lg-4 mb-4">
        <div class="card bg-info text-white shadow">
            <div class="card-body">
                1대1문의
                <div class="text-white-50 small">QnA</div>
            </div>
        </div>
    </div>
    <div>
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th class="text-center" style="width:40%;">Title</th>
                <th>Service ID (0 &rarr; 서비스 관련 문의)</th>
                <th>Register Date</th>
                <th>Writer</th>
                <th>답변</th>
            </thead>
            <tbody>
                <c:forEach var="q" items="${qnaDtoList}">
                    <tr>
                        <td>${q.qnaid}</td>
                        <td class="text-center">${q.title}</td>
                        <td>${q.svcid}</td>
                        <td>${q.regdate}</td>
                        <td>${q.memberid}</td>
                        <td><span class="badge badge-info">답변</span></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
