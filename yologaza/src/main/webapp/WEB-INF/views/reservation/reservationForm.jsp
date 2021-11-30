<!-- 기여도 : 이택진100%-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 예약 페이지</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/orderGoodsForm.css">
    <script src="${contextPath}/resources/js/orderGoodsForm.js"></script>
</head>
<body>
	<div id="pay" class="wrap">
		<div class="pay-box con row">
		  <div class="pay_user_information cell">
		    <div class="user_information_box">
		      <h3>예약자 정보</h3>
		      <div class="name">
		        <p>예약자 이름</p>
		        <div><input type="text" name="name" placeholder="체크인시 필요한 정보입니다."></div>
		      </div>
		      <div class="num">
		        <p>휴대폰 번호</p>
		        <div><input type="text" name="phone" placeholder="체크인시 필요한 정보입니다.">
		          <button>인증번호 전송</button>
		        </div>
		        <p style="color:darkred;">휴대폰 번호를 확인해 주세요.</p>
		      </div>
		      <div class="num_certify" style="margin-top:10px;">
		        <p>휴대폰 번호</p>
		        <div><input type="text" name="phone">
		          <button>인증번호 확인</button>
		        </div>
		      </div>
		    </div>
		    <a class="login_event" href="${contextPath}/member/loginForm.do"><div class="login-box"><img src="https://image.goodchoice.kr/images/web_v3/bg_login_m.png" alt="로그인후 이벤트 적용 이미지"><p>로그인 후 쿠폰 적립/적용 가능 합니다.<br>- 로그인하러가기 -</p></div></a>
		    <div class="pay_select">
		      <h3>결제수단 선택</h3>
		      <select id="payment-select" class="select_type_1">
		        <option value="KAKAO"> 카카오페이</option>
		        <option value="TOSS"> 토스</option>
		        <option value="CARD"> 신용/체크카드</option>
		      </select>
		    </div>
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
		     </div>
		  </div>
		  <div class="pay_payment cell">
		    <div class="payment_information">
		      <div class="user_goods_information">
		        <p>숙소이름</p>
		        <h3>숙소 이름 정보</h3>
		        <br>
		        <p>객실타입/기간</p>
		        <h3>객실타입 기간 적용</h3>
		        <br>
		        <br>
		        <p>체크인</p>
		        <h4>00.00 요일 00:00</h4>
		        <br>
		        <p>체크아웃</p>
		        <h4>00.00 요일 00:00</h4>
		      </div>
		      <div class="user_goods_cost">
		       <div class="text-box">
		         <h3 style="float:left;">총 결제 금액</h3><p>(VAT포함)</p>
		         <br>
		         <h1 style="color:darkred;">00,000원</h1>
		            <br>
		            <br>
		            <p>- 해당 객실가 세금, 봉사료가 포함된 금액입니다</p>
		            <br>
		            <p>- 결제완료 후 예약자 이름으로 바로 체크인 <br>&nbsp;&nbsp;하시면 됩니다</p>
		          </div>
		         </div>
		         <div class="pay_result">
		           <button type="submit" class="next-button" disabled>결제하기</button>
		         </div>
		       </div>
		     </div>
		   </div>
		</div>
</body>
</html>