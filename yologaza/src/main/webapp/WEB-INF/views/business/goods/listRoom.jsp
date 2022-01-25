<!-- 기여도: 이택진100% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<%
  request.setCharacterEncoding("UTF-8");
	String goods_id = request.getParameter("goods_id");
%>    
<html>
<head>
	<meta charset=UTF-8">
	<title>사업자 숙박 등록 리스트</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
	<style>
		#admin_main{
			margin-bottom: -150px;
		}
		.admin_main_wrap .admin_main_box .adminCustomer{
			display: flex;
			flex-direction: column;
			width: 100%;
			margin: 0 auto;
			padding: 40px 50px 0px 50px;
			border-radius: 15px 15px 0 0;
			border: 9px solid #ddd;
			border-bottom: 0px;
			box-sizing: border-box;
			margin-top: 50px;
		}
		.admin_main_wrap .admin_main_box .adminCustomer .adminCustomer_box h3{
			margin-bottom:0px;
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
		#admin_main .room_wrap{
			float: left;
			width: 50%;
			padding: 20px;
			box-sizing: border-box;
		    height: 300px;
		    overflow:hidden;
		}
		#admin_main .room_box{
			position: relative;
			width: 100%;
			height: 100%;
			overflow: hidden;
			border-radius: 15px;
			border: 9px solid #ddd;
			box-sizing: border-box;
			z-index: 9;
		}
		#admin_main .room_text{
			position: absolute;
			z-index: 9;
			bottom: 0;
			width: 100%;
			right: 0;
			text-align: right;
			font-size: 18px;
			padding: 15px;
    		box-sizing: border-box;
			font-weight: bold;
			background: rgba(255,255,255,0.7);
		}
		#admin_main .room_box div img{
			width:100%;
		}
		#admin_main .fas{
			position: absolute;
		    font-size: 120px;
		    color: white;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		}
	</style>
</head>
<body>
<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con" style="width:1024px">

	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <h1>객실 등록 리스트</h1>
			<c:forEach var="roomList" items="${listRoomMap.roomList}" > 
				<div class="room_wrap">
					<div class="room_box">
						<a href="${contextPath}/business/goods/viewNewGoodsRoom.do?goods_id=${roomList.goods_id}&goods_uroom=${roomList.goods_uroom}">
							<div>
								<img src="${contextPath}/room_download.do?goods_id=${roomList.goods_id}&goods_uroom=${roomList.goods_uroom}&fileName=${roomList.fileName}" alt="객실 이미지">
							</div>
							<div class="room_text">
								<h3>${roomList.goods_room_type}</h3>
								<div>숙박가격 : ${roomList.goods_room_price1}원</div>
								<c:if test="${goods.goods_type=='motel'}">
								<div>대실가격 : ${roomList.goods_room_price2}원</div>
								</c:if>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
				<div class="room_wrap">
					<a href="${contextPath}/business/goods/addNewGoodsRoomForm.do?goods_id=<%=goods_id%>">
						<div class="room_box" style="background:#eee; position:relative; background:rgba(52, 152, 219, 0.3);">
							<i class="fas fa-plus-circle"></i>
						</div>
					</a>
				</div>   
		</div>
		<div class="building_box">
			<div class="window"></div>
			<div class="door"></div>
			<div class="window"></div>
		</div>
	</div>
</div>
</body>
</html>
