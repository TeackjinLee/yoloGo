<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="room"  value="${goodsRoomMap.roomVO}"  />
<c:set var="roomImageList"  value="${goodsRoomMap.roomImageList}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<%

String goods_id = request.getParameter("goods_id");
System.out.println("goods_id :"+goods_id);

%>
<head>
	<script type="text/javascript">
	  var cnt=0;goods_uroom_detail
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
	  
		function fn_enable(obj){
			document.getElementById("goods_room_type").disabled=false;
			document.getElementById("goods_capacity").disabled=false;
			document.getElementById("goods_introduce").disabled=false;
			document.getElementById("goods_room_price1").disabled=false;
			document.getElementById("goods_room_price2").disabled=false;
			document.getElementById("tr_btn").style.display="none";
			document.getElementById("tr_btn_modify").style.display="block";
		}
	</script>
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
		.sub_top a:nth-child(4){
			color:white;
		}
		.sub_top a:nth-child(4) i{
			color:white;
		}
		.sub_top a:nth-child(2){
			left:333px;
		}
		.sub_top a:nth-child(3){
			right:333px;
		}
		.sub_top a:nth-child(4){
			right:0;
		}
		.sub_top a div{
			font-size:14px;
		}
		th {
			background-color:rgb(52, 152, 219);
			font-size:12px;
			width:130px;
		}
		div#cent {
			text-align:center;
			margin-top: 50px;
			}
		label {
			font-size:12px;
			display:inline-block;
			width:110px;
			line-height:25px;
			}
		
		input#checkbox {
			border:1px soild ;
			width:10px;
			height:10px;
			margin-right:5px;
			margin-left:5px;
			}
		p {
			font-size:14px;
		  color:#555;
			}
		p#img {
			font-size:14px;
		  color:#555;
			}
		button {
		  width:150px;
		  height:40px;
		  color:black;
		  padding-bottom: 5px;
		  box-sizing: border-box;
		  font-size:16px;
		}textarea{
		  padding:10px;
		  box-sizing:border-box;
		  width: 750px;
		}
		input#zipcode {
			width:200px;
			height:40px;
			font-size:12px;
			margin-bottom:5px;
		  padding:10px;
		  box-sizing:border-box;
			}
		input {
			width:550px;
			height:30px;
			font-size:16px;
			margin-bottom:5px;
		  box-sizing:border-box;
			}
		select{
		  width:150px;
		  height:40px;
		  margin-top:10px;
		}
		section form table{
		  width: 100%;
		  margin: 0 auto;
		  box-sizing: border-box;
		  padding: 40px 50px;
		  border-radius: 15px;
		  box-shadow: 1px 1px 2px 2px #ddd;
		}
		section form table tbody tr:nth-child(1) td{
			border-top:1px solid #999;
		}
		section form table tbody tr:nth-child(1) th{
			border-top:1px solid #999;
		}
		section form table tbody tr td{
		  padding: 20px;
		  box-sizing:border-box;
		  text-align:left;
		  border-bottom: 1px solid #999;
		  border-right: 1px solid #999;
	      box-sizing: border-box;
		}
		section form table tbody tr th{
		  color:white;
		  font-size:16px;
		  border-bottom: 1px solid #999;
		  border-left: 1px solid #999;
		  border-right: 1px solid #999;
	      box-sizing: border-box;
		}
		.fas{
			font-size:50px;
			padding-bottom:10px;
			box-sizing: border-box;
			color: #eee;
		}
		#tr_btn_modify{
	       display:none;
	     }
	</style>  
</head>
<body>
	<section>
		<div class="sub_top_wrap">
	      <div class="sub_top">
	        <a href="${contextPath}/business/goods/viewNewGoods.do?goods_id=<%=goods_id%>"><i class="fas fa-house-user"></i> <div>숙박등록</div></a>
          <a href="#"><i class="fas fa-concierge-bell"></i> <div>서비스등록</div></a>
          <a href="#"><i class="fas fa-calendar-alt"></i> <div>이용약관등록</div></a>
          <a href="${contextPath}/business/goods/viewNewGoodsRoom.do?goods_id=<%=goods_id%>"><i class="fas fa-hotel"></i> <div>객실등록</div></a>
	      </div>
	    </div>
		     <form action="${contextPath}/business/goods/addNewGoodsRoom.do?goods_id=<%=goods_id%>" method="post"  enctype="multipart/form-data" style="width:1024px; min-width:1024px; margin:0 auto;">
	       <div id="cent">
	       <input id="goods_id" name="goods_id" value="<%=goods_id%>" type="text" size="40" style="visibility: hidden;" readonly/>
	       <input id="goods_uid" name="uid" value="${goods.uid}" type="text" size="40" style="visibility: hidden;" readonly/>
	         
	       <h3>[객실 등록 창]</h3>
	       </div>
	        <table cellspacing="0">
	         <tbody>
	          <tr>
	            <th>객실 정보</th>
	            <td>
	              <div><strong>객실 유형</strong></div>
	              <select id="goods_room_type" name="goods_room_type" disabled>
	              	<option value="${room.goods_room_type }" selected>${room.goods_room_type }</option>
	                <option value="도미토리 혼성"  >도미토리(혼성)</option>
	                <option value="도미토리(남자)" >도미토리(남자)</option>
	                <option value="도미토리(여자)" >도미토리(여자)</option>
	                <option value="개인실" >개인실</option>
	                <option value="독채형(콘도롬)" >독채형(콘도롬)</option>
	              </select>
	              <div style="margin-top:20px;"><strong>침대 개수</strong></div>
	              <select id="goods_capacity" name="goods_capacity" disabled>
	              	<option value="${room.goods_capacity }" selected>${room.goods_capacity }명</option>
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
	             <th>이미지 정보<br> (최대 15장)</th>
	              <td>
	                <p>
	                  * 객실의 전반적인 이미지를 업로드 해주시기 바랍니다. <br>
	                  * 이미지 교체를 원하시면 "변경"을 선택하시고 삭제를 원하시면 우측 "삭제"를 선택하시기 바랍니다. <br>
	                  * 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등<br>
	                  * 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다. <br><br></p>
						<ul>
						<c:forEach var="item" items="${goodsRoomMap.roomImageList}" >
							<li class="pic" style="width:204px;height:144px;overflow: hidden; float:left; margin:10px; border:1px solid #ddd; margin-top:30px;"><img src="${contextPath}/goods_download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙박정보 사진" style="width:100%;" /></li>
						</c:forEach>
						</ul> 
				            
	            </td>
	          </tr>
	          <tr>
	             <th>편의시설<br>서비스 안내</th>
	             <td>
	               <textarea id="goods_introduce" name="goods_introduce" rows="20" cols="110" maxlength="1000" placeholder="도미토리 : 객실 내 침대 구성 및 구비 물품 등을 자세히 기재해 주세요.                                                                  개인실 : 객실 내 전용 욕실 여부 및 침대 구성과 구비 물품 등을 자세히 기재해 주세요.                                                           독채 : 객실 구조 및 침대 구성, 취사 구비 물품 등을 자세히 기재해 주세요."
	               			disabled>${room.goods_introduce }</textarea>
	
	             </td>
	           </tr>
	           <tr>
	             <th>요금설정</th>
	             <td>
	               <div style="margin-bottom:10px;"><strong>숙박 가격</strong></div>
	               <input id="goods_room_price1" name="goods_room_price1" value="${room.goods_room_price1}" type="text" style="width:auto;" disabled/><storong style="padding-left:10px; font-size:16px;">원</storong>
	               <div style="margin-top:20px; margin-bottom:10px;"><strong>대실 가격</strong></div>
	               <input id="goods_room_price2" name="goods_room_price2" value="${room.goods_room_price2}" type="text" style="width:auto;" disabled/><storong style="padding-left:10px; font-size:16px;">원</storong>
	             </td>
	           </tr>
	      </tbody>
	     </table>
		<div id="tr_btn_modify" align="center" style="margin: 0 auto; margin-top:30px; text-align: center;">
			<div>
				<input type=button value="수정반영하기"   onClick="fn_modify_goods(frmGoods)" style="width:150px; cursor:pointer;">
				<input type=button value="취소"  onClick="backToList(frmGoods)" style="width:150px; cursor:pointer;">
			</div>   
		</div>
		<div id="tr_btn" style="margin: 0 auto; margin-top:30px; text-align: center;">
			<c:if test="${member.uid == goods.uid }">
				<input type=button value="수정하기" onClick="fn_enable(this.form)" style="width:150px; cursor:pointer;">
			</c:if>
			<input  type="button" value="저장 후 다음 단계"  onClick="fn_add_new_room(this.form)" style="width:150px; cursor:pointer;">
		</div>
	  </form>
	
	</section>
</body>