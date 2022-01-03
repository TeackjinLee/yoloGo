<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='goods' id='f_goods' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='goods"+cnt+"' />");
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
  
  
  function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	      if(fullRoadAddr !== ''){
	        fullRoadAddr += extraRoadAddr;
	      }

	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	      document.getElementById('roadAddress').value = fullRoadAddr;
	      document.getElementById('jibunAddress').value = data.jibunAddress;

	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	      if(data.autoRoadAddress) {
	        //예상되는 도로명 주소에 조합형 주소를 추가한다.
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	      } else if(data.autoJibunAddress) {
	          var expJibunAddr = data.autoJibunAddress;
	          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	      } else {
	          document.getElementById('guide').innerHTML = '';
	      }
	      
	     
	    }
	  }).open();
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
					<tr>
						<td >상품 작성자 번호</td>
						<td><input name="uid" type="text" value="${member.uid}" size="40" readonly/></td>
					</tr>
					<tr >
						<td >숙소이름</td>
						<td><input name="goods_name" type="text" size="40" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td>
						   <input type="text" id="zipcode" name="zipcode" size="10" > <button><a href="javascript:execDaumPostcode()">우편번호검색</a></button>
						  <br>
						  <p> 
						   지번 주소:<br><input type="text" id="roadAddress"  name="roadAddress" size="50"><br><br>
						  도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
						  나머지 주소: <input type="text"  name="namujiAddress" size="50" />
						 <!--   <span id="guide" style="color:#999"></span> -->
						   </p>
						</td>
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
									<option value="13:00" selected>오후 01:00</option>
									<option value="14:00">오후 02:00</option>
									<option value="15:00">오후 03:00</option>
									<option value="16:00">오후 04:00</option>
									<option value="17:00">오후 05:00</option>
									<option value="18:00">오후 06:00</option>
									<option value="19:00">오후 07:00</option>
									<option value="20:00">오후 08:00</option>
								</select>
							</div>
							<div class="checkOut">
								<span>체크아웃 가능시간</span>
								<select name="goods_checkOut">
									<option value="10:00" selected>오전 10:00</option>
									<option value="11:00">오전 11:00</option>
									<option value="12:00">오후 12:00</option>
									<option value="13:00">오후 01:00</option>
									<option value="14:00">오후 02:00</option>
									<option value="15:00">오후 03:00</option>
									<option value="16:00">오후 04:00</option>
									<option value="17:00">오후 05:00</option>
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