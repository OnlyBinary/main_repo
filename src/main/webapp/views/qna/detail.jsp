<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let detail = {
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
            <input type="text" value="${qnadetail.title}" class="form-control" id="title"  name="boardTitle">
        </div>
        <div class="form-group">
            <label for="custid">아이디:</label>
            <input type="text" value="${qnadetail.memberid}" class="form-control" id="custid"  name="custId" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="content">내용:</label>
            <textarea class="form-control" rows="10" id="content" name="boardContent" >${qnadetail.content}</textarea>
        </div>
        <div class="form-group">
            <p>등록일: ${qnadetail.regdate}</p>
        </div>
    </form>
</div>