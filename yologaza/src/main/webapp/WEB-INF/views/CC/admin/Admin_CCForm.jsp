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
    cursor:pointer;
}

.paging .on{
  background:rgb(192, 57, 43);
  color:#fff;
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

.tab_each ul li button {
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

.paging .write{
  float:right;
  width: 70px;
  height: 38px;
  box-sizing: inherit;
  align-items: center;
  border-radius: 5px;
  border: 2px solid rgba(0,0,0,0.15);
  box-shadow: none;
  font-size: 16px;
  line-height: 1.5;
  text-align: center;
}


</style>
<script type="text/javascript">
$(function(){
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
              <a href="${contextPath}/CC/admin_announceList.do" class="active">공지사항</a>
            </li>
            <li>
              <a href="${contextPath}/CC/admin_frequentList.do">자주묻는 질문</a>
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
                      <div class="type" onclick='location.href="${contextPath}/CC/admin_announceList.do?pages=1&auth=1";'>사용자 공지사항 조회</div>
                      <div class="type" onclick='location.href="${contextPath}/CC/admin_announceList.do?pages=1&auth=2";'>사업자 공지사항 조회</div>
                  </div>
                  </div>
                  </li>
                <c:forEach  var="announce" items="${announceList}">
                <li>
                  <a href="${contextPath}/CC/admin_viewAnnounce.do?articleNo=${announce.articleNo}" class="list_que">
                    <p>${announce.title}</p>
                    <span>
                      ${announce.writeDate}
                    </span>
                  </a>
                </li>
                </c:forEach>
              </ul>
              <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/CC/admin_announceList.do?pages=${pagination.startPage-1}&auth=${auth}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/CC/admin_announceList.do?pages=${i}&auth=${auth}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/CC/admin_announceList.do?pages=${i}&auth=${auth}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/CC/admin_announceList.do?pages=${pagination.endPage+1}&auth=${auth}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                <button class="write" type="button" onclick="location.href='${contextPath}/CC/admin_announceForm.do'">글쓰기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>