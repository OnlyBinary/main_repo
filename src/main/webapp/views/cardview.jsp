<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <main id="main">

    <!-- Blog Page Title & Breadcrumbs -->
    <div data-aos="fade" class="page-title">
      <div class="heading">
        <div class="container">
          <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-8">
              <h1>Blog</h1>
              <p class="mb-0">Odio et unde deleniti. Deserunt numquam exercitationem. Officiis quo odio sint voluptas consequatur ut a odio voluptatem. Sit dolorum debitis veritatis natus dolores. Quasi ratione sint. Sit quaerat ipsum dolorem.</p>
            </div>
          </div>
        </div>
      </div>
      <nav class="breadcrumbs">
        <div class="container">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Blog</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Page Title -->

    <!-- Blog Section - Blog Page -->
    <section id="blog" class="blog">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4 posts-list">
<%--          나중에 foreach로 데이터 가져와서 돌려야함--%>
          <div class="col-xl-4 col-lg-6">
            <article>

              <div class="post-img">
                <img src="/img/about.png" alt="" class="img-fluid">
              </div>

              <p class="post-category">문화행사</p>

              <h2 class="title">
                <a href="blog-details.html">행사 이름</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="/img/blog/blog-author.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">장소 및 주소</p>
                  <p class="post-date">
                    <time datetime="2022-01-01">행사 기간</time>
                  </p>
                </div>
              </div>

            </article>
          </div><!-- End post list item -->

  <div class="col-xl-4 col-lg-6">
    <article>

      <div class="post-img">
        <img src="/img/hero-img.png" alt="" class="img-fluid">
      </div>

      <p class="post-category">문화행사</p>

      <h2 class="title">
        <a href="blog-details.html">Dolorum optio tempore voluptas dignissimos</a>
      </h2>

      <div class="d-flex align-items-center">
        <img src="/img/blog/blog-author.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
        <div class="post-meta">
          <p class="post-author">Maria Doe</p>
          <p class="post-date">
            <time datetime="2022-01-01">Jan 1, 2022</time>
          </p>
        </div>
      </div>

    </article>
  </div><!-- End post list item -->

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