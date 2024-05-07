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
        <div class="card bg-primary text-white shadow">
            <div class="card-body">
                회원관리
                <div class="text-white-50 small">Member</div>
            </div>
        </div>
    </div>
    <div>
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Member Name</th>
                <th>Phone Number</th>
                <th>Member Email</th>
                <th>관리</th>
            </thead>
            <tbody>
                <c:forEach var="m" items="${memberDtoList}">
                    <tr>
                        <td>${m.memberid}</td>
                        <td>${m.membernm}</td>
                        <td>${m.membertel}</td>
                        <td>${m.memberemail}</td>
                        <td>
                            <span class="badge badge-info">관리</span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
