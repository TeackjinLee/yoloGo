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
  width:600px;
}

td {
    border: 1px solid #444444;
  }

.column{
  background-color:rgba(0,0,0,0.2);
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

.time_div{
    position: relative;
    display: inline-block;
    margin-left: auto;
}

.price{
	width: 200px;
}
</style>
<script type="text/javascript">
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
          <a href="${contextPath}/business/goods/reservationHistory.do">예약 취소 내역</a>
          <a href="${contextPath}/business/goods/calHistory.do">정산 내역</a>
          <a href="${contextPath}/business/goods/salesHistory.do" class="active">매출 내역</a>
        </div>
      </div>
    <div class="content">
      <div class="content_top_wrap">
      <div class="content_top">
       <div class="time_div">
       		<button type="button" class="time_button" onclick="location.href='${contextPath}/business/goods/salesHistory.do?term=4'">년간</button>
       		<button type="button" class="time_button" onclick="location.href='${contextPath}/business/goods/salesHistory.do?term=3'">월간</button>
       		<button type="button" class="time_button" onclick="location.href='${contextPath}/business/goods/salesHistory.do?term=2'">주간</button>
       		<button type="button" class="time_button" onclick="location.href='${contextPath}/business/goods/salesHistory.do?term=1'">일간</button>
       </div>
      </div>
      </div>
      <table align="center">
	          <tr align="center" class="column">
      			<c:if test="${term == 4}">
	            <td><b>년도</b></td>
	            </c:if>
	            <c:if test="${term == 3}">
	            <td><b>월</b></td>
	            </c:if>
	            <c:if test="${term == 2}">
	            <td><b>주</b></td>
	            </c:if>
	            <c:if test="${term == 1}">
	            <td><b>일</b></td>
	            </c:if>
	            <td class="price"><b>매출</b></td>
	            <td class="price"><b>정산금액</b></td>
	          </tr>
	    	<c:forEach var="sales_h" items="${selectSalesHistory}">     
        		<tr align="center" class="data">
        		<c:choose>
        		<c:when test="${sales_h.date != null}">
	              <td>${sales_h.date}</td>
	            </c:when>
	            <c:otherwise>
	            	<td>합계</td>
	            </c:otherwise>
	            </c:choose>
	              <td>${sales_h.sum}</td>
	              <td><fmt:parseNumber value="${sales_h.sum * 0.9}" integerOnly="true"/></td>
        		</tr>
        	</c:forEach>
      </table>
      </div>
  </section>
</body>
</html>