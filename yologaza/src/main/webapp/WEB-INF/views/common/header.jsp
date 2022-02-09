<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style>
	#board_head_wrap .member_img img{
		width: 100%;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	#toggleBtn:checked ~ #toggleBtnOn{
		color: white;
		padding: 6px;
    	box-sizing: border-box;
	}
</style>
<meta charset="UTF-8">
<title>헤더</title>
	<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
	<style>
		#board_head_wrap .member_img{
		     	    position: relative;
				    top: -5px;
				    float: right;
				    width: 30px;
				    height: 30px;
				    border-radius: 15px;
				    overflow: hidden;
				    border:1px solid #ddd;
		     }
		     #board_head_wrap .member_img img{
		     	width: 100%;
		     }
		     #head_link ul li {
			    height: 20px;
			}
			#user_header .sub-menu-box ul li:hover{
				color:rgb(112, 173, 71);
				font-weight:bold;
			}
			
			#toggleBtnOn::placeholder{
				color:white;
				opacity: 1;
			
			}
	</style>
	<script type="text/javascript">
		var loopSearch=true;
		function keywordSearch(){
			if(loopSearch==false)
				return;
		 var value=document.frmSearch.searchWord.value;
			$.ajax({
				type : "get",
				async : true, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/keywordSearch.do",
				data : {keyword:value},
				success : function(data, textStatus) {
				    var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");
					
				}
			}); //end ajax	
		}
		function displayResult(jsonInfo){
			var count = jsonInfo.keyword.length;
			if(count > 0) {
			    var html = '';
			    for(var i in jsonInfo.keyword){
				   html += "<a style='display:none;' href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
			    }
			    var listView = document.getElementById("suggestList");
			    listView.innerHTML = html;
			    show('suggest');
			}else{
			    hide('suggest');
			} 
		}
		
		function select(selectedKeyword) {
			 document.frmSearch.searchWord.value=selectedKeyword;
			 loopSearch = false;
			 hide('suggest');
		}
			
		function show(elementId) {
			 var element = document.getElementById(elementId);
			 if(element) {
			  element.style.display = 'block';
			 }
			}
		
		function hide(elementId){
		   var element = document.getElementById(elementId);
		   if(element){
			  element.style.display = 'none';
		   }
		}
		
	</script>
</head>
<body>
	<div class="wrap main_wrap show">
	  <!-- Header -->
	  <header>
	  
	    <div id="head_link" class="con">
	      <ul class = "row">
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class = cell-r style="padding-right:10px"><a href="${contextPath}/mypage/Mypage1.do"><div id="board_head_wrap">
																					<div class="member_img">
																					<c:choose>
																						<c:when test="${member.memFileName != null and member.kakaoImg == null}">
																							<img onerror="this.src='${contextPath}/resources/image/noImage.jpg'" src="${contextPath}/mem_download.do?uid=${member.uid}&memFileName=${member.memFileName}" alt="사용자 사진"	/>
																						</c:when>
																						<c:otherwise>
																							<img onerror="this.src='${contextPath}/resources/image/noImage.jpg'" src="${member.kakaoImg}" alt="사용자 사진"	/>
																						</c:otherwise>
																					</c:choose>
																					
																					</div>
																					<div style="float:left;">${member.name}님&nbsp;&nbsp;</div>
																				</div></a></li>
	      			<li class = cell-r><a href="${contextPath}/cart/myCartList.do"><i class="far fa-heart" style="color: rgb(192, 57, 43);"></i>&nbsp;찜하기</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/logout.do">로그아웃</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/member/agreeForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      </ul>
	    </div>
	    <section id="user_header" style="background-color:rgb(112, 173, 71)">
	      <div class="menu con">
	        <div id = "logo"><a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/yolo-logo-w.png" alt="YOLO가자로고"></a></div>
	        <div class="menu-bar row">
		        <div id="search" class="cell">
		            <form name="frmSearch" action="${contextPath}/searchWorld.do" >
		              <input type="checkbox" id="toggleBtn">
		              <label for="toggleBtn" class="toggleBtn">&nbsp;&nbsp; &nbsp;</label>
					  <!--  <input type="submit" name="search" class="btn1"  value="검 색" > -->
		              <input name="searchWord" id="toggleBtnOn" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="지역, 숙소명" >
		              <input type="submit" name="search" class="btn1"  value="검 색" style="display: none;">
		            </form>
	             </div>
		         <div id="suggest" class="cell">
		                <div id="suggestList"></div>
		          </div>
           		<!--  
				<div id="search" class="cell">
				 <form name="frmSearch" action="" >
				   <input type="submit" name="search" class="btn1"  value="검 색" >
				   <input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="지역, 숙소명" >
				  </form>
				</div>
				<div id="suggest" class="cell">
				      <div id="suggestList"></div>
				 </div>
				 -->
	          <ul class="gnb-list row cell">
	            <li class="cell">
	              <div>숙박종류</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=my">내주변</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=motel">모텔</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=hotel">호텔</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=pension">펜션</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=resort">리조트</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=guestHouse">게스트하우스</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=camping">캠핑/글램핑</a></li>
	                  <li><a href="${contextPath}/searchGoods.do?goods_type=hanok">한옥</a></li>
	              </div>  
	             </li>
	            <li class="cell">
					<c:choose>
			      		<c:when test="${isLogOn == true  && member!= null}">
			      			<a href="${contextPath}/mypage/Mypage3.do">예약내역</a>
			      		</c:when>
			      		<c:otherwise>
			      			<a href="${contextPath}/member/loginForm.do">예약내역</a>
			      		</c:otherwise>
			      	</c:choose>
	            </li>
	            <li class="cell">
	              <a href="#">매장안내</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="#">회사소개</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	              <div>고객센터</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/announceList.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/frequentList.do">자주 묻는 질문</a></li>
	                  <li><a href="${contextPath}/CC/inPersonQuestion.do">1:1 문의</a></li>
	                </ul>
	              </div>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </section>
	  </header>
	</div>
</body>
</html>