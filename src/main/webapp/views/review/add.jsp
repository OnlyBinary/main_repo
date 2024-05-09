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
                let content = $('#content').val();
                if (content == '' || content == null) {
                    alert("내용을 입력하세요");
                    $('#content').focus();
                    return;
                }
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
<main id="main">
    <div data-aos="fade" class="page-title">
        <div class="heading">
            <div class="container">
                <h4>리뷰 등록하기</h4>
                <p>해당 행사에 대한 여러분의 솔직한 리뷰를 남겨주세요!!</p>
                <div class="row d-flex justify-content-center text-center">
                    <div class="col-lg-12">
                        <img style="width:100%;height:20rem!important;" src="${menu}">
                    </div>
                </div>
            </div>
        </div>
    </div><!-- End Page Title -->
    <section id="contact" class="contact">
        <div class="container">
            <div class="reply-form">
                <form id="register_form" class="php-email-form" style="padding-top:15px!important;">
                    <div class="row mb-2">
                        <div class="col-md-4">
                            <span class="badge badge-success">회원 ID</span>
                        </div>
                        <div class="col-md-8">
                            <span class="badge badge-primary">${svc.maxclassnm}</span>
                            <span class="badge badge-dark">${svc.minclassnm}</span>
                            <span class="badge badge-info">${svc.usertgtinfo}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <input type="text" class="form-control" name="memberid" id="memberid" value="${sessionScope.id}" readonly>
                        </div>
                        <div class="col-md-8 form-group">
                            <input type="text" class="form-control" name="svcnm" id="svcnm" value="${svc.svcnm}" readonly>
                            <input type="hidden" name="svcid" value="${svc.svcid}">
                        </div>
                    </div>
                    <div class="row" style="display:flex; align-items:center;">

                        <div class="col form-group">
                            <input type="text" class="form-control" name="content" id="content"
                                   placeholder="리뷰 내용을 입력해주세요" required>
                        </div>
                        <div class="col-4 form-group" style="display: flex; align-items: center;">
                            <select class="form-select" id="score"  name="score">
                                <option value="0">평점을 선택해주세요</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
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