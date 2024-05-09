<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let detail = {
        init:function(){
            $('#board_detail_form > #btn_update').click(()=>{
                let c = confirm('수정하시겠습니까?');
                if(c == true){
                    this.send();
                }
            });
        },
        send:function(){
            $('#board_detail_form').attr({
                'method':'post',
                'action':'<c:url value="/qna/updateimpl"/>'
            });
            $('#board_detail_form').submit();
        }
    };
    $(function () {
        detail.init();
    });
</script>

<div class="container">
    <h3>문의사항 상세보기</h3>
</div>
<div class="container">
    <form id="board_detail_form">
        <div class="form-group">
            <label for="title" style="margin-top: 20px;">제목:</label>
            <input type="text" value="${qnadetail.title}" class="form-control" id="title"  name="title">
        </div>
        <div class="form-group">
            <label for="memberid">아이디:</label>
            <input type="text" value="${qnadetail.memberid}" class="form-control" id="memberid"  name="memberid" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="content">내용:</label>
            <textarea class="form-control" rows="10" id="content" name="content" >${qnadetail.content}</textarea>
        </div>
        <div class="form-group">
            <p>등록일: ${qnadetail.regdate}</p>
        </div>
        <input type="hidden" name="qnaid" value="${qnadetail.qnaid}">
        <button id="btn_update" style="margin-left: 10px" class="btn btn-success">수정하기</button>
    </form>
</div>