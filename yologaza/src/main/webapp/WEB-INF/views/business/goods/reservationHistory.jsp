<!-- 기여도 : 송상우100% -->
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
.sub_top_wrap{
  border-bottom:solid 1px;
  display:flex;
  justify-content:center;
}

.sub_top{
  width:1024px;
  height:60px;
  margin:0 40px;
  justify-content:space-between;
  display:flex;
  flex-flow:row nowrap;
}

.sub_top a{
  font-size: 20px;
  text-decoration:none;
  color:black;
  line-height:60px;
}

.sub_top a.active{
  color:rgb(52, 152, 219);
}

table{
  border: 1px solid #444444;
  border-collapse: collapse;
  width:1024px;
}

td {
    border: 1px solid #444444;
  }

.column{
  background-color:rgba(0,0,0,0.2);
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
  width : 120px;
  height: 40px;
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
  margin-left:auto;
}

.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fff;
  min-width : 120px;
  border-radius: 8px;
  height : 135px;
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

.content_top{
  height:80px;
  width:1024px;
  display:flex;
  align-items: center;
}

.content_top_wrap{
  display:flex;
  justify-content:center;
}

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
  background:rgb(52, 152, 219);
  color:#fff;
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

.content_top .far{
	font-size: 27px;
	color: #555;
	margin: 3px 7px 0px 0px;
}
</style>
<script type="text/javascript">
$(function() {
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
		        var type = '${type}';
		        $('#dateApplyBtn').click(function(){
		    		window.location.href='${contextPath}/business/goods/reservationHistory.do?date1='+date1+'&date2='+date2+'&type='+type;
		    	});
	        });
	 });
if(("${member.auth}" == "1") && ("${isLogOn}" == "true")){
	alert("사업자 권한이 필요합니다.");
	document.location.href = "/yologaza/business_main.do";
}else if(('${member}' == '') || ('${member}' == null)){
	alert("로그인이 필요합니다.");
	document.location.href = "/yologaza/businessMember/business_loginForm.do";
}
</script>
<script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />

<meta charset="UTF-8">
<title>예약 관리</title>
</head>
<body>
  <section>
    <div class="sub_top_wrap">
        <div class="sub_top">
          <a href="${contextPath}/business/goods/reservationCheck.do">예약 조회</a>
          <a href="${contextPath}/business/goods/reservationHistory.do" class="active">예약 취소 내역</a>
          <a href="${contextPath}/business/goods/calHistory.do">정산 내역</a>
          <a href="${contextPath}/business/goods/salesHistory.do">매출 내역</a>
        </div>
      </div>
    <div class="content">
      <div class="content_top_wrap">
      <div class="content_top">
        <div class="date-box-wrap" style="display: inline-block; float: right;">
	          	<input type="text" id="cal" name="daterange" value="${Ddate1}/ - ${Ddate2}"/>
	          	<i class="far fa-calendar-alt"></i>
	      </div>
       <button id="dateApplyBtn">검색</button>
        <div class="dropdown">
                    <button class="dropbtn">
                    <c:choose>
                    <c:when test="${type==2}">
                      <span class="dropbtn_content">숙박</span>
                    </c:when>
                    <c:when test="${type==1}">
                      <span class="dropbtn_content">대실</span>
                    </c:when>
                    <c:otherwise>
                      <span class="dropbtn_content">전체</span>
                    </c:otherwise>
                    </c:choose>
                    </button>
                    <div class="dropdown-content">
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reservationHistory.do?date1=${date1}&date2=${date2}&pages=1&type=0"'>전체</div>
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reservationHistory.do?date1=${date1}&date2=${date2}&pages=1&type=2"'>숙박</div>
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reservationHistory.do?date1=${date1}&date2=${date2}&pages=1&type=1"'>대실</div>
                  	</div>
              </div>
      </div>
      </div>
      <table align="center">
	          <tr align="center" class="column">
	            <td><b>성함</b></td>
	            <td><b>연락처</b></td>
	            <td><b>숙소이름</b></td>
				<td><b>방 종류</b></td>
				<td><b>숙박/대실</b></td>
				<td><b>결제비용</b></td>
				<td><b>이용시간</b></td>
				<td><b>상세 이용시간</b></td>
				<td><b>일련번호</b></td>
				<td><b>상태</b></td>
	          </tr>
	    <c:forEach var="rsv_history" items="${selectReservationHistory}">     
        <tr align="center" class="data">
        <fmt:parseDate var="checkInDate" value="${rsv_history.checkIn}" pattern="yyyy-MM-dd"/>
        <fmt:parseDate var="checkOutDate" value="${rsv_history.checkOut}" pattern="yyyy-MM-dd"/>
        <fmt:parseNumber var="checkInDate_N" value="${checkInDate.time/(1000*60*60*24)}" integerOnly="true"/>
        <fmt:parseNumber var="checkOutDate_N" value="${checkOutDate.time/(1000*60*60*24)}" integerOnly="true"/>
	              <td>${rsv_history.name}</td>
	              <td>${rsv_history.hp}</td>
			      <td>${rsv_history.goods_name}</td>
			      <td>${rsv_history.goods_room_type}</td>
			      <c:choose>
			      	<c:when test="${(checkOutDate_N - checkInDate_N) != 0}">
			      		<td>숙박</td>
			      	</c:when>
			      	<c:otherwise>
			      		<td>대실</td>
			      	</c:otherwise>
			      </c:choose>
			      <td>${rsv_history.price}</td>
			      <c:choose>
			      	<c:when test="${(checkOutDate_N - checkInDate_N) != 0}">
			      		<td>${checkOutDate_N - checkInDate_N}박</td>
			      	</c:when>
			      	<c:otherwise>
			      		<td>${rsv_history.goods_motel_usetime}</td>
			      	</c:otherwise>
			      </c:choose>
			      <td>${rsv_history.checkIn}&nbsp${rsv_history.goods_checkIn}~${rsv_history.checkOut}&nbsp${rsv_history.goods_checkOut}</td>
			      <td>${rsv_history.rid}</td>
			      <td>${rsv_history.reservationType}</td>
        </tr>
        </c:forEach>
      </table>
      <div id="notice_pagination">
                <div class="paging">
                <c:if test="${pagination.startPage > 1}">
                  <button type="button" class="prev" onclick="location.href='${contextPath}/business/goods/reservationManagement.do?date1=${date1}&date2=${date2}&pages=${pagination.startPage-1}'"><i class="fas fa-angle-double-left"></i></button>
                </c:if>
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                	<c:choose>
                		<c:when test="${i == pagination.page}">
                  			<button class="on" onclick="location.href='${contextPath}/business/goods/reservationManagement.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:when>
                  		<c:otherwise>
                  			<button onclick="location.href='${contextPath}/business/goods/reservationManagement.do?date1=${date1}&date2=${date2}&pages=${i}'">${i}</button>
                  		</c:otherwise>
                  	</c:choose>
                </c:forEach>
                <c:if test="${pagination.endPage < pagination.totalPage}">
                  <button type="button" class="next" onclick="location.href='${contextPath}/business/goods/reservationManagement.do?date1=${date1}&date2=${date2}&pages=${pagination.endPage+1}'"><i class="fas fa-angle-double-right"></i></button>
                </c:if>
                </div>
              </div>
    </div>
  </section>
</body>
</html>