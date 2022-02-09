<!-- 기여도 : 이택진90% 송상우10%-->
<!-- 2차기여도 : 이택진100%-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageListRoom }"  />
<%
	request.setCharacterEncoding("UTF-8");
	String goods_id = request.getParameter("goods_id");
	
	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
%>
<style>
	.tab_each ul li .room-box .room-text .reserve div{
		font-weight:bold;
	}
	.slider-single img{
		width: 100%;
	    position: relative;
	    top: 50%;
	    transform: translateY(-50%);
	}
	#tab2 label{
		cursor:pointer;
	}
	
	#tab2 .room-pic-theme{
		display: block;
	    width: 20%;
	    text-align: center;
	    float:left;
	    padding: 10px;
	    box-sizing: border-box;
	}
	
</style>
<!DOCTYPE html>
<head>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cf929ac0c936c4cda3566648aaf3dc4&libraries=services"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<script type="text/javascript">
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
    <title>방 검색</title>
    <!-- 폰트어썸 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
	
    <!-- gsap 용 플러그인 -->
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick.css">
    <link rel="stylesheet" href="${contextPath}/resources/slick/slick-theme.css">
    <script src="${contextPath}/resources/slick/slick.min.js"></script>

    <!-- 달력링크 -->
    <script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/goodsRoom.css">
    <script src="${contextPath}/resources/js/goodsRoom.js"></script>
    <script type="text/javascript">
	    function add_cart(goods_uroom,price,checkIn,checkOut) {
			$.ajax({
				type : "POST",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/cart/addGoodsInCart.do",
				data : {
					goods_uroom:goods_uroom,
					price:price,
					checkIn:checkIn,
					checkOut:checkOut
				},
				success : function(data, textStatus) {
					//alert(data);
				//	$('#message').append(data);
					if(data.trim()=='add_success'){
						imagePopup('open', '.layer01');	
					}else if(data.trim()=='already_existed'){
						swal ( "Oops" ,  "이미 카트에 등록된 상품입니다."  ,  "error");
					} else{
						swal ( "Oops" ,  "로그인후 사용 가능합니다."  ,  "error");
					}
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
				}
			}); //end ajax	
		}
	    
	    function imagePopup(type) {
			if (type == 'open') {
				// 팝업창을 연다.
				jQuery('#layer').attr('style', 'visibility:visible');

				// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
				jQuery('#layer').height(jQuery(document).height());
			}

			else if (type == 'close') {

				// 팝업창을 닫는다.
				jQuery('#layer').attr('style', 'visibility:hidden');
			}
		}
	    

	    $(function() {
	    	  $('.tab_each #tab1 .room .room-box .room-select img').click(function(){
	    	    var idx = $(".tab_each #tab1 .room .room-box .room-select img").index(this)
	    	    if($('#tab1 .room-box-wrap').eq(idx).css('display')=='none'){
	    	           $('#tab1 .room-box-wrap').eq(idx).show();
	    	  }
	    	    else{
	    	      $('#tab1 .room-box-wrap').eq(idx).hide();
	    	    }
	    	});
    	 
	    	});
	    
    </script>
    <style>
    	#tab1 .room-box-wrap{
    		display:none;
    	}
    	#tab1 .room-pic-box .slick-list .slick-track{
    		width: 6720px;
    	}
    	#tab1 .room-pic-box .slick-list .slick-track .slick-slide{
    		width: 960px;
    	}
    	
    	#tab1 .fa-shopping-cart:before {
		    content: "\f004";
		}
		#tab1 .fas {
		    font-weight: 100;
		    text-align:center;
		    margin-right:5px;
		}
		#tab1 .fa-shopping-cart:hover {
		    color:rgb(192, 57, 43);
		    transition:0.5s;
		    
		}
		#tab1 .fas:hover {
			font-size:30px;
			text-align:center;
			margin-right:0px;
			font-weight:500;
		}
		
		<!-- 장바구니 팝업 -->
		#layer {
			z-index: 2;
			position: absolute;
			top: 0px;
			left: 0px;
			width: 100%;
		}
		
		#popup {
			z-index: 3;
			position: fixed;
			text-align: center;
			left: 50%;
			top: 45%;
			width: 300px;
			height: 180px;
			background-color: white;
			border: 3px solid #87cb42;
		}
		#popup a{
			float: right;
    		margin-right: 10px;
		}
		#popup font{
			    margin: 20px 0px;
			    display: block;
			    font-weight: bold;
		}
		
		#popup form input{
			background: rgb(112, 173, 71);
		    color: white;
		    font-size: 16px;
		    padding: 5px 30px;
		    border-radius: 5px;
		    cursor:pointer;
		}
		
		#close {
			z-index: 4;
			float: right;
		}
		#board_head .member_img{
     	    position: relative;
		    float: left;
		    width: 60px;
		    height: 60px;
		    border-radius: 30px;
		    margin-top: 10px;
		    margin-left: 10px;
		    overflow: hidden;
		    border: 1px solid #ddd;
	     }
	     #board_head .member_img img{
	     	position: absolute;
		    width: 100%;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
	     }
	     #tab1 .btn_date{
			position: relative;
	     }
	     #tab1 .far{
			position: absolute;
		    left: 5px;
		    top: 5px;
		    font-size: 21px;
		    color: #555;
	     }
	     #tab1 .dateApplyBtn{
	     	position:absolute;
	     	padding: 5px 10px 5px 10px;
		    box-sizing: border-box;
		    right: -60px;
	     }
	     .room_img_box{
	     	max-height: 300px;
	     }
	     .nonResBtn{
	     	display:block;
	     	cursor:pointer;
	     }
	     .tab_each ul li .room-box .room-text .reserve .nonResDate{
	     	position: absolute;
		    top: 0;
		    right: -250px;
		    visibility: hidden;
		    width: 240px;
		    padding: 10px;
		    height: auto;
		    border: 2px solid #ddd;
		    box-sizing: border-box;
	     }
	     .tab_each ul li .room-box .room-text:hover .reserve .nonResDate{
	     	visibility: visible;
	     }
    </style>
    <!--  달력js -->
    <script>
	    $(function() {
	        $('input[name="daterange"]').daterangepicker({
		        opens: 'left',
		        showDropdowns: true
	        }, function(start, end, label) {
		        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		        var date1 = Date.parse(start.format('YYYY-MM-DD'))/1000;
		        var date2 = Date.parse(end.format('YYYY-MM-DD'))/1000;
		        $('#dateApplyBtn').click(function(){
		    		window.location.replace('${contextPath}/goods/goodsInformation.do?goods_id='+<%=goods_id%>+'&date1='+date1+'&date2='+date2);
		    	});
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
          		<li class="pic" style="width: 511px;height: 360px;overflow: hidden;"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙박정보 사진"></li>
			</c:forEach>
          </div>
          <div class="slider slider-nav">
            <c:forEach var="item" items="${goodsMap.imageList}" >
          		<li class="pic" style="width: 158px;height: 95px;overflow: hidden;"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙박정보 사진"></li>
			</c:forEach>
          </div>
        </div>
      </div>
    </div>
    <div class="goods_impormation">
      <div class="name">
        <h2>${goods.goods_name}</h2>
        <p class="score"><span>별점 : <em>8.2</em></p>
        <p> ${goods.roadAddress} </p>
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
					      <td  class="date"><i class="far fa-calendar-alt"></i>
					      <input type="text" name="daterange" value="${Ddate1}/ - ${Ddate2}" />
					    </td>
					    </tr>
					    <button id="dateApplyBtn" class="dateApplyBtn">검색</button>
					  </div>
					</section>
					<c:choose>
					<c:when test="${goods.goods_type=='motel'}">
						<c:forEach var="item" items="${goodsMap.RoomList}" >
							<li class="room on">
							  <div class="room-box">
							    <div class="room-select">
							      <div class="room_img_box" style="width: 40%;overflow: hidden;">
							      	<img src="${contextPath}/room_download.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&fileName=${item.fileName}" alt="룸 사진">
							      </div>
							      <div class="room-text cell-r">
							        <div class="reserve cell">				        
							          <c:choose>
								          <c:when test="${date1==0}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:when test="${Ddate1 == Ddate2}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:otherwise>
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1 *(date2-date1-1)/86400}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:otherwise>
							          </c:choose>				         
							          <h3>대실</h3>
							          <br>
							          <div class="price"><h2><fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price2}" />원</h2></div>
							          <div style="float:left; font-size:14px;">${Ddate3}</div>
							          <div><span style="float: left">마감시간</span><span style="float: right">${goods.goods_motel_endtime}시까지</span></div>
							          <div><span style="float: left">이용시간최대</span><span style="float: right"> ${goods.goods_motel_usetime}시간</span></div>
							          <div class="point">
							          	<button type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price2=${item.goods_room_price2}&date1=<%=date1%>&date2=<%=date1%>'">예약하기</button>
							          </div>
							        </div>
							        <div class="reserve cell">
							          <c:choose>
								          <c:when test="${date1==0}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:when test="${Ddate1 == Ddate2}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:otherwise>
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1 *(date2-date1-1)/86400}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:otherwise>
							          </c:choose>
							          <h3>숙박</h3>
							          <br>
							          <div class="price">
								          <h2>
								          
								          <c:set var="index" value="<%=date1 %>"/>
								          <c:set var="index2" value="<%=date2 %>"/>
						
								          <c:if test="${index != index2 and index != 0}">
								          	  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price1 *(date2-date1-1)/86400}" />원/
								          	  <span style="font-size:16px;">
										          <fmt:formatNumber type="number" maxFractionDigits="0"  value="${(date2-date1-1)/86400}" />박
										          <fmt:formatNumber type="number" maxFractionDigits="0"  value="${((date2-date1-1)/86400+1)}" />일
										       </span>
										       <div style="float:left; font-size:14px;">${Ddate3} - ${Ddate4}</div>
								          </c:if>
								          <c:if test="${index == index2 or index == 0}">
								          	  
								          	  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price1}" />원/
									          <span style="font-size:16px;">
									          	1박2일
									          </span>
									          <br>
									          <div style="float:left; font-size:14px;">${Ddate3} - ${Ddate4}</div>
								          </c:if> 
								          </h2>
							          </div>
							          <div><span style="float: left">입실시간</span>
							            <span style="float: right">${item.goods_checkIn}시부터</span></div>
							          <div><span style="float: left">퇴실시간</span>
							            <span style="float: right">익일${item.goods_checkOut}시</span></div>
							          <div class="point">
							          
							 			<div class="nonResDate">
							 			<div class="nonResBtn">실시간 예약 현황</div>
										<c:forEach var="resCheck" items="${reservationCheck}">
											
											
											<c:choose>
												<c:when test="${item.goods_uroom == resCheck.goods_uroom}">
													<div>${resCheck.checkIn} - ${resCheck.checkOut}</div>
												</c:when>
											</c:choose>
											
											<c:if test="${item.goods_uroom == resCheck.goods_uroom}">
											<c:choose>	
									          	<c:when test="${(Ddate3 <= resCheck.checkIn && resCheck.checkIn <= Ddate4)||(Ddate3 <= resCheck.checkOut && resCheck.checkOut <= Ddate4)||(resCheck.checkIn <= Ddate3 && Ddate4 <= resCheck.checkOut)}">
									          		<c:set var="resOnBtn" value="${item.goods_uroom}" />
									          	</c:when>
									    		<c:otherwise>
									    		</c:otherwise>
									         </c:choose>
									         </c:if>
									         
										</c:forEach>
										</div>
								          <c:set var="index" value="${date1}"/>
									      <c:if test="${index != 0 && resOnBtn != item.goods_uroom}">
								          	<button id="${item.goods_uroom}" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.goods_room_price1 *(date2-date1-1)/86400}&date1=<%=date1%>&date2=<%=date2%>' ">예약하기</button>
							          	  </c:if> 
								          <c:if test="${index == 0 && resOnBtn != item.goods_uroom}">
								          	<button id="${item.goods_uroom}" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.goods_room_price1}&date1=<%=date1%>&date2=<%=date2%>' ">예약하기</button>
								          </c:if>
								          <c:if test="${resOnBtn == item.goods_uroom}">
								          	<button id="${item.goods_uroom}" style="background:#777;" type="button" " disabled>예약방 없음</button>
								          </c:if>
								         
							          </div>
							        </div>
							      </div>
							    </div>
							    <input type="checkbox" class="room-search" id="room-1">
							    <div class="room-box-wrap">
							      <div class="room-img-content slider-wrap">
							        <div class="room-pic-box" id="room-pic">
							        	<c:forEach var="itemRoom" items="${goodsMap.imageListRoom}" >
							        		<c:choose>
								        		<c:when test="${item.goods_uroom == itemRoom.goods_uroom}">
								        			<div class="content cell" style="width: 962px;height: 500px;margin-bottom: 50px;overflow: hidden;"><img src="${contextPath}/room_download.do?goods_id=${itemRoom.goods_id}&goods_uroom=${itemRoom.goods_uroom}&fileName=${itemRoom.fileName}" alt="객실 이미지"></div>
												</c:when>
											</c:choose>
										</c:forEach>
							        </div>
							      </div>
							      <div class="page-num row">
							        <p class="current-txt cell"> 1 </p>
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
							      <div class="room_img_box" style="width: 40%;overflow: hidden;">
							      	<img src="${contextPath}/room_download.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&fileName=${item.fileName}" alt="룸 사진">
							      </div>
							      <div class="room-text cell-r">
							        
							        <div class="reserve cell" style="width:100%; border-right:none;">
							          <c:choose>
								          <c:when test="${date1==0}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:when test="${Ddate1 == Ddate2}">
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:when>
								          <c:otherwise>
								          	<h2>${item.goods_room_type}<a href="javascript:add_cart('${item.goods_uroom}','${item.goods_room_price1 *(date2-date1-1)/86400}','${Ddate3}','${Ddate4}')" style="float:right; color:rgba(192, 57, 43, 0.7);"><i class="fas fa-shopping-cart"></i></a></h2>
								          </c:otherwise>
							          </c:choose>
							          <h3>숙박</h3>
							          <br>
							          <div class="price">
										<h2>
								          <c:set var="index" value="<%=date1 %>"/>
								          <c:set var="index2" value="<%=date2 %>"/>
						
								          <c:if test="${index != index2 and index != 0}">
								          	  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price1 *(date2-date1-1)/86400}" />원/
								          	  <span style="font-size:16px;">
										          <fmt:formatNumber type="number" maxFractionDigits="0"  value="${(date2-date1-1)/86400}" />박
										          <fmt:formatNumber type="number" maxFractionDigits="0"  value="${((date2-date1-1)/86400+1)}" />일
										       </span>
										       <br>
										       <div style="float:left; font-size:14px;">${Ddate3} - ${Ddate4}</div>
								          </c:if>
								          <c:if test="${index == index2 or index == 0}">
								          	  
								          	  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price1}" />원/
									          <span style="font-size:16px;">
									          	1박2일
									          </span>
									          <br>
									          <div style="float:left; font-size:14px;">${Ddate3} - ${Ddate4}</div>
								          </c:if> 
								          </h2>
							          </div>
							          <div><span style="float: left">입실시간</span> <span style="float: right">${item.goods_checkIn}시부터</span></div>
							          <div><span style="float: left">퇴실시간</span> <span style="float: right">익일${item.goods_checkOut}시</span></div>
							          
							          <div class="point">
							          
							 			<div class="nonResDate">
							 			<div class="nonResBtn">실시간 예약 현황</div>
										<c:forEach var="resCheck" items="${reservationCheck}">
											
											
											<c:choose>
												<c:when test="${item.goods_uroom == resCheck.goods_uroom}">
													<div>${resCheck.checkIn} - ${resCheck.checkOut}</div>
												</c:when>
											</c:choose>
											
											<c:if test="${item.goods_uroom == resCheck.goods_uroom}">
											<c:choose>	
									          	<c:when test="${(Ddate3 <= resCheck.checkIn && resCheck.checkIn <= Ddate4)||(Ddate3 <= resCheck.checkOut && resCheck.checkOut <= Ddate4)||(resCheck.checkIn <= Ddate3 && Ddate4 <= resCheck.checkOut)}">
									          		<c:set var="resOnBtn" value="${item.goods_uroom}" />
									          	</c:when>
									    		<c:otherwise>
									    		</c:otherwise>
									         </c:choose>
									         </c:if>
									         
										</c:forEach>
										</div>
								          <c:set var="index" value="${date1}"/>
									      <c:if test="${index != 0 && resOnBtn != item.goods_uroom}">
								          	<button id="${item.goods_uroom}" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.goods_room_price1 *(date2-date1-1)/86400}&date1=<%=date1%>&date2=<%=date2%>' ">예약하기</button>
							          	  </c:if> 
								          <c:if test="${index == 0 && resOnBtn != item.goods_uroom}">
								          	<button id="${item.goods_uroom}" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.goods_room_price1}&date1=<%=date1%>&date2=<%=date2%>' ">예약하기</button>
								          </c:if>
								          <c:if test="${resOnBtn == item.goods_uroom}">
								          	<button id="${item.goods_uroom}" style="background:#777;" type="button" " disabled>예약방 없음</button>
								          </c:if>
								         
							          </div>
							        </div>
							      </div>
							    </div>
							    <input type="checkbox" class="room-search" id="room-1">
							    <div class="room-box-wrap">
							      <div class="room-img-content slider-wrap">
							        <div class="room-pic-box" id="room-pic" >
							        	<c:forEach var="itemRoom" items="${goodsMap.imageListRoom}" >
							        		<c:choose>
								        		<c:when test="${item.goods_uroom == itemRoom.goods_uroom}">
								        			<div class="content cell slick-slide" style="width: 962px;height: 500px;margin-bottom: 50px;overflow: hidden;">
								        				<img src="${contextPath}/room_download.do?goods_id=${itemRoom.goods_id}&goods_uroom=${itemRoom.goods_uroom}&fileName=${itemRoom.fileName}" alt="객실 이미지">
								        			</div>
								        			
												</c:when>
											</c:choose>
										</c:forEach>
							        </div>
							      </div>
							      <div class="page-num row">
							        <p class="current-txt cell" style="margin-left: 14px;"> 1 </p>
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
                    <div class="room-pic room-pic-themes row" id="room-pic-5">
						<span>
						<c:forTokens var="yoloTheme" items="${goods.yolo_theme}" delims = " ">
		               		<span class="room-pic-theme">
		               			<span style="display: block;">
		               			 <img style="width:30%;" src="${contextPath}/resources/image/theme-icon/${yoloTheme}.png" alt="service_image">
		               			</span>
		               			<strong style="color:#777;">${yoloTheme}</strong>
		               		</span>
		               	</c:forTokens>
		               	</span>
					</div>
					
                  </li>
                </ul>
                
                <ul id="tab3">
                  <table align="center" width="100%" style="margin-top:20px;"  >
					  <tr height="10" align="center" style="height:30px; color:white; font-weight:bold; background-color:rgb(112, 173, 71);">

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
					    <c:forEach  var="article" items="${articlesList}" varStatus="articleNum" >
						    <c:choose>
							    <c:when test="${article.goods_id == goods.goods_id}" >
								    <tr align="center" style=" height:80px; box-shadow: 3px 3px 3px #ddd;">
									<td id="board_head" width="5%">
										<div class="member_img"><img src="${contextPath}/mem_download.do?uid=${article.uid}&memFileName=${article.memFileName}" alt="리뷰 사진"	/></div>
									</td>
									<td style="visibility: hidden;" width="1%">${articleNum.count}</td>
									<td width="10%">${article.id }</td>
									<td align='left'  width="60%">
									  <span style="padding-right:30px"></span>
									   <c:choose>
									      <c:when test='${article.level > 1 }'>
									     	
									         <c:forEach begin="1" end="${article.level }" step="1">
									              <span style="padding-left:5px"></span>
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
									     <img onerror="this.src='${contextPath}/resources/image/1px.gif'" src="${contextPath}/thumbnails.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"   /><br>
									   </td> 
									  <td  width="10%">${article.writeDate}</td>
									</tr>
								</c:when>
							</c:choose>
					    </c:forEach>
					    </c:when>
					    </c:choose>
					</table>

						<a type="submit"  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do?goods_id=${goods.goods_id}','${contextPath}/member/loginForm.do')">
														<p class="cls2" 
	                                                    style="display: block;
															    width: 100px;
															    background: rgba(0,0,0,0.05);
															    margin: 0 auto;
															    text-align: center;
															    padding: 5px;
															    box-sizing: border-box;
															    border-radius: 5px;
															    margin-top: 20px;
															    border: 1px solid #ddd;">글쓰기</p>
						</a>

                </ul>
              </div>
            </div>
          </div>
        </div>
        <div id="layer" style="visibility: hidden">
			<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
			<div id="popup">
					<!-- 팝업창 닫기 버튼 -->
					<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> x
					</a> <br /> <font size="5" id="contents">장바구니에 담았습니다.</font><br>
				<form   action='${contextPath}/cart/myCartList.do'  >				
						<input  type="submit" value="장바구니 보기">
				</form>	
				</div>
			</div>
		  </div>
	  </div>
	
</body>
