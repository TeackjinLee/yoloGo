<!-- 기여도: 이택진20% / 윤진80% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인창</title>	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		<c:when test="${result=='PwdFailed' }">
		  <script>
		    window.onload=function(){
		      swal ( "Oops" ,  "비밀번호를 입력해 주세요!" ,  "error" );
		    }
		  </script>
		</c:when>
	</c:choose>
	<link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
</head>

<body>
	
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form id="frmLogin" name="frmLogin" method="post"  action="${contextPath}/member/login.do">
	  <h1>회원로그인</h1><br>
	    <button type="button" id="kakao-login-btn" class="btn_start-btn_kakao" data-device-type="w" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=53670056b11ef5a86e82087f6eccf7d9&redirect_uri=http://localhost:8080/yologaza/member/kakaologin&response_type=code'">
	      <span>
	        <img class="icon-ic_login_kakao" src="${contextPath}/resources/image/ico-kakao.svg" alt="카카오 로고">
	        <p>카카오톡 로그인</p> 
	      </span>
	    </button>
	    <button type="button" id="naver-login-btn" class="btn_start-btn_naver" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Ea7fGahGOcYi0aNmhl8j&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fyologaza%2Fcallback&state=1a6a7a74-ac3a-4b8b-b81e-6458f177631d'">
	      <span>
	        <img class="icon-ic_login_naver" src="${contextPath}/resources/image/ico-naver.svg" alt="네이버 로고">
	        <p>네이버 로그인</p> 
	      </span>
	    </button>
	
	    <input type="text" name="id" placeholder="아이디를 입력하세요"><br>
	    <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"><br>
	    <button type="submit"> 로그인</button><br>
	
	    <a href="${contextPath}/member/agreeForm.do">회원가입</a>
	    |
	    <a href="${contextPath}/member/findIdView">아이디찾기</a>
	    |
	    <a href="${contextPath}/member/findPwView">비밀번호찾기</a><br>
	    <a href="${contextPath}/member/nonMemberForm.do">비회원 예약 내역 조회</a>
	</form>
</body>
</html>
