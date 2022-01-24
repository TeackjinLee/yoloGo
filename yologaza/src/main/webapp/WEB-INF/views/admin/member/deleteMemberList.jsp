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
	margin-left:10px;
}
.button_div button:nth-child(6){
	margin-left:0px;
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
  margin-left:10px;
}

.auth_div{
	height:29px;
	margin-top:5px;
}

#cal{
	float:right;
	width: 200px;
    height: 30px;
   	border: none;
   	font-size: 16px;
   	text-align: center;
   	color: #777;
   	border: 1px solid #ddd;
    border-radius: 5px;
    margin-right:5px;
    cursor:pointer;
}
#admin_main .far{
	font-size: 27px;
	color: #555;
	margin: 3px 7px 0px 0px;
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
}

.dropdown button {
  border : 1px solid rgba(0,0,0,0.2);
  border-radius : 4px;
  background-color: #fff;
  font-weight: 400;
  color : black;
  padding : 4px;
  width : 80px;
  height: 19px;
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
  min-width : 80px;
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
  cursor : pointer;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

#search{
	float:right;
	height:25px;
	font-size:16px;
}

.detail{
	width:25px;
	height:25px;
	cursor:pointer;
	border:1px solid rgba(0,0,0,0.25);
	border-radius:4px;
	background-color:rgba(0,0,0,0.15)
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
    $(function() {        
        $.fn.type();
    	$('.dropbtn').click(function(){
    	    event.stopPropagation();
    		$(this).parent().find('.dropdown-content').toggle();
    	});
    	
    	$('.type').click(function(){
    		$(this).parent().parent().find('.dropbtn_content').text($(this).text());
    		$(this).parent('.dropdown-content').toggle();
    		$.fn.type();
    	});
    	
    	$(document).click(function(){
    	    $('.dropdown-content').hide();
    	});
    	
        $('input[name="daterange"]').daterangepicker({
	        opens: 'left',
	        showDropdowns: true
        }, function(start, end, label) {
	        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	        var date1 = Date.parse(start.format('YYYY-MM-DD'))/1000;
	        var date2 = Date.parse(end.format('YYYY-MM-DD'))/1000;
	        var auth = '${auth}';
	        $('#dateApplyBtn').click(function(){
	    		window.location.href='${contextPath}/admin/member/deleteMemberList.do?date1='+date1+'&date2='+date2+'&auth='+auth;
	    	});
        });
    });

    
    
    $.fn.type = function(){
		var text = $('.dropbtn_content').text();
    	var type = '';
    	if(text == '이메일'){
    		type = 'email1';
    	}else if(text == '이름'){
    		type = 'name';
    	}else if(text == '연락처'){
    		type = 'hp';
    	}else{
    		type = 'id';
    	}
    	var query = '${query}';
        $('#search').keyup(function(){
        	query = $(this).val();
    	});
    	var date1 = '${date1}';
    	var date2 = '${date2}';
    	var auth = '${auth}';
        $('#searchBtn').click(function(){
    		window.location.href='${contextPath}/admin/member/deleteMemberList.do?date1='+date1+'&date2='+date2+'&auth='+auth+'&query='+query+'&type='+type;
    	});
	}

</script>
<script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />

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
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=0&date2=0&auth=${auth}'">전체</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today1-7776000}&date2=${today2}&auth=${auth}'">90일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today1-2592000}&date2=${today2}&auth=${auth}'">30일</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today1-604800}&date2=${today2}&auth=${auth}'">1주</button> 
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${today1}&date2=${today2}&auth=${auth}'">오늘</button>
	          <button id="dateApplyBtn">검색</button>
	          <div class="date-box-wrap" style="display: inline-block; float: right;">
	          	<input type="text" id="cal" name="daterange" value="${Ddate1}/ - ${Ddate2}"/>
	          	<i class="far fa-calendar-alt"></i>
	          </div>
	        </div>
	        <div class="auth_div">
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth='">전체</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=3'">관리자</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=2'">사업자</button>
	          <button type="button" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=1'">사용자</button>
	          <button id="searchBtn">검색</button>
	       	  <div class="dropdown">
                    <button class="dropbtn">
                      <span class="dropbtn_content">
                      	<c:choose>
                      		<c:when test="${type == 'name'}">
                      		이름
                      		</c:when>
                      		<c:when test="${type == 'hp'}">
                      		연락처
                      		</c:when>
                      		<c:when test="${type == 'email1'}">
                      		이메일
                      		</c:when>
                      		<c:otherwise>
                      		아이디
                      		</c:otherwise>
                      	</c:choose>
                      </span>
                    </button>
                    <div class="dropdown-content">
                      <div class="type">아이디</div>
                      <div class="type">이름</div>
                      <div class="type">연락처</div>
                      <div class="type">이메일</div>
                  	</div>
              </div>
              <input type="text" id="search" value="${query}">
	        </div>
	        <table align="center">
	          <tr align="center" class="column">
	            <td ><b>번호</b></td>
				<td ><b>아이디</b></td>
				<td><b>이름</b></td>
				<td><b>연락처</b></td>
				<td><b>이메일</b></td>
				<td><b>권한</b></td>
				<td><b>사유</b></td>
				<td><b>탈퇴일</b></td>
	          </tr>
	   
	          <c:forEach var="member" items="${deleteMemberList}" varStatus="status">     
	            <tr align="center" class="data">
	              <td>${member.uid}</td>
			      <td>${member.id}</td>
			      <td>${member.name}</td>
			      <td>${member.hp}</td>
			      <td>${member.email1}@${member.email2}</td>
			      <td>${member.auth}</td>
			      <td>
			      <c:choose>
			      	<c:when test="${member.detail1 == '자주 사용하지 않아요'}">
			      		<div class="detail"><a href="#ex${status.count}" rel="modal:open">1</a></div>
			      	</c:when>
			      	<c:when test="${member.detail1 == '원하는 숙소가 없어요'}">
			      		<div class="detail"><a href="#ex${status.count}" rel="modal:open">2</a></div>
			      	</c:when>
			      	<c:when test="${member.detail1 == '다른 계정이 있어요'}">
			      		<div class="detail"><a href="#ex${status.count}" rel="modal:open">3</a></div>
			      	</c:when>
			      	<c:when test="${member.detail1 == '개인정보를 위해 삭제할 정보가 있어요'}">
			      		<div class="detail"><a href="#ex${status.count}" rel="modal:open">4</a></div>
			      	</c:when>
			      	<c:otherwise>
			      		<div class="detail"><a href="#ex${status.count}" rel="modal:open">5</a></div>
			      	</c:otherwise>
			      </c:choose>
			      </td>
			      <td>${member.joinDate}</td>
	            </tr>
	            <div id="ex${status.count}" class="modal">
	            <a>${member.detail1} / ${member.detail2}</a>
	            </div>
	          </c:forEach>   
	        </table>
	        <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=${auth}&pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=${auth}&pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=${auth}&pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/admin/member/deleteMemberList.do?date1=${date1}&date2=${date2}&auth=${auth}&pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>