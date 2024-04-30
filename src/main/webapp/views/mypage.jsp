<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-04-30
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .info p {
        margin-bottom: 20px; /* Increase the margin-bottom value to increase spacing between rows */
        line-height: 3; /* Adjust line height to make the cells taller */
    }
</style>

<script>
    let mypage = {
        init: function () {
            console.log(${interest[0].serviceList[0]});

            <%--for(let i =0; i<${interest}.length;i++){--%>
            <%--    $('#svcnm').text(${interest.serviceList[i]})--%>
            <%--}--%>
            <%--$(${interest.serviceList}).forEach((item, idx)=> {--%>
            <%--    $('#svcnm').text(item.serviceList[idx].svcnm);--%>
            <%--})--%>
        }
    };
    $(function () {
        mypage.init();
    });
</script>

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container">

            <div class="section-title">
                <span>Mypage</span>
                <h2>Mypage</h2>
<%--                <p>Sit sint consectetur velit quisquam cupiditate impedit suscipit alias</p>--%>
            </div>

            <div class="row justify-content-center mt-4">
                <div class="col-lg-8 d-flex align-items-stretch">
                    <div class="info">
                        <div class="id">
                            <i class="bi bi-check-circle"></i>
                            <h4>ID:</h4>
                            <p style ="font-size: 20px">${member.memberid}</p>
                        </div>
                        <div class="name">
                            <i class="bi bi-person-square"></i>
                            <h4>Name:</h4>
                            <p style ="font-size: 20px">${member.membernm}</p>
                        </div>
                        <div class="tel">
                            <i class="bi bi-phone"></i>
                            <h4>Tel:</h4>
                            <p style ="font-size: 20px">${member.membertel}</p>
                        </div>
                        <div class="address">
                            <i class="bi bi-geo-alt"></i>
                            <h4>Location:</h4>
                            <p style ="font-size: 20px">${member.memberaddr}</p>
                        </div>
                        <div class="email">
                            <i class="bi bi-envelope"></i>
                            <h4>Email:</h4>
                            <p style ="font-size: 20px">${member.memberemail}</p>
                        </div>
                        <table class="table table-striped" id="comment_table">
                            <thead>
                            <tr>
                                <th>서비스명</th>
                                <th>접수시작일자</th>
                                <th>접수종료일자</th>
                            </tr>
                            </thead>
                            <tbody>
<%--                            <c:forEach var="c" items="${interest}">--%>
<%--                                <tr>--%>
<%--                                    <td>${c.serviceList}</td> <!-- ServiceDto의 svcnm 속성 -->--%>
<%--                                    <td>${c.regdate}</td> <!-- ServiceDto의 regdate 속성 -->--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- End Contact Section