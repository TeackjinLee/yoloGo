<%-- 송상우 100% --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<html>
<head>
<meta charset="utf-8">
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
body{
  font-size: 14px;
}
.wrap.show{
  opacity: 1;
  visibility: visible;
}

.wrap{
  width: 100%;
  background:#fff;
}


ul,
li {
    list-style: none;
}

a {
    color: inherit;
    text-decoration: none;
}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
}

ul{
	margin-bottom:10px;
}

.sub_wrap .align_rt {
    float: right;
    width: 750px;
    margin-right: 31px;
  margin-top:20px;
  margin-bottom:100px;
}

.sub_wrap nav {
    display: block;
    float: left;
    width: 238px;
  padding-top:32px;
}

.wrap{
  width:100%;
  background:#fff;
}

.sub_top_wrap{
  height: 120px;
  background:rgb(112,173,71);
}

.sub_top{
	position:relative;
  width:1024px;
  height:120px;
  margin:0 auto;
  border-radius:0;
	text-align:left;
}

.sub_top a{
	position: absolute;
    color: white;
    font-weight: 500;
    font-size: 32px;
    bottom:20px;
}


.content{
  overflow:hidden;
}

.sub_wrap{
  width: 1024px;
  margin:0 auto 0 auto;
  padding-top:54px;
  padding-bottom:54px;
}

.show_list li .list_que span {
    font-size: 16px;
    color: black;
}

.show_list li{
    display: block;
    position: relative;
    height: auto;
    margin-bottom: 0;
    padding: 0px 24px 0px 0px;
    border-radius: 0;
    background: #fff;
    font-size: 18px;
    line-height: normal;
    cursor: pointer;
}

.show_list li .list_que p {
    padding-bottom: 0px;
    overflow: visible;
    white-space: normal;
    text-overflow: initial;
    line-height: normal;
    word-wrap: break-word;
}

.show_list li a p {
    overflow: hidden;
    width: 100%;
    padding-bottom: 3px;
    white-space: nowrap;
    text-overflow: ellipsis;
    color:black;
}

.tab_each {
    border-top: none;
}

.tab_each {
    clear: both;
    border-bottom: 1px solid black;
    display:block;
  padding-top:8px;
    text-align:left;
}

div {
    display: block;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.show_list {
    margin-bottom: 0;
    padding: 0 0;
}

.sub_wrap nav ul li a{
  display:block;
  font-size:20px;
  color:black;
}

.sub_wrap nav{
	padding-right:20px;
	text-align:left;
}

.sub_wrap nav ul li a.active{
  font-size:20px;
  color:rgb(112,173,71);
  font-weight:bold;
}

.wrap.show, footer.show {
    opacity: 1;
    visibility: visible;
}

.wrap {
    width: 100%;
    background: #fff;
    opacity: 0;
    visibility: hidden;
}

.sub_wrap nav ul li {
    margin-bottom: 26px;
}

.tab{
	text-align:left;
}
.tab .tab_btn ul li{
    display: inline-block;
    float: none;
    position: relative;
    margin-right: 64px;
    font-size: 18px;
    line-height: normal;
    text-align: left;
    cursor: pointer;
    padding-left:5px;
    color:black;
}

.tab .tab_btn ul li a{
  color:black;
}

.withdrawal {
  color:black;
  position:relative;
  top:10px;
    float:left;
}
.tab .tab_btn ul{
  position:relative;
  margin-top:30px;
}
.tab_each ul li div{
	height:32px;
}

.tab_each ul li div span{
  font-size:16px;
  width:130px;
  display:inline-block;
  padding-top:4px;
}

.tab_each ul li div input{
  width:150px;
  font-size:16px;
  border:0px;
}

.tab_each ul li .modify{
  width:130px;
  height:32px;
  margin-top:20px;
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  padding : 4px;
  color:black;
  text-align: center;
  font-size : 16px;
  position : relative;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  cursor:pointer;
}

.tab_each ul li a{
  position:relative;
  top:10px;
}

</style>
 <script>

   
   window.onload=function()
    {
      selectBoxInit();
    }

    function selectBoxInit(){
    
     var hp1='${memberInfo.hp}';
     var selHp1 = document.getElementById('hp');
     var optionHp = selHp.options;
     var val;
     
     for(var i=0; i<optionHp.length;i++){
         val = optionHp[i].value;
         if(hp == val){
        	 optionHp[i].selected= true;
          break;
         }
       } 
     
   }


function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		if(attribute=='pwd'){
			value=frm_mod_member.member_pw.value;
			//alert("member_pw:"+value);
		} else if(attribute=='hp'){
			var hp=frm_mod_member.hp;
			var smssts_yn=frm_mod_member.smssts_yn;
			
			for(var i=0; hp.length;i++){
			 	if(hp1[i].selected){
					value_hp=hp[i].value;
					break;
				} 
			}
			value_smssts_yn=smssts_yn.checked;
			value=value_hp +","+value_smssts_yn;
		}else if(attribute=='email'){
			var email1=frm_mod_member.email1;
			var email2=frm_mod_member.email2;
			var emailsts_yn=frm_mod_member.emailsts_yn;
			
			value_email1=email1.value;
			value_email2=email2.value;
			value_emailsts_yn=emailsts_yn.checked;
			value=value_email1+","+value_email2+","+value_emailsts_yn;
			//alert(value);
		}
		console.log(attribute);
	 
		$.ajax({
			type : "GET",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax
}
</script>
</head>
<body class="pc">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a>MY페이지</a>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/mypage/Mypage1.do" class="active">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage2.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage3.do">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage4.do">내 리뷰 관리</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="#">회원정보 수정</a></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
              <ul>
                <li>
                  <div>
                    <span>닉네임</span>
                    <input type="text" class="mod" value="#" readonly>
                  </div>
                </li>
                <li>
                  <input type="button" class="modify">
                  </input>
                </li>
              </ul>
              <ul>
                <li>
                  <div>
                    <span>예약자 성함</span>
                    <input type="text" class="mod" value="#" readonly>
                  </div>
                </li>
                <li>
                  <input type="button" class="modify">
                  </input>
                </li>
              </ul>
              <ul>
                <li>
                  <div>
                    <span>휴대폰 번호</span>
                    <input type="text" class="mod" value="#" readonly>
                  </div>
                </li>
                <li>
                  <a>개인정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</a>
                </li>
                <li>
                  <input type="button" class="modify">
                  </input>
                </li>
              </ul>
            </div>
            <a href="${contextPath}/member/QuitForm.do" class="withdrawal">회원 탈퇴</a>
          </div>
        </div>
      </div>
    </div>
    <h3>내 상세 정보</h3>
	<form name="frm_mod_member">	
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input name="id" type="text" size="20" value="${member.id }"  disabled/>
						</td>
						 <td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td>
						  <input name="pwd" type="password" size="20" value="${memberInfo.pwd }" />
						</td>
						<td>
						  <input type="button" value="수정하기" onClick="fn_modify_member_info('pwd')" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td>
							<input name="name" type="text" size="20" value="${memberInfo.name }"/>
						 </td>
						 <td>
							<input type="button" value="수정하기" onClick="fn_modify_member_info('name')" />
						</td>	
						 <td>
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">휴대폰번호</td>
						<td> 
						 	<input type="text" name="hp" size=20 value="${memberInfo.hp }"> 
					    </td>
						<td>
						  <input type="button" value="수정하기" onClick="fn_modify_member_info('hp')" />
						</td>	
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이메일<br>(e-mail)</td>
						<td>
						   <input type="text" name="email1" size=10 value="${memberInfo.email1 }" /> @ <input type="text" size=10  name="email2" value="${memberInfo.email2 }" /> 
						   <select name="select_email2" onChange=""  title="직접입력">
								<option value="non">직접입력</option>
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
						</select><Br><br> 
						</td>
						<td>
						  <input type="button" value="수정하기" onClick="fn_modify_member_info('email')" />
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div class="clear">
			<br><br>
			<table align=center>
			<tr>
				<td >
					<input type="hidden" name="command"  value="modify_my_info" /> 
					<input name="btn_cancel_member" type="button"  value="수정 취소">
				</td>
			</tr>
		</table>
		</div>

		<input  type="hidden" name="h_hp1" value="${memberInfo.hp}" />		
	</form>
</body>
</html>