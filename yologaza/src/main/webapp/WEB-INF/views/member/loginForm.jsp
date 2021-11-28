<!-- 기여도: 이택진10% / 윤진90% -->
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
	
	<c:choose>
		<c:when test="${result=='loginFailed' }">
		  <script>
		    window.onload=function(){
		      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
		    }
		  </script>
		</c:when>
	</c:choose>
	<link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
</head>

<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form id="frmLogin" name="frmLogin" method="post"  action="${contextPath}/member/login.do">
	  <h3>회원로그인</h3><br>
	    <button type="button" id="kakao-login-btn" class="btn_start-btn_kakao" data-device-type="w">
	      <span>
	        <img class="icon-ic_login_kakao" src="${contextPath}/resources/image/ico-kakao.svg" alt="카카오 로고">
	        <p>카카오톡 로그인</p> 
	      </span>
	    </button>
	    <button type="button" id="facebook-login-btn" class="btn_start-btn_fb">
	      <span>
	        <img class="icon-ic_login_facebook" src="${contextPath}/resources/image/ico-facebook.svg" alt="페이스북 로고">
	        <p>페이스북 로그인</p> 
	      </span>
	    </button>
	    <button type="button" id="naver-login-btn" class="btn_start-btn_naver">
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
	    <a href="${contextPath}/member/idFindForm.do">아이디찾기</a>
	    |
	    <a href="${contextPath}/member/pwdFindForm.do">비밀번호찾기</a><br><br>
	</form>
</body>
</html>
