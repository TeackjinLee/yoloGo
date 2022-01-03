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
    clear: both;
    display:block;
  	margin-top:10px;
    text-align:left;
    border-top:1px solid black;
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

.tab .tab_btn ul li.active a{
  color:rgb(112,173,71);
}

.tab .tab_btn ul li a{
  color:black;
}


.tab_each li{
  font-size:16px;
  padding:10px 0 0 0;
}

.tab_each ul li button {
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  color : black;
  padding : 4px;
  width :400px;
  text-align: left;
  cursor : pointer;
  font-size : 16px;
  position : relative;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
}

.tab_each ul .phone, .mail{
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  color : black;
  padding : 4px;
  width :390px;
  text-align: left;
  font-size : 16px;
  position : relative;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  height:21px;
}

.tab_each ul .asking{
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  padding : 4px;
  color:black;
  width :640px;
  text-align: left;
  font-size : 16px;
  position : relative;
  box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  height:100px;
}

.tab_each ul li button::before{
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

.dropdown{
  position : relative;
  display : inline-block;
}

.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fff;
  min-width : 240px;
  border-radius: 8px;
  height : 180px;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
  position:absolute;
  z-index:99;
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

.submit{
  background:rgb(112,173,71);
  color:#fff;
  position : relative;
  border-radius : 4px;
  border : 1px solid #5CC92E;
  width:120px;
  height:45px;
  font-size:17px;
  margin-left:200px;
  cursor:pointer;
}
</style>
<script type="text/javascript">

$(function(){
	$('.type').click(function(){
		$('#selType').val($(this).text());
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
  <form name="questionForm" method="post" action="${contextPath}/CC/addQuestion.do" enctype="multipart/form-data" onsubmit="return check()">
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
              <a href="${contextPath}/CC/announceList.do">공지사항</a>
            </li>
            <li>
              <a href="${contextPath}/CC/frequentList.do">자주묻는 질문</a>
            </li>
            <li>
              <a href="${contextPath}/CC/inPersonQuestion.do" class="active">1:1문의</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="${contextPath}/CC/inPersonQuestion.do">내 문의내역</a></li>
                  <li class="active"><a href="${contextPath}/CC/questionForm.do">문의작성</a></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
              <li>
                YOLO가자! 이용 중 불편하신 점을 문의주시면 최대한 빠른 시일내에 답변드리겠습니다.
              </li>
              <ul>
                <li>
                  문의유형
                </li>
                <li>
                  <div class="dropdown">
                    <button type="button" class="dropbtn">
                      <span class="dropbtn_content">문의 유형을 선택하세요</span>
                    </button>
                    <input type="hidden" name="type" id="selType" />
                    <div class="dropdown-content">
                      <div class="type">이벤트</div>
                      <div class="type">예약/결제</div>
                      <div class="type">취소/환불</div>
                      <div class="type">기타</div>
                    </div>
                  </div>
                </li>
              </ul>
              <ul>
                <li>
                  휴대폰 번호
                </li>
                <li>
                  <input type="text" class="phone" name="hp" placeholder="선택사항 입니다.">
                </li>
              </ul>
              <ul>
                <li>
                  이메일
                </li>
                <li>
                  <input type="text" class="mail" name="email" placeholder="선택사항 입니다.">
                </li>
              </ul>
              <ul>
                <li>
                  문의 내용
                </li>
                <li>
                  <textarea class="asking" name="content" placeholder="내용을 입력해주세요." ></textarea>
                </li>
              </ul>
              <input type="submit" class="submit" value="작성 완료">
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</body>
</html>