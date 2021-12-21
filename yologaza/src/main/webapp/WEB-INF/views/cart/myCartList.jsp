<%-- 송상우 100% --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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

.tab_each{
  height:500px;
}

.tab_each .reservation img{
  width:30%;
  height:220px;
  border:1px solid rgba(0,0,0,0.2);
  display:inline-block;
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
  margin-top:10px;
  display:block;
}

.tab_each .reservation .descript a4{
  display:inline-block;
  margin-top:10px;
}

.tab_each .reservation .descript .detail{
  position:absolute;
  display:block;
  width:60%;
  height:60px;
  bottom:0px;
  right:0px;
  font-size:24px;
  text-align:right;
  padding-right:50px;
}

.detail #type{
  position:absolute;
  right:200px;
}

#price{
  color:red;
}

</style>
<script type="text/javascript">
// 참조 https://kuzuro.blogspot.com/2018/10/22.html
// 전체선택
$(document).ready(function() {
	$("#allsel").click(function() {
		if($("#allsel").is(":checked")) $("input[name=roomchk]").prop("checked", true);
		else $("input[name=roomchk]").prop("checked", false);
	});

	$("input[name=roomchk]").click(function() {
		var total = $("input[name=roomchk]").length;
		var checked = $("input[name=roomchk]:checked").length;

		if(total != checked) $("#allsel").prop("checked", false);
		else $("#allsel").prop("checked", true); 
	});
	

	// 선택삭제
 $("#seldelete").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[name='roomchk']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
   $.ajax({
    url : "/wishListForm/deleteCart",
    type : "post",
    data : { roomchk : checkArr },
    success : function(){
     location.href = "/wishListForm";
    }
   });
  } 
 });

</script>
</head>
<body class="pc">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a><i class="fas fa-shopping-cart"></i> 장바구니</a>
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
            <div class="tab_each">
              <div class="reservation">
                <img src="https://image.goodchoice.kr/resize_490x348/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg">
                <div class="descript">
                  <a1>숙소명</a1>
                  <input type="checkbox" name="roomchk">
                  <a2>주소</a2>
                  <a3>선택한 방 종류</a3>
                  <a4>체크인</a4>~<a4>체크아웃</a4>
                  <div class="detail">
                    <span id="type">숙박</span>
                    <span id="price">100,000원</span>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>