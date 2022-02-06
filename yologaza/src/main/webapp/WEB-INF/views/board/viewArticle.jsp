<!-- 기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<%-- 
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />

 --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
     #board{
		max-width: 1050px;
		margin: 0 auto;
		background: white;
		margin-top:20px;
		padding: 5px 30px;
    	box-sizing: border-box;
    	border-radius: 15px;
    	box-shadow: 10px 10px 10px #ddd;
     }
     #board_head{
     	margin: 0 auto;
     	width: 100%;
     	height: 50px;
     	text-align: left;
     	margin-top: 10px;
     }
     #board_head .member_img{
     	float: left;
	    width: 40px;
	    height: 40px;
	    border-radius: 20px;
	    overflow: hidden;
	    position: relative;
	    border: 1px solid #ddd;
     }
     #board_head .member_img img{
     	width: 100%;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
     }
     #board_head .board_box{
     	float:left;
     	margin-left:10px;
     }
     #board_head .board_box .board_id{
		font-weight: bold;
     }
   	 #board_head h1 a{
   	 	display:none;
   	 }
   	 #board_head .cancel{
   	 	display: none;
   	 }
   	 .review-img-box{
   	 	width:100%;
   	 	height: 500px;
   	 	overflow:hidden;
   	 	position:relative;
   	 }
   	 .review-img-box img{
   	 	height: 100%;
	    position: absolute;
	    top: 0;
	    left: 50%;
	    transform: translateX(-50%);
	    border-radius: 15px;
   	 }
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/goods/goodsInformation.do?goods_id=${article.goods_id }";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body style="background:rgb(240,242,245);">
  <form id="board" name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center" style="margin:0 auto; width:100%;">
	<div id="board_head">
		<div class="member_img"><img src="${contextPath}/mem_download.do?uid=${article.uid}&memFileName=${article.memFileName}" alt="리뷰 사진"	/></div>
		<div class="board_box">
			<div class="board_id">${article.id }</div>
			<div class="board_date">${article.writeDate}</div>
		</div>
		<div class="cancel" style="float:right;">
			<a href="${contextPath}/main.do">
				<span style="font-size:24px; font-weight:bold;">x</span>
			</a>
		</div>
		<div style="text-align:right;"><h1><a href="${contextPath}/main.do">x</a></h1></div>
	</div>  
	<c:choose> 
		<c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
			<input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
			<div class="review-img-box">
				<img onerror="this.src='${contextPath}/resources/image/1px.gif'" src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br>
			</div>
		 <tr>
		   <td style="float:right; width:180px;">
		      <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
		   </td>
		 </tr> 
		</c:when>
		<c:otherwise>
		   <tr  id="tr_file_upload" >
		    <td>
		      <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
		    </td>
		   </tr>
		<tr>
			<td style="float:right; width:180px;">
				<img id="preview"  /><br>
				<input  type=file  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"	/>
			</td>
		</tr>
		</c:otherwise>
	</c:choose>
  <tr>
   
   <td >
    <input type="hidden"  value="${article.articleNO }"  disabled />
    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
    <input type="hidden" name="goods_id" value="${article.goods_id }"  disabled />
   </td>
  </tr>
  
  <tr>
   <td>
    <input type=text value="${article.title }"  name="title"  id="i_title" style="width:100%; float:left; margin-bottom:10px; font-weight:bold; font-size:18px; padding:5px; box-sizing:border-box;" disabled />
   </td>   
  </tr>
  <tr>
   <td>
    <textarea rows="20" cols="140" style="width:100%; padding: 10px; box-sizing:border-box;"  name="content"  id="i_content"  disabled >${article.content }</textarea>
   </td>  
  </tr>
 <%-- 
 <c:if test="${not empty imageFileList && imageFileList!='null' }">
	  <c:forEach var="item" items="${imageFileList}" varStatus="status" >
		    <tr>
			    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
			      이미지${status.count }
			   </td>
			   <td>
			     <input  type= "hidden"   name="originalFileName" value="${item.imageFileName }" />
			    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview"  /><br>
			   </td>   
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
			    </td>
			 </tr>
		</c:forEach>
 </c:if>
 	 --%>    
 	 
  
  
  <tr   id="tr_btn_modify"  align="center"  >
	   <td colspan="2">
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center" style="padding: 20px; box-sizing: border-box;">
       <c:if test="${member.id == article.id }">
	      <input style="cursor:pointer;padding: 5px;font-weight: bold;box-sizing: border-box;" type=button value="수정하기" onClick="fn_enable(this.form)">
	      <input style="cursor:pointer;padding: 5px;font-weight: bold;box-sizing: border-box;" type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
	    </c:if>
	    <input style="cursor:pointer;padding: 5px;font-weight: bold;box-sizing: border-box;" type=button value="숙소로 가기"  onClick="backToList(this.form)">
	    <input style="cursor:pointer;padding: 5px;font-weight: bold;box-sizing: border-box;" type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/board/replyForm.do?goods_id=${article.goods_id}', ${article.articleNO})">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>