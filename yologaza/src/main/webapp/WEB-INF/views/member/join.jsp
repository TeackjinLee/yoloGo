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
<script>
function fn_overlapped(){
    var id=$("#id").val();
    if(id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {_id:id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#id').prop("disabled", true);
       	    $('#_id').val(id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
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
					<td class="fixed_join">아이디</td>
					<td>
					  <input type="text" name="id"  id="id" style="width:78%;" />
					  <input type="hidden" name="_id"  id="_id" />
					  <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" style="width:20%; float:right; cursor:pointer;"/>
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td><input name="pwd" type="password"  /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td><input name="name" type="text" /></td>
				</tr>		
				<tr class="dot_line">
					<td class="fixed_join">휴대폰 번호</td>
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
						<input type="submit"  value="회원 가입" style="width:30%; cursor:pointer;">
						<input  type="reset"  value="다시입력"  style="width:30%; cursor:pointer;">
					</td>
				</tr>

			</tbody>
		</table>
		</div>
		
	</form>	
</body>
</html>