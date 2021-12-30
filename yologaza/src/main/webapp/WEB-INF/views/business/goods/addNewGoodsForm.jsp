<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='goods' id='f_goods' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='room"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  
  
  function fn_add_new_goods(obj){
		 fileName = $('#f_goods').val();
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
	<form action="${contextPath}/business/goods/addNewGoods.do" method="post"  enctype="multipart/form-data">
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
					<tr>
						<td >숙박 시설</td>
						<td>
						<select name="goods_type">
						  <option value="motel"  >모텔</option>
						  <option value="hotel" >호텔</option>
						  <option value="pension" >펜션</option>
						  <option value="resort" >리조트</option>
						  <option value="guestHouse" >게스트하우스</option>
						  <option value="camping" >캠핑/글램핑</option>
						  <option value="hanok" >한옥</option>
						</select>
						</td>
					</tr>
					<tr >
						<td >숙소이름</td>
						<td><input name="goods_name" type="text" size="40" /></td>
					</tr>
					<tr >
						<td >숙소주소</td>
						<td><input name="goods_address" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >숙소 이메일</td>
						<td><input name="goods_email1" type="text" size="16" />@<input name="goods_email2" type="text" size="16" /></td>
					</tr>
					<tr>
						<td >숙소 핸드폰 번호</td>
						<td><input name="goods_hp" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >숙소 연락처</td>
						<td><input name="goods_tel1" type="text" size="10" />-<input name="goods_tel2" type="text" size="10" />-<input name="goods_tel3" type="text" size="10" /></td>
					</tr>
	
					<tr>
						<td >계좌은행</td>
						<td><input name="account_bank" type="text" size="40" /></td>
					</tr>
					
					
					<tr>
						<td >계좌주 이름</td>
						<td><input name="account_name" type="text" size="40" /></td>
					</tr>
					
					<tr>
						<td >계좌번호</td>
						<td><input  name="account"  type="text" size="40" /></td>
					</tr>
					
					<tr>
						<td >숙소 홈페이지</td>
						<td><input name="goods_homePage" type="text" size="40" /></td>
					</tr>
					
					<tr>
						<td >숙소 설명</td>
						<td><input name="goods_description" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >숙소 기초 정보</td>
						<td><input name="goods_baseImpormation" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >예약취소 가능여부</td>
						<td>
						<select name="goods_chargeImpormation">
						  <option value="예약취소 가능"  >예약취소 가능</option>
						  <option value="예약취소 불가능" >예약취소 불가능</option>
						</select>
						</td>
					</tr>
					<tr>
						<td >이용시간</td>
						<td>
							<div class="checkIn">
								<span>체크인 가능시간</span>
								<select name="goods_checkIn">
									<option value="13" selected>오후 01:00</option>
									<option value="14">오후 02:00</option>
									<option value="15">오후 03:00</option>
									<option value="16">오후 04:00</option>
									<option value="17">오후 05:00</option>
									<option value="18">오후 06:00</option>
									<option value="19">오후 07:00</option>
									<option value="20">오후 08:00</option>
								</select>
							</div>
							<div class="checkOut">
								<span>체크아웃 가능시간</span>
								<select name="goods_checkOut">
									<option value="10" selected>오전 10:00</option>
									<option value="11">오전 11:00</option>
									<option value="12">오후 12:00</option>
									<option value="13">오후 01:00</option>
									<option value="14">오후 02:00</option>
									<option value="15">오후 03:00</option>
									<option value="16">오후 04:00</option>
									<option value="17">오후 05:00</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td >숙박 가격</td>
						<td><input name="goods_price1" type="text" size="40" /></td>
					</tr>
					<tr>
						<td >대실 가격</td>
						<td><input name="goods_price2" type="text" size="40" /></td>
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
					  <input  type="button" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)">
				  </td>
				</tr>
		 </table>
	</center>	 
	</div>
	</form>
</body>