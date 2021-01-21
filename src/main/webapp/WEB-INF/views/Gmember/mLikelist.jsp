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
	display: block;
}

.submenu {
	border: 1px solid #D5D5D5;
	height: 35px;
}
td{vertical-align:middle !important;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li><a href="mChangepw.do">비밀번호 변경</a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li style="border-left: 2px solid black;"><a
					href="mLikelist.do"><span style="font-weight: bold;">내가
							누른 좋아요 조회</span></a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span style="color:white; background:gray;">좋아요 누른 목록</span>
			<hr style="width:80%; margin-top:30px; border:1px solid #EAEAEA;">
			<div id="submenu" style="padding-top: 30px;">
				<input type="button" id="all" class="submenu" value="전체"
					style="background: white; text-align: center; width: 120px; border: 2px solid black;"
					onclick="location.href='mLikelist.do'"> <input
					type="button" id="board" class="submenu" value="일반 게시글"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='mLikelistboard.do'"> <input
					type="button" id="bboard" class="submenu" value="비즈니스 게시글"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='mLikelistbboard.do'">
			</div>
			<div style="padding: 30px 0 30px 0;">
				<c:if test="${likelist.size() == 0}">
					<br>
					<br>
					<br>
					<br>
					<br>좋아요한 게시글이 없습니다.<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</c:if>
				<c:if test="${likelist.size() != 0}">
					<c:forEach var="ll" items="${likelist}" varStatus="status">
						<img src="${ll.b_img1}" width="200px" height="200px" onclick="location.href=''"><input type="text" value="${ll.b_id}" style="display:none">
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>