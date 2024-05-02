<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="cardviewheader.jsp"/>
  <main id="main">

    <!-- Blog Section - Blog Page -->
    <section id="blog" class="blog">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4 posts-list">
<%--          나중에 foreach로 데이터 가져와서 돌려야함--%>
          <c:forEach var="d" items="${data}">
            <div class="col-xl-4 col-lg-6">
              <article>
                <div class="post-img">
                  <img src="${d.imgurl}" alt="" class="img-fluid">
                </div>

                <p class="post-category">${d.maxclassnm} > ${d.minclassnm}</p>

                <h2 class="title">
                  <a href="/service?detail=${d.svcid}">${d.svcnm}</a>
                </h2>

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

        <div class="pagination d-flex justify-content-center">
          <ul>
            <li><a href="#">1</a></li>
            <li class="active"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
          </ul>
        </div><!-- End pagination -->

      </div>

    </section><!-- End Blog Section -->

  </main>