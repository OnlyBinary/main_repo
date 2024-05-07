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
<script>
    let register = {
        url: '',
        init: function (url) {
            this.url = url;

            $('#register_form  #btn_register').click(function () {
                register.send();
            });
        },
        send: function () {
            $('#register_form').attr({
                'method': 'post',
                'action': this.url
            });
            $('#register_form').submit();
        }
    };
        function showPasswordInput() {
        document.getElementById("passwordInputGroup").style.display = "block";
    }

        function hidePasswordInput() {
        document.getElementById("passwordInputGroup").style.display = "none";
    }
$(function(){
register.init('<c:url value="/qna/addimpl"/>');
});
</script>
<!-- ======= Contact Section ======= -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class = "custom-heading">문의등록</h2>
                <ol>
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li>문의등록</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container">
            <div class="col-lg-15 mt-5 mt-lg-0 d-flex align-items-stretch">
                <form id="register_form" class="php-email-form">
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            아이디: <input type="text" class="form-control" name="memberid" id="memberid" value="${id}" readonly>
                        </div>
                        <input type="hidden" name="svcid" value="${svcid}"/>
                    </div>
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            서비스명: <input type="text" class="form-control" name="svcnm" id="svcnm" value="${svcnm}" readonly>
                        </div>
                    </div>
                    <div class="form-group col-md-8 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            <label for="title">제목:</label>
                            <input type="text" class="form-control" name="title" id="title" required>
                        </div>
                    </div>
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            <label for="content">내용:</label>
                            <input style="height: 300px;" type="text" class="form-control" name="content" id="content">
                        </div>
                    </div>
                    <div class="form-group col-md-12 mt-3 mt-md-0">
                        <div class="input-group mb-3">
                            <span class="input-group-text" style="margin-right: 30px">공개여부</span>
                            <div>
                                <input id="openyn1" name="openyn" type="radio" value="1" onclick="hidePasswordInput()">
                                <label for="openyn1" class="radio-label">동의</label>
                                <input id="openyn2" name="openyn" type="radio" value="0" onclick="showPasswordInput()">
                                <label for="openyn2" class="radio-label">미동의</label>
                            </div>
                        </div>
                    </div>
                    <div id="passwordInputGroup" class="form-group col-md-5 mt-3 mt-md-0" style="display: none;">
                        <div class="input-group mb-3">
                            <label for="password">비밀번호:</label>
                            <input type="password" class="form-control" name="password" id="password">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="form-group col-md-6 text-center">
                            <button id= "btn_register" type="submit">등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section><!-- End Contact Section -->
</main><!-- End #main -->