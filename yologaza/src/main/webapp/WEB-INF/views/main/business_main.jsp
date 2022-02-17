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
<style>
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
  background:rgb(52, 152, 219);
  color:#fff;
}
</style>
<meta charset="UTF-8">
<title>YOLO가자! 비지니스메인페이지</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/business_main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="business_main_wrap">
	  <div class="business_main_box con">
	    <div class="goods_register">
	      <div class="text-box">
	        <h3>숙소관리 메뉴에서 객실을 등록해 주세요.</h3>
	      </div>
	      <button type="button" onclick="location.href='${contextPath}/business/goods/addNewGoodsForm.do' "><h3>숙소 등록하기 ></h3> </button>
	    </div>
	    <div class="main_box">
	      <div class="img_box">
	        <a href="${contextPath}/main.do">
	          <img src="${contextPath}/resources/image/business_trip.jpg" alt="user_main 이미지" style="width:100%;">
	        </a>
	      </div>
	      <div class="text-box" style="position: absolute;bottom: 20px;right: 20px;color: black;"><h2>사용자 메인화면 이동 ></h2></div>
	    </div>
	    <div class="goodsRoom_sell">
	      <div class="text-box">
	        <h3>예약 객실 판매 ></h3>
	        <div class="sell_box">
	          <div><sapn> ${pagination.totalCount} <br>오늘</sapn></div>
	          <c:forEach var="rsvCount" items="${selectReservationCount}">
	          	<div><sapn> ${rsvCount.businessWeek} <br>이번주</sapn></div>
	          	<div><sapn> ${rsvCount.businessMonth}<br>이번달</sapn></div>
	          </c:forEach>
	        </div>
	      </div>
	    </div>
	    <div class="guestInformation">
	      <div class="guestInformation_box">
	        <h3>입실 예정 고객 정보</h3>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>예약 번호</b></td>
	            <td ><b>객실명</b></td>
	            <td><b>예약자</b></td>
	            <td><b>전화번호</b></td>
	            <td><b>예약 시간</b></td>
	            <td><b>예약 확인</b></td>
	          </tr>
	   
	          <c:forEach var="r" items="${selectReservationBusinessMain}" >     
	            <tr align="center" class="data">
	              <td>${r.rid}</td>
	              <td>${r.goods_name}&nbsp${r.goods_room_type}</td>
	              <td>${r.name}</td>
	              <td>${r.hp}</td>
	              <td>${r.checkIn}</td>
	              <td>${r.reservationType}</td>
	            </tr>
	          </c:forEach>   
	        </table>
	      </div>
	            <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/business/goods/reservationCheck.do?date1=${date1}&date2=${date2}&pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/business/goods/reservationCheck.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/business/goods/reservationCheck.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/business/goods/reservationCheck.do?date1=${date1}&date2=${date2}&pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
	    </div>
	  </div>
	</div>
</body>
</html>