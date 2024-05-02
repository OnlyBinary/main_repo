<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/2/24
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let movePage = {
        init: function (url) {
            window.location.href="http://127.0.0.1"+url;
            console.log("http://127.0.0.1"+url);
        }
    };
    $(function () {
        // movePage.init();
    })
</script>
<jsp:include page="cardviewheader.jsp"/>
<div class="container mt-5 mb-5">
    <div class="row align-items-md-stretch mb-3">
        <div class="col-md-4">
            <div class="h-100 p-5 text-bg-success rounded-3">
                <h2>${list.get(0)}</h2>
<%--                <p>Swap the background-color utility and add a `.text-*` color utility to mix up the jumbotron look. Then, mix and match with additional component themes and more.</p>--%>
                <button class="btn btn-outline-light" type="button" onclick="movePage.init('${urlList.get(0)}')"> -> 바로가기</button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                <h2>${list.get(1)}</h2>
<%--                <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>--%>
                <button class="btn btn-outline-secondary" type="button" onclick="movePage.init('${urlList.get(1)}')">-> 바로가기</button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="h-100 p-5 text-bg-secondary rounded-3">
                <h2>${list.get(2)}</h2>
<%--                <p>Swap the background-color utility and add a `.text-*` color utility to mix up the jumbotron look. Then, mix and match with additional component themes and more.</p>--%>
                <button class="btn btn-outline-light" type="button" onclick="movePage.init('${urlList.get(2)}')">-> 바로가기</button>
            </div>
        </div>
    </div>
    <div class="row align-items-md-stretch">
        <div class="col-md-4">
            <div class="h-100 p-5 bg-body-secondary border rounded-3">
                <h2>${list.get(3)}</h2>
<%--                <p>Or, keep it light and add a border for some added definition to the boundaries of your content. Be sure to look under the hood at the source HTML here as we've adjusted the alignment and sizing of both column's content for equal-height.</p>--%>
                <button class="btn btn-outline-secondary" type="button" onclick="movePage.init('${urlList.get(3)}')">-> 바로가기</button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="h-100 p-5 text-bg-dark rounded-3">
                <h2>${list.get(4)}</h2>
<%--                <p>Swap the background-color utility and add a `.text-*` color utility to mix up the jumbotron look. Then, mix and match with additional component themes and more.</p>--%>
                <button class="btn btn-outline-light" type="button" onclick="movePage.init('${urlList.get(4)}')">-> 바로가기</button>
            </div>
        </div>
    </div>
</div>
