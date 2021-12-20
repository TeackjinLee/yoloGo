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
	<form  class="join_inner_float" action="/member/pwdUpdate" method="GET" id="pwdUpdateForm" name="pwdUpdateForm">
      <div class="input_line">
        <h1 class="join_minisub">비밀번호찾기</h1>
      </div>
      <table>
    
      <tbody>
      	 <input type="text" id="id" name="id" value="${member.memberId}">
        <tr>
          <td> 비밀번호 </td>
          <td> <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요"></td>
        </tr>
        <tr>
          <td> 비밀번호 재입력 </td>
          <td> <input type="password" id="pwd2" placeholder="비밀번호를 재입력하세요"></td>
        </tr>
        </tbody>
      </table>
      <button type="button" id="pwdUpdate" name="pwdUpdate" class="btn btn-primary">비밀번호 변경</button>
      <button type="button" onclick="location.href='${contextPath}/member/loginForm.do' ">회원로그인</button>
    </form>
    
    <form method="post" autocomplete="off">
 	
 	<div>
 		<label for="id">아이디</label>
 		<input type="text" id="id" name="id" value="${member.id}" readonly/>
 	</div>
 	
 	<div>
 		<label for="password">새 비밀번호</label>
 		<input type="password" id="password" name="password" />
 	</div>
 	
 	<div>
 		<button type="submit">회원정보 수정</button>
 	</div>
 	
</form>

	<div>
		<button onclick ="location.href='/'">처음</button>
	</div>
</body>
</html>