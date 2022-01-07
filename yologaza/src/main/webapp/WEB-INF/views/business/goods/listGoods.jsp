<!-- 기여도: 이택진100% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
		.admin_main_wrap .admin_main_box .adminCustomer{
			width: 100%;
		    margin: 0 auto;
		    box-sizing: border-box;
		    padding: 40px 50px 0px 50px;
		    border-radius: 15px;
		    box-shadow: 1px 1px 2px 2px #ddd;
		    border:none;
		    margin-top:50px;
		}
		#admin_main .box{
			width:100%;
			height:150px;
			padding-top:30px;
			box-sizing:border-box;
		}
		#admin_main .door{
			width: 90px;
			height:120px;
			background:#ddd;
			margin:0 auto;
			border-radius:10px 10px 0px 0px;
		}
	</style>
</head>
<body>
<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con" style="width:1024px">

	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <h3>숙박 등록 리스트</h3>
			<table align="center">
			<tr align="center" class="column">
				<td ><b>업체명</b></td>
				<td ><b>예약페이지 이동</b></td>
				<td ><b>주소</b></td>
				<td><b>숙박 시설</b></td>
				<td><b>등록 날짜</b></td>
				<td><b>검색/변경</b></td>
			</tr>
			
			<c:forEach var="goodsList" items="${listGoodsMap.goodsList}" > 
				<tr align="center" style="box-shadow: 0px 3px #ddd;">
					
					<td>${goodsList.goods_name}</td>
					<td><a href="${contextPath}/goods/goodsInformation.do?goods_id=${goodsList.goods_id }"><img src="${contextPath}/goods_thumbnails.do?goods_id=${goodsList.goods_id}&fileName=${goodsList.fileName}" alt="숙박정보 사진"></a></td>
					<td width="40%">${goodsList.roadAddress}<br>${goodsList.namujiAddress}</td>
					<td>${goodsList.goods_type}</td>
					<td>${goodsList.goods_creDate}</td>
					<td>
						<button type="button" class="next" style="padding:5px; box-sizing:boder-box; cursor:pointer; display:block;" onclick="location.href='${contextPath}/business/goods/viewNewGoods.do?goods_id=${goodsList.goods_id}'">상세 검색</button>
						<button type="button" class="next" style="padding:5px; box-sizing:boder-box; cursor:pointer; display:block; margin-top:9px;" onclick="location.href='${contextPath}/business/goods/listRoom.do?goods_id=${goodsList.goods_id}'">객실 관리</button>
					</td>
				</tr>
			</c:forEach>   
			</table>
		</div>
		<div class="box"><div class="door"></div></div>
	</div>
</div>
</body>
</html>
