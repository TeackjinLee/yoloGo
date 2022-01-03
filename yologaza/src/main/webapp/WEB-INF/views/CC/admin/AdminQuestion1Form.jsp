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

ul{
	display:block;
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
    height: 100%;
    margin-right: 31px;
  margin-top:20px;
  margin-bottom:100px;
}

.sub_wrap nav {
    display: block;
    float: left;
    width: 238px;
  padding-top:32px;
  height:400px;
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


#content{
  overflow:hidden;
  position:relative;
  z-index:1;
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
  color:rgb(192, 57, 43);
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

.tab_each ul li input{
  display:none;
}

.tab_each ul li div{
  display: none;
  color: #666;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 30px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}

.tab_each ul li input:checked + label + div{
  display:block;
}

.tab_each ul{
  display:none;
}
.tab_each ul:nth-child(1){
  display:block;
}

.btm ul li button::before{
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

.btm ul li button {
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
  float : right;
}

.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fff;
  min-width : 240px;
  border-radius: 8px;
  height : 90px;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
  position:fixed;
  z-index:99;
  cursor:pointer;
}

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : black;
  font-size: 16px;
  padding : 12px 10px;
  text-align:left;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}


.btm{
	width:750px;
	right:31px;
	position:absolute;
	bottom:0;
}

.btm ul li{
	float:left;
}

.btm .write{
	float:right;
  width: 70px;
  height: 31px;
  box-sizing: inherit;
  align-items: center;
  border-radius: 5px;
  border: 2px solid rgba(0,0,0,0.15);
  box-shadow: none;
  font-size: 16px;
  line-height: 1.5;
  text-align: center;
  cursor:pointer;
}

#footer{
	z-index:1;
	position:relative;
}

</style>
<script type="text/javascript">
$(document).ready(function () {
	const tabList = document.querySelectorAll('.tab_btn ul li');
const contents = document.querySelectorAll('.tab_each ul')
let activeCont = '';// 현재 활성화 된 컨텐츠

for(var i = 0; i < tabList.length; i++){
    tabList[i].querySelector('.tab_btn ul li a').addEventListener('click', function(e){
      e.preventDefault();
      for(var j = 0; j < tabList.length; j++){
        // 나머지 버튼 클래스 제거
        tabList[j].classList.remove('active');

        // 나머지 컨텐츠 display:none 처리
        contents[j].style.display = 'none';
      }

      // 버튼 관련 이벤트
      this.parentNode.classList.add('active');

      // 버튼 클릭시 컨텐츠 전환
      activeCont = this.getAttribute('href');
      document.querySelector(activeCont).style.display = 'block';
    })
  }
  
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
              <div class="tab_btn">
                <ul>
                  <li class="active"><a href="#tab1">이용문의</a></li>
                  <li><a href="#tab2">예약취소</a></li>
                  <li><a href="#tab3">예약문의</a></li>
                  <li><a href="#tab4">리뷰</a></li>
                  <li><a href="#tab5">결제</a></li>
                </ul>
              </div>
            </div>
            <!-- 공지사항  -->
            <div class="tab_each">
            <c:forEach var="i" begin="1" end="5" step="1">
              <ul id="tab${i}" class="active">
              <c:forEach  var="frequent" items="${frequentList}" varStatus="stat">
              <c:if test="${frequent.type == i}">
                <li>
                  <input type="checkbox" class="question" id="que-${stat.count}">
                  <label for="que-${stat.count}">${frequent.title}</label>
                  <div class="answer" id="ans-${stat.count}">${frequent.content}</div>
                </li>
              </c:if>
              </c:forEach>
              </ul>
             </c:forEach>
            </div>
          </div>
        </div>
        <div class="btm">
        	<ul>
        	<li>
        	<div class="dropdown">
            	<button class="dropbtn">
                	<c:choose>
                    <c:when test="${auth==2}">
                      <span class="dropbtn_content">사업자 공지사항 조회</span>
                    </c:when>
                    <c:otherwise>
                      <span class="dropbtn_content">사용자 공지사항 조회</span>
                    </c:otherwise>
                    </c:choose>
                </button>
                    <div class="dropdown-content">
                      <div class="type" onclick='location.href="${contextPath}/CC/admin_frequentList.do?auth=1";'>사용자 공지사항 조회</div>
                      <div class="type" onclick='location.href="${contextPath}/CC/admin_frequentList.do?auth=2";'>사업자 공지사항 조회</div>
                  	</div>
            </div>
        	</li>
        	</ul>
        <button class="write" type="button" onclick="location.href='${contextPath}/CC/admin_frequentForm.do'">글쓰기</button>
        </div>
      </div>
    </div>
</body>
</html>