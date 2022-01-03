<!-- 기여도: 이택진20% / 윤진80% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인창</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
	<style>
		#frmLogin{
			height:310px;
		}
	</style>	
	
	<c:choose>
		<c:when test="${result=='loginFailed' }">
		  <script>
		    window.onload=function(){
		      swal ( "Oops" ,  "올바른 아이디와 비밀번호를 입력해주세요!" ,  "error" );
		    }
		  </script>
		</c:when>
		<c:when test="${result=='idFailed' }">
		  <script>
		    window.onload=function(){
		      swal ( "Oops" ,  "아이디를 입력해 주세요!" ,  "error" );
		    }
		  </script>
		</c:when>
		<c:when test="${result=='AuthFailed' }">
		  <script>
		    window.onload=function(){
		      swal ( "Oops" ,  "관리자 권한등급이 아닙니다.!" ,  "error" );
		    }
		  </script>
		</c:when>
		<c:when test="${result=='PwdFailed' }">
		  <script>
		    window.onload=function(){
		      swal ( "Oops" ,  "비밀번호를 입력해 주세요!" ,  "error" );
		    }
		  </script>
		</c:when>
		
	</c:choose>
	
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-hosthouse.png" alt="yolo가자 관리자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form id="frmLogin" name="frmLogin" method="post"  action="${contextPath}/admin/member/login.do">
	  <h1>관리자 로그인</h1><br>
	    <input type="text" name="id" placeholder="아이디를 입력하세요"><br>
	    <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"><br>
	    <button type="submit"> 로그인</button><br>
	
	    <a href="${contextPath}/admin/member/findIdView">아이디찾기</a>
	    |
	    <a href="${contextPath}/admin/member/findPwView">비밀번호찾기</a><br>
	</form>
</body>
</html>
