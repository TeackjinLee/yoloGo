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
<meta charset="utf-8">
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<title> 회원가입 | 약관동의 </title>
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
		.join_inner_float .input_line h1{
		  margin-top:0;
		}
		.join_inner_float .input_line .check_line{
		  margin-bottom: 10px;
		  text-align: left;
		}
		.input_line button{
		  background-color:rgb(112, 173, 71);;
		  color: white;
		  width: 170px;
		  height: 30px;
		  border-radius: 5px;
		  box-sizing: border-box;
		  margin-bottom: 10px;
		  font-weight: bold;
		  border-width: 1px;
		  margin-bottom: 0px;
		}
		.input_line .button{
			background-color: rgb(112, 173, 71);
			color: white;
			width: 170px;
			height: 30px;
			border-radius: 5px;
			box-sizing: border-box;
			font-weight: bold;
			border-width: 1px;
			text-align: center;
			padding: 5px;
			cursor: pointer;
			margin: 0 auto;
		}
		.input_line .button a{
			padding: 0 40%;
    		box-sizing: border-box;
		}
		.in_label_viewmore{
			color:darkred;
			border-bottom: 1px solid darkred;
			box-sizing: border-box;
		}
	</style>
	<script type="text/javascript">
  $(document).on("click", "#allCheck", function(e) {
    if ($(this).is(":checked")) {
      $(":checkbox.check").prop("checked", true);
    } else {
      $(":checkbox.check").removeAttr("checked");
    }
  });

  $(document).on("click", ":checkbox.check", function(e) {
    var length = $(":checkbox.check").length;
    var checkLen = $(":checkbox.check:checked").length;
    if (length == checkLen) {
      $(":checkbox#allCheck").prop("checked", true);
    } else {
      $("#allCheck").removeAttr("checked");
    }
  });
  </script>
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<div class="join_inner_float">
	   <div class="input_line">
	     <h1 class="join_minisub">약관동의</h1>
	   </div>
	    <div class="input_line">
	      <div class="check_line check_all">
	        <input name="chkAll" type="checkbox" id="allCheck" class="fakebox" />
	        <label for="allCheck" class="">전체동의</label><br>
	      </div>
	      <div class="check_line">
	        <input type="checkbox" name="check_01" id="check_01" class="fakebox check">
	        <label for="check_01" class="labelbox">
	          만 14세 이상 동의
	          <a href="" class="in_label_viewmore"> 보기 <i class="fas fa-chevron-right"></i></a>
	        </label>
	      </div>
	      <div class="check_line">
	        <input type="checkbox" id="check_02" class="fakebox check">
	        <label for="check_02" class="labelbox">
	          이용동의
	          <a href="" class="in_label_viewmore"> 보기 <i class="fas fa-chevron-right"></i></a>
	        </label>
	      </div>
	      <div class="check_line">
	        <input type="checkbox" id="check_03" class="fakebox check">
	        <label for="check_03" class="labelbox">
	          개인정보 수집 및 이용안내
	          <a href="" class="in_label_viewmore"> 보기 <i class="fas fa-chevron-right"></i></a>
	        </label>
	      </div><br>
	    <div class="input_line">
	      <div class="button"><a href="${contextPath}/member/memberForm.do">다음</a></div>
	    </div>
	  </div>
	</div>
  
</body>
</html>