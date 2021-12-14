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
.tab_each{
  height:500px;
}

.tab_each .reservation img{
  width:45%;
  height:220px;
  border:1px solid rgba(0,0,0,0.2);
  display:inline-block;
}

.tab_each .reservation .descript{
  width:54%;
  height:220px;
  border:1px solid rgba(0,0,0,0.2);
  display:inline-block;
  position:relative;
  right:6px;
  padding:10px 10px 10px 15px;
  vertical-align:top;
}

.tab_each .reservation .descript .reviewdate{
  float:right;
  text-align:right;
  border:0;
  font-size:18px;
}

.tab_each .reservation .descript a1{
  font-size:24px;
}

.tab_each .reservation .descript a2{
  display:block;
}

.tab_each .reservation .descript a3{
  display:inline-block;
  margin-top:15px;
  margin-right:20px;
}

.tab_each .reservation .descript .reviewtxt{
  display:block;
  width:330px;
  height:90px;
  padding:5px;
  margin-top:13px;
}

.tab_btn ul li a{
	font-size:18px;
}
.tab .tab_btn ul{
  position:relative;
  margin-top:30px;
}
</style>
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
              <a href="${contextPath}/mypage/Mypage1.do">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage2.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage3.do">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/Mypage4.do" class="active">내 리뷰 관리</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="${contextPath}/mypage/Mypage4.do">내 리뷰 관리</a></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
              <div class="reservation">
                <img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg">
                <div class="descript">
                  <a1>숙소명</a1>
                  <input type="text" class="reviewdate" value="2011. 11. 11" readonly>
                  <a2>선택한 방 종류</a2>
                  <a3>닉네임</a3><a3>평점 4.5</a3>
                  <div class="reviewtxt">
                    리뷰 내용
                  </div>
                </div>
              </div>
              <div class="reservation">
                <img src="https://image.goodchoice.kr/resize_490x348/adimg_new/68065/381552/536f3a7ee6b4bba14b3c710645062570.jpg">
                <div class="descript">
                  <a1>숙소명</a1>
                  <input type="text" class="reviewdate" value="2011. 11. 11" readonly>
                  <a2>선택한 방 종류</a2>
                  <a3>닉네임</a3><a3>평점 4.5</a3>
                  <div class="reviewtxt">
                    리뷰 내용
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>