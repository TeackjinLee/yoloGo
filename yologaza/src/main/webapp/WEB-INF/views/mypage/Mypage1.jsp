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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

#detail_table input{
  width:150px;
  font-size:16px;
  border:0px;
}
#detail_table .dot_line{
	font-size:18px;
	font-weight:bold;
	color:#777;
	height:50px;
}
#detail_table .dot_line td{
	padding-top:20px;
}
#detail_table .dot_line input{
	font-weight:bold;
	color:#777;
}
#detail_table .modify{
  width:130px;
  height:32px;
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

.Withdrawal{
	float:left;
	font-weight: bold;
    color: #777;
    font-size:16px;
}
</style>

<script type="text/javascript">

	function fn_modify_member_info(attribute){
		var value;
		// alert(id);
		// alert("mod_type:"+mod_type);
			var frm_mod_member=document.frm_mod_member;
			if(attribute=='name'){
				value=frm_mod_member.name.value;
				//alert("name:"+value);
			}else if(attribute=='hp'){
				value=frm_mod_member.hp.value;
				//alert("name:"+value);
			}else if(attribute=='email'){
				var email1=frm_mod_member.email1;
				var email2=frm_mod_member.email2;
				
				value_email1=email1.value;
				value_email2=email2.value;
				value=value_email1+","+value_email2;
				//alert(value);
			}
			console.log(attribute);
		 
			$.ajax({
				type : "post",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/mypage/modifyMyInfo.do",
				data : {
					attribute:attribute,
					value:value,
				},
				success : function(data, textStatus) {
					if(data.trim()=='mod_success'){
						swal("Good job!", "회원 정보를 수정했습니다.", "success");
					}else if(data.trim()=='failed'){
						swal ( "Oops" ,  "다시 시도해 주세요." ,  "error");
					}
					
				},
				error : function(data, textStatus) {
					swal ( "Oops" ,  "에러가 발생했습니다." +data  ,  "error");
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
					
				}
			}); //end ajax
	}
	function fn_modify_memberImg(obj){
		 obj.action="${contextPath}/mypage/modArticle.do?uid="+${member.uid};
		 obj.submit();
	 }
	 
	function readURL(input,preview) {
		//  alert(preview);
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#'+preview).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	  }
	
	
	function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
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
                  <li><strong>회원정보 수정</strong></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
            	<form name="memberImg" method="POST"   action="${contextPath}"   enctype="multipart/form-data">
				    <table border="0" align="center">
						<tr>
							<td> 
								
								<div style="position:relative; width:200px; height:200px; border-radius:100px; overflow:hidden; border: 1px solid #ddd; box-sizing: border-box;">
								<c:choose>
									<c:when test="${member.memFileName != null and member.kakaoImg == null}">
										<img id="preview" onerror="this.src='${contextPath}/resources/image/1px.gif'" src="${contextPath}/mem_download.do?uid=${member.uid}&memFileName=${member.memFileName}" onchange=readURL(this,'previewImage') style="position:absolute; top:50%; left: 50%; transform: translate(-50%, -50%); width:100%;"/>
									</c:when>
									<c:otherwise>
										<img id="preview" onerror="this.src='${contextPath}/resources/image/1px.gif'" src="${member.kakaoImg}" onchange=readURL(this,'previewImage') style="position:absolute; top:50%; left: 50%; transform: translate(-50%, -50%); width:100%;"/>
									</c:otherwise>
								</c:choose>
								</div>
								<input  type= "hidden"   name="uid" value="${member.uid }" />
								<input  type= "hidden"   name="originalFileName" value="${member.memFileName }" />
								<input type="file" name="memFileName"  onchange="readURL(this);" />
							</td>
						</tr>
						<tr>
							<td align="right"> </td>
							<td colspan="2">
								<input type="submit" value="이미지 등록하기" onClick="fn_modify_memberImg(memberImg)" />
							</td>
						</tr>
					</table>
				</form>
            	<form name="frm_mod_member">	
					<div id="detail_table">
						<table>
							<tbody>
								<tr class="dot_line">
									<td class="fixed_join">아이디</td>
									<td>
										<input style="background:white;" name="id" type="text" size="20" value="${member.id }"  disabled/>
									</td>
								</tr>
								<tr class="dot_line">
									<td class="fixed_join">이름</td>
									<td>
									  <input name="name" type="text" size="20" value="${member.name }" />
									</td>
								</tr>
								<tr>
									<td>
									  <input class="modify" type="button" value="수정하기" onClick="fn_modify_member_info('name')" />
									</td>
								</tr>
								<tr class="dot_line">
									<td class="fixed_join">휴대폰번호</td>
									<td>
									  <input name="hp" type="text" size="20" value="${member.hp }" />
									</td>
									
								</tr>
								<tr>
									<td>
									  <input class="modify" type="button" value="수정하기" onClick="fn_modify_member_info('hp')" />
									</td>
								</tr>
								<tr class="dot_line">
									<td class="fixed_join">이메일</td>
									<td>
									   <c:choose>
									   		<c:when test="${member.email1 != null}">
									   			<input style="width:auto;" type="text" name="email1" size=5 value="${member.email1 }" /> @ <input style="width:auto;" type="text" size=7 name="email2" value="${member.email2 }" /> 
									   		</c:when>
									   		<c:otherwise>
									   			${member.email}
									   		</c:otherwise>
									   </c:choose>
									</td>
									
								</tr>
								<tr>
									<td>
									  <input class="modify" type="button" value="수정하기" onClick="fn_modify_member_info('email')" />
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="clear">
						<br><br>
						<table align=center>
					</table>
					</div>
				
				</form>	
            	
          </div>
          <a class="Withdrawal" href="${contextPath}/member/QuitForm.do">탈퇴하기</a>
        </div>
      </div>
    </div>

</body>
</html>