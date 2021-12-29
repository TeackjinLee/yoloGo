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
	      <button type="button" onclick="location.href='#' "><h3>숙소 등록하기 ></h3> </button>
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
	          <div><sapn> 0 <br>오늘</sapn></div>
	          <div><sapn> 0 <br>이번주</sapn></div>
	          <div><sapn> 0 <br>이번달</sapn></div>
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
	            <td><b>취소 하기</b></td>
	          </tr>
	   
	          <c:forEach var="member" items="${membersList}" >     
	            <tr align="center" class="data">
	              <td>$</td>
	              <td>$</td>
	              <td>$</td>
	              <td>$</td>
	              <td>$</td>
	              <td>$</td>
	              <td><a href="${contextPath}/member/removeMember.do?id=${member.id}">취소 하기</a></td>
	            </tr>
	          </c:forEach>   
	        </table>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>