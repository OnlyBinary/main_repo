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

            $('#register_form  #btn_check').click(()=>{
                let id = $('#memberid').val();
                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    return;
                }
                $.ajax({
                    url:'<c:url value="/registercheckid"/>',
                    data:{'id':id},
                    success:(result)=>{
                        // alert(result);
                        let msg = '입력 가능 합니다.';
                        if(result == '0'){
                            msg = '사용 불가능 합니다.';
                        }
                        $('#check_msg').html(msg);
                    }
                });

            });


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
        register.init('<c:url value="/registerimpl"/>');
    });

</script>

<!-- ======= Contact Section ======= -->

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class = "custom-heading">회원가입</h2>
                <ol>
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li>회원가입</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->
            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">
                        <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
                            <form id="register_form" class="php-email-form">
                                    <div class="form-group col-md-8">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="bi bi-check-circle"></i></span>
                                            <input type="text" name="memberid" class="form-control mr-2" id="memberid" placeholder="아이디">
                                            <button id="btn_check" type="button" class="btn btn-primary rounded" style="background-color: #69DB87; border-color: #69DB87;">CHECK ID</button>
                                        </div>
                                        <div class="text-start">
                                            <span id="check_msg"></span>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-8 mt-3 mt-md-0">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="bi bi-person-square"></i></span>
                                            <input type="text" class="form-control" name="membernm" id="membernm" placeholder="이름" required>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-8 mt-3 mt-md-0">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                                        <input type="password" class="form-control" name="memberpwd" id="memberpwd"  placeholder="비밀번호" required>
                                        </div>
                                    </div>
                                <div class="form-group col-md-8 mt-3 mt-md-0">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="bi bi-phone"></i></span>
                                        <input type="text" class="form-control" name="membertel" id="membertel" placeholder="전화번호" required>
                                    </div>
                                    </div>
                                <div class="form-group col-md-8 mt-3 mt-md-0">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                        <input type="email" class="form-control" name="memberemail" id="memberemail" placeholder="이메일" required>
                                    </div>
                                </div>
                                <div class="form-group col-md-8 mt-3 mt-md-0">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                        <input type="text" class="form-control" name="memberaddr" id="memberaddr" placeholder="주소" required>
                                    </div>
                                </div>
                                <div class="form-group col-md-8 mt-3 mt-md-0">
                                    <div class="input-group mb-2">
                                        <span class="input-group-text" style="margin-right: 30px">수신동의여부</span>
                                <div>
                                    <input id="snsagree1" name="snsagree" type="radio" value="1">
                                    <label for="snsagree1" class="radio-label">동의</label>
                                    <input id="snsagree2" name="snsagree" type="radio" value="0">
                                    <label for="snsagree2" class="radio-label">미동의</label>
                                </div>
                                    </div>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="row justify-content-center">
                                    <div class="form-group col-md-6 text-center">
                                        <button id= "button" type="submit">회원가입</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </section><!-- End Contact Section -->

        </div>
    </section>

</main><!-- End #main -->


