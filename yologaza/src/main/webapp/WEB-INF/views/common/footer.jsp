<%-- 기여도 : 송상우 100% --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
footer{
  position:relative;
  padding:10px 16px 180px 16px;
  background:rgb(200,200,200);
}
a{text-decoration:none}

ul,ol,li{list-style:none}

footer{
	text-align: left;
}

footer div ul{
	display: block;
    list-style-type: disc;
    margin-block-start: 0em;
    margin-block-end: 0em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 0px;
}


footer .link li{
    display:inline-block;
}
footer div ul li a{
  color:rgba(0,0,0,0.38);
}
footer div address{
  color:rgba(0,0,0,0.38);
  font-style:normal;
  padding:20px 0 0 0;
  float:left;
  background:rgb(200,200,200);
  line-height:30px;
}
footer div .sc{
  float:right;
  background:rgb(200,200,200);
  padding-top: 90px;
  font-size: 10px;
}
footer div .sc a{
  color:#ffffff;
  margin-left: 20px;
}
</style>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<footer>
        <div class="align con">
            <ul class="link">
                <li>
                    <a href="#" target="_blank">회사소개</a>
                    <span>｜</span>
                </li>
                <li>
                    <a href="#" target="_blank">이용약관</a>
                    <span>｜</span>
                </li>
                <li>
                    <a href="#" target="_blank">개인정보처리방침</a>
                    <span>｜</span>
                </li>
                <li>
                    <a href="#" target="_blank">사업자 정보확인</a>
                    <span>｜</span>
                </li>
                <li>
                    <a href="#" target="_blank">YOLO가자! 호텔</a>
                    <span>｜</span>
                </li>
                <li>
                    <a href="#" target="_blank">콘텐츠산업진흥에의한 표시</a>
                </li>
            </ul>
            <address>
                <span>(주)YOLO가자!</span>
                <br>
                주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층
                <br>
                대표이사:6조
                <br>
                Copyright YOLO가자! All rights reserved.
            </address>
            <div class="sc">
                  <a href="#" target="_blank"  class="fab fa-facebook fa-4x"></a>
                  <a href="#" target="_blank" class="fab fa-instagram fa-4x"></a>
            </div>
        </div>
    </footer>
</body>
</html>