<%@page import="java.io.Console"%>
<%@page import="com.project.tain.membermanage.model.service.mMemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mManage.css"
	rel="stylesheet" type="text/css" />
<title>계정 관리</title>
<style>
a {
	display:block;
}
.submenu {
	border: 1px solid #D5D5D5;
	height: 35px;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		$("#bmc").click(function(){
			if(confirm("비즈니스 계정을 해제하시겠습니까?") == true){
				location.href="bDelete.do";
			}else{
				alert("취소하였습니다.")
				return false;
			}
		});
	});
</script>
<body>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li><a href="mChangepw.do">비밀번호 변경</a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li style="border-left: 2px solid black;"><a href="mBusiness.do"><span style="font-weight:bold;">비즈니스 계정</span></a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span style="color:white; background:gray;">비즈니스 계정 해제</span>
			<div id="submenu" style="padding-top: 30px;">
					<input type="button" id="all" class="submenu" value="비즈니스 정보"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='mBusiness.do'">
					<input type="button" id="board" class="submenu" value="비즈니스 계정"
					style="background: white; text-align: center; width: 120px; border: 2px solid black;"
					onclick="location.href='bOut.do'">
					<input type="button" id="board" class="submenu" value="주문관리"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bOrder.do'">
					<input	type="button" id="bboard" class="submenu" value="카테고리"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bCategory.do'">
					<input	type="button" id="bboard" class="submenu" value="광고 컨텐츠"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bAD.do'">
			</div>
			<div>
			<br><br><br>
				<h4>비즈니스 계정을 해제하시겠습니까?</h4>
				<br>
				<input type="button" id="bmc" style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;"
			value="확인">
			<br><br><br><br><br>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</body>
</html>