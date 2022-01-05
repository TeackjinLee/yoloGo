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
<style>
.paging {
  padding-top:32px;
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
</style>
<meta charset="UTF-8">
<title>YOLO가자! 어드민메인페이지</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con" style="width:1024px">

	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <h3>고객 문의 관리</h3>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>번호</b></td>
				<td ><b>아이디</b></td>
				<td><b>이름</b></td>
				<td><b>연락처</b></td>
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
			      <td><a href="${contextPath}/admin/member/removeAdminMember.do?id=${member.id }">삭제하기</a></td>
	            </tr>
	          </c:forEach>   
	        </table>
	        <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/admin/member/listMember.do?pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/admin/member/listMember.do?pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/admin/member/listMember.do?pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/admin/member/listMember.do?pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>