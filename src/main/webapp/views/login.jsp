<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
    a {
        color: #777; /* 링크 색상을 검정색으로 지정 */
        text-decoration: none; /* 밑줄 제거 */
    }
</style>
<script>
    let login = {
        url: '',
        init: function (url) {
            this.url = url;
            $("#login_form  button").click(() =>{
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                if (id == '' || id == null) {
                    alert("ID를 입력하세요");
                    $('#id').focus();
                    return;
                }
                if (pwd == '' || pwd == null) {
                    alert("PWD를 입력하세요");
                    return;
                }
                login.send();
            });
        },
        send: function () {
            $('#login_form').attr({
                'method': 'post',
                'action': this.url
            });
            $('#login_form').submit();
        }
    };

    function openIdFindModal() {
        $('#idFindModal').modal('show');
    }

    function openPasswordFindModal() {
        $('#passwordFindModal').modal('show');
    }

    function openPasswordModifiedModal() {
        $("#passwordFindModal").modal("hide");
        $('#passwordModifiedModal').modal('show');
    }


    $(function (){
        $("#idFindForm #btn_id_find").click(() => {
            let name = $("#membernm1").val();
            let email = $("#memberemail1").val();
            $.ajax({
                url: "<c:url value='/idfindimpl' />",
                data: {"membernm": name, "memberemail": email},
                success: (res) => {
                    if (res){
                        alert("회원님의 아이디는 " + res + " 입니다.")
                    }
                    else{
                        alert("일치하는 회원정보가 없습니다.")
                        return;
                    }
                }
            });
        });

        $("#passwordFindForm #btn_pwd_find").click(() => {
            let name = $("#membernm").val();
            let id = $("#memberid").val();
            let email = $("#memberemail").val();
            $.ajax({
                url: "<c:url value='/passwordfindimpl' />",
                data: {"membernm": name, "memberid": id, "memberemail": email},
                success: (res) => {
                    if (res=="1"){
                        openPasswordModifiedModal()
                    }
                    else{
                        alert("일치하는 회원정보가 없습니다.")
                        return;
                    }
                }
            });
        });

        $("#passwordModifiedForm #btn_pwd_modified").click(() => {
            let id = $("#passwordFindForm #memberid").val();
            let pwd = $("#memberpwd").val();
            let pwdcon = $("#memberpwdcon").val();
            $.ajax({
                url: "<c:url value='/passwordmodifiedimpl' />",
                data: {"memberid": id, "memberpwd": pwd, 'memberpwdcon': pwdcon},
                success: (res) => {
                    if (res == "1"){
                        alert("비밀번호 변경이 완료되었습니다.")
                        window.location.href = "<c:url value="/login"/>"
                    }
                    else{
                        alert("비밀번호가 다릅니다.")
                        return;
                    }
                }
            });
        });

        $("#idFindModal button[data-dismiss='modal']").click(() => {
            $("#idFindModal").modal("hide");
        });

        $("#passwordFindModal button[data-dismiss='modal']").click(() => {
            $("#passwordFindModal").modal("hide");
        });

        $("#passwordModifiedModal button[data-dismiss='modal']").click(() => {
            $("#passwordModifiedModal").modal("hide");
        });

        login.init('<c:url value="/loginimpl"/>');
    });
</script>

<!-- ======= Contact Section ======= -->
<section id="contact" class="contact">
    <div class="container">

        <div class="section-title">
            <span>LOGIN</span>
            <h2>LOGIN</h2>
        </div>

        <div class="row justify-content-center">

            <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
                <form id="login_form" class="php-email-form">
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
                                <a href="#" onclick="openIdFindModal()">아이디찾기</a> |
                                <a href="#" onclick="openPasswordFindModal()">비밀번호찾기</a> |
                                <a href="<c:url value="/register"/>">회원가입</a>
                            </span>
                        </div>
                    </form>

                </div>
            <div id="idFindModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <form id="idFindForm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">아이디 찾기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="membernm1">성명</label>
                                    <input id="membernm1" type="text" class="form-control" name="membernm1">
                                </div>
                                <div class="form-group">
                                    <label for="memberemail1">이메일</label>
                                    <input id="memberemail1" type="text" class="form-control" name="memberemail1">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_id_find" type="button" class="btn btn-primary">확인</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>


            <div id="passwordFindModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <form id="passwordFindForm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">비밀번호 찾기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="membernm">성명</label>
                                    <input id="membernm" type="text" class="form-control" name="membernm">
                                </div>
                                <div class="form-group">
                                    <label for="memberid">아이디</label>
                                    <input id="memberid" type="text" class="form-control" name="memberid">
                                </div>
                                <div class="form-group">
                                    <label for="memberemail">이메일</label>
                                    <input id="memberemail" type="email" class="form-control" name="memberemail">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_pwd_find" type="button" class="btn btn-primary">확인</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div id="passwordModifiedModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <form id="passwordModifiedForm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">비밀번호 수정</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="memberpwd">새로운 비밀번호</label>
                                    <input id="memberpwd" type="password" class="form-control" name="memberpwd">
                                </div>
                                <div class="form-group">
                                    <label for="memberpwdcon">새로운 비밀번호 확인</label>
                                    <input id="memberpwdcon" type="password" class="form-control" name="memberpwdcon">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btn_pwd_modified" type="button" class="btn btn-primary">확인</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            </div>
        </div>
    </section><!-- End Contact Section -->
