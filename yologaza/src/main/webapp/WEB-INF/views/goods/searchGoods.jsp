<!-- 기여도 : 이택진100% -->
<!-- 2차기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
	request.setCharacterEncoding("UTF-8");
	String goods_type = request.getParameter("goods_type");
	String roadAddress = request.getParameter("roadAddress");
	String value = request.getParameter("value");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙박 검색</title>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/search_goods.css">
	<!--<script src="${contextPath}/resources/js/search_goods.js"></script>-->
    <!-- 달력링크 -->
    <script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cf929ac0c936c4cda3566648aaf3dc4&libraries=services"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />
    
    
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
		    		window.location.replace('${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=<%=roadAddress%>&date1='+date1+'&date2='+date2);
		    	});
	        });
	
	    });
	    
	    $(function() {
			$('.btn_map').click(function(){
			  var idx = $(".btn_map").index(this)
			  if($('#map-box').eq(idx).css('display')=='none'){
			         $('#map-box').eq(idx).show();
			}
			});
			$('#map .map-close').click(function(){
			  var idx = $("#map .map-close").index(this)
			  if($('#map-box').eq(idx).css('display')=='block'){
			         $('#map-box').eq(idx).hide();
			}
			});
	    });
	    
	 // YOLO가자!커뮤니티
    	$(function(){
		    $(".goods_list .goods_box").slice(0, 5).show(); // select the first ten
		    $("#load").click(function(e){ // click event for load more
		        e.preventDefault();
		        $(".goods_list .goods_box:hidden").slice(0, 5).show(); // select next 10 hidden divs and show them
		        if($(".goods_list .goods_box:hidden").length == 0){ // check if any hidden divs still exist
		            alert("No more divs"); // alert if there are none left
		        }
		    });
		});
    	
    </script>
    
	<style>
		.detail-select .detail-select-box .top_menu ul .active {
			font-weight:bold;
			color:rgb(112, 173, 71);
		}
		#filter_wrap .btn_date{
			position: relative;
	     }
	     #filter_wrap .far{
			position: absolute;
		    left: 5px;
		    top: 5px;
		    font-size: 21px;
		    color: #555;
	     }
	     #map-box{
	     	display: none;
     	    position: absolute;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0,0,0,0.5);
		    z-index: 99;
		    padding-bottom:100vh;
	     }
	     #map .map-close{
	     	position: absolute;
	     	top:0px;
	     	right:20px;
	     	z-index: 10;
	     	cusor: pointer;
	     }
	     #map .map-close h1{
	     	cursor: pointer;
	     }
	     
	     #map{
	     	position: relative;
		    top: 60%;
		    left: 50%;
		    transform: translate(-50%, -50%);
	     }
	     .goods_list .goods_box:nth-child(-n+5){
	     	display:block;
	     }
	     .goods_list .goods_box{
	     	display:none;
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
    	#roadAddress{
    		color: white;
		    width: 90px;
		    padding: 5px;
		    border: 1px solid rgba(0,0,0,0.1);
		    box-sizing: border-box;
		    font-size: 18px;
		    background: rgba(0,0,0,0.1);
		    position: absolute;
		    top: 0;
    		left: 0;
		    border-radius: 6px;
		    cursor:pointer;
    	}
    	#roadAddress option{
    		color: black;
    		background: white;
    	}
    	.header-bar .text-box p{
    		left: 0;
   			bottom: 54px;
    	}
    	.location{	
			position: relative;
    		top: 75px;
    		z-index: 9;
    	}
    	.location ul{
    		display:none;
			position: absolute;
    		top: 36px;
    		width: 180px;
			text-align: left;
			background: white;
			border: 1px solid #ddd;
			padding: 10px;
			box-sizing: border-box;
			border-radius: 9px;
    	}
    	.location:hover ul{
    		display:block;
    	}
    	.location ul li{
    		width:100%;
    		padding-bottom: 5px;
    		box-sizing:border-box;
    		color:#777;
    	}
    	.location ul li:hover{
    		color:rgb(112, 173, 71);
    		font-weight:bold;
    	}
	</style>
	
</head>
<body id="searchGoods">
<!-- yolo가자 작성 -->
<div class="detail-select">
    <div class="header-bar">
      <div class="text-box con">
      	<c:set var="index" value="<%=goods_type %>"/>
      	<c:if test="${index eq 'my'}">
       		<p>내주변</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(1){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>
        <c:if test="${index eq 'motel'}">
       		<p>모텔</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(2){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>
       	<c:if test="${index eq 'hotel'}">
       		<p>호텔</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(3){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>	
       	<c:if test="${index eq 'pension'}">
       		<p>펜션</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(4){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>	
       	<c:if test="${index eq 'resort'}">
       		<p>리조트</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(5){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>	
       	<c:if test="${index eq 'guestHouse'}">
       		<p>게스트하우스</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(6){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>	
       	<c:if test="${index eq 'camping'}">
       		<p>켐핑/글램핑</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(7){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>	
       	<c:if test="${index eq 'hanok'}">
       		<p>한옥</p>
       		<style>
       			.detail-select .detail-select-box .top_menu ul li:nth-child(8){
       				font-weight:bold;
       				color:rgb(112, 173, 71);
       			}
       		</style>
       	</c:if>
		<div class="location">
			<div id="roadAddress">
			<c:set var="location" value="<%=roadAddress %>"/>
			<c:choose>
				<c:when test="${location eq null or location eq 'null'}">
					지역
				</c:when>
				<c:otherwise>
					<%=roadAddress %>
				</c:otherwise>
			</c:choose>
			</div>
			<ul>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>">전체</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=서울">서울</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=부산">부산</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=제주">제주</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=강원">강원</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=경기">경기</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=인천">인천</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=경상">경상</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=전라">전라</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=충남">충남</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=대전">대전</a></li>
				<li><a href="${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=세종">세종</a></li>
			</ul>
		</div>		
      </div>
      
    </div>
    <div class="detail-select-box con">
		<div class="top_menu tab_btn">
			<ul class="row">
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=my">내주변</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=motel">모텔</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=hotel">호텔</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=pension">펜션</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=resort">리조트</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=guestHouse">게스트하우스</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=camping">캠핑/글램핑</a></li>
				<li class="cell"><a href="${contextPath}/searchGoods.do?goods_type=hanok">한옥</a></li>
			</ul>
		</div>
      <!-- 상세 검색창 -->
      <div id="filter_wrap" class="filter_wrap">
        <section class="date-wrap">
		<h3>날짜</h3>
		<div class="btn_date">
			<tr class="date-box">
				<td  class="date"><i class="far fa-calendar-alt"></i>
					<input type="text" name="daterange" value="${Ddate1}/ - ${Ddate2}" />
				</td>
			</tr>
			
		</div>
        <div class="select-wrap">
          <h3>상세조건</h3>
          <button type="button" onclick="">초기화</button>
          <button id="dateApplyBtn" class="dateApplyBtn">적용</button>
        </div>
        
        <section>
          <strong>이색테마</strong>
            <ul class="hide_type half">
              <li><input type="checkbox" id="tmino_0" name="tmino[]" class="inp_chk" value="8"><label
                                                                                                      for="tmino_0" class="label_chk">무인텔</label></li>
              <li><input type="checkbox" id="tmino_1" name="tmino[]" class="inp_chk" value="14"><label
                                                                                                       for="tmino_1" class="label_chk">파티룸</label></li>
              <li><input type="checkbox" id="tmino_2" name="tmino[]" class="inp_chk" value="1"><label
                                                                                                      for="tmino_2" class="label_chk">거울룸</label></li>
              <li><input type="checkbox" id="tmino_3" name="tmino[]" class="inp_chk" value="9"><label
                                                                                                      for="tmino_3" class="label_chk">복층룸</label></li>
              <li><input type="checkbox" id="tmino_4" name="tmino[]" class="inp_chk" value="2"><label
                                                                                                      for="tmino_4" class="label_chk">공주룸</label></li>
              <li><input type="checkbox" id="tmino_5" name="tmino[]" class="inp_chk" value="13"><label
                                                                                                       for="tmino_5" class="label_chk">트윈베드</label></li>
              <li><input type="checkbox" id="tmino_6" name="tmino[]" class="inp_chk" value="26"><label
                                                                                                       for="tmino_6" class="label_chk">야외테라스</label></li>
              <li><input type="checkbox" id="tmino_7" name="tmino[]" class="inp_chk" value="31"><label
                                                                                                       for="tmino_7" class="label_chk">바다뷰</label></li>
              <li><input type="checkbox" id="tmino_8" name="tmino[]" class="inp_chk" value="39"><label
                                                                                                       for="tmino_8" class="label_chk">호수뷰</label></li>
              <li><input type="checkbox" id="tmino_9" name="tmino[]" class="inp_chk" value="40"><label
                                                                                                       for="tmino_9" class="label_chk">하늘뷰</label></li>
            </ul>
            
          </ul>
        </section>
        <section>
          <strong>스파시설</strong>
          <ul class="hide_type half">
            <li><input type="checkbox" id="tmino_10" name="tmino[]" class="inp_chk"
                       value="19"><label for="tmino_10" class="label_chk">스파/월풀</label></li>
            <li><input type="checkbox" id="tmino_11" name="tmino[]" class="inp_chk"
                       value="17"><label for="tmino_11" class="label_chk">사우나/찜질방</label></li>
            <li><input type="checkbox" id="tmino_12" name="tmino[]" class="inp_chk" value="7"><label
                                                                                                     for="tmino_12" class="label_chk">맛사지 베드</label></li>
            <li><input type="checkbox" id="tmino_13" name="tmino[]" class="inp_chk"
                       value="15"><label for="tmino_13" class="label_chk">히노끼탕</label></li>
            <li><input type="checkbox" id="tmino_14" name="tmino[]" class="inp_chk" value="5"><label
                                                                                                     for="tmino_14" class="label_chk">노천탕</label></li>
            <li><input type="checkbox" id="tmino_15" name="tmino[]" class="inp_chk"
                       value="34"><label for="tmino_15" class="label_chk">반신욕</label></li>
            <li><input type="checkbox" id="tmino_16" name="tmino[]" class="inp_chk"
                       value="10"><label for="tmino_16" class="label_chk">욕실 TV</label></li>
          </ul> 
        </section>
        <section>
          <strong>놀이시설</strong>
          <ul class="hide_type half">
            <li><input type="checkbox" id="tmino_17" name="tmino[]" class="inp_chk"
                       value="11"><label for="tmino_17" class="label_chk">수영장</label></li>
            <li><input type="checkbox" id="tmino_18" name="tmino[]" class="inp_chk" value="4"><label
                                                                                                     for="tmino_18" class="label_chk">노래방</label></li>
            <li><input type="checkbox" id="tmino_19" name="tmino[]" class="inp_chk" value="6"><label
                                                                                                     for="tmino_19" class="label_chk">당구대</label></li>
            <li><input type="checkbox" id="tmino_20" name="tmino[]" class="inp_chk" value="3"><label
                                                                                                     for="tmino_20" class="label_chk">게임기</label></li>
            <li><input type="checkbox" id="tmino_21" name="tmino[]" class="inp_chk"
                       value="30"><label for="tmino_21" class="label_chk">안마의자</label></li>
            <li><input type="checkbox" id="tmino_22" name="tmino[]" class="inp_chk"
                       value="12"><label for="tmino_22" class="label_chk">커플 PC</label></li>
            <li><input type="checkbox" id="tmino_23" name="tmino[]" class="inp_chk"
                       value="18"><label for="tmino_23" class="label_chk">미니바</label></li>
            <li><input type="checkbox" id="tmino_24" name="tmino[]" class="inp_chk"
                       value="23"><label for="tmino_24" class="label_chk">3D TV</label></li>
            <li><input type="checkbox" id="tmino_25" name="tmino[]" class="inp_chk"
                       value="25"><label for="tmino_25" class="label_chk">빔프로젝터</label></li>
          </ul>
        </section>
  
        <section>
          <strong>가격<p class="result" style="float:right;">0</p></strong>
          
          <div class="slider_wrap">
            <div id="slider"
                 class="slider_align ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                 data-min="1" data-max="30">
              <input class="slider" type="range" min="10000" max="300000" class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;">
              
              </div><span class="price_txt">1만원</span><span class="price_txt">30만원</span>
          </div>
          <script>
		      var result = $(".result");
		      var slider = $(".slider")
		      slider.on('input', function() {
		          result.html( $(this).val() );
		      });
		      $(function() {
		    	  $('.result').on('change', function() {
		    	     var n = $(this).val(); 
		    	     n = Math.floor(n/1000) * 1000; 
		    	     //alert(n);  
		    	     $(this).val(n);
		    	  });
		    	});
		    </script>
         </section>
      </div>
      	<c:set var="index" value="<%=value %>"/>
		<c:if test="${index eq 'new_up'}">
			<style>
				.goods-wrap .search-menu > .search-box > button:nth-child(1) span{
					font-weight:bold;
					color:black;
				}
			</style>
		</c:if>
		<c:if test="${index eq 'higher_price'}">
			<style>
				.goods-wrap .search-menu > .search-box > button:nth-child(2) span{
					font-weight:bold;
					color:black;
				}
			</style>
		</c:if>
		<c:if test="${index eq 'lower_price'}">
			<style>
				.goods-wrap .search-menu > .search-box > button:nth-child(3) span{
					font-weight:bold;
					color:black;
				}
			</style>
		</c:if>
      <div class="list_wrap">
        <div class="goods-wrap">  
          <div class="search-menu">
            <div class="search-box">
             <button type="text" id="goods_newest" onclick="location.href='${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=<%=roadAddress%>&value=new_up' "><span>최신순</span></button>
             <button type="text" id="hightPrice" onclick="location.href='${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=<%=roadAddress%>&value=higher_price' "><span>높은 가격 순</span></button>
             <button type="text" id="lowerPrice" onclick="location.href='${contextPath}/searchGoods.do?goods_type=<%=goods_type%>&roadAddress=<%=roadAddress%>&value=lower_price' "><span>낮은 가격 순</span></button>
            </div>
            <button id="btn_map" type="button" class="btn_map" onclick="pop_map_pc();">지도</button> 
          </div>
          <div id="goods_list" class="tab_each goods_list">
            <div class="goods_title"><h3>상품 리스트</h3></div>
            
            <ul id = "tab1" class="active">
           		<c:forEach var="item" items="${goodsMap}" >
            		<li class="list_1 goods_menu1 goods_box">
				      <a href="${contextPath}/goods/goodsInformation.do?goods_id=${item.goods_id }&date1=${date1}&date2=${date2}">
				        <div class="goods_picture">
				          <img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙소 이미지"/>
				        </div>
				        <div class="goos_impormation">
				          <div class="name">
				            <strong>${item.goods_name}</strong>
				            <p>${item.roadAddress}</p>
				          </div>
				          <div class="price">
				            <div class="map_html">
				            	<c:set var="index" value="<%=goods_type %>"/>
									<c:if test="${index eq 'motel'}">
				            			<p>대실&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>${item.goods_price2}</b></p>
									</c:if>
									<p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>${item.goods_price1}</b></p>
				            </div>
				          </div>    
				        </div>
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
  <div id="map-box" class="map-box">
	  <div id="map" style="width:750px;height:750px">
	  	<div class="map-close"><h1>x<h1></div>
	  </div>
	</div>
	<script>
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		<c:set var="index" value="<%=goods_type %>"/>
		<c:if test="${index eq ''}">  
		<c:forEach var="item" items="${item.hotel}" >
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${item.roadAddress}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;height:45px;text-align:center;">${item.goods_name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		</c:forEach>
		</c:if>
	</script>
</body>
</html>