<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>비지니스헤더</title>
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
	<style>
		#business_header .sub-menu-box ul li:hover{
			color:rgb(52, 152, 219);
			font-weight:bold;
		}
	</style>
</head>
<body>
	<div class="wrap main_wrap show">
	  <!-- Header -->
	  <header>
	    <div id="head_link" class="con">
	      <ul class = row>
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class = cell-r><a href="${contextPath}/business/goods/listGoods.do">객실 관리</a></li>
	        		<li class = cell-r><a href="${contextPath}/businessMember/logout.do">로그아웃</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/businessMember/memberForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/businessMember/business_loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
	    </div>
	    <section id="business_header" style="background-color:rgb(52, 152, 219)">
	      <div class="menu con">
	        <div id = "logo"><a href="${contextPath}/business_main.do"><img src="${contextPath}/resources/image/yolo-logo-w.png" alt="YOLO가자로고"></a></div>
	        <div class="menu-bar row">
		        
	          <ul class="gnb-list row cell">
	            <li class="cell">
	              <div>숙박 관리</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/business/goods/addNewGoodsForm.do">숙소등록</a></li>
	                  <li><a href="#">이용규칙 관리</a></li>
	                  <li><a href="${contextPath}/business/goods/listGoods.do">객실 관리</a></li>
	                  <li><a href="${contextPath}/business/goods/reviewManagement.do">리뷰 관리</a></li>
	                </ul>
	              </div>  
	             </li>
	            <li class="cell">
	              <div>예약관리</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/business/goods/reservationCheck.do">예약 조회</a></li>
	                  <li><a href="${contextPath}/business/goods/reservationHistory.do">예약 취소 내역</a></li>
	                  <li><a href="${contextPath}/business/goods/calHistory.do">정산 내역</a></li>
	                  <li><a href="${contextPath}/business/goods/salesHistory.do">매출 내역</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	              <a>고객센터</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/business_announceList.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/business_frequentList.do">자주묻는 질문</a></li>
	                </ul>
	              </div>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </section>
	  </header>
	</div>
</body>
</html>