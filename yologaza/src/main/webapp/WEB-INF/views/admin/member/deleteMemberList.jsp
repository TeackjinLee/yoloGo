<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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

#text1{
  display: inline-block;
  font-size: 1.17em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
  float:left;
  margin-bottom:30px;
}

.button_div button{
	float:right;
  width: 60px;
  height: 25px;
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

.button_div{
	height:29px;
}

.auth_div button{
	float:right;
  width: 60px;
  height: 25px;
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

.auth_div{
	height:29px;
	margin-top:5px;
}
</style>
<meta charset="UTF-8">
<title>YOLO가자! 관리자 메인페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div id="admin_main" class="admin_main_wrap">
	  <div class="admin_main_box con" style="width:1024px">

	    <div class="adminCustomer">
	      <div class="adminCustomer_box">
	        <a id="text1">탈퇴 회원 관리</a>
	        <div class="button_div">
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=0&date2=0'">전체</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today-7776000}&date2=${today}'">90일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today-2592000}&date2=${today}'">30일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today-604800}&date2=${today}'">1주</button> 
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today}&date2=${today}'">오늘</button>
	        </div>
	        <div class="auth_div">
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?auth='">전체</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?auth=3'">관리자</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?auth=2'">사업자</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?auth=1'">사용자</button>
	        </div>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>번호</b></td>
				<td ><b>아이디</b></td>
				<td><b>이름</b></td>
				<td><b>연락처</b></td>
				<td><b>이메일</b></td>
				<td><b>권한</b></td>
				<td><b>탈퇴일</b></td>
	          </tr>
	   
	          <c:forEach var="member" items="${deleteMemberList}" >     
	            <tr align="center" class="data">
	              <td>${member.uid}</td>
			      <td>${member.id}</td>
			      <td>${member.name}</td>
			      <td>${member.hp}</td>
			      <td>${member.email1}@${member.email2}</td>
			      <td>${member.auth}</td>
			      <td>${member.joinDate}</td>
	            </tr>
	          </c:forEach>   
	        </table>
	        <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>