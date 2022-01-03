<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>swal ( "500" ,  "error" ,  "error" );</script>
</head>
<body>
</body>
</html>