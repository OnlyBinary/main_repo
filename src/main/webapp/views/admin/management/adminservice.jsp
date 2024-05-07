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
    let adminservice = {
        init: function (data) {
            $.ajax({
                url: '/admin/management/service/delete',
                data: {"serviceId": data},
                success: function() {
                    window.location.reload();
                }
            })
        }
    };
    $(function () {
        // adminservice.init();
    })
</script>
<html>
<div class="container">
    <div class="col-lg-4 mb-4">
        <div class="card bg-success text-white shadow">
            <div class="card-body">
                행사관리
                <div class="text-white-50 small">Service</div>
            </div>
        </div>
    </div>
    <div>
        <table class="table table-striped" style="height:100vh;">
            <thead>
                <th>Service ID</th>
                <th style="width:50%;">Service Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>관리</th>
            </thead>
            <tbody style="overflow:scroll;">
                <c:forEach var="s" items="${serviceDtoList}">
                    <tr>
                        <td>${s.svcid}</td>
                        <td>${s.svcnm}</td>
                        <td>${s.svcstr.toString().split("T")[0]}</td>
                        <td>${s.svcfin.toString().split("T")[0]}</td>
                        <td>
                            <span class="badge badge-danger"
                                  onclick="adminservice.init('${s.svcid}')">삭제</span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
