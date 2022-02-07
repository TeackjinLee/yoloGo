<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOLO가자!</title>
    <script src="${contextPath}/resources/jquery/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>
    
    
	body{
		margin:0;
	}
      #container {
      display:flex;
      flex-direction:column;
      min-height:100vh;
        width: 100%;
        margin: 0px auto;
          text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 50px;
      }
      #sidebar-left {
        width: 15%;
        height:100px;
        padding: 5px;
        float:left;
        margin-right: 5px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content {
      flex:1;
      }
      #footer {
        clear: both;
		margin-top: 150px;
        border: 0px solid #bcbcbc;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>