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
  width:900px;
}

td {
    border: 1px solid #444444;
  }

.column{
  background-color:rgba(0,0,0,0.2);
}

.content_top{
  width:1024px;
  display:flex;
  align-items: center;
  margin-top:30px;
}

.content_top_wrap, .content_mid, .content_bot{
  display:flex;
  justify-content:center;
}

.date_search{
  background-color:rgba(0,0,0,0.2);
  width:900px;
  height:60px;
  display:flex;
  align-items: center;
  margin-top:30px;
  border:1px solid rgba(0,0,0,0.3);
}

.calculate{
	display:flex;
	align-items:center;
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

.far{
	font-size: 27px;
	color: #555;
	margin: 3px 7px 0px 0px;
}

.date-box-wrap{
	margin-left:5px;
}

.time_div{
    position: relative;
    display: inline-block;
    margin-left: auto;
}

.price{
	width: 200px;
}

.left{
	background-color:rgba(0,0,0,0.2);
	width:300px;
}

.right{
	text-align:left;
}

p{
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
}


</style>
<script type="text/javascript">
$(function() {
	$('input[name="daterange"]').daterangepicker({
        opens: 'left',
        showDropdowns: true
    }, function(start, end, label) {
        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        var date1 = Date.parse(start.format('YYYY-MM-DD'))/1000;
        var date2 = Date.parse(end.format('YYYY-MM-DD'))/1000;
        $('#dateApplyBtn').click(function(){
    		window.location.href='${contextPath}/business/goods/calHistory.do?date1='+date1+'&date2='+date2;
    	});
    });
});
}
/*if(("${member.auth}" == "1") && ("${isLogOn}" == "true")){
	alert("사업자 권한이 필요합니다.");
	document.location.href = "/yologaza/business_main.do";
}else if(('${member}' == '') || ('${member}' == null)){
	alert("로그인이 필요합니다.");
	document.location.href = "/yologaza/businessMember/business_loginForm.do";
}*/
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
          <a href="${contextPath}/business/goods/reservationManagement.do">예약 관리</a>
          <a href="${contextPath}/business/goods/reservationHistory.do">예약 내역</a>
          <a href="${contextPath}/business/goods/calHistory.do" class="active">정산 내역</a>
          <a href="${contextPath}/business/goods/salesHistory.do">매출 내역</a>
        </div>
      </div>
    <div class="content">
      <div class="content_top_wrap">
      <div class="content_top">
      	<table align="center">
      		<tr align="center">
      			<td class="left">입금 계좌정보</td>
      			<td class="right"><p>계좌</p></td>
      		</tr>
      		<tr align="center">
      			<td class="left">정산 및 입금 안내</td>
      			<td class="right">
      				<p>1. 정산된 금액은 위 계좌정보로 입금됩니다.</p>
      				<p>2. 정산주기는 매주 수요일 일괄 정산됩니다.</p>
      				<p>&nbsp&nbsp&nbsp*단, 정산일인 수요일이 공휴일인 경우 다음날 정산되며,</p>
      				<p>&nbsp&nbsp&nbsp3일이상 공휴일인 경우는 정산일이 호스트하우스 공지사항에 안내됩니다.</p>
      				<p>3. 정산금이 상이한 경우 고객센터에 접수해 주시면, 담당부서에서 확인 후 빠르게</p>
      				<p>&nbsp&nbsp&nbsp안내 도와드리겠습니다.</p>
      			</td>
      		</tr>
      	</table>
      </div>
      </div>
      <div class="content_mid">
      	<div class="date_search">
			<div class="date-box-wrap" style="display: inline-block; float: right;">
	          	<input type="text" id="cal" name="daterange" value="${Ddate1}/ - ${Ddate2}"/>
	          	<i class="far fa-calendar-alt"></i>
	        </div>
       		<button id="dateApplyBtn">검색</button>
      	</div>
      </div>
      <div class="content_bot">
      	<div class="calculate">
      	</div>
      	<table align="center">
	          <tr align="center" class="column">
	          </tr>
      	</table>
      </div>
      </div>
  </section>
</body>
</html>