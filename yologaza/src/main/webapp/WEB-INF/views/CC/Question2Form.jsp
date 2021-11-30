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

.tab_each ul li label::before{
  content: "\f078";
  font-family:"Font Awesome 5 Free";
  font-weight: 600;
  display: block;
  color: black;
  float: right;
  cursor:pointer;
}

.tab_each ul li input:checked + label::before{
  content:"\f077"
}

.tab_each ul li label{
    font-size: 19px;
    cursor: pointer;
    border: none;
    outline: none;
    background: none;
    width: 97%;
    text-align: left;
}

.tab_each ul li{
  margin:15px;
}

.tab_each ul li .question{
  display:none;
}

.tab_each ul li .answer{
  display: none;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 0 0 10px 40px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}

.tab_each ul li .ask{
  display:none;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 10px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}

.tab_each ul li input:checked + label + input + .ask, .tab_each ul li input:checked + label + input + .ask + .answer{
  display:block;
}

.tab_each ul li .ans{
  width: 65px;
  height: 24px;
  position:relative;
  bottom:2px;
  text-align:center;
  border:0px;
  color:rgb(112,173,71);
}

.tab_each ul li div{
  background:rgba(0,0,0,0.08);
}
</style>
</head>
<body class="pc">
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
              <a href="${contextPath}/CC/User_CCForm.do">공지사항</a>
            </li>
            <li>
              <a href="${contextPath}/CC/Question1Form.do">자주묻는 질문</a>
            </li>
            <li>
              <a href="${contextPath}/CC/Question2Form.do" class="active">1:1문의</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li class="active"><a href="${contextPath}/CC/Question2Form.do">내 문의내역</a></li>
                  <li><a href="${contextPath}/CC/Question3Form.do">문의작성</a></li>
                </ul>
              </div>
            </div>
            <!-- 공지사항  -->
            <div class="tab_each">
              <ul id="tab1">
                <li>
                  <input type="checkbox" class="question" id="que-1">
                  <label for="que-1">
                    문의 유형 / 문의 내용
                  </label>
                  <input type="text" class="ans" value="답변 완료" readonly>
                  <div class="ask">[문의] 작성일 2021.11.24<br>문의 내용입니다.</div>
                  <div class="answer">[답변] 작성일 2021.11.25<br>답변 내용입니다.</div>
                </li>
                <li>
                  <input type="checkbox" class="question" id="que-2">
                  <label for="que-2">
                    문의 유형 / 문의 내용
                  </label>
                  <input type="text" class="ans" value="답변 대기" readonly>
                  <div class="ask">[문의] 작성일 2021.11.24<br>문의 내용입니다.</div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>