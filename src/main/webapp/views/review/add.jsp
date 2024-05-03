<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-04-30
  Time: 오후 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    .radio-label {
        margin-right: 20px; /* 원하는 간격 값으로 조정하세요. */
    }
    .custom-heading {
        font-family: 'Arial', sans-serif; /* 적절한 폰트로 변경하세요 */
    }
    #btn_check:hover {
        background-color: #0d6efd !important;
        border-color: #0d6efd !important;
    }
</style>

<!-- ======= Contact Section ======= -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class = "custom-heading">리뷰등록</h2>
                <ol>
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li>리뷰등록</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container">
            <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
                <form id="register_form" class="php-email-form">
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            아이디: <input type="text" class="form-control" name="memberid" id="memberid">
                        </div>
                    </div>
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            서비스명: <input type="text" class="form-control" name="svcnm" id="svcnm" value="${svcnm}">
                        </div>
                    </div>
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            내용: <input type="text" class="form-control" name="content" id="content" required>
                        </div>
                    </div>
                    <div class="form-group col-md-8 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            점수: <input type="text" class="form-control" name="score" id="score" required>
                            <input type="hidden" name="svcid" value="${svcid}"/>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="form-group col-md-6 text-center">
                            <a href="<c:url value="/review/addimpl">"/>
                            <button id= "btn_register" type="submit">등록</button>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section><!-- End Contact Section -->
</main><!-- End #main -->