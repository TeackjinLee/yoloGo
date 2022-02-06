<!-- 기여도: 이택진30% / 윤진70% -->
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
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
	<style>
		.join_inner_float
		{
		  border: 5px solid #ddd;
		  border-radius: 10px;
		  text-align: center;
		  width: 330px;
		  height: auto;
		  background-color: white;
		  margin: auto;
		  margin-bottom: 150px;
		  padding: 20px;
		  box-sizing: border-box;
		}
		.join_inner_float table{
		  width: 100%;
		}
		.join_inner_float .input_line h1{
		  margin-top:0;
		}
		.join_inner_float .input_line .check_line{
		  margin-bottom: 10px;
		  text-align: left;
		}
		.join_inner_float tr td{
		  display: block;
		  text-align: left;
		  width: 100%;
		}
		.join_inner_float tr td input{
		  height: 30px;
		  border: 1px solid #d8d8d8;
		  border-radius: 5px;
		  width: 100%;
		  box-sizing: border-box;
		}
		.join_inner_float button{
		  margin-top:30px;
		}
	</style>
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form class="join_inner_float" method="POST">
		<div class="input_line">
			<h1 class="join_minisub">아이디찾기</h1>
		</div>
		<br>
		<ul style="padding-left:0;">
			<c:forEach items="${member}" var="member">
				<li><h3> ${member.id} </h3></li>
			</c:forEach>
		</ul>
		<h3> 입니다. </h3>
		<button type="button" onclick="location.href='${contextPath}/member/findPwView' ">비밀번호찾기</button>
		<button type="button" onclick="location.href='${contextPath}/member/loginForm.do' ">회원로그인</button>
		</br>
	</form>
</body>
</html>