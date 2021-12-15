<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>swal ( "404" ,  "error" ,  "error" );</script>
</head>
<body>
</body>
</html>