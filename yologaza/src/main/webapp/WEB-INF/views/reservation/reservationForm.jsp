<!-- 기여도 : 이택진100%-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="RoomList"  value="${goodsMap.RoomList}"  />
<c:set var="imageList"  value="${goodsMap.imageListRoom }"  />
<%
	request.setCharacterEncoding("UTF-8");
	String goods_uroom = request.getParameter("goods_uroom");
	String goods_room_price1 = request.getParameter("goods_room_price1");
	String goods_room_price2 = request.getParameter("goods_room_price2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 예약 페이지</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/orderGoodsForm.css">
    <script src="${contextPath}/resources/js/orderGoodsForm.js"></script>
    <style>
    	#tab1 .fa-shopping-cart:before {
		    content: "\f004";
		}
		#tab1 .fas {
		    font-weight: 100;
		}
		#tab1 .fa-shopping-cart:hover {
		    color:rgb(192, 57, 43);
		    transition:1s;
		}
		#tab1 .fas:hover {
		    font-weight: 900;
		}
		#pay .agree .checkbox_group .user_information_box .mobileNo div p input{
			height:50px;
		}
    </style>
</head>
<body>

	<div id="pay" class="wrap">
		<div class="pay-box con row">
		  <div class="pay_user_information cell">
		    
		    <div class="agree">
		         <form class="checkbox_group" action="${contextPath}/main.do" method="POST" id="form__wrap">
		           <div class="user_information_box">
				      <h3>예약자 정보</h3>
				      <div class="name">
				        <p>예약자 이름</p>
				        <div>
				        	<input type="text" name="name" value="${member.name}" placeholder="체크인시 필요한 정보입니다.">
				        </div>
				      </div>
				      <div class="mobileNo dot_line"> 
							<div class="fixed_join"> 
								<label for="phone">*휴대폰 번호</label> 
							</div> 
							<div> <p> <input id="phone" type="text" name="hp" style="width:78%; margin-bottom:10px;" title="전화번호 입력" required/> 
								<input type="button" id="phoneChk" class="doubleChk" style="width:20%; float:right; cursor:pointer;" value="인증전송" />
								<input id="phone2" type="text" name="phone2" style="width:78%;" title="인증번호 입력" disabled required/> 
								<input type="button" id="phoneChk2" class="doubleChk" style="width:20%; float:right; cursor:pointer;" value="본인인증" />
								<div class="point successPhoneChk">&nbsp;&nbsp;&nbsp;휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</div> 
								<input type="hidden" id="phoneDoubleChk"/> </p> 
							</div> 
						</div>
						
				    </div>
				    <c:choose>
				    	<c:when test="${member.id == null || member.id == ''}">
				    		<a class="login_event" href="${contextPath}/member/loginForm.do">
						    	<div class="login-box"><img src="https://image.goodchoice.kr/images/web_v3/bg_login_m.png" alt="로그인후 이벤트 적용 이미지">
						    		<p>로그인 후 쿠폰 적립/적용 가능 합니다.<br>- 로그인하러가기 -</p>
						    	</div>
						    </a>
				    	</c:when>
				    	<c:otherwise>
				    		<div class="name" style="margin-top:10px;">
						        <p>할인 선택</p>
						        <div>
						        	<input type="text" id="member_point" name="member_point" value="" placeholder="포인트 적용" style="width:100%; height:50px;"	/>
						        </div>
						      </div>
				    	</c:otherwise>
				    </c:choose>
				    <div class="pay_select">
				      <h3>결제수단 선택</h3>
				      <select id="payment-select" class="select_type_1">
				        <option value="KAKAO"> 카카오페이</option>
				        <option value="TOSS"> 토스</option>
				        <option value="CARD"> 신용/체크카드</option>
				      </select>
				    </div>
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
		        <h3>${goods.goods_name}</h3>
		        <br>
		        <p>객실타입/기간</p>
		        <h3>
		        <c:set var="index" value="${date2-date1-1}"/>
					<c:if test="${index != 0}">
						<fmt:formatNumber type="number" maxFractionDigits="0"  value="${(date2-date1-1)/86400}" />박	
			        	<fmt:formatNumber type="number" maxFractionDigits="0"  value="${((date2-date1-1)/86400+1)}" />일
					</c:if>
		        	<c:if test="${index == 0}">
						1박2일
					</c:if>
		        </h3>
		        <br>
		        <br>
		        <p>체크인</p>
		        <h4>${Ddate1} ${goods.goods_checkIn}시</h4>
		        <br>
		        <p>체크아웃</p>
		        <h4>${Ddate2} ${goods.goods_checkOut}시</h4>
		      </div>
		      <div class="user_goods_cost">
		       <div class="text-box">
		         <h3 style="float:left;">총 결제 금액</h3><p>(VAT포함)</p>
		         	<br>
		         	<c:set var="index" value="<%=goods_room_price2%>"/>
		         	<c:if test="${index == null }">
		         		<h1 style="color:darkred;"><%=goods_room_price1%>원</h1>
		         		
		         	</c:if>
		         	<c:set var="index2" value="<%=goods_room_price1%>"/>
		         	<c:if test="${index2 == null }">
		         		<h1 style="color:darkred;"><%=goods_room_price2%>원</h1>
		         	</c:if>		      
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
	<script>
	
			//휴대폰 번호 인증
			var code2 = ""; 
			$("#phoneChk").click(function(){ 
				alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
				var phone = $("#phone").val(); 
				$.ajax({ 
					type:"GET", 
					url:"phoneCheck?phone=" + phone, 
					cache : false, 
					success:function(data){ 
						if(data == "error"){ 
							alert("휴대폰 번호가 올바르지 않습니다.") 
							$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
							$(".successPhoneChk").css("color","red"); 
							$("#phone").attr("autofocus",true); 
						}else{ $("#phone2").attr("disabled",false); 
							$("#phoneChk2").css("display","inline-block"); 
							$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
							$(".successPhoneChk").css("color","green"); 
							$("#phone").attr("readonly",true); code2 = data; 
						} 
					} 
				}); 
			});
	
	</script>
	<script>
			
			//휴대폰 인증번호 대조
			$("#phoneChk2").click(function(){ 
				if($("#phone2").val() == code2 && $("#phone2").val() != ""){ 
					$(".successPhoneChk").text("인증번호가 일치합니다."); 
					$(".successPhoneChk").css("color","green"); 
					$("#phoneDoubleChk").val("true"); 
					$("#phone2").attr("disabled",true); 
				}else{ 
					$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
					$(".successPhoneChk").css("color","red"); 
					$("#phoneDoubleChk").val("false"); 
					$(this).attr("autofocus",true); 
				} 
			});
	
	</script>
</body>
</html>