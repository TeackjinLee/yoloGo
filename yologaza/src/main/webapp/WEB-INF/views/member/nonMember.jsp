<!-- 기여도: 이택진100% -->
<!-- 2차기여도: 이택진100% -->
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
<script>
$(function(){

    //------- 회원가입 입력란
    $( "form" ).submit(function( event ) {
        var uname = $('#name');
        var uhp = $('#hp');
        var uphoneDoubleChk = $('#phoneDoubleChk');
        
        //이름
        if($('#name').val()==""){
        	swal ( "Oops" ,  "이름을 입력하여 주시기 바랍니다." ,  "error" );
            uname.removeClass("has-success");
            uname.addClass("has-error");
            $('#name').focus();
            return false;
        }else{
        	uname.removeClass("has-error");
        	uname.addClass("has-success");
        }
        
        //휴대폰 번호
        if($('#hp').val()==""){
        	swal ( "Oops" ,  "휴대폰 번호를 입력하여 주시기 바랍니다." ,  "error" );
            uhp.removeClass("has-success");
            uhp.addClass("has-error");
            $('#phone').focus();
            return false;
        }else{
        	uhp.removeClass("has-error");
        	uhp.addClass("has-success");
        }
        
      //휴대폰 인증
        if($('#phoneDoubleChk').val()== null || $('#phoneDoubleChk').val()=="" || $('#phoneDoubleChk').val()=="false"){
        	swal ( "Oops" ,  "휴대폰 인증을 확인해 주시기 바랍니다." ,  "error" );
        	uphoneDoubleChk.removeClass("has-success");
            uphoneDoubleChk.addClass("has-error");
            $('#phone').focus();
            return false;
        }else{
        	uphoneDoubleChk.removeClass("has-error");
        	uphoneDoubleChk.addClass("has-success");
        }
    });
    
});
</script>
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form  class="join_inner_float" method="GET" action="${contextPath}/mypage/nonReservation.do">
	  <div class="input_line">
	    <h1 class="join_minisub">비회원 예약 조회</h1>
	  </div>
	  <table>
	  <tbody>
	    <tr>
	      <td> 이름 </td>
	      <td> <input id="name" type="text" name="name" placeholder="예약자 이름을 입력해 주세요."></td>
	    </tr>
	    <tr class="mobileNo dot_line"> 
					<td class="fixed_join"> 
					<label for="phone">휴대폰 번호</label> 
					</td> 
					<td> <p> <input id="phone" type="text" name="hp" style="width:70%; margin-bottom:10px;" title="전화번호 입력" required/> 
					<input type="button" id="phoneChk" class="doubleChk" style="width:28%; float:right; cursor:pointer;" value="인증전송" />
					<input id="phone2" type="text" name="phone2" style="width:70%;" title="인증번호 입력" disabled required/> 
					<input type="button" id="phoneChk2" class="doubleChk" style="width:28%; float:right; cursor:pointer;" value="본인인증" />
					<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> 
					<input type="hidden" id="phoneDoubleChk"/> </p> 
					</td> 
				</tr>
	    </tbody>
	  </table>
	  <button type="submit">예약 확인하기</button>
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