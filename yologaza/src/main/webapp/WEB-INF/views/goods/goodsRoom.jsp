<!-- 기여도 : 이택진90% 송상우10%-->
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
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트어썸 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
	
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/406084/ad5465aea207609c304a996455543d56.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/dffb419e594eecd8990e207f1a045801.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403110/012ad3728ae06ff3c5e9d2590c2112ae.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/785c73a4e4166bc0460f32cc77528e0a.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/f7b8c8f5f015ae73e7c330c655c122d3.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/9549b94d54d4cd1e20da85199a1b6727.jpg" alt="숙박정보 사진"></li>
          </div>
          <div class="slider slider-nav">
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/406084/ad5465aea207609c304a996455543d56.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/dffb419e594eecd8990e207f1a045801.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403110/012ad3728ae06ff3c5e9d2590c2112ae.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/785c73a4e4166bc0460f32cc77528e0a.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/f7b8c8f5f015ae73e7c330c655c122d3.jpg" alt="숙박정보 사진"></li>
            <li class="pic"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/9549b94d54d4cd1e20da85199a1b6727.jpg" alt="숙박정보 사진"></li>
          </div>
        </div>
      </div>
    </div>
    <div class="goods_impormation">
      <div class="name">
        <h2>숙소명</h2>
        <p class="score"><span>별점 : <em>8.2</em></p>
        <p> 8.6km | 강북구 수유동 </p>
        <p class="txt_opt">예약취소가능</p>
      </div>
      <div class="business_tell">
        <div class="tell-box">
          <strong>사장님 한마디</strong>
          <p>"사장님 한마디 내용"</p>
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
                  <li class="room">
                    <div class="room-box wrap">
                      <div class="room-select">
                        <img src="https://image.goodchoice.kr/resize_370x220/adimg_new/69041/403108/64fbb5b87e71214dfb7100bb28c08419.jpg" alt="룸 설정">
                        <div class="room-text cell-r">
                          <div class="reserve cell">
                            <h2>객실 타이틀</h2>
                            <h3>대실</h3>
                            <br><br><br>
                            <div class="price"><h2>35,000원</h2></div>
                            <h3>마감시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              &nbsp;&nbsp;&nbsp;22시까지</h3>
                            <h3>이용시간최대 &nbsp;&nbsp;&nbsp;  
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5시간</h3>
                            <div class="point"><a href="#"><h3>예약하기</h3></a></div>
                          </div>
                          <div class="reserve cell">
                            <h2>객실 타이틀</h2>
                            <h3>숙박</h3>
                            <br><br><br>
                            <div class="price"><h2>35,000원</h2></div>
                            <h3>입실시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              &nbsp;&nbsp;&nbsp;14시부터</h3>
                            <h3>퇴실시간 &nbsp;&nbsp;&nbsp;&nbsp;  
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;익일12시</h3>
                            <div class="point"><a href="#"><h3>예약하기</h3></a></div>
                          </div>
                        </div>
                      </div>
                      <input type="checkbox" class="room-search" id="room-1">
                      <label for="room-1">객실 이미지 보기</label>
                      <div class="room-pic" id="room-pic-1">
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/dffb419e594eecd8990e207f1a045801.jpg" alt="객실 이미지"></div>
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/18413407346f1a8ea4a96f6c53b6f952.jpg" alt="객실 이미지"></div>
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/bf5d1b07fc7c413f53af1de59c57a941.jpg" alt="객실 이미지"></div>
                      </div>
                    </div>
                  </li>
                  <li class="room">
                    <div class="room-box wrap">
                      <div class="room-select">
                        <img src="https://image.goodchoice.kr/resize_370x220/adimg_new/69041/403108/64fbb5b87e71214dfb7100bb28c08419.jpg" alt="룸 설정">
                        <div class="room-text cell-r">
                          <div class="reserve cell">
                            <h2>객실 타이틀</h2>
                            <h3>대실</h3>
                            <br><br><br>
                            <div class="price"><h2>35,000원</h2></div>
                            <h3>마감시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              &nbsp;&nbsp;&nbsp;22시까지</h3>
                            <h3>이용시간최대 &nbsp;&nbsp;&nbsp;  
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5시간</h3>
                            <div class="point"><a href="#"><h3>예약하기</h3></a></div>
                          </div>
                          <div class="reserve cell">
                            <h2>객실 타이틀</h2>
                            <h3>숙박</h3>
                            <br><br><br>
                            <div class="price"><h2>35,000원</h2></div>
                            <h3>입실시간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              &nbsp;&nbsp;&nbsp;14시부터</h3>
                            <h3>퇴실시간 &nbsp;&nbsp;&nbsp;&nbsp;  
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;익일12시</h3>
                            <div class="point"><a href="#"><h3>예약하기</h3></a></div>
                          </div>
                        </div>
                      </div>
                      <input type="checkbox" class="room-search" id="room-2">
                      <label for="room-2">객실 이미지 보기</label>
                      <div class="room-pic" id="room-pic-2">
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/dffb419e594eecd8990e207f1a045801.jpg" alt="객실 이미지"></div>
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/18413407346f1a8ea4a96f6c53b6f952.jpg" alt="객실 이미지"></div>
                        <div class="content cell"><img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/403109/bf5d1b07fc7c413f53af1de59c57a941.jpg" alt="객실 이미지"></div>
                      </div>
                    </div>
                  </li>
                </ul>
                <ul id="tab2">
                  <li>
                    <input type="checkbox" class="room-search" id="room-3">
                    <label for="room-3">기본정보</label>
                    <div class="room-pic" id="room-pic-3">기본 정보 기제</div>
                  </li>
                  <li>
                    <input type="checkbox" class="room-search" id="room-4">
                    <label for="room-4">요금정보</label>
                    <div class="room-pic" id="room-pic-4">요금 정보 기제</div>
                  </li>
                  <li>
                    <input type="checkbox" class="room-search" id="room-5">
                    <label for="room-5">테마</label>
                    <div class="room-pic" id="room-pic-5">테마 기제</div>
                  </li>
                </ul>
                <ul id="tab3">
                  <li>
                  <!-- 
                    <input type="checkbox" class="room-search" id="room-6">
                    <label for="room-6">리뷰작성란1</label>
                    <div class="room-pic" id="room-pic-6">고객리뷰 답변란1</div>
                  </li>
                  <li>
                    <input type="checkbox" class="room-search" id="room-7">
                    <label for="room-7">리뷰작성란2</label>
                    <div class="room-pic" id="room-pic-7">고객리뷰 답변란2</div>
                    -->
                    <table align="center" border="1"  width="100%"  >
					  <tr height="10" align="center"  bgcolor="lightgreen">
					     <td >글번호</td>
					     <td >작성자</td>              
					     <td >제목</td>
					     <td >작성일</td>
					  </tr>
					<c:choose>
					  <c:when test="${articlesList ==null }" >
					    <tr  height="10">
					      <td colspan="4">
					         <p align="center">
					            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
					        </p>
					      </td>  
					    </tr>
					  </c:when>
					  <c:when test="${articlesList !=null }" >
					    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
					     <tr align="center">
						<td width="5%">${articleNum.count}</td>
						<td width="10%">${article.id }</td>
						<td align='left'  width="35%">
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
						  <td  width="10%">${article.writeDate}</td> 
						</tr>
					    </c:forEach>
					     </c:when>
					    </c:choose>
					</table>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
  </div>
  </div>
</body>
</html>