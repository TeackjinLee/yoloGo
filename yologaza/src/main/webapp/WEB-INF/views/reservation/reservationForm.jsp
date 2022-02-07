<!-- 기여도 : 이택진100% -->
<!-- 2차기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
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
	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
%>
<%

	/*
		//*** 위변조 방지체크를 signature 생성 ***

			oid, price, timestamp 3개의 키와 값을

			key=value 형식으로 하여 '&'로 연결한 하여 SHA-256 Hash로 생성 된값

			ex) oid=INIpayTest_1432813606995&price=819000&timestamp=2012-02-01 09:19:04.004
				

			 * key기준 알파벳 정렬

			 * timestamp는 반드시 signature생성에 사용한 timestamp 값을 timestamp input에 그대로 사용하여야함
	*/

	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################

	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
	String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)					
	
	//인증
	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

	String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
	String price					= "100";													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
	//###############################################
	// 2.signature 생성
	//###############################################
	Map<String, String> signParam = new HashMap<String, String>();

	signParam.put("oid",		oid); 							// 필수
	signParam.put("price", price);							// 필수
	signParam.put("timestamp",	timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
	String signature = SignatureUtil.makeSignature(signParam);
	
	
	/* 기타 */
	String siteDomain = "http://localhost:8080/yologaza/reservation"; //가맹점 도메인 입력

	// 페이지 URL에서 고정된 부분을 적는다. 
	// Ex) returnURL이 http://127.0.0.1:8080INIpayStdSample/INIStdPayReturn.jsp 라면
	// http://127.0.0.1:8080/INIpayStdSample 까지만 기입한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 예약 페이지</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/orderGoodsForm.css">
    <style>
    	#pay .pay-box{
    		position:relative;
    	}
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
		#pay #next-button{
			position: absolute;
		    right: 0;
		    bottom: 0;
		    border-radius: 0;
		    width: 409.5px;
		}
		#pay .pay_user_information .terms__check__all{
			margin-top:45px;
		}
		#pay .pay_user_information .term input{
		  margin-top: 5px;
		  margin-right:10px;
		  float: left;
		  width: 20px;
		  height: 20px;
		}
		#pay .pay_user_information ul li{
		  margin-top: 10px;
		}
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
    	  const form = document.querySelector("#form__wrap");
    	  const checkAll = document.querySelector(".terms__check__all input");
    	  const checkBoxes = document.querySelectorAll(".input__check input");
    	  const submitButton = document.querySelector("#next-button");
    	  
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
	<div id="pay" class="wrap">
		<div class="pay-box con row">
		<form id="SendPayForm_id" name="" method="POST" >
		  <div class="pay_user_information cell">
		    
		    <div class="agree">
		        	
		           <div class="user_information_box">
				      <h3>예약자 정보</h3>
				      <div class="name">
				        <p>예약자 이름</p>
				        <div>
				        	<input type="text" id="buyername" name="buyername" value="${member.name}" placeholder="체크인시 필요한 정보입니다.">
				        </div>
				      </div>
				      <div class="mobileNo dot_line"> 
							<div class="fixed_join"> 
								<label for="phone">*휴대폰 번호</label> 
							</div> 
							<div> <p> <input id="phone" type="text" name="buyertel" value="${member.hp}" style="width:78%; margin-bottom:10px;" title="전화번호 입력" required/> 
								<input type="button" id="phoneChk" class="doubleChk" style="width:20%; float:right; cursor:pointer;" value="인증전송" />
								<input id="phone2" type="text" name="phone2" style="width:78%;" title="인증번호 입력" disabled required/> 
								<input type="button" id="phoneChk2" class="doubleChk" style="width:20%; float:right; cursor:pointer;" value="본인인증" />
								<div class="point successPhoneChk">&nbsp;&nbsp;&nbsp;휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</div> 
								<input type="hidden" id="phoneDoubleChk"/> </p> 
							</div> 
						</div>
						<div class="name">
							<p>예약자 이메일</p>
							<div>
								<c:choose>
							   		<c:when test="${member.email1 != null }">
							   			<input type="text"    name="buyeremail" value="${member.email1 }@${member.email2 }" >
							   		</c:when>
							   		<c:otherwise>
							   			<input type="text"    name="buyeremail" value="${member.email}" >
							   		</c:otherwise>
							   </c:choose>
								
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
						        <button>포인트 사용</button>
						    </div>
				    	</c:otherwise>
				    </c:choose> 
		     </div>
			<div class="terms__check__all term">
			  <input type="checkbox" name="checkAll" id="checkAll" />
			  <label for="checkAll"><h3>전체 동의</h3></label>
			</div>
			<ul class="terms__list term">
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
		        <c:set var="index" value="<%=date1 %>"/>
				<c:set var="index2" value="<%=date2 %>"/>
		        <c:choose>
		        	<c:when test="${index==index2}">
		        		<p>사용시간</p>
			        	<h4>${goods.goods_motel_usetime}시</h4>
		        	</c:when>
			        <c:when test="${index!=index2}">
			        	<p>체크아웃</p>
			        	<h4>${Ddate2} ${goods.goods_checkOut}시</h4>
			        </c:when>
		        </c:choose>
		      </div>
		      <div class="user_goods_cost">
		       <div class="text-box" >
		         <h3 style="float:left;">총 결제 금액</h3><p>(VAT포함)</p>
		         	<br>
		         	<c:set var="index" value="<%=goods_room_price2%>"/>
		         	
		         	<c:set var="index2" value="<%=goods_room_price1%>"/>
		         	<c:if test="${index == null}">
		         		<h1 style="color:darkred; border:none;">
		         			<fmt:formatNumber type="number" maxFractionDigits="0"  value="<%=goods_room_price1%>" />원
		         		</h1>
		         	</c:if>
		         	<c:if test="${index2 == null }">
		         		<h1 style="color:darkred;">
		         			<fmt:formatNumber type="number" maxFractionDigits="0"  value="<%=goods_room_price2%>" />원
		         		</h1>
		         	</c:if>
		         		      
		            <br>
		            <br>
		            <p>- 해당 객실가 세금, 봉사료가 포함된 금액입니다</p>
		            <br>
		            <p>- 결제완료 후 예약자 이름으로 바로 체크인 <br>&nbsp;&nbsp;하시면 됩니다</p>
		          </div>
		         </div>
		         <div class="pay_result">
					<input type="hidden"    name="goodname" value="${goods.goods_name }" >
					<input type="hidden"    name="logo_url" value="http://localhost:8080/yologaza/resources/image/89x18yolo_logo_c.png" >
					<input type="hidden"    name="logo_2nd" value="http://localhost:8080/yologaza/resources/image/64x13yolo_logo_w.png" >
					
					<input type="hidden"    name="price" value="<%=price%>" >
					<input type="hidden"  name="mid" value="<%=mid%>" ><!-- 에스크로테스트 : iniescrow0, 빌링(정기과금)테스트 : INIBillTst -->
					<input type="hidden"  name="gopaymethod" value="Card:DirectBank:VBank" >
					<input type="hidden"  name="mKey" value="<%=mKey%>" >
			        <input type="hidden"  name="signature" value="<%=signature%>" >
			        <input type="hidden"  name="oid" value="<%=oid%>" >
			        <input type="hidden"  name="timestamp" value="<%=timestamp %>" >
			        <input type="hidden"  name="version" value="1.0" >
			        <input type="hidden"  name="currency" value="WON" >
			        <input type="hidden"  name="acceptmethod" value="below1000:SKIN(#70ad47)" ><!-- 에스크로옵션 : useescrow, 빌링(정기과금)옵션 : BILLAUTH(Card) -->
			        <c:set var="index" value="<%=goods_room_price2%>"/>
		         	<c:if test="${index == null }">
		         		<input type="hidden"  name="returnUrl" value="http://localhost:8080/yologaza/reservation/INIStdPayReturn.do?goods_id=${goods.goods_id}&goods_uroom=<%=goods_uroom %>&goods_room_price1=<%=goods_room_price1%>&date1=${date1}&date2=${date2}" >
		         	</c:if>
		         	<c:set var="index2" value="<%=goods_room_price1%>"/>
		         	<c:if test="${index2 == null }">
		         		<input type="hidden"  name="returnUrl" value="http://localhost:8080/yologaza/reservation/INIStdPayReturn.do?goods_id=${goods.goods_id}&goods_uroom=<%=goods_uroom %>&goods_room_price2=<%=goods_room_price2%>&date1=${date1}&date2=${date2}" >
		         	</c:if>	
					
					<input type="hidden"  name="closeUrl" value="http://localhost:8080/yologaza/reservation/close.do" >
						
		           
		         </div>
		       </div>
		       
		     </div>
		     </form>
		     <button onclick="INIStdPay.pay('SendPayForm_id')" class="next-button" id="next-button" disabled>결제하기</button>
		</div>
	</div>
   
	
	<form class="checkbox_group" method="POST" id="form__wrap">
	   
	</form>
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