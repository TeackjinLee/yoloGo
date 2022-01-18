<!-- 기여도: 이택진70% / 윤진30% -->
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
<meta charset="utf-8">
	<title> 회원가입 | 약관동의 </title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/orderGoodsForm.css">
    <script src="${contextPath}/resources/js/orderGoodsForm.js"></script>
	<script type="text/javascript">
  </script>
  <style>
  	#pay input{
  		height: 20px;
	    border: 1px solid #d8d8d8;
	    border-radius: 5px;
	    width: 20px;
	    padding: 5px;
	    box-sizing: border-box;
	    font-size: 18px;
	    color: #777;
	    float: left;
	    margin-top: 7px;
  	}
  </style>
  <script type="text/javascript">
    $(document).ready(function(){
    	  const form = document.querySelector("#form__wrap");
    	  const checkAll = document.querySelector(".terms__check__all input");
    	  const checkBoxes = document.querySelectorAll(".input__check input");
    	  const submitButton = document.querySelector(".next-button");
    	  
    	  const agreements = {
    	    goodsRefundAgree: false,
    	    privacyPolicy: false,
    	    serviceAgree: false,
    	    ageAgree: false
    	  };
    	  
    	  form.addEventListener("submit", (e) => e.preventDefault());

    	checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

    	function toggleCheckbox(e) {
    	  const { checked, id } = e.target;
    	  agreements[id] = checked;
    	  this.parentNode.classList.toggle("active");
    	  checkAllStatus();
    	  toggleSubmitButton();
    	}

    	function checkAllStatus() {
    	  const { goodsRefundAgree, privacyPolicy, serviceAgree, ageAgree } = agreements;
    	  if (goodsRefundAgree && privacyPolicy && serviceAgree && ageAgree) {
    	    checkAll.checked = true;
    	  } else {
    	    checkAll.checked = false;
    	  }
    	}

    	function toggleSubmitButton() {
    	  const { goodsRefundAgree, privacyPolicy, serviceAgree, ageAgree } = agreements;
    	  if (goodsRefundAgree && privacyPolicy && serviceAgree && ageAgree) {
    	    submitButton.disabled = false;
    	  } else {
    	    submitButton.disabled = true;
    	  }
    	}

    	checkAll.addEventListener("click", (e) => {
    	  const { checked } = e.target;
    	  if (checked) {
    	    checkBoxes.forEach((item) => {
    	      item.checked = true;
    	      agreements[item.id] = true;
    	      item.parentNode.classList.add("active");
    	    });
    	  } else {
    	    checkBoxes.forEach((item) => {
    	      item.checked = false;
    	      agreements[item.id] = false;
    	      item.parentNode.classList.remove("active");
    	    });
    	  }
    	  toggleSubmitButton();
    	});
    	  
    	});
    </script>
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<div id="pay" class="wrap">
		<div class="pay-box con row" style="display:block;
											border: 5px solid #ddd;
											border-radius: 10px;
											text-align: center;
											width: 450px;
											height: auto;
											background-color: white;
											margin: auto;
											margin-bottom: 150px;
											padding: 20px;
											box-sizing: border-box;">
		  <div class="input_line">
		    <h1 class="join_minisub">약관 동의</h1>
		  </div>
		  <div class="pay_user_information" style="width:100%; text-align: left;">
		    <div class="agree">
		         <form class="checkbox_group" action="/" method="POST" id="form__wrap">
		           <div class="terms__check__all">
		             <input type="checkbox" name="checkAll" id="checkAll" />
		             <label for="checkAll"><h3>전체 동의</h3></label>
		           </div>
		           <ul class="terms__list">
		             <li class="terms__box">
		               <div class="input__check">
		                 <input
		                        type="checkbox"
		                        name="agreement"
		                        id="goodsRefundAgree"
		                        value="goodsRefundAgree"
		                        required/>
		                 <label for="goodsRefundAgree" class="required"><a href="#">숙소이용규칙 및 취소/환불규정 동의<span>(필수)</span></a></label>
		               </div>
		             </li>
		             <li class="terms__box">
		               <div class="input__check">
		                 <input
		                        type="checkbox"
		                        name="agreement"
		                        id="privacyPolicy"
		                        value="privacyPolicy"
		                        required/>
		                 <label for="privacyPolicy" class="required"><a href="#">개인정보 처리방침 동의<span>(필수)</span></a></label>
		               </div>
		             </li>
		             <li class="terms__box">
		               <div class="input__check">
		                 <input
		                        type="checkbox"
		                        name="agreement"
		                        id="serviceAgree"
		                        value="serviceAgree"/>
		                 <label for="serviceAgree"><a href="#">서비스 이용약관 동의<span>(필수)</span></a></label>
		               </div>
		             </li>
		             <li class="terms__box">
		               <div class="input__check">
		                 <input
		                        type="checkbox"
		                        name="agreement"
		                        id="ageAgree"
		                        value="ageAgree"/>
		                 <label for="ageAgree"><a href="#">만 14세 이상 확인<span>(필수)</span></a></label>
		               </div>
		             </li>
		           </ul>
		           
		        </form>
		        <div class="pay_payment cell" style="margin-left: 10px; background:none; width:100%;">
					  <div class="payment_information">
					       <div class="pay_result">
					         <button type="submit" onclick="location.href='${contextPath}/member/joinForm.do' " class="next-button" style="border-radius: 5px; height:50px; margin-top:30px; width:100%;" disabled>동의하기</button>
					       </div>
					   </div>
					</div>
		     </div>
		  	</div>
		   </div>
		</div>
</body>
</html>