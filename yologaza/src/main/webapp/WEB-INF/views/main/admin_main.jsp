<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

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

#text1{
  display: inline-block;
  font-size: 1.17em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
  float:left;
  padding-left:10px;
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
  padding : 12px 10px 12px 12px;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

.type{
	text-align:left;
}

.dropbtn_content{
	padding-left:10px;
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
<meta charset="UTF-8">
<title>YOLO가자! 어드민메인페이지</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con">
	    <div class="main_box wrap">
	      <div class="img_box cell">
	        <a href="${contextPath}/main.do">
	          <img src="${contextPath}/resources/image/admin_main_user.jpg" alt="user_main 이미지" style="width:100%;">
	          <div class="text-box"><h2>사용자 메인화면 이동 ></h2></div>
	        </a>
	      </div>
	      <div class="img_box cell">
	        <a href="${contextPath}/business_main.do">
	          <img src="${contextPath}/resources/image/admin_main_business.jpg" alt="business_main 이미지" style="width:100%;">
	          <div class="text-box"><h2>사업자 메인화면 이동 ></h2></div>
	        </a>
	      </div>
	    </div>
	    <div class="goodsRoom_sell">
	      <div class="text-box">
	        <h3><a href="#"> 상품 관리 > </a></h3>
	        <div class="sell_box">
	          <div><sapn> 0 <br>오늘</sapn></div>
	          <div><sapn> 0 <br>이번주</sapn></div>
	          <div><sapn> 0 <br>이번달</sapn></div>
	        </div>
	      </div>
	    </div>
	    
	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <a id="text1">고객 문의 관리</a>
	        <div class="dropdown">
                    <button class="dropbtn">
                    <c:choose>
                    <c:when test="${auth==2}">
                      <span class="dropbtn_content">사업자 조회</span>
                    </c:when>
                    <c:otherwise>
                      <span class="dropbtn_content">사용자 조회</span>
                    </c:otherwise>
                    </c:choose>
                    </button>
                    <div class="dropdown-content">
                      <div class="type" onclick='location.href="${contextPath}/admin_main.do?pages=1&auth=1";'>사용자 조회</div>
                      <div class="type" onclick='location.href="${contextPath}/admin_main.do?pages=1&auth=2";'>사업자 조회</div>
                  </div>
                  </div>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>번호</b></td>
				<td ><b>아이디</b></td>
				<td><b>이름</b></td>
				<td><b>연락쳐</b></td>
				<td><b>이메일</b></td>
				<td><b>권한</b></td>
				<td><b>가입일</b></td>
				<td><b>삭제</b></td>
	          </tr>
	   
	          <c:forEach var="member" items="${membersList}" >     
	            <tr align="center" class="data">
	              <td>${member.uid}</td>
			      <td>${member.id}</td>
			      <td>${member.name}</td>
			      <td>${member.hp}</td>
			      <td>${member.email1}@${member.email2}</td>
			      <td>${member.auth}</td>
			      <td>${member.joinDate}</td>
			      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제하기</a></td>
	            </tr>
	          </c:forEach>  
	        </table>
	        <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/admin_main.do?pages=${pagination.startPage-1}&auth=${auth}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/admin_main.do?pages=${i}&auth=${auth}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/admin_main.do?pages=${i}&auth=${auth}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/admin_main.do?pages=${pagination.endPage+1}&auth=${auth}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div> 
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>