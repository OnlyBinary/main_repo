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
<!-- ======= Breadcrumbs ======= -->
<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2 class = "custom-heading">문의상세보기</h2>
            <ol>
                <li><a href="<c:url value="/"/>">Home</a></li>
                <li>문의상세보기</li>
            </ol>
        </div>

    </div>
</section><!-- End Breadcrumbs -->

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
        <c:if test="${sessionScope.id == board.custId}">
            <button id="btn_update" type="button" class="btn btn_primary">Update</button>
            <button id="btn_delete" type="button" class="btn btn_primary">Delete</button>
        </c:if>
    </form>
</div>