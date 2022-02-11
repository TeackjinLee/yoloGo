<%-- 송상우 100% --%>
<!-- 2차기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cf929ac0c936c4cda3566648aaf3dc4&libraries=services"></script>
<style>
body{
  font-size: 14px;
}
.wrap.show{
  opacity: 1;
  visibility: visible;
}

.wrap{
  width: 100%;
  background:#fff;
}


ul,
li {
    list-style: none;
}

a {
    color: inherit;
    text-decoration: none;
}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
}

.sub_wrap .align_rt {
    float: right;
    width: 750px;
    margin-right: 31px;
  margin-top:20px;
  margin-bottom:100px;
}

.sub_wrap nav {
    display: block;
    float: left;
    width: 238px;
  padding-top:32px;
}

.wrap{
  width:100%;
  background:#fff;
}

.sub_top_wrap{
  height: 120px;
  background:rgb(112,173,71);
}

.sub_top{
	position:relative;
  width:1024px;
  height:120px;
  margin:0 auto;
  border-radius:0;
	text-align:left;
}

.sub_top a{
	position: absolute;
    color: white;
    font-weight: 500;
    font-size: 32px;
    bottom:20px;
}


.content{
  overflow:hidden;
}

.sub_wrap{
  width: 1024px;
  margin:0 auto 0 auto;
  padding-top:54px;
  padding-bottom:54px;
}

.show_list li .list_que span {
    font-size: 16px;
    color: black;
}

.show_list li{
    display: block;
    position: relative;
    height: auto;
    margin-bottom: 0;
    padding: 0px 24px 0px 0px;
    border-radius: 0;
    background: #fff;
    font-size: 18px;
    line-height: normal;
    cursor: pointer;
}

.show_list li .list_que p {
    padding-bottom: 0px;
    overflow: visible;
    white-space: normal;
    text-overflow: initial;
    line-height: normal;
    word-wrap: break-word;
}

.show_list li a p {
    overflow: hidden;
    width: 100%;
    padding-bottom: 3px;
    white-space: nowrap;
    text-overflow: ellipsis;
    color:black;
}

.tab_each {
    border-top: none;
}

.tab_each {
    clear: both;
    display:block;
  padding-top:8px;
    text-align:left;
}

div {
    display: block;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.show_list {
    margin-bottom: 0;
    padding: 0 0;
}

.sub_wrap nav ul li a{
  display:block;
  font-size:20px;
  color:black;
}

.sub_wrap nav{
	padding-right:20px;
	text-align:left;
}

.sub_wrap nav ul li a.active{
  font-size:20px;
  color:rgb(112,173,71);
  font-weight:bold;
}

.wrap.show, footer.show {
    opacity: 1;
    visibility: visible;
}

.wrap {
    width: 100%;
    background: #fff;
    opacity: 0;
    visibility: hidden;
}

.sub_wrap nav ul li {
    margin-bottom: 26px;
}

.tab{
	text-align:left;
}
.tab .tab_btn ul li{
  display:inline-block;
}
.tab .tab_btn ul li a{
  color:black;
  font-size:20px;
  font-weight:500;
}

.tab .tab_btn ul input{
  position:absolute;
  right:0px;
  border:0px;
  background:#fff;
  color:rgb(112,173,71);
  font-size:18px;
}

.tab .tab_btn ul{
  position:relative;
  margin-top:30px;
}

.tab_each .reservation{
	height:220px;
	margin-top:20px;
	border:1px solid #ddd;
	box-sizing: border-box;
}

.tab_each .reservation img{
    height: 100%;
    display: block;
    position: absolute;
    transform: translateX(-50%);
    left: 50%;
}

.tab_each .reservation .descript{
    width: 70%;
    height: 100%;
    float: right;
    border-left: none;
    position: relative;
    right: 6px;
    padding: 10px 10px 10px 15px;
    vertical-align: top;
}

.tab_each .reservation .descript a1{
  font-size:24px;
}

.tab_each .reservation .descript input{
  position: absolute;
  top: 5px;
  right: 0px;
  cursor: pointer;
}
.tab_each .reservation .box-reservation{
	width: 30%;
    height: 220px;
    float: left;
    overflow: hidden;
    border: 1px solid #ddd;
    position: relative;
}
.tab_each .reservation .descript a2{
  display:block;
}

.tab_each .reservation .descript a3{
  display:inline-block;
  margin-top:15px;
}

.tab_each .reservation .descript a4{
  padding-left:15px;
}

.tab_each .reservation .descript .detail{
  display:block;
  width:500px;
  height:30px;
  margin-top:10px;
}

.tab_each .reservation .descript .detail .phonenumber{
  display:none;
  width:200px;
  height:30px;
  position: absolute;
  top: 221px;
  left: 85px;
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  text-align:center;
  z-index:2;
  float:left;
}

.tab_each .reservation .descript .detail .cancel{
    display: block;
    font-size: 16px;
    border: 2px solid rgba(0,0,0,0.2);
    border-radius: 6px;
    cursor: pointer;
    float: right;
    padding: 2px 5px 2px 5px;
    z-index: 9;
}

.tab_each .reservation .descript .detail .used{
  display:block;
  height:30px;
  font-size:16px;
  border:0;
  background:#fff;
  float:right;
}

.tab_each .reservation .descript .button{
  position:absolute;
  bottom:0;
  width:500px;
}

.tab_each .reservation .descript .button button{
  width:45px;
  height:45px;
  border:0;
  border-radius:6px;
  margin-left:10px;
  margin-bottom:10px;
  cursor:pointer;
  position:relative;
}

.tab_each .reservation .descript .button button i{
  zoom:2;
}

.tab_each .reservation .descript .button .price{
  zoom:1;
  width:180px;
  float:right;
  position:relative;
  margin-top:15px;
  border:0;
  font-size:18px;
  color:red;
  text-align:right;
}

.map-box{
	display:none;
	height: 270px;
	position: absolute;
	right: 365px;
	top: 220px;
	z-index: 2;
	background:red;
}

</style>
<script type="text/javascript">
	
	$(function() {
	  $('.phoneicon').click(function(){
		    var idx = $(".phoneicon").index(this)
		    if($('.phonenumber').eq(idx).css('display')=='none'){
		           $('.phonenumber').eq(idx).show();
		  }
		    else{
		      $('.phonenumber').eq(idx).hide();
		    }
		});
		  $('.mapicon').click(function(){
		    var idx = $(".mapicon").index(this)
		    if($('.map-box').eq(idx).css('display')=='none'){
		           $('.map-box').eq(idx).show();
		  }
		    else{
		      $('.map-box').eq(idx).hide();
		    }
		});
	});
	
	<!-- 예약 취소js -->
	function delete_reservation_goods(rid, goods_id, price){
		var rid=Number(rid);
		var goods_id=Number(goods_id);
		var price=Number(price);
		var formObj=document.createElement("form");
		var i_rid = document.createElement("input");
		var i_goods_id = document.createElement("input");
		var i_price = document.createElement("input");
	
		i_rid.name="rid";
		i_rid.value=rid;
		i_goods_id.name="goods_id";
		i_goods_id.value=goods_id;
		i_price.name="price";
		i_price.value=price;
		
		formObj.appendChild(i_rid);
		formObj.appendChild(i_goods_id);
		formObj.appendChild(i_price);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/reservation/removeReservation.do";
	    formObj.submit();
	}
	
	<!--  달력js -->
    $(function() {
        $('input[name="daterange"]').daterangepicker({
	        opens: 'left',
	        showDropdowns: true
        }, function(start, end, label) {
	        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	        var date1 = Date.parse(start.format('YYYY-MM-DD'))/1000;
	        var date2 = Date.parse(end.format('YYYY-MM-DD'))/1000;
        });

    });

</script>
</head>
<body class="pc">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a>MY페이지</a>
        </div>
      </div>
      <div id="content" class="sub_wrap">
      	
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/mypage/Mypage1.do">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage2.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage3.do" class="active">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage4.do">내 리뷰 관리</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="${contextPath}/mypage/Mypage3.do"">예약 내역</a></li>
                  <input type="submit" value="선택 삭제">
                </ul>
              </div>
            </div>
            
            <div class="tab_each">
            	<c:forEach var="item" items="${mypageReservation}" varStatus="cnt">
	           		<div class="reservation">
	           			<div class="box-reservation">
		           			<a href="${contextPath}/goods/goodsInformation.do?goods_id=${item.goods_id }">
								<img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙소 이미지"/>
							</a>
						</div>
						<div class="descript">
						  <h1>${item.goods_name}</h1>
						  <h3>${item.roadAddress}</h3><br>
						  <input type="checkbox">
						  <h3>체 크 인&nbsp; : ${item.checkIn}&nbsp;${item.goods_checkIn}</h3>
						  <h3>체크아웃 : ${item.checkOut}&nbsp;${item.goods_checkOut}</h3>
						  <div class="detail">
						  <c:choose>
							  <c:when test="${item.checkIn <= Ddate3}">
							  	<form>
								    <a class="cancel" href="#"> 
										예약완료
									</a>
								</form>
							  </c:when>
							  <c:otherwise>
							  	<form>
								    <a class="cancel" href="javascript:delete_reservation_goods('${item.rid}','${item.goods_id}','${item.price}');"> 
										예약취소
									</a>
								</form>
							  </c:otherwise>
						  </c:choose>
						  <input class="phonenumber" type="text" value="${item.goods_hp}" readonly>
						  </div>
						  <div class="button">
						    <button class="mapicon"><i class="fas fa-map-marker-alt"></i></button>
						    <button class="phoneicon"><i class="fas fa-phone-alt"></i></button>
						    <h3 class="price">결제가 : <fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.price}" />원</h3>
						    <input style="visibility:hidden;" name="price" value="${item.price}" />
						    <input style="visibility:hidden;" name="price" value="${item.uid}" />
						  </div>
						  <div id="map-box" class="map-box">
							  <div id="${item.rid}" style="width:270px;height:270px;"></div>
						  </div>
						   <script>
								//주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
									var mapContainer = document.getElementById('${item.rid}'), // 지도를 표시할 div 
									    mapOption = {
									        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };  
									
									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									
									
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
									            content: '<div style="width:150px;text-align:center;padding:6px 0;">${item.goods_name}</div>'
									        });
									        infowindow.open(map, marker);
									
									        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									        map.setCenter(coords);
									    } 
									});    
								</script>
						</div>	
		            </div>

					
            	</c:forEach>
              
              
            </div>
            
          </div>
        </div>
      </div>
    </div>
    
    



</body>
</html>