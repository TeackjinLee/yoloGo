<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLO가자! 어드민메인페이지</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con">
	    <div class="main_box wrap">
	      <div class="img_box cell">
	        <a href="${contextPath}/main.do">
	          <img src="${contextPath}/resources/image/admin_main_user.jpg" alt="user_main 이미지" style="width:100%;">
	          <div class="text-box"><h2>사용자 메인화면 이동 ></h2></div>
	        </a>
	      </div>
	      <div class="img_box cell">
	        <a href="${contextPath}/business_main.do">
	          <img src="${contextPath}/resources/image/admin_main_business.jpg" alt="business_main 이미지" style="width:100%;">
	          <div class="text-box"><h2>사업자 메인화면 이동 ></h2></div>
	        </a>
	      </div>
	    </div>
	    <div class="goodsRoom_sell">
	      <div class="text-box">
	        <h3><a href="#"> 상품 관리 > </a></h3>
	        <div class="sell_box">
	          <div><sapn> 0 <br>오늘</sapn></div>
	          <div><sapn> 0 <br>이번주</sapn></div>
	          <div><sapn> 0 <br>이번달</sapn></div>
	        </div>
	      </div>
	    </div>
	    
	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <h3>고객 문의 관리</h3>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>번호</b></td>
				<td ><b>아이디</b></td>
				<td><b>비밀번호</b></td>
				<td><b>이름</b></td>
				<td><b>연락쳐</b></td>
				<td><b>이메일</b></td>
				<td><b>권한</b></td>
				<td><b>가입일</b></td>
				<td><b>삭제</b></td>
	          </tr>
	   
	          <c:forEach var="member" items="${membersList}" >     
	            <tr align="center" class="data">
	              <td>${member.uid}</td>
			      <td>${member.id}</td>
			      <td>${member.pwd}</td>
			      <td>${member.name}</td>
			      <td>${member.hp}</td>
			      <td>${member.email1}@${member.email2}</td>
			      <td>${member.auth}</td>
			      <td>${member.joinDate}</td>
			      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
	            </tr>
	          </c:forEach>   
	        </table>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>