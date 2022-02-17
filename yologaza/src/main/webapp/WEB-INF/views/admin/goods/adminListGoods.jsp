<!-- 기여도: 이택진100% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    

<html>
<head>
	<meta charset=UTF-8">
	<title>사업자 숙박 등록 리스트</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
	<style>
		#admin_main{
			margin-bottom: -150px;
			border-bottom: 10px solid #ddd;
		}
		#admin_main button :not(.paging button){
			padding:5px; 
			box-sizing:boder-box; 
			cursor:pointer; 
			display:block;
		}
		.admin_main_wrap .admin_main_box .adminCustomer{
			width: 100%;
			margin: 0 auto;
			padding: 40px 50px 0px 50px;
			border-radius: 15px 15px 0 0;
			border: 9px solid #ddd;
			border-bottom: 0px;
			box-sizing: border-box;
			margin-top: 50px;
		}
		#admin_main .building_box{
			display: flex;
			width:100%;
			height:180px;
			padding-top:60px;
			box-sizing:border-box;
			justify-content: space-around;
		}
		#admin_main .door{
			width: 90px;
			height:120px;
			background:#ddd;
			margin:0 auto;
			border-radius:10px 10px 0px 0px;
		}
		#admin_main .door{
			float:left;
			width: 90px;
			height:120px;
			background:#ddd;
			border-radius:10px 10px 0px 0px;
		}
		#admin_main .window{
			float:left;
			width: 120px;
			height:60px;
			border: 6px solid #ddd;
			border-radius:10px;
		}
		.button_div button{
	float:right;
	width: 60px;
	height: 25px;
	box-sizing: inherit;
	align-items: center;
	border-radius: 5px;
	border: 2px solid rgba(0,0,0,0.15);
	box-shadow: none;
	font-size: 16px;
	line-height: 1.5;
	text-align: center;
	cursor:pointer;
	margin-left:10px;
}
.button_div button:nth-child(6){
	margin-left:0px;
}
.button_div{
	height:29px;
}


.auth_div{
	height:29px;
	margin-top:5px;
}

#cal{
	float:right;
	width: 200px;
    height: 30px;
   	border: none;
   	font-size: 16px;
   	text-align: center;
   	color: #777;
   	border: 1px solid #ddd;
    border-radius: 5px;
    margin-right:5px;
}
#admin_main .far{
	font-size: 27px;
	color: #555;
	margin: 3px 7px 0px 0px;
}
#text1{
  display: inline-block;
  font-size: 1.17em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
  float:left;
  margin-bottom:30px;
}
.paging {
  padding-top:32px;
}

.paging button{
    width: 32px;
    height: 32px;
    box-sizing: inherit;
    align-items: center;
    border-radius: 3px;
    border: none;
    box-shadow: none;
    font-size: 13px;
    line-height: 1.5;
    text-align: center;
    cursor:pointer;
}

.paging .on{
  background:rgb(192, 57, 43);
  color:#fff;
}
	</style>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		function adminGoodsAcess(goods_id,uid) {
			$.ajax({
				type : "POST",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/admin/goods/goodsAcess.do?goods_id="+goods_id,
				data : {
					goods_id:goods_id,
					uid:uid
				},
				success: function(result){
					swal("Good job!", "검수 승인을 완료했습니다.", "success");
				  }
			}); //end ajax	
		}
		
		 $(function() {
		        $('input[name="daterange"]').daterangepicker({
			        opens: 'left',
			        showDropdowns: true
		        }, function(start, end, label) {
			        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
			        var date1 = Date.parse(start.format('YYYY-MM-DD'))/1000;
			        var date2 = Date.parse(end.format('YYYY-MM-DD'))/1000;
			        $('#dateApplyBtn').click(function(){
			    		window.location.replace('${contextPath}/admin/goods/listGoods.do?date1='+date1+'&date2='+date2);
			    	});
		        });

		    });
	</script>
	
<script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />
</head>
<body>
<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con" style="width:1024px">

	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <a id="text1">숙박 관리 리스트</a>
	        <div class="button_div">
	          <button type="button" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=0&date2=0'">전체</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${today-7776000}&date2=${today}'">90일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${today-2592000}&date2=${today}'">30일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${today-604800}&date2=${today}'">1주</button> 
	          <button type="button" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${today}&date2=${today}'">오늘</button>
	          <button id="dateApplyBtn">검색</button>
	          <div class="date-box-wrap" style="display: inline-block; float: right;">
	          	<input type="text" id="cal" name="daterange" value="${Ddate1}/ - ${Ddate2}"/>
	          	<i class="far fa-calendar-alt"></i>
	          </div>
	        </div>
			<table align="center">
			<tr align="center" class="column" style="font-size:12px;">
				<td ><b>업체명</b></td>
				<td ><b>예약페이지 이동</b></td>
				<td ><b>주소</b></td>
				<td><b>숙박 시설</b></td>
				<td><b>검수 여부</b></td>
				<td><b>등록 날짜</b></td>
				<td><b>검색/변경</b></td>
			</tr>
			
			<c:forEach var="goodsList" items="${listGoods}" > 
				<tr align="center" style="box-shadow: 0px 3px #ddd; font-size:14px;">
					
					<td width="13%">${goodsList.goods_name}</td>
					<td>
						<div class="img-box" style="height:90px; overflow:hidden;">
							<a href="${contextPath}/goods/goodsInformation.do?goods_id=${goodsList.goods_id }">
								<img src="${contextPath}/goods_thumbnails.do?goods_id=${goodsList.goods_id}&fileName=${goodsList.fileName}" alt="숙박정보 사진">
							</a>
						</div>
					</td>
					<td width="40%">${goodsList.roadAddress}<br>${goodsList.namujiAddress}</td>
					<td>${goodsList.goods_type}</td>
					<td>
					<c:choose>
						<c:when test="${goodsList.goods_acess != null && goodsList.goods_acess != ''}">
							<button disabled>검수 완료</button>
						</c:when>
						<c:otherwise>
							<button><a href="javascript:adminGoodsAcess('${goodsList.goods_id}','${goodsList.uid}')">검수 확인</a></button>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${goodsList.goods_creDate}</td>
					<td>
						<button type="button" class="next" style="display:block;"  
						onclick="location.href='${contextPath}/business/goods/viewNewGoods.do?goods_id=${goodsList.goods_id}'">상세 검색</button>
						<button type="button" class="next" style="margin-top:9px;" 
						onclick="location.href='${contextPath}/business/goods/listRoom.do?goods_id=${goodsList.goods_id}'">객실 검색</button>
					</td>
				</tr>
			</c:forEach>   
			</table>
		</div>
		<div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${date1}&date2=${date2}&pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/admin/goods/listGoods.do?date1=${date1}&date2=${date2}&pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
		<div class="building_box">
			<div class="window"></div>
			<div class="door"></div>
			<div class="window"></div>
		</div>
	</div>
</div>
</div>
</body>
</html>
