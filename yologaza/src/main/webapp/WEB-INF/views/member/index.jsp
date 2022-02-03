<!-- 기여도: 이택진20% / 윤진80% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>   
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=53670056b11ef5a86e82087f6eccf7d9&redirect_uri=http://localhost:8080/yologaza/kakaologin&response_type=code">
            <img src="/img/kakao_login/ko/kakao_login_medium_wide.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
</body>
</html>