<!-- 기여도: 이택진30% / 윤진70% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
 request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js" type="text/javascript"></script>
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
	<form  class="join_inner_float">
      <div class="input_line">
        <h1 class="join_minisub">비밀번호 변경 완료</h1>
      </div>
      <button type="button" onclick="location.href='${contextPath}/main.do' ">메인화면으로 가기</button>
      <button type="button" onclick="location.href='${contextPath}/member/loginForm.do' ">회원로그인</button>
    </form>
</body>
</html>