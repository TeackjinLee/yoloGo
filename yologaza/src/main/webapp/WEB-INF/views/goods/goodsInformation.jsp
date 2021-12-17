<!-- 기여도 : 이택진90% 송상우10%-->
<!-- 2차기여도 : 이택진100%-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
		swal ( "Oops" ,  "로그인 후 글쓰기가 가능합니다." ,  "error" );
	    swal.location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
	</script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트어썸 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
	
    <!-- gsap 용 플러그인 -->
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick.css">
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick-theme.css">
    <script src="${contextPath}/resources/slick/slick.min.js"></script>
    <!-- gsap 용 플러그인 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/animation.gsap.js"></script>
    <!-- 달력링크 -->
    <script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/goodsRoom.css">
    <script src="${contextPath}/resources/js/goodsRoom.js"></script>
    
    <!--  달력js -->
    <script>
    $(function() {
        $('input[name="daterange"]').daterangepicker({
        opens: 'left',
        timePicker: true
        }, function(start, end, label) {
        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });

    });
    </script>
    
</head>
<body>
<!-- 객실 설명란 -->
<div id="goodsRoom" class="con">
<div id="content"><!-- class="숙박 종류"-->
    <div id="page" class="content_pic">
      <div class="slide-wrap row">
        <div class="column small-11 small-centered">
          <div class="slider slider-single">
          	<c:forEach var="item" items="${goodsMap.imageList}" >
          		<li class="pic"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙박정보 사진"></li>
			</c:forEach>
          </div>
          <div class="slider slider-nav">
            <c:forEach var="item" items="${goodsMap.imageList}" >
          		<li class="pic"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙박정보 사진"></li>
			</c:forEach>
          </div>
        </div>
      </div>
    </div>
    <div class="goods_impormation">
      <div class="name">
        <h2>${goods.goods_name}</h2>
        <p class="score"><span>별점 : <em>8.2</em></p>
        <p> ${goods.goods_address} </p>
      </div>
      <div class="business_tell">
        <div class="tell-box">
          <strong>사장님 한마디</strong>
          <p>"${goods.goods_description}"</p>
        </div>
      </div>
    </div>
  </div>
  <!-- 객실 안내 뷰 -->
  <div class="wrap show con">
    <div id="room" class="sub_wrap">
          <div class="align_rt">
            <div class="notice">
              <!-- Tab -->
              <div class="tab">
                <div class="tab_btn">
                  <ul>
                    <li class="active"><a href="#tab1">객실안내/예약</a></li>
                    <li><a href="#tab2">숙소정보</a></li>
                    <li><a href="#tab3">리뷰</a></li>
                  </ul>
                </div>
              </div>
              <!-- 예약/숙소정보/리뷰  -->
              <div class="tab_each">
				  <ul id="tab1" class="active">
				  
				  <section class="date-wrap">
				    <div class="btn_date">
				      <tr class="date-box">
				        <td  class="date"><input type="text" name="daterange" value="01/01/2021/ - 01/15/2022" /></td>
				      </tr>
				    </div>
				  </section>
				<c:choose>
					<c:when test="${goods.goods_type=='motel'}">
						<c:forEach var="item" items="${goodsMap.RoomList}" >
				  <li class="room on">
				    <div class="room-box">
				      <div class="room-select">
				        <img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="룸 사진">
				        <div class="room-text cell-r">
				          <div class="reserve cell">
				            <h2>${item.goods_room_name}</h2>
				            <h3>대실</h3>
				            <br><br><br>
				            <div class="price"><h2>${item.goods_room_price2}원</h2></div>
				            <h3>마감시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				              &nbsp;&nbsp;&nbsp;${item.goods_motel_endtime}시까지</h3>
				            <h3>이용시간최대 &nbsp;&nbsp;&nbsp;  
				              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.goods_motel_usetime}시간</h3>
				            <div class="point">
				            	<button type="button" onclick="location.href='${contextPath}/member/reservationForm.do?goods_uroom=${item.goods_uroom}' ">예약하기</button>
				            </div>
				          </div>
				          <div class="reserve cell">
				            <h2>${item.goods_room_name}</h2>
				            <h3>숙박</h3>
				            <br><br><br>
				            <div class="price"><h2>${item.goods_room_price1}원</h2></div>
				            <h3>입실시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				              &nbsp;&nbsp;&nbsp;${item.goods_checkIn}시부터</h3>
				            <h3>퇴실시간 &nbsp;&nbsp;&nbsp;&nbsp;  
				              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;익일${item.goods_checkOut}시</h3>
				            <div class="point">
				            	<button type="button" onclick="location.href='${contextPath}/member/reservationForm.do?goods_uroom=${item.goods_uroom}' ">예약하기</button>
				            </div>
				          </div>
				        </div>
				      </div>
				      <input type="checkbox" class="room-search" id="room-1">
				      <div class="room-box-wrap">
				        <div class="room-img-content slider-wrap">
				          <div class="room-pic-box" id="room-pic">
				          	<c:forEach var="item" items="${goodsMap.imageListRoom}" >
				          		<div class="content cell"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="객실 이미지"></div>
							</c:forEach>
				          </div>
				        </div>
				        <div class="page-num row">
				          <p class="current-txt cell"> 1 </p>
				          <p class="all-txt cell">  &nbsp;/ 6 </p>
				      </div>
				      </div>
				    </div>
				  </li>
				  </c:forEach>
					</c:when>
					<c:otherwise>
					<c:forEach var="item" items="${goodsMap.RoomList}" >
				  <li class="room on">
				    <div class="room-box">
				      <div class="room-select">
				        <img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="룸 사진">
				        <div class="room-text cell-r">
				          
				          <div class="reserve cell" style="width:100%; border-right:none;">
				            <h2>${item.goods_room_name}</h2>
				            <h3>숙박</h3>
				            <br><br><br>
				            <div class="price"><h2>${item.goods_room_price1}원</h2></div>
				            <h3>입실시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				              &nbsp;&nbsp;&nbsp;${item.goods_checkIn}시부터</h3>
				            <h3>퇴실시간 &nbsp;&nbsp;&nbsp;&nbsp;  
				              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;익일${item.goods_checkOut}시</h3>
				            <div class="point">
				            	<button type="button" onclick="location.href='${contextPath}/member/reservationForm.do?goods_uroom=${item.goods_uroom}' ">예약하기</button>
				            </div>
				          </div>
				        </div>
				      </div>
				      <input type="checkbox" class="room-search" id="room-1">
				      <div class="room-box-wrap">
				        <div class="room-img-content slider-wrap">
				          <div class="room-pic-box" id="room-pic">
				          	<c:forEach var="item" items="${goodsMap.imageListRoom}" >
				          		<div class="content cell"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="객실 이미지"></div>
							</c:forEach>
				          </div>
				        </div>
				        <div class="page-num row">
				          <p class="current-txt cell"> 1 </p>
				          <p class="all-txt cell">  &nbsp;/ 6 </p>
				      </div>
				      </div>
				    </div>
				  </li>
				  </c:forEach>
					</c:otherwise>
				</c:choose>
				  
				</ul>
                <ul id="tab2">
                  <li>
                    <input type="checkbox" class="room-search" id="room-3">
                    <label for="room-3">기본정보</label>
                    <div class="room-pic" id="room-pic-3">${goods.goods_baseImpormation}</div>
                  </li>
                  <li>
                    <input type="checkbox" class="room-search" id="room-4">
                    <label for="room-4">요금정보</label>
                    <div class="room-pic" id="room-pic-4">${goods.goods_chargeImpormation}</div>
                  </li>
                  <li>
                    <input type="checkbox" class="room-search" id="room-5">
                    <label for="room-5">테마</label>
                    <div class="room-pic" id="room-pic-5">테마 기제</div>
                  </li>
                </ul>
                <ul id="tab3">
                  <table align="center" width="100%" style="margin-top:20px;"  >
					  <tr height="10" align="center" style="height:30px; color:white; font-weight:bold; background-color:rgb(112, 173, 71);">
					     <td >글번호</td>
					     <td >작성자</td>              
					     <td >제목</td>
					     <td >사진</td>
					     <td >작성일</td>
					  </tr>
					<c:choose>
					  <c:when test="${articlesList ==null }" >
					    <tr  height="10">
					      <td>
					         <p align="center">
					            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
					        </p>
					      </td>  
					    </tr>
					  </c:when>
					  <c:when test="${articlesList !=null }" >
					    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
					     <tr align="center" style="background-color:rgba(0, 0, 0, 0.03); height:50px;">
						<td width="5%">${articleNum.count}</td>
						<td width="10%">${article.id }</td>
						<td align='left'  width="60%">
						  <span style="padding-right:30px"></span>
						   <c:choose>
						      <c:when test='${article.level > 1 }'>  
						         <c:forEach begin="1" end="${article.level }" step="1">
						              <span style="padding-left:20px"></span>    
						         </c:forEach>
						         <span style="font-size:12px;">[답변]</span>
					                   <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
						          </c:when>
						          <c:otherwise>
						            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
						          </c:otherwise>
						        </c:choose>
						  </td>
					      <td width="auto">
						     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
						     <img src="${contextPath}/thumbnails.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"   /><br>
						   </td> 
						  <td  width="10%">${article.writeDate}</td> 
						</tr>
					    </c:forEach>
					     </c:when>
					    </c:choose>
					</table>
					<a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do',
                                                    '${contextPath}/member/loginForm.do')"><p class="cls2" 
                                                    style="display: block;
														    width: 100px;
														    background: rgba(0,0,0,0.05);
														    margin: 0 auto;
														    text-align: center;
														    padding: 5px;
														    box-sizing: border-box;
														    border-radius: 5px;
														    margin-top: 20px;
														    border: 1px solid #ddd;">글쓰기</p></a>
                </ul>
              </div>
            </div>
          </div>
        </div>
  </div>
  </div>
</body>
</html>