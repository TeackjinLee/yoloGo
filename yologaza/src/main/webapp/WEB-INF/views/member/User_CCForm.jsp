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
a{text-decoration:none}
ul,ol,li{list-style:none}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.sub_wrap .align_rt {
    float: right;
    width: 750px;
    margin-right: 31px;
  margin-top:70px;
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
  height: 211px;
  background:rgb(112,173,71);
}

.sub_top{
  width:1024px;
  height:211px;
  margin:0 auto;
  border-radius:0;
  padding-top:110px;
}

.sub_top h1{
  display:block;
  color:#fff;
  text-align:left;
  
}


.content{
  overflow:hidden;
}

.sub_wrap{
  width: 1024px;
  margin:0 auto 0 auto;
  padding_top:54px;
  padding_bottom:54px;
  background:red;
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
    border-top: 1px solid black;
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

.sub_top{
  margin:0 auto;
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

.sub_top li {
    margin: 21px 0 0 0px;
    font-size: 16px;
    font-weight: normal;
    letter-spacing: -1px;
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
    font-size: 18px;
    line-height: normal;
    color: black;
    text-align: left;
    cursor: pointer;
}



.paging {
  padding:32px 0 0 32px;
}

.paging button{
    width: 32px;
    height: 32px;
    box-sizing: inherit;
    align-items: center;
    border-radius: 3px;
    border: none;
    box-shadow: none;
    font-size: 13px;
    line-height: 1.5;
    text-align: center;
}

.paging .on{
  background:rgb(112,173,71);
  color:#fff;
}
</style>
</head>
<body class="pc">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <h1><i class="fas fa-phone-alt fa-lg"></i> 고객센터</h1>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/member/User_CCForm.do" class="active">공지사항</a>
            </li>
            <li>
              <a href="${contextPath}/member/Question1Form.do">자주묻는 질문</a>
            </li>
            <li>
              <a href="${contextPath}/member/Question2Form.do">1:1문의</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <span class="tab_btn">
                공지사항
              </span>
            </div>
            <!-- 공지사항  -->
            <div class="tab_each">
              <ul id="notices" class="show_list">
                <li>
                  <a href="#" id="notice_tab" class="list_que">
                    <p>[공지]11월 이벤트</p>
                    <span>
                      2021.11.10
                    </span>
                  </a>
                </li>
                <li>
                  <a href="#" id="notice_tab" class="list_que">
                    <p>[공지]10월 이벤트</p>
                    <span>
                      2021.10.07
                    </span>
                  </a>
                </li>
              </ul>
              <div id="notice_pagination">
                <div class="paging">
                  <button class="prev"><i class="fas fa-angle-double-left"></i></button>
                  <button class="on">1</button>
                  <button>2</button>
                  <button>3</button>
                  <button>4</button>
                  <button>5</button>
                  <button>6</button>
                  <button class="next"><i class="fas fa-angle-double-right"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>