<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #like {
    width:20px;
    /*height:20vh;*/
    fill:#ddd;
  }
  #like.active{
    fill:red;
  }
</style>
<script>
  let likeClick = {
    init: function() {
      let likeBtn = document.querySelector("#like");
      // 처음에 접속할 때 해당 게시글을 좋아하는지 아닌지 데이터 가져와서 초기상태 설정
      // 해당 게시글에 대한 좋아요수 만 가져와서 하트 옆에 출력
      likeBtn.addEventListener('click', function() {
        if (likeBtn.classList.contains('active')) {
          likeBtn.classList.remove('active');
          alert('좋아요가 취소되었습니다.');
          // 해당 유저의 해당 게시글 좋아요 취소 쿼리
        } else {
          likeBtn.classList.toggle('active');
          alert("해당 게시글을 좋아합니다.");
          // 해당 유저의 해당 게시글 좋아요 쿼리
        }
      });
    }
  }
  $(function() {
    likeClick.init();
  })
</script>
<main id="main">

  <!-- ======= Breadcrumbs ======= -->
  <section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

      <div class="d-flex justify-content-between align-items-center">
        <h4>${service.svcnm}</h4>
        <ol>
          <li><a href="index.html">Home</a></li>
          <li>${prevMenu}</li>
          <li>행사 상세정보</li>
        </ol>
      </div>

    </div>
  </section><!-- End Breadcrumbs -->

  <!-- ======= Portfolio Details Section ======= -->
  <section id="portfolio-details" class="portfolio-details">
    <div class="container">

      <div class="row gy-4">

        <div class="col-lg-8">
          <div class="portfolio-details-slider swiper">
            <div class="swiper-wrapper align-items-center">

              <div class="swiper-slide">
                <img src="${service.imgurl}" alt="">
              </div>

<%--              <div class="swiper-slide">--%>
<%--                <img src="assets/img/portfolio/portfolio-2.jpg" alt="">--%>
<%--              </div>--%>

<%--              <div class="swiper-slide">--%>
<%--                <img src="assets/img/portfolio/portfolio-3.jpg" alt="">--%>
<%--              </div>--%>

            </div>
            <div class="swiper-pagination"></div>
          </div>
          <div>
            ${service.detail}
          </div>
        </div>

        <div class="col-lg-4">
          <div class="portfolio-description" style="padding-top:0px!important;">
            <h5>${service.svcnm}</h5>
            <p>가격 : ${service.payatnm}</p>
            <p>지역 : ${service.areanm}</p>
            <p>장소 : ${service.placenm}</p>
            <p>대상 : ${service.usertgtinfo}</p>
          </div>
          <button style="width:100%;" class="btn btn-success mb-2">홈페이지 이동</button>
          <div style="display:flex;">
            <svg id="like" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
            <p class="ml-1" style="align-items: center;">1,200</p>
          </div>

          <div style="overflow:scroll;">
            <div class="portfolio-info">
              <h3>날씨, 미세먼지, 모기예보</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-info">
              <h3>근처 주차장 정보</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-info">
              <h3>교통정보</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Portfolio Details Section -->

</main><!-- End #main -->