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
<title>어드민헤더</title>
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="wrap main_wrap show">
	  <!-- Header -->
	  <header>
	    <div id="head_link" class="con">
	      <ul class = row>
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class = cell-r><a href="#">마이페이지</a></li>
	        		<li class = cell-r><a href="${contextPath}/adminMember/logout.do">로그아웃</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/adminMember/memberForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/adminMember/admin_loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
	    </div>
	    <section id="admin_header" style="background-color:rgb(192, 57, 43)">
	      <div class="menu con">
	        <div id = "logo"><a href="${contextPath}/admin_main.do"><img src="${contextPath}/resources/image/yolo-logo-w.png" alt="YOLO가자로고"></a></div>
	        <div class="menu-bar row">
		        
	          <ul class="gnb-list row cell">
	            <li class="cell">
	              <div>숙박 관리</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="#">검수 관리 조회</a></li>
	                  <li><a href="#">전체 숙소 목록</a></li>
	                  <li><a href="#">쿠폰 관리</a></li>
	                </ul>
	              </div>  
	             </li>
	            <li class="cell">
	              <div>고객 및 문의 관리</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="#">전체 회원 목록</a></li>
	                  <li><a href="#">탈퇴 회원 목록</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	              <a>고객센터</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/admin_announceList.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/admin_frequentList.do">자주묻는 질문</a></li>
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