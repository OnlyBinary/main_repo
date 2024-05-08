<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 5/7/24
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let center = {
        init: function () {
        }
    };
    $(function () {
        center.init();
    })
</script>
<c:choose>
    <c:when test="${subcenter != null}">
        <jsp:include page="${subcenter}.jsp"/>
    </c:when>
</c:choose>
