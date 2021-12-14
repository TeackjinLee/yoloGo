<!-- 기여도 : 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>

    <!-- 디버그용 인디케이터, 실전에선 필요없음 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.js"></script>

    <!-- gsap 용 플러그인 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/animation.gsap.js"></script>
    <!-- 달력링크 -->
    <script type="text/javascript" src="${contextPath}/resources/js/moment.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/daterangepicker.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/search_goods.css">
    <script src="${contextPath}/resources/js/search_goods.js"></script>
    <!--  달력js -->
    <script>
    $(function() {
        $('input[name="daterange"]').daterangepicker({
        opens: 'left',
        timePicker: true
        }, function(start, end, label) {
        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });

    });
    </script>
</head>
<body>
<!-- yolo가자 작성 -->
<div class="detail-select">
    <div class="header-bar">
      <div class="text-box con">
        <p>내주변</p>
      </div>
    </div>
    <div class="detail-select-box con">
      <div class="top_menu">
        <ul class="row">
          <li class="cell"><a href="#">모텔</a></li>
          <li class="cell"><a href="#">호텔</a></li>
          <li class="cell"><a href="#">펜션</a></li>
          <li class="cell"><a href="#">리조트</a></li>
          <li class="cell"><a href="#">게스트하우스</a></li>
          <li class="cell"><a href="#">캠핑/글램핑</a></li>
          <li class="cell"><a href="#">한옥</a></li>
        </ul>
      </div>
      <!-- 상세 검색창 -->
      <div class="filter_wrap">
        <section class="date-wrap">
          <h3>날짜</h3>
          <div class="btn_date">
            <tr class="date-box">
              <td  class="date"><input type="text" name="daterange" value="01/01/2021/ - 01/15/2022" /></td>
                  </tr>
          </div>
        </section>
        <div class="select-wrap">
          <h3>상세조건</h3>
          <button type="button" onclick="">초기화</button>
          <button type="submit">적용</button>
        </div>
        
        <section>
          <strong>이색테마</strong>
            <ul class="hide_type half">
              <li><input type="checkbox" id="tmino_0" name="tmino[]" class="inp_chk" value="8"><label
                                                                                                      for="tmino_0" class="label_chk">무인텔</label></li>
              <li><input type="checkbox" id="tmino_1" name="tmino[]" class="inp_chk" value="14"><label
                                                                                                       for="tmino_1" class="label_chk">파티룸</label></li>
              <li><input type="checkbox" id="tmino_2" name="tmino[]" class="inp_chk" value="1"><label
                                                                                                      for="tmino_2" class="label_chk">거울룸</label></li>
              <li><input type="checkbox" id="tmino_3" name="tmino[]" class="inp_chk" value="9"><label
                                                                                                      for="tmino_3" class="label_chk">복층룸</label></li>
              <li><input type="checkbox" id="tmino_4" name="tmino[]" class="inp_chk" value="2"><label
                                                                                                      for="tmino_4" class="label_chk">공주룸</label></li>
              <li><input type="checkbox" id="tmino_5" name="tmino[]" class="inp_chk" value="13"><label
                                                                                                       for="tmino_5" class="label_chk">트윈베드</label></li>
              <li><input type="checkbox" id="tmino_6" name="tmino[]" class="inp_chk" value="26"><label
                                                                                                       for="tmino_6" class="label_chk">야외테라스</label></li>
              <li><input type="checkbox" id="tmino_7" name="tmino[]" class="inp_chk" value="31"><label
                                                                                                       for="tmino_7" class="label_chk">바다뷰</label></li>
              <li><input type="checkbox" id="tmino_8" name="tmino[]" class="inp_chk" value="39"><label
                                                                                                       for="tmino_8" class="label_chk">호수뷰</label></li>
              <li><input type="checkbox" id="tmino_9" name="tmino[]" class="inp_chk" value="40"><label
                                                                                                       for="tmino_9" class="label_chk">하늘뷰</label></li>
            </ul>
            
          </ul>
        </section>
        <section>
          <strong>스파시설</strong>
          <ul class="hide_type half">
            <li><input type="checkbox" id="tmino_10" name="tmino[]" class="inp_chk"
                       value="19"><label for="tmino_10" class="label_chk">스파/월풀</label></li>
            <li><input type="checkbox" id="tmino_11" name="tmino[]" class="inp_chk"
                       value="17"><label for="tmino_11" class="label_chk">사우나/찜질방</label></li>
            <li><input type="checkbox" id="tmino_12" name="tmino[]" class="inp_chk" value="7"><label
                                                                                                     for="tmino_12" class="label_chk">맛사지 베드</label></li>
            <li><input type="checkbox" id="tmino_13" name="tmino[]" class="inp_chk"
                       value="15"><label for="tmino_13" class="label_chk">히노끼탕</label></li>
            <li><input type="checkbox" id="tmino_14" name="tmino[]" class="inp_chk" value="5"><label
                                                                                                     for="tmino_14" class="label_chk">노천탕</label></li>
            <li><input type="checkbox" id="tmino_15" name="tmino[]" class="inp_chk"
                       value="34"><label for="tmino_15" class="label_chk">반신욕</label></li>
            <li><input type="checkbox" id="tmino_16" name="tmino[]" class="inp_chk"
                       value="10"><label for="tmino_16" class="label_chk">욕실 TV</label></li>
          </ul> 
        </section>
        <section>
          <strong>놀이시설</strong>
          <ul class="hide_type half">
            <li><input type="checkbox" id="tmino_17" name="tmino[]" class="inp_chk"
                       value="11"><label for="tmino_17" class="label_chk">수영장</label></li>
            <li><input type="checkbox" id="tmino_18" name="tmino[]" class="inp_chk" value="4"><label
                                                                                                     for="tmino_18" class="label_chk">노래방</label></li>
            <li><input type="checkbox" id="tmino_19" name="tmino[]" class="inp_chk" value="6"><label
                                                                                                     for="tmino_19" class="label_chk">당구대</label></li>
            <li><input type="checkbox" id="tmino_20" name="tmino[]" class="inp_chk" value="3"><label
                                                                                                     for="tmino_20" class="label_chk">게임기</label></li>
            <li><input type="checkbox" id="tmino_21" name="tmino[]" class="inp_chk"
                       value="30"><label for="tmino_21" class="label_chk">안마의자</label></li>
            <li><input type="checkbox" id="tmino_22" name="tmino[]" class="inp_chk"
                       value="12"><label for="tmino_22" class="label_chk">커플 PC</label></li>
            <li><input type="checkbox" id="tmino_23" name="tmino[]" class="inp_chk"
                       value="18"><label for="tmino_23" class="label_chk">미니바</label></li>
            <li><input type="checkbox" id="tmino_24" name="tmino[]" class="inp_chk"
                       value="23"><label for="tmino_24" class="label_chk">3D TV</label></li>
            <li><input type="checkbox" id="tmino_25" name="tmino[]" class="inp_chk"
                       value="25"><label for="tmino_25" class="label_chk">빔프로젝터</label></li>
          </ul>
        </section>
  
        <section>
          <strong>가격
            <span><label for="amount"></label><input type="text" id="amount" class="price_val" readonly="">
              <input type="hidden" id="min_price" name="min_price" value="">
              <input type="hidden" id="max_price" name="max_price" value="">
            </span>
          </strong>
          <div class="slider_wrap">
            <div id="slider"
                 class="slider_align ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                 data-min="1" data-max="30">
              <div class="ui-slider-range ui-corner-all ui-widget-header"
                   style="left: 0%; width: 100%;"></div>
              <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span>
              <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
            </div><span class="price_txt">1만원</span><span class="price_txt">30만원</span>
          </div>
         </section>
      </div>
      <div class="list_wrap">
        <div class="goods-wrap">
          <div class="search-menu">
            <div class="search-box">
             <button type="button" data-sort="distance" class=""><span>거리순</span></button>
             <button type="button" data-sort="lowprice" class=""><span>낮은 가격 순</span></button>
             <button type="button" data-sort="highprice" class=""><span>높은 가격 순</span></button>
            </div>
            <button type="button" class="btn_map" onclick="pop_map_pc();">지도</button>
          </div>
          <div class="goods_list">
            <div class="goods_title"><h3>상품 리스트</h3></div>
            <li class="list_1 goods_menu1 goods_box">
              <a href="${contextPath}/board/goodsInformation.do">
                <div class="goods_picture">
                  <img src="https://image.goodchoice.kr/resize_1000X500x0/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙소 이미지">
                </div>
                <div class="goos_impormation">
                  <div class="name">
                    <strong>숙소 명</strong>
                    <p class="score"><span><em>8.2</em></p>
                    <p> 8.6km | 강북구 수유동 </p>
                    <p class="txt_opt">예약취소가능</p>
                  </div>
                  <div class="price">
                    <div class="map_html">
                      <p>대실&nbsp;<b>15,000원</b></p>
                      <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>20,000원</b></p>
                    </div>
                  </div>    
                </div>
              </a>
            </li><!--    goods_menu1/2/3/4/5(호텔 모텔 리조트 등등 번호 순차 등록)      -->
            <li class="list_1 goods_menu1 goods_box">
              <a href="${contextPath}/board/goodsInformation.do">
                <div class="goods_picture">
                  <img src="https://image.goodchoice.kr/resize_1000X500x0/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙소 이미지">
                </div>
                <div class="goos_impormation">
                  <div class="name">
                    <strong>숙소 명</strong>
                    <p class="score"><span><em>8.2</em></p>
                    <p> 8.6km | 강북구 수유동 </p>
                    <p class="txt_opt">예약취소가능</p>
                  </div>
                  <div class="price">
                    <div class="map_html">
                      <p>대실&nbsp;<b>15,000원</b></p>
                      <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>20,000원</b></p>
                    </div>
                  </div>    
                </div>
              </a>
            </li><!--    goods_menu1/2/3/4/5(호텔 모텔 리조트 등등 번호 순차 등록)      -->
            
            <c:forEach var="item" items="${goodsMap.hotel}" >     
				<li class="list_1 goods_menu1 goods_box">
			      <a href="${contextPath}/board/goodsInformation.do">
			        <div class="goods_picture">
			          <img src="${contextPath}/goods_download.do.do?goods_id=${item.goods_id}&fileName=${item.fileName}" alt="숙소 이미지"/>
			        </div>
			        <div class="goos_impormation">
			          <div class="name">
			            <strong>${item.goods_name}</strong>
			            <p class="score"><span><em>8.2</em></p>
			            <p>${item.goods_address}</p>
			          </div>
			          <div class="price">
			            <div class="map_html">
			              <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>${item.goods_price1}</b></p>
			            </div>
			          </div>    
			        </div>
			      </a>
			    </li>
			</c:forEach>   

          </div>
        </div>
      </div>
    </div>	
  </div>
 
   


</body>
</html>