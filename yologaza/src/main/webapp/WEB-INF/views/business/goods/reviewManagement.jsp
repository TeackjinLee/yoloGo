<!-- 기여도 : 송상우100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<!DOCTYPE html>
<meta charset="utf-8">

<head>
<style>
	.sub_top_wrap{
	  height: 150px;
	  background:rgb(52, 152, 219);
	}
	.sub_top{
	  position:relative;
	  width:1024px;
	  height:150px;
	  margin:0 auto;
	  border-radius:0;
	  text-align:left;
	}
	
	.sub_top a{
		position: absolute;
	    color: #ddd;
	    font-weight: 500;
	    font-size: 32px;
	    bottom:20px;
	    text-align: center;
	}
	.sub_top a{
		color:#ddd;
	}
	.sub_top a:nth-child(1){
		color:white;
	}
	.sub_top a:nth-child(1) i{
		color:white;
		margin-left:15px;
	}
	.sub_top a div{
		font-size:24px;
		margin-bottom:15px;
		margin-left:15px;
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
  		width : 300px;
  		height: 40px;
  		cursor : pointer;
  		font-size : 16px;
  		position : relative;
  		box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
  		z-index:1;
	}
	.dropdown{
  		position : relative;
  		display : inline-block;
  		margin:40px 0;
	}

	.dropdown-content{
  		display : none;
  		font-weight: 400;
  		background-color: #fff;
  		min-width : 300px;
  		border-radius: 8px;
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
	
	.dropdown_wrap{
		display:flex;
    	justify-content: center;
    	height:120px;
	}
</style>
<script>
	if(("${member.auth}" == "1") && ("${isLogOn}" == "true")){
		alert("사업자 권한이 필요합니다.");
		document.location.href = "/yologaza/business_main.do";
	}else if(('${member}' == '') || ('${member}' == null)){
		alert("로그인이 필요합니다.");
		document.location.href = "/yologaza/businessMember/business_loginForm.do";
	}
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
	});
</script>
</head>
<body>
<section>
	  <div class="sub_top_wrap">
        <div class="sub_top">
          <a href="${contextPath}/business/goods/reviewManagement.do"><i class="fas fa-edit"></i><div>리뷰관리</div></a>
        </div>
      </div>
      <div class="dropdown_wrap">
      <div class="dropdown">
                    <button class="dropbtn">
                      <span class="dropbtn_content">숙소이름</span>
                    </button>
                    <div class="dropdown-content" style="height : 135px;">
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reviewManagement.do?type=0"'>숙소이름1</div>
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reviewManagement.do?type=1"'>숙소이름2</div>
                      <div class="type" onclick='location.href="${contextPath}/business/goods/reviewManagement.do?type=2"'>숙소이름3</div>
                  	</div>
              </div>
              </div>
                  <table align="center" width="100%" style="margin-top:20px;"  >
					  <tr height="10" align="center" style="height:30px; color:white; font-weight:bold; background-color:rgb(112, 173, 71);">

					  </tr>
					<c:choose>
					  <c:when test="${articlesList ==null }" >
					    <tr  height="10">
					      <td>
					         <p align="center">
					            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
					        </p>
					      </td>  
					    </tr>
					  </c:when>
					  
					  <c:when test="${articlesList !=null }" >
					    <c:forEach  var="article" items="${articlesList}" varStatus="articleNum" >
						    <c:choose>
							    <c:when test="${article.goods_id == goods.goods_id}" >
								    <tr align="center" style=" height:80px; box-shadow: 3px 3px 3px #ddd;">
									<td id="board_head" width="5%">
										<div class="member_img"><img src="${contextPath}/mem_download.do?uid=${article.uid}&memFileName=${article.memFileName}" alt="리뷰 사진"	/></div>
									</td>
									<td style="visibility: hidden;" width="1%">${articleNum.count}</td>
									<td width="10%">${article.id }</td>
									<td align='left'  width="60%">
									  <span style="padding-right:30px"></span>
									   <c:choose>
									      <c:when test='${article.level > 1 }'>
									     	
									         <c:forEach begin="1" end="${article.level }" step="1">
									              <span style="padding-left:5px"></span>
									         </c:forEach>
									         <span style="font-size:12px;">[답변]</span>
								                   <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
									          </c:when>
									          <c:otherwise>
									            
									            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
									          </c:otherwise>
									        </c:choose>
									  </td>
								      <td width="auto">
									     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
									     <img onerror="this.src='${contextPath}/resources/image/1px.gif'" src="${contextPath}/thumbnails.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"   /><br>
									   </td> 
									  <td  width="10%">${article.writeDate}</td>
									</tr>
								</c:when>
							</c:choose>
					    </c:forEach>
					    </c:when>
					    </c:choose>
					</table>
      <div id="button" style="margin: 0 auto; margin-top:30px; text-align: center;">
        <input  type="submit" value="저장 후 다음 단계"  onClick="fn_add_new_goods(this.form)" style="width:150px; cursor:pointer;">
      </div>
 </section>
</body>