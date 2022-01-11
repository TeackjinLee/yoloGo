<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOLO가자!메인페이지</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <!-- gsap 용 플러그인 -->
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick.css">
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick-theme.css">
    <script src="${contextPath}/resources/slick/slick.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
    <script src="${contextPath}/resources/js/script.js"></script>
</head>
<!-- 메인 페이지 -->
<body>
    <!-- 메인이미지 -->
    <div class="slider-wrap con">
        <div class="slider-contents" test="내  주  변">
          <a href="${contextPath}/searchGoods.do?goods_type=my">
            <video src="${contextPath}/resources/image/main_image.mp4" loop autoplay muted></video>
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="모      텔">
          <a href="${contextPath}/searchGoods.do?goods_type=motel">
            <img src="${contextPath}/resources/image/main_motel.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="호      텔">
          <a href="${contextPath}/searchGoods.do?goods_type=hotel">
            <img src="${contextPath}/resources/image/main_hotel.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="펜      션">
          <a href="${contextPath}/searchGoods.do?goods_type=pension">
            <img src="${contextPath}/resources/image/main_penction.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-cw.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="리  조  트">
          <a href="${contextPath}/searchGoods.do?goods_type=resort">
            <img src="${contextPath}/resources/image/main_resort.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="게스트하우스">
          <a href="${contextPath}/searchGoods.do?goods_type=guestHouse">
            <img src="${contextPath}/resources/image/main_guesthouse.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-cw.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="캠핑/글램핑">
          <a href="${contextPath}/searchGoods.do?goods_type=camping">
            <img src="${contextPath}/resources/image/main_glamping.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-cw.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        <div class="slider-contents" test="한      옥">
          <a href="${contextPath}/searchGoods.do?goods_type=hanok">
            <img src="${contextPath}/resources/image/main_khouse.jpg" alt="메인사진pixabay">
            <div class="text-box">
              <div class="text"><h3>즐거운 추억을 저장하다.</h3><img src="${contextPath}/resources/image/yolo-logo-cw.png" alt="YOLO가자로고"></div>
            </div>
          </a>
        </div>
        
    </div>

    <!-- 메인 로고 이미지 -->
    <div class="main-link">
      <div class="main-logo-box con">
        <ul  class= "row">
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=my"><img src="${contextPath}/resources/image/8logo_l.png" alt="내주변 로고 이미지"></a></li>
          <li class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=motel"><img src="${contextPath}/resources/image/1logo_m.png" alt="모텔 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=hotel"><img src="${contextPath}/resources/image/2logo_h.png" alt="호텔 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=pension"><img src="${contextPath}/resources/image/3logo_p.png" alt="펜션 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=resort"><img src="${contextPath}/resources/image/4logo_r.png" alt="리조트 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=guestHouse"><img src="${contextPath}/resources/image/6logo_g.png" alt="캠핑/글램핑 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=camping"><img src="${contextPath}/resources/image/5logo_c.png" alt="게스트하우스 로고 이미지"></a></li>
          <li  class= "cell"><a href="${contextPath}/searchGoods.do?goods_type=hanok"><img src="${contextPath}/resources/image/7logo_h.png" alt="한옥 로고 이미지"></a></li>
        </ul>
      </div>
    </div>

    <!-- YOLO가자!커뮤니티 -->
    <div class="main-community con">
      <div class="community-name"><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"><p>&nbsp;&nbsp;COMMUNITY</p></div>
      <div class="community-box">
        <div class="content-wrap con">
          <div class="content-list row">
            <div class="content-box content-box-1 cell">
              <ul class="row">
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2016/03/05/21/45/pizza-1239077__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2021/07/09/02/29/family-6398107__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2019/10/25/19/15/family-children-4577797__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2020/03/24/05/37/family-4962873__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
              </ul>
            </div>
            <div class="content-box content-box-2 cell">
              <ul class="row">
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2017/10/11/02/13/hanok-2839691_960_720.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2016/11/22/20/10/dog-1850465__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2018/04/27/08/55/water-3354062__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2016/11/23/13/45/celebration-1852926__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
              </ul>
            </div>
            <div class="content-box content-box-3 cell">
              <ul class="row">
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2018/07/06/00/33/couple-3519503__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2019/08/28/14/24/tokyo-4436914__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2020/03/24/05/37/family-4962874__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2018/12/02/21/47/couple-3852277__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
              </ul>
            </div>
            <div class="content-box content-box-4 cell">
              <ul class="row">
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2016/11/13/21/45/airport-1822133__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2019/04/08/04/22/glasses-4111357__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
                <li class="cell"><a href="#"><img src="https://cdn.pixabay.com/photo/2016/11/08/06/45/couple-1807617__340.jpg" alt="추후 리뷰 이미지 등록"></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- YOLO가자! 쿠폰 커뮤니티 -->
    <div class="main-guest con row">
      <div class="guest-box cell">
        <div class="title">
          <div class="community-name"><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"><p>&nbsp;&nbsp;EVENT</p></div>
        </div>
        <div class="coupon-box">
          <a href="${contextPath}/CC/announceList.do"><img src="${contextPath}/resources/image/coupon.png" alt="고객센터 쿠폰이미지"></a>
        </div>
      </div>
      <div class="business-box cell">
        <div class="title">
          <div class="community-name"><img src="${contextPath}/resources/image/yolo-guesthouse.png" alt="YOLO가자로고"><p>&nbsp;&nbsp;등록하기</p></div>
        </div>
        <div class="host-box">
       	  <c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<a href="${contextPath}/business_main.do"><img src="${contextPath}/resources/image/host.png" alt="사업자등록"></a>
	      		</c:when>
	      		<c:otherwise>
	      			<a href="${contextPath}/businessMember/business_loginForm.do"><img src="${contextPath}/resources/image/host.png" alt="사업자등록"></a>
	      		</c:otherwise>
	      	</c:choose>
          
        </div>
      </div>

    </div>

</body>
</html>