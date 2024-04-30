<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    a {
        color: #777; /* 링크 색상을 검정색으로 지정 */
        text-decoration: none; /* 밑줄 제거 */
    }
</style>
<script>
    let login = {
        url: '',
        init: function (url){
            this.url = url;
            // id      >  tag
            $('#login_form  button').click(function (){
                let id = $('#id').val(); // text, form에서 가져올때는 val(value)
                let pwd = $('#pwd').val();
                if(id=='' || id == null){
                    alert("ID를 입력하세요");
                    $('#id').focus();
                    return;
                }
                if(pwd=='' || pwd == null){
                    alert("PWD를 입력하세요");
                    return;
                }
                login.send();
            });
        },
        send: function (){
            $('#login_form').attr({
                'method': 'post',
                'action': this.url
            }); //attr: form 태그의 action
            $('#login_form').submit();
        }
    };
    $(function (){
        login.init('<c:url value = "/loginimpl"/>');
    });

</script>

<!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container">

            <div class="section-title">
                <span>LOGIN</span>
                <h2>LOGIN</h2>
<%--               <p>Welcome!</p>--%>
            </div>

            <div class="row justify-content-center">

                <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
                    <form id = "login_form" class="php-email-form">
                        <div class="row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="id">Your ID</label>
                                <input type="text" name="id" class="form-control" id="id" required>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="pwd">Your Password</label>
                                <input type="password" name="pwd" class="form-control" id="pwd" required>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="form-group col-md-6 text-center">
                                <button id= "button" type="submit">Login</button>
                            </div>
                        </div>

                        <div class="text-center">
                            <span>
                                <a href="<c:url value="/idfind"/>">아이디찾기</a> |
                                <a href="<c:url value="/pwfind"/>">비밀번호찾기</a> |
                                <a href="<c:url value="/register"/>">회원가입</a>
                            </span>
                        </div>
                    </form>

                </div>

            </div>

        </div>

    </section><!-- End Contact Section -->
