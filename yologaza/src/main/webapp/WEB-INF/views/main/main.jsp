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
    <style>
    	.content-wrap {
		    height: 300px;
		    overflow: visible;
		}
    	.content-wrap > .content-list {
    		top:0;
    	}
    	.content-wrap > .content-list > .content-box > ul > li:nth-child(-n+8){
    		display:block;
    	}
    	
    	.content-wrap > .content-list > .content-box > ul > li{
    		display:none;
    	}
    	.content-wrap > .content-list > .content-box > ul > li > a > img{
    		border:1px solid #ddd;
    	}
    	#load{
    		color:black;
    		width:100%;
    		padding:5px;
    		font-size:18px;
    		font-weight:bold;
    		cursor:pointer;
    		border:none;
    		margin-top:10px;
    		background-color: white ;
    		border:1px solid #ddd;
    		box-sizing:border-box;
    		transition: 0.1s;
    	}
    	#load:hover{
    		color:white;
    		background-color: rgb(112, 173, 71);
    		border:1px solid rgb(112, 173, 71);
    	}
    	#product_list #header{
    		display:none;
    	}
    	#product_list #footer{
    		display:none;
    	}
    	#product_list #board{
    		border:1px solid #ddd;
    	}
    	#board_detail_box{
    		    position: fixed;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    z-index: 999;
			    background: rgba(0,0,0,0.5);
			    width: 200%;
    	}
    	#board_detail_box #product_list #board{
    		    width: 750px;
    		    box-shadow: none;
    		    margin-top:50px;
    	}
    	#board_detail_box #board_head .cancel{
	   	 	display: block;
	   	 }
    </style>
    <script>
	    $(document).ready(function () {
	    	  $(".slider-wrap").slick({
	    	    slide: "div", //슬라이드 되어야 할 태그 ex) div, li
	    	    infinite: true, //무한 반복 옵션
	    	    slidesToShow: 1, // 한 화면에 보여질 컨텐츠 개수
	    	    slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
	    	    speed: 500, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	    	    arrows: true, // 옆으로 이동하는 화살표 표시 여부
	    	    dots: true, // 스크롤바 아래 점으로 페이지네이션 여부
	    	    autoplay: false, // 자동 스크롤 사용 여부
	    	    autoplaySpeed: 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	    	    pauseOnHover: true, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
	    	    vertical: false, // 세로 방향 슬라이드 옵션
	    	    prevArrow: "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정"<button type='button' class='slick-prev'>Previous</button>"
	    	    nextArrow: "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정"<button type='button' class='slick-next'>Next</button>"
	    	    dotsClass: "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
	    	    draggable: true, //드래그 가능 여부
	
	    	    customPaging: function(slider, i) {
	    	      var target_txt = $(slider.$slides[i]).attr('test');
	    	      console.log(target_txt);
	//    	       console.log(target_txt);
	    	      
	//    	       var thumb = "<span class='page-nav'> " + target_txt + " </span>";
	//    	       // var thumb = "<span>"+ target_txt + "</span>";
	    	      var thumb = target_txt;
	    	      return thumb;
	    	    }
	    	    
	    	    
	    	  });
	    	});

    	// YOLO가자!커뮤니티
    	$(function(){
		    $(".content-wrap > .content-list > .content-box > ul > li").slice(0, 8).show(); // select the first ten
		    $("#load").click(function(e){ // click event for load more
		        e.preventDefault();
		        $(".content-wrap > .content-list > .content-box > ul > li:hidden").slice(0, 8).show(); // select next 10 hidden divs and show them
		        if($(".content-wrap > .content-list > .content-box > ul > li:hidden").length == 0){ // check if any hidden divs still exist
		            alert("No more divs"); // alert if there are none left
		        }
		    });
		});
    	
    	var boardArticleNO = function(articleNO){

    		$.ajax({
    			type: 'get',
    			data: "",
    			url: "${contextPath}/board/viewArticle.do?articleNO="+articleNO,
    			contentType:"${contextPath}/main.do; charset=UTF-8",
    			success: function(data) {
    				$('#product_list').html(data);
    			},
    			error: function(request, status, error) {
    				alert(error);
    			}
    		});
    		
    	};
    </script>
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
     <!-- YOLO가자!커뮤니티 -->
    <div class="main-community con" style="margin-top:50px;">
      <div class="community-name"><img src="${contextPath}/resources/image/yolo-logo-c.png" alt="YOLO가자로고"><p>&nbsp;&nbsp;COMMUNITY</p></div>
      <div class="community-box">
        <div class="content-wrap con">
          <div class="content-list row">
            <div class="content-box content-box-1 cell">
              <ul class="row">
              	<c:forEach var="article" items="${mainBoard}" >
                <li class="cell">
	                <a href="javascript:boardArticleNO(${article.articleNO});">
	                	<img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" alt="리뷰 이미지 등록">
	                </a>
                </li>
              	</c:forEach>
              </ul>
              <button id="load">더 보 기</button>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="board_detail_box">
		<div id="product_list" style="width:100%;">
	</div>
		<div id="product_list" style="width:100%;"></div>

	</div>
</body>
</html>