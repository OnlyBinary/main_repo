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
        url:'',
        init:function(url){
            this.url = url;

            $('#register_form  #btn_register').click(function(){
                register.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'action':this.url
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        register.init('<c:url value="/review/addimpl"/>');
    });
</script>
<!-- ======= Contact Section ======= -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
<%--    <section class="breadcrumbs">--%>
<%--        <div class="container">--%>
<%--            <div class="d-flex justify-content-between align-items-center">--%>
<%--                <h2 class = "custom-heading">리뷰등록</h2>--%>
<%--                <ol>--%>
<%--                    <li><a href="<c:url value="/"/>">Home</a></li>--%>
<%--                    <li>리뷰등록</li>--%>
<%--                </ol>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </section><!-- End Breadcrumbs -->--%>
    <!-- ======= Contact Section ======= -->
    <div data-aos="fade" class="page-title">
        <div class="heading">
            <div class="container">
                <div class="row d-flex justify-content-center text-center">
                    <div class="col-lg-12">
                        <%--                    <h1>${menu}</h1>--%>
                        <img style="width:100%;" src="${menu}">
                        <%--                    <p class="mb-0">Odio et unde deleniti. Deserunt numquam exercitationem. Officiis quo odio sint voluptas consequatur ut a odio voluptatem. Sit dolorum debitis veritatis natus dolores. Quasi ratione sint. Sit quaerat ipsum dolorem.</p>--%>
                    </div>
                </div>
            </div>
        </div>
<%--        <nav class="breadcrumbs">--%>
<%--            <div class="container">--%>
<%--                <ol>--%>
<%--                    <li><a href="index.html">Home</a></li>--%>
<%--                    <li>${currentDiv}</li>--%>
<%--                    <li class="current">${submenu}</li>--%>
<%--                </ol>--%>
<%--            </div>--%>
<%--        </nav>--%>
    </div><!-- End Page Title -->
    <section id="contact" class="contact">
        <div class="container">
<%--            <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">--%>
            <div class="reply-form">
                <h4>리뷰 등록하기</h4>
                <p>해당 행사에 대한 여러분의 솔직한 리뷰를 남겨주세요!!</p>
                <form id="register_form" class="php-email-form">
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <input type="text" class="form-control" name="memberid" id="memberid" value="${sessionScope.id}" readonly>
                        </div>
                        <div class="col-md-8 form-group">
                            <input type="text" class="form-control" name="svcnm" id="svcnm" value="${svcnm}" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <input type="number" min="1" max="5" class="form-control"
                                   name="score" id="score" placeholder="평점을 입력해주세요" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-group">
                            <input type="text" class="form-control" name="content" id="content"
                            placeholder="리뷰 내용을 입력해주세요">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="form-group col-md-6 text-center">
                            <button id= "btn_register" type="submit">리뷰 남기기</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section><!-- End Contact Section -->
</main><!-- End #main -->