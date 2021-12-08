<!-- 기여도: 이택진70% / 윤진30% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function fn_overlapped(){
    var _id=$("#_id").val();
    if(_id==''){
    	swal ( "Oops" ,  "ID를 입력하세요" ,  "error" );
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
        	swal("Good job!", "사용할 수 있는 ID입니다.", "success");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_id').prop("disabled", true);
       	    $('#id').val(_id);
          }else{
        	  swal ( "Oops" ,  "사용할 수 없는 ID입니다." ,  "error" );
          }
       },
       error:function(data,textStatus){
    	  swal ( "Oops" ,  "에러가 발생했습니다." ,  "error" );
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
}	
</script>

<style>
#detail_table table tbody tr{
	display: block;
}
#detail_table table tbody tr .fixed_join{
	display:block;
	font-weight: bold;
    font-size: 16px;
}
#detail_table table tbody tr td{
	display:block;
}
#detail_table table tbody tr td p{
	margin-top:0px;
}
#detail_table table tbody tr td input{
	width: 100%;
    height: 30px;
    border-radius: 5px;
    box-sizing: border-box;
    margin-bottom: 10px;
}
</style>
<script>
	
function checkfield(){
	 
	 if(document.addjoin.id.value==""){ //id값이 없을 경우
	 alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
	 document.addjoin.id.focus();     // id 텍스트박스에 커서를 위치
	 exit;
	 
	 }else if(document.addjoin.pwd.value==""){
	 alert("비밀번호를 입력하세요");
	 document.addjoin.pw.focus();
	 exit;
	 
	 }else if(document.addjoin.pwd2.value==""){
	 alert("비밀번호확인을 입력하세요");
	 document.addjoin.pw2.focus();
	 exit;
	 
	 }else if(document.addjoin.name.value==""){
	 alert("이름을 입력하세요");
	 document.addjoin.name.focus();
	 exit;
	 
	 
	 }
	 
	 
	 if(document.addjoin.pwd.value!=document.addjoin.pwd2.value){
	 //비밀번호와 비밀번호확인의 값이 다를 경우
	 
	 alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
	 document.addjoin.pw.focus();
	 exit;
	 
	 }
	 
	 
	 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 
	 if(exptext.test(document.addjoin.email.value)==false){
	 //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
	 
	 alert("이 메일형식이 올바르지 않습니다.");
	 document.addjoin.email.focus();
	 exit;
	 }
	 
	 document.addjoin.submit();
	 
	}

	function check_id(){
			var uid = document.getElementById('_id').value;
			var idReg = /^[a-zA-Z]+[a-z0-9A-Z]{3,19}$/g;
			
			if( !idReg.test( uid ) ) {
				window.swal ( "Oops" ,  "아이디는 영소문자로 시작하는 4~20자 영문자 또는 숫자이어야 합니다." ,  "error" );
				document.getElementById('_id').value='';
				return;
				}
	}
	function check_pw(){

        var pw = document.getElementById('pwd').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;

        if(pw.length < 6 || pw.length>16){
            window.swal ( "Oops" ,  "비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다." ,  "error" );
            document.getElementById('pwd').value='';
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        if(check_SC == 0){
            window.swal ( "Oops" ,  "!,@,#,$,% 의 특수문자가 들어가 있지 않습니다." ,  "error" );
            document.getElementById('pwd').value='';
        }
        if(document.getElementById('pwd').value !='' && document.getElementById('pwd2').value!=''){
            if(document.getElementById('pwd').value==document.getElementById('pwd2').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
    }
	
</script>
</head>
<body>
	
	<form action="${contextPath}/member/addMember.do" method="post">	
	<div id="detail_table">
		<table style="margin: 0 auto; padding: 10px 40px; box-sizing: border-box; border: 5px solid #ddd; border-radius: 10px; width: 450px; margin-bottom:150px">
			<tbody style="display: block; text-align: left; align-content: center;">
				<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
				<tr class="dot_line" style="text-align: center;">
					<td><h1>회원가입</h1></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">*아이디</td>
					<td>
					  <input type="text" name="_id"  id="_id" onchange="check_id()" style="width:78%;" placeholder="영문자와 숫자를 4~20자내로 입력해 주세요." />
					  <input type="hidden" name="id"  id="id" />
					  <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" style="width:20%; float:right; cursor:pointer;"/>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">*비밀번호</td>
					<td><input id="pwd" name="pwd" type="password" onchange="check_pw()" placeholder="6자리이상 16자리이하 특수기호 포함" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">*비밀번호 재확인</td>
					<td><input id="pwd2" name="pwd2" type="password" onchange="check_pw()" />&nbsp;<span id="check"></span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">*이름</td>
					<td><input name="name" type="text" /></td>
				</tr>		
				<tr class="dot_line">
					<td class="fixed_join">*휴대폰 번호</td>
					<td>
						<input type="text" name="hp" id="hp" style="width:78%; margin-bottom:10px;"/>
						<input type="button"  value="인증 전송" onClick="" style="width:20%; float:right; cursor:pointer;"/>
						<input type="text" name="hpA" style="width:78%;"/>
						<input type="button"  id="hpA" value="인증 확인" onClick="" style="width:20%; float:right; cursor:pointer;"/>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일(e-mail)</td>
					<td><input size="10px"   type="text" name="email1" style="width:33%;"/> @ <input  size="10px"  type="text"name="email2" style="width:33%;"/> 
						  <select name="email2" onChange=""	title="직접입력" style="width:27%; height:30px; float:right;">
									<option value="">직접입력</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="naver.com">naver.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="empal.com">empal.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
							</select></td>
				</tr>
				<tr >
					<td style="text-align: center;">
						<input type="submit"  value="회원 가입" onclick="checkfield()" style="width:30%; cursor:pointer;">
						<input  type="reset"  value="다시입력"  style="width:30%; cursor:pointer;">
					</td>
				</tr>
			</tbody>
		</table>
		</div>	
	</form>	
</body>
</html>