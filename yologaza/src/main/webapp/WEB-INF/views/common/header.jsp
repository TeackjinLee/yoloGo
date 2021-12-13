<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="wrap main_wrap show">
	  <!-- Header -->
	  <header>
	    <div id="head_link" class="con">
	      <ul class = "row">
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class = cell-r><a href="${contextPath}/mypage/Mypage1.do">마이페이지</a></li>
	      			<li class = cell-r><a href="${contextPath}/member/cartForm.do">장바구니</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/logout.do">로그아웃</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/member/agreeForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
	    </div>
	    <section id="user_header" style="background-color:rgb(112, 173, 71)">
	      <div class="menu con">
	        <div id = "logo"><a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/yolo-logo-w.png" alt="YOLO가자로고"></a></div>
	        <div class="menu-bar row">
		        <div id="search" class="cell">
		            <form name="frmSearch" action="" >
		              <input type="checkbox" id="toggleBtn">
		              <label for="toggleBtn" class="toggleBtn">&nbsp;&nbsp; &nbsp;</label>
					  <!--  <input type="submit" name="search" class="btn1"  value="검 색" > -->
		              <input name="searchWord" id="toggleBtnOn" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="지역, 숙소명" >
		            </form>
	             </div>
		         <div id="suggest" class="cell">
		                <div id="suggestList"></div>
		          </div>
           		<!--  
				<div id="search" class="cell">
				 <form name="frmSearch" action="" >
				   <input type="submit" name="search" class="btn1"  value="검 색" >
				   <input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="지역, 숙소명" >
				  </form>
				</div>
				<div id="suggest" class="cell">
				      <div id="suggestList"></div>
				 </div>
				 -->
	          <ul class="gnb-list row cell">
	            <li class="cell">
	              <div>숙박종류</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/searchGoods.do">모텔</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">호텔</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">펜션</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">리조트</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">게스트하우스</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">캠핑/글램핑</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">한옥</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">내주변</a></li>
	                </ul>
	              </div>  
	             </li>
	            <li class="cell">
					<c:choose>
			      		<c:when test="${isLogOn == true  && member!= null}">
			      			<a href="${contextPath}/mypage/Mypage3.do">예약내역</a>
			      		</c:when>
			      		<c:otherwise>
			      			<a href="${contextPath}/member/loginForm.do">예약내역</a>
			      		</c:otherwise>
			      	</c:choose>
	            </li>
	            <li class="cell">
	              <a href="#">매장안내</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="#">회사소개</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	              <div>고객센터</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/announceList.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">자주 묻는 질문</a></li>
	                  <li><a href="${contextPath}/CC/Question2Form.do">1:1 문의</a></li>
	                </ul>
	              </div>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </section>
	  </header>
	</div>
</body>
</html>