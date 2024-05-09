<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="cardviewheader.jsp"/>
  <main id="main">

    <!-- Blog Section - Blog Page -->
    <section id="blog" class="blog" style="padding-top:30px!important;">
      <!-- pagination -->
      <div class="col text-center mb-4">
        <ul class="pagination justify-content-center align-items-center">
          <c:choose>
            <c:when test="${data.getPrePage() != 0}">
              <li class="page-item">
                <a class="page-link" href="<c:url value="${target}?pageNo=${data.getPrePage()}"/>">Previous</a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="page-item disabled">
                <a class="page-link" href="#">Previous</a>
              </li>
            </c:otherwise>
          </c:choose>
          <c:forEach begin="${data.getNavigateFirstPage()}" end="${data.getNavigateLastPage()}" var="page">
            <c:choose>
              <c:when test="${data.getPageNum() == page}">
                <li class="page-item active">
                  <a class="page-link" href="<c:url value="${target}?pageNo=${page}"/>">${page}</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item">
                  <a class="page-link" href="<c:url value="${target}?pageNo=${page}"/>">${page}</a>
                </li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:choose>
            <c:when test="${data.getNextPage() != 0}">
              <li class="page-item">
                <a class="page-link" href="<c:url value="${target}allpage?pageNo=${cpage.getNextPage()}"/>">Next</a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="page-item disabled">
                <a class="page-link" href="#">Next</a>
              </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4 posts-list">
<%--          나중에 foreach로 데이터 가져와서 돌려야함--%>
          <c:forEach var="d" items="${data.getList()}">
            <div class="col-xl-4 col-lg-6">
              <article>
                <div class="post-img">
                  <img src="${d.imgurl}" alt="" class="img-fluid" style="width:100%;height:10rem;">
                </div>

                <div class="mt-3 mb-2">
                  <span class="badge badge-primary">${d.maxclassnm}</span>
                  <span class="badge badge-dark">${d.minclassnm}</span>
                  <span class="badge badge-info">${d.usertgtinfo}</span>
                </div>

                <h4 class="title">
                  <a href="/service?detail=${d.svcid}">${d.svcnm}</a>
                </h4>

                <div class="d-flex align-items-center">
                  <img src="/img/blog/blog-author.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                  <div class="post-meta">
                    <p class="post-author">장소 : ${d.placenm}</p>
<%--                    <p class="post-author"></p>--%>
                    <p class="post-date">
                      <time datetime="2022-01-01">행사 기간 : ${d.svcstr.toString().split("T")[0]} ~ ${d.svcfin.toString().split("T")[0]}</time>
                    </p>
                  </div>
                </div>

              </article>
            </div><!-- End post list item -->
          </c:forEach>

        </div><!-- End blog posts list -->

<%--        <div class="pagination d-flex justify-content-center">--%>
<%--          <ul>--%>
<%--            <li><a href="#">1</a></li>--%>
<%--            <li class="active"><a href="#">2</a></li>--%>
<%--            <li><a href="#">3</a></li>--%>
<%--          </ul>--%>
<%--        </div><!-- End pagination -->--%>


      </div>

    </section><!-- End Blog Section -->

  </main>