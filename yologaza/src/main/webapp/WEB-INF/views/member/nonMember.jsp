<!-- 기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
	<form  class="join_inner_float">
	  <div class="input_line">
	    <h1 class="join_minisub">비회원 예약 조회</h1>
	  </div>
	  <table>
	  <tbody>
	    <tr>
	      <td> 아이디 </td>
	      <td> <input type="text" name="name" placeholder="예약자 이름을 입력해 주세요."></td>
	    </tr>
	    <tr class="dot_line">
	      <td class="fixed_join">휴대폰 번호</td>
	      <td>
	        <input type="text" name="hp" style="width:70%; margin-bottom:10px;"/>
	        <input type="button"  id="hp" value="인증 전송" onClick="" style="width:28%; float:right; cursor:pointer;"/>
	        <input type="text" name="hpA" style="width:70%;"/>
	        <input type="button"  id="hpA" value="인증 확인" onClick="" style="width:28%; float:right; cursor:pointer;"/>
	      </td>
	    </tr>
	    </tbody>
	  </table>
	  <button type="button" onclick="location.href='${contextPath}/mypage/Mypage3.do' ">예약 확인하기</button>
	</form>
</body>
</html>