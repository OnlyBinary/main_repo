<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/7/24
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let admincenter = {
        init: function () {
        }
    };
    $(function () {
        admincenter.init();
    })
</script>
<div class="container">
    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">조회수 높은 행사</h6>
                </div>
                <div class="card-body">
                    <c:forEach var="s" items="${serviceDtoList}">
                        <p>${s.svcnm}</p>
<%--                        <p>${s.cnt}</p>--%>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <!-- Color System -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card bg-primary text-white shadow" onclick={window.location.href="/admin/management/member"}>
                        <div class="card-body">
                            회원관리
                            <div class="text-white-50 small">Member</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4" onclick={window.location.href="/admin/management/service"}>
                    <div class="card bg-success text-white shadow">
                        <div class="card-body">
                            행사관리
                            <div class="text-white-50 small">Service</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4" onclick={window.location.href="/admin/management/qna"}>
                    <div class="card bg-info text-white shadow">
                        <div class="card-body">
                            1대1 문의
                            <div class="text-white-50 small">Contact</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Illustrations -->
        <div class="col-lg-6">
            <div class="card shadow mb-4" style="height:50vh;">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">리뷰 관리 (최근 등록순)</h6>
                </div>
                <div class="card-body" style="overflow:scroll;">
                    <c:forEach var="r" items="${reviewListDtos}">
                        <div class="p-3 mb-2 text-bg-light rounded-3">
                            <p>${r.content}</p>
                            <p>serviceId: ${r.svcid}</p>
                            <p>${r.memberid}</p>
                            <p>${r.regdate}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Illustrations -->
        <div class="col-lg-6">
            <div class="card shadow mb-4" style="height:50vh;">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">리뷰 관리</h6>
                </div>
                <div class="card-body" style="overflow:scroll;">

                </div>
            </div>
        </div>

    </div>
</div>

