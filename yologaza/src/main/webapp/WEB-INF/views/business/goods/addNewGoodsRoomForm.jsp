<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageListRoom }"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<head>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='room' id='f_room' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='room"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  
  function fn_add_new_room(obj){
		 fileName = $('#f_room').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
		 
	}
</script>    
</head>

<body>
	<form action="${contextPath}/business/goods/addNewGoodsRoom.do" method="post"  enctype="multipart/form-data">
	<h1>새상품 등록창</h1>
	<div class="tab_container">
		<!-- 내용 들어 가는 곳 -->
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">상품정보</a></li>
				<li><a href="#tab2">상품목차</a></li>
				<li><a href="#tab3">상품저자소개</a></li>
				<li><a href="#tab4">상품소개</a></li>
				<li><a href="#tab5">출판사 상품 평가</a></li>
				<li><a href="#tab6">추천사</a></li>
				<li><a href="#tab7">상품이미지</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
				<table >
					<tr >
						<td >숙박번호</td>
						<td><input name="goods_id" type="text" size="40" /></td>
					</tr>
					<tr >
						<td >객실명</td>
						<td><input name="goods_room_name" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >객실 유형</td>
						<td>
						<select name="goods_room_type">
						  <option value="도미토리 혼성"  >도미토리(혼성)</option>
						  <option value="도미토리(남자)" >도미토리(남자)</option>
						  <option value="도미토리(여자)" >도미토리(여자)</option>
						  <option value="개인실" >개인실</option>
						  <option value="독채형(콘도롬)" >독채형(콘도롬)</option>
						</select>
						</td>
					</tr>
					<tr >
						<td >침대 개수</td>
						<td>정원
						<select name="goods_capacity">
						  <option value="2" >2명</option>
						  <option value="3" >3명</option>
						  <option value="4" >4명</option>
						  <option value="5" >5명</option>
						  <option value="6" >6명</option>
						  <option value="7" >7명</option>
						  <option value="8" >8명</option>
						  <option value="9" >9명</option>
						  <option value="10" >10명</option>
						</select>
						</td>
					</tr>
					<tr>
						<td >숙박 가격</td>
						<td><input name="goods_room_price1" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >대실 가격</td>
						<td><input name="goods_room_price2" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >상품 설명</td>
						<td><input name="goods_introduce" type="text" size="40" /></td>
					</tr>
					
				</table>	
				</div>
				<div class="tab_content" id="tab2">
					<h4>책목차</h4>
					<table>	
					 <tr>
						<td ></td>
						<td><textarea  rows="100" cols="80" name=""></textarea></td>
					</tr>
					</table>	
				</div>
				<div class="tab_content" id="tab3">
					<h4>책목차</h4>
					<table>	
					 <tr>
						<td ></td>
						<td><textarea  rows="100" cols="80" name=""></textarea></td>
					</tr>
					</table>
				</div>
				<div class="tab_content" id="tab4">
					<h4>책목차</h4>
					<table>	
					 <tr>
						<td ></td>
						<td><textarea  rows="100" cols="80" name=""></textarea></td>
					</tr>
					</table>
				</div>
				<div class="tab_content" id="tab5">
					<h4>책목차</h4>
					<table>	
					 <tr>
						<td ></td>
						<td><textarea  rows="100" cols="80" name=""></textarea></td>
					</tr>
					</table>
				</div>
				<div class="tab_content" id="tab6">
					<h4>책목차</h4>
					<table>	
					 <tr>
						<td ></td>
						<td><textarea  rows="100" cols="80" name=""></textarea></td>
					</tr>
					</table>
				</div>
				<div class="tab_content" id="tab7">
					<h4>상품이미지</h4>
					<table >
						<tr>
							<td align="right">이미지파일 첨부</td>
				            
				            <td  align="left"> <input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
				            <td>
					            <div id="d_file">
					            </div>
				            </td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	<center>	
		 <table>
		 <tr>
				  <td align=center>
					<!--   <input  type="submit" value="상품 등록하기"> --> 
					  <input  type="button" value="상품 등록하기"  onClick="fn_add_new_room(this.form)">
				  </td>
				</tr>
		 </table>
	</center>	 
	</div>
	</form>
</body>