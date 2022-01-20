<!-- 기여도: 이택진50% / 윤진50% -->
<!-- 2차기여도: 이택진100% -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<style>
  .join_inner_float
		{
		  border: 5px solid #ddd;
		  border-radius: 10px;
		  text-align: center;
		  width: 330px;
		  height: auto;
		  background-color: white;
		  margin: auto;
		  margin-bottom: 150px;
		  padding: 20px;
		  box-sizing: border-box;
		}
    .join_inner_float table{
      width: 100%;
    }
		.join_inner_float .input_line h1{
		  margin-top:0;
		}
    .join_inner_float p{
      display: block;
      text-align: left;
      width: 100%;
    }

</style>
</head>
<body>
	<img src="${contextPath}/resources/image/yolo-logo-c.png" alt="yolo가자 로고" style="margin-top:60px; margin-bottom:30px; width:270px;">
	<form  class="join_inner_float" action="${contextPath}/member/removeMember.do" enctype="multipart/form-data" method="post">
     <div class="input_line">
	    <h1 class="join_minisub">회원탈퇴</h1>
	  </div>
     <p><input type="radio" name="detail1" value="자주 사용하지 않아요">자주 사용하지 않아요</p>
     <p><input type="radio" name="detail1" value="원하는 숙소가 없어요">원하는 숙소가 없어요</p>
     <p><input type="radio" name="detail1" value="다른 계정이 있어요">다른 계정이 있어요</p>
     <p><input type="radio" name="detail1" value="개인정보를 위해 삭제할 정보가 있어요">개인정보를 위해 삭제할 정보가 있어요</p>
     <p><input type="radio" name="detail1" value="기타" checked>기타</p>
     <p><input type="text"  id="texts" name="detail2" placeholder="불편사항 있으시면 작성부탁드려요." style="width:100%; height:50px;"></p>
     <button type="submit" onclick="alert('회원탈퇴가 완료되었습니다.')">사용해 주셔서 감사드립니다</button>
    </form>
</body>
</html>