<%-- 송상우 100% --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<c:set var="today" value="<%=new java.util.Date()%>"/>


<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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


.sub_wrap .align_rt {
    float: right;
    width: 750px;
    margin-right: 31px;
  margin-top:20px;
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
  background:rgb(192, 57, 43);
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
    clear: both;
    display:block;
  padding-top:8px;
    text-align:left;
    border-top:1px solid black;
}

div {
    display: block;
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
  color:rgb(192, 57, 43);
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
.tab span.tab_btn {
    display: inline-block;
    float: none;
    position: relative;
    width: auto;
    height: 30px;
    margin-right: 22px;
    font-size: 20px;
    line-height: normal;
    color: black;
    text-align: left;
    cursor: pointer;
    font-weight:bold;
    padding-left:5px;
}

textarea{
  width:650px;
  height:250px;
  border-radius:7px;
  margin-top:10px;
  resize:none; 
  outline:none;
}

.tab_each ul li{
    display: inline-block;
}

.tab_each ul .title{
	height:36px;
	margin-top:10px;
}

.tab_each ul li span{
  position:relative;
  font-size:18px;
  font-weight:bold;
  top:3px;
}

.tab_each ul li input{
  width:70px;
  border-radius:4px;
  height:18px;
  margin-top:0px;
  outline:none;
}

.tab_each ul li .input2{
  width:120px;
}

.tab_each ul li .input3{
	width:591px;
	border-width:2px;
	border-color:rgba(118, 118, 118, 0.3);
	height:30px;
	font-size:16px;
	line-height:30px;
	float:right;
	margin-left:22px;
}

.write{
	float:right;
	width:100px;
	height:36px;
	font-size:16px;
	border-radius:4px;
	border-width:1px;
	border-color:rgba(0,0,0,0.15);
	margin-right:94px;
	cursor:pointer;
}

.div_bot{
	margin-top:15px;
	height:50px;
}

.dropdown button::before{
  content: "\f078";
  font-family:"Font Awesome 5 Free";
  font-weight: 600;
  display: block;
  color: black;
  float: right;
  cursor:pointer;
  position:relative;
  top:3px;
}

.dropdown button {
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  color : black;
  padding : 4px;
  width : 240px;
  text-align: left;
  cursor : pointer;
  font-size : 16px;
  position : relative;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  z-index:1;
}

.dropdown{
  position : relative;
  display : inline-block;
  float : left;
}

.tab_each .li_drp{
	float:right;
	margin-right:94px;
}

#drop2{
  display : none;
  font-weight: 400;
  background-color: #fff;
  min-width : 240px;
  border-radius: 8px;
  height : 90px;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
  position:absolute;
  z-index:99;
  cursor:pointer;
}

#drop1{
  display : none;
  font-weight: 400;
  background-color: #fff;
  min-width : 240px;
  border-radius: 8px;
  height : 225px;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
  position:absolute;
  z-index:99;
  cursor:pointer;
}

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : black;
  font-size: 16px;
  padding : 12px 10px;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

</style>
<script type="text/javascript">

$(function(){
	$('#drop2 .type').click(function(){
		var cnt = $('#drop2 .type').index(this) + 1
		$('#selAuth').val(cnt);
	});
	
	$('#drop1 .type').click(function(){
		var cnt = $('#drop1 .type').index(this) + 1
		$('#selType').val(cnt);
	});
	
	$('.dropbtn').click(function(){
		$(this).parent().find('.dropdown-content').toggle();
	});
	
	$('.type').click(function(){
		$(this).parent().parent().find('.dropbtn_content').text($(this).text());
		$(this).parent('.dropdown-content').toggle();
	});
	});

    
</script>
</head>
<body class="pc">
  <form name="frmFrequent" method="post"  action="${contextPath}/CC/admin_addFrequent.do"  enctype="multipart/form-data">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a><i class="fas fa-phone-alt fa-lg"></i> 고객센터</a>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/CC/admin_announceList.do">공지사항</a>
            </li>
            <li>
              <a href="${contextPath}/CC/admin_frequentList.do" class="active">자주묻는 질문</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <span class="tab_btn">
                자주 묻는 질문
              </span>
            </div>
            <!-- 공지사항  -->
            <div class="tab_each">
              <ul>
                <li>
                  <span>작성자</span>
                </li>
                <li>
                  <input type="text" class="input1" name="id" value="${id}" disabled/>
                </li>
                <li>
                  &nbsp&nbsp<span>작성일</span>
                </li>
                <li>
                  <input type="text" class="input2" value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>" disabled/>
                </li>
                <li class="li_drp">
        			<div class="dropdown">
            			<button type="button" class="dropbtn">
                      		<p class="dropbtn_content">질문 유형을 선택해주세요</p>
                		</button>
                    <div class="dropdown-content" id="drop1">
                      <div class="type">이용문의</div>
                      <div class="type">예약취소</div>
                      <div class="type">예약문의</div>
                      <div class="type">리뷰</div>
                      <div class="type">결제</div>
                    <input type="hidden" name="type" id="selType" />
                  	</div>
            		</div>
        		</li>
              </ul>
              <ul>
              	<li class="title">
              		<span>제목</span>
              		<input type="text" name="title" class="input3"/>
              	</li>
              </ul>
              <div>
                <textarea placeholder="공지를 작성해주세요." name="content"></textarea>
              </div>
              <div class="div_bot">
                <div class="dropdown">
                    <button type="button" class="dropbtn">
                      <span class="dropbtn_content">조회 대상을 선택해주세요</span>
                    </button>
                    <input type="hidden" name="auth" id="selAuth" />
                    <div class="dropdown-content" id="drop2">
                      <div class="type">사용자 자주묻는질문</div>
                      <div class="type">사업자 자주묻는질문</div>
                  	</div>
                  </div>
              	<input class="write" type="submit" value="등록">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>
</body>
</html>