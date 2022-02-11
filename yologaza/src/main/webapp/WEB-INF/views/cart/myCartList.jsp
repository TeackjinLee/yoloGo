<%-- 1차 송상우 100% --%>
<%-- 2차 이택진 100% --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--예약 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 예약비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<html>
<head>

<style>
	body{
	  font-size: 14px;
	}
	.wrap.show{
	  opacity: 1;
	  visibility: visible;
	}
	
	.wrap{
	  width: 100%;
	  background:#fff;
	}
	
	
	ul,
	li {
	    list-style: none;
	}
	
	a {
	    color: inherit;
	    text-decoration: none;
	}
	
	html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	    margin: 0;
	    padding: 0;
	    border: 0;
	    box-sizing: border-box;
	}
	
	.sub_wrap .align_rt {
	    float: left;
	    width: 1024px;
	  margin-bottom:100px;
	}
	
	.wrap{
	  width:100%;
	  background:#fff;
	}
	
	.sub_top_wrap{
	  height: 120px;
	  background:rgb(112,173,71);
	}
	
	.sub_top{
		position:relative;
	  width:1024px;
	  height:120px;
	  margin:0 auto;
	  border-radius:0;
		text-align:left;
	}
	
	.sub_top a{
		position: absolute;
	    color: white;
	    font-weight: 500;
	    font-size: 32px;
	    bottom:20px;
	}
	
	
	.content{
	  overflow:hidden;
	}
	
	.sub_wrap{
	  width: 1024px;
	  margin:0 auto 0 auto;
	  padding-top:54px;
	  padding-bottom:54px;
	}
	
	.tab_each {
	    border-top: none;
	}
	
	.tab_each {
	    clear: both;
	    display:block;
	  padding-top:8px;
	    text-align:left;
	}
	
	div {
	    display: block;
	}
	
	
	.wrap.show, footer.show {
	    opacity: 1;
	    visibility: visible;
	}
	
	.wrap {
	    width: 100%;
	    background: #fff;
	    opacity: 0;
	    visibility: hidden;
	}
	
	.tab{
		text-align:left;
	}
	.tab .tab_btn ul li{
	  display:inline-block;
	}
	.tab .tab_btn ul li a{
	  color:black;
	  font-size:20px;
	  font-weight:500;
	  margin-left:4px;
	  bottom:0px;
	  position:absolute;
	}
	
	.tab .tab_btn ul li #allsel{
	  display:none;
	}
	
	.tab .tab_btn ul li label{
	  border : 3px solid rgba(0,0,0,0.2);
	  border-radius : 4px;
	  width:20px;
	  height:20px;
	  cursor:pointer;
	  display: inline-block;
	}
	
	.tab .tab_btn ul li #allsel:checked + label::after{
	  content:"\f00c";
	  font-family:"Font Awesome 5 Free";
	  font-weight: 600;
	  bottom:5px;
	  position:absolute;
	}
	
	.tab .tab_btn ul #seldelete{
	  position:absolute;
	  right:0px;
	  border:0px;
	  background:#fff;
	  color:rgb(112,173,71);
	  font-size:18px;
	  cursor:pointer;
	}
	
	.tab .tab_btn ul{
	  position:relative;
	}
	
	.tab_each .reservation .img-box{
	  position:relative;
	  width:30%;
	  height:220px;
	  border:1px solid rgba(0,0,0,0.2);
	  border-right: none;
	  display:inline-block;
	  overflow:hidden;
	}
	.tab_each .reservation .img-box img{
	  position:absolute;
	  top:50%;
	  left:50%;
	  transform:translate(-50%,-50%);
	  width:100%;	  
	}
	
	.tab_each .reservation .descript{
	  width:69%;
	  height:220px;
	  border:1px solid rgba(0,0,0,0.2);
	  display:inline-block;
	  position:relative;
	  right:6px;
	  padding:10px 10px 10px 15px;
	  vertical-align:top;
	  font-size:16px;
	}
	.tab_each .reservation .descript .delete{
		float: right;
		padding: 3px 5px;
		border: 1px solid #777;
		border-radius: 5px;
		font-weight: bold;
		margin-left: 10px;
		cursor:pointer;
	}
	.tab_each .reservation .descript .btn{
		float: right;
		width:120px;
		height:31.5px;
		padding: 3px 5px;
		border: 1px solid #777;
		border-radius: 5px;
		font-weight: bold;
		margin-left: 10px;
		cursor:pointer;
		font-size:16px;
		background:white;
	}
	.tab_each .reservation .descript .delete:hover{
		color:white;
		background:rgb(112,173,71);
		border: 1px solid #ddd;
	}
	.tab_each .reservation .descript .btn:hover{
		color:white;
		background:rgb(112,173,71);
		border: 1px solid #ddd;
	}
	.tab_each .reservation .descript a1{
	  font-size:24px;
	}
	
	.tab_each .reservation .descript input{
	  float:right;
	  cursor:pointer;
	}
	
	.tab_each .reservation .descript a2{
	  margin-top:5px;
	  display:block;
	}
	
	.tab_each .reservation .descript a3{
		margin-top: 10px;
		display: block;
		margin-bottom: 70px;
	}
	
	.tab_each .reservation .descript a4{
	  display:inline-block;
	  margin-top:10px;
	}
	
	.tab_each .reservation .descript .detail{
		position: absolute;
		display: block;
		width: 60%;
		bottom: 60px;
		right: 10px;
		font-size: 24px;
		text-align: right;
	}
	
	.detail #type{
	   		    background: rgb(112,173,71);
			    color: white;
			    font-weight: bold;
			    padding: 1px 10px;
			    font-size: 18px;
	    	}
	
	#price{
	  font-weight:bold;
	}

</style>


<script type="text/javascript">
function calcGoodsPrice(bookPrice,obj){
	var totalPrice,final_total_price,totalNum;
	var goods_qty=document.getElementById("select_goods_qty");
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalNum");
	var p_totalPrice=document.getElementById("p_totalPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var h_totalNum=document.getElementById("h_totalNum");
	var h_totalPrice=document.getElementById("h_totalPrice");
	var h_totalDelivery=document.getElementById("h_totalDelivery");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum=Number(h_totalNum.value)+Number(goods_qty.value);
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalPrice.value)+Number(goods_qty.value*bookPrice);
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice+Number(h_totalDelivery.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum=Number(h_totalNum.value)-Number(goods_qty.value);
	//	alert("totalNum:"+ totalNum);
		totalPrice=Number(h_totalPrice.value)-Number(goods_qty.value)*bookPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice-Number(h_totalDelivery.value);
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	
	p_totalNum.innerHTML=totalNum;
	p_totalPrice.innerHTML=totalPrice;
	p_final_totalPrice.innerHTML=final_total_price;
}

function modify_cart_qty(goods_id,bookPrice,index){
	//alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
	}else{
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
	}
		
	var cart_goods_qty=Number(_cart_goods_qty);
	//alert("cart_goods_qty:"+cart_goods_qty);
	//console.log(cart_goods_qty);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		
		success : function(data, textStatus) {
			//alert(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
			}else{
				alert("다시 시도해 주세요!!");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}

function delete_cart_goods(cart_uid){
	var cart_uid=Number(cart_uid);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_uid";
	i_cart.value=cart_uid;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartGoods.do";
    formObj.submit();
}

function fn_order_each_goods(goods_uroom,goods_title,goods_room_price1,fileName){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	
	_order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_room_price1=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_uroom";
    i_goods_title.name="goods_title";
    i_goods_room_price1.name="goods_room_price1";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_uroom;
    i_order_goods_qty.value=_order_goods_qty;
    i_goods_title.value=goods_title;
    i_goods_room_price1.value=goods_room_price1;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_room_price1);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				//alert(select_goods_qty[i].value);
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}

</script>
<!--  달력js -->


</head>
<body >
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a><i class="far fa-heart"></i> 장바구니</a>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><input type="checkbox" id="allsel"><label for="allsel"></label>
                    <a>전체 선택</a>
                  </li>
                  <input type="button" id="seldelete" value="선택 삭제">
                </ul>
              </div>
            </div>
            <form name="frm_order_all_cart">
	            <ul class="tab_each" >
		            <c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
		            
		            <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
				    <c:set var="cart_uid" value="${myCartList[cnt.count-1].cart_uid}" />
				    
			            <li class="reservation" style="margin-bottom: 20px;">
			              <div class="img-box">
			              <a href="${contextPath}/goods/goodsInformation.do?goods_id=${item.goods_id }">
			              	<img src="${contextPath}/room_download.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&fileName=${item.fileName}" alt="숙소 이미지"/>
			              </a>
			              </div>
			              <div class="descript">
			                <a1 style= "font-weight:bold;">${item.goods_name}</a1>
			                <input type="checkbox" name="checked_goods"  checked  value="${item.goods_uroom }"  onClick="calcGoodsPrice(${item.goods_room_price1 },this)">
			                <a2>${item.roadAddress}</a2>
			                <a3>${item.goods_room_name}</a3>
			                <h3>${item.checkIn} - ${item.checkOut}</h3>
			                <div class="detail" style = "font-weight:bold;">
								
								<c:choose>
									<c:when test="${item.goods_room_price2 != 0}">
										<span id="type">대실</span>
										<span id="price2" style="padding-right:10px; box-sizing: border-box;"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.goods_room_price2}" />원</span>
										<span id="type">숙박</span>
										<span id="price1"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.price}" />원</span>
									</c:when>
									<c:otherwise>
										<span id="type">숙박</span>
										<span id="price1"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${item.price}" />원</span>
									</c:otherwise>
								</c:choose>
			                </div>
			                <div style="position: absolute;bottom: 10px; right: 10px;">
			                <a class="delete" href="javascript:delete_cart_goods('${cart_uid}');"> 
								삭제하기
							</a>
							<fmt:parseDate var="date3" value="${item.checkIn}" pattern="yyyy-MM-dd"/>
					        <fmt:parseDate var="date4" value="${item.checkOut}" pattern="yyyy-MM-dd"/>
					        <fmt:parseNumber var="dateTime3" value="${date3.time/(1000*60*60*24)}" integerOnly="true"/>
					        <fmt:parseNumber var="dateTime4" value="${date4.time/(1000*60*60*24)}" integerOnly="true"/>
							<!-- 날짜 변환 -->
							<!--<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${item.checkIn}" pattern="yyyy-MM-dd" /></c:set> -->
							<c:choose>
								<c:when test="${item.goods_room_price2 != 0}">
									<button class="btn" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.price}&date1=${dateTime3*86400+86400}&date2=${dateTime4*86400+86400}'">숙박 예약하기</button>
									<button class="btn" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price2=${item.goods_room_price2}&date1=${dateTime3*86400}&date2=${dateTime3*86400}'">대실 예약하기</button>
								</c:when>
								<c:otherwise>
									<button class="btn" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${item.price}&date1=${dateTime3*86400+86400}&date2=${dateTime4*86400+86400}'">숙박 예약하기</button>
								</c:otherwise>
							</c:choose>
							</div>
			              </div>
			            </li>
			            <c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.price }" />
						<c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
					
		            </c:forEach>
		        </ul>
          	</form>
          	
	<table  width=99%  class="list_view" style="font-size:18px; box-sizing: border-box; border-top:1px solid #ddd; border-bottom:1px solid #ddd; margin-top:30px;">
		<h3 style="color:rgb(192, 57, 43); margin-top:90px;">총 예약 금액은 숙박금액으로만 계산 됩니다. 대실은 제외 금액이오니 대실은 따로 예약 바랍니다.</h3>
		<tbody>
		     <tr  align=center  class="fixed" >
		       <td class="fixed">총 예약 건수 </td>
		       <td>총 예약 금액</td>
		       <td>  </td>
		       <td>옵션 비용</td>
		       <td>  </td>
		       <td>총 할인 금액 </td>
		       <td>  </td>
		       <td>최종 결제금액</td>
		     </tr>
			<tr cellpadding=40  align=center >
				<td id="">
				  <p id="p_totalGoodsNum">${totalGoodsNum}개 </p>
				  <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
				</td>
		       <td>
		          <p id="p_totalGoodsPrice">
		          <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
					         ${total_goods_price}원
		          </p>
		          <input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
		       </td>
		       <td> 
		          + 
		       </td>
		       <td>
		         <p id="p_totalDeliveryPrice">${totalDeliveryPrice }원  </p>
		         <input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
		       </td>
		       <td> 
		         -
		       </td>
		       <td>  
		         <p id="p_totalSalesPrice"> 
					         ${totalDiscountedPrice}원
		         </p>
		         <input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
		       </td>
		       <td>  
		         =
		       </td>
		       <td>
		          <p id="p_final_totalPrice" style="font-weight:bold; color:rgb(192, 57, 43)">
		          <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
		            ${total_price}원
		          </p>
		          <input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
		       </td>
			</tr>
		</tbody>
	</table>
	<!--  
	<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
		<input name="goods_id" value="${member.uid}, ${member.name}, ${member.hp}, ${item.goods_id}, ${item.goods_uroom}, ${item.price}, ${item.checkIn}, ${item.checkOut}" />
		
		<button class="btn" type="button" onclick="location.href='${contextPath}/reservation/reservationForm.do?goods_id=${item.goods_id}&goods_uroom=${item.goods_uroom}&goods_room_price1=${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}&date1=${dateTime3*86400+86400}&date2=${dateTime4*86400+86400}'">숙박 예약하기</button>
	</c:forEach>
	-->
	<center>
    <br><br>	
		 <a href="javascript:fn_order_all_cart_goods()">
		 	<img width="75" alt="" src="#">
		 </a>
		 <a href="#">
		 	<img width="75" alt="" src="#">
		 </a>
	<center>
          	
        </div>
      </div>
    </div>
</body>
</html>