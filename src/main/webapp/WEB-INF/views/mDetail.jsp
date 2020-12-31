<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mDetail.css"
	rel="stylesheet" type="text/css" />
<title>이름(@아이디)</title>
<style>
a {
	display:block;
}
</style>
</head>
<body>
	<div id="contents">
		<div id="header_contents">
			<div id="profileinfo">
				<div id="profileimg">
					<img src="" id="proimg">
				</div>
				<div id="profilecontents">
					아이디&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="mbtn" onclick="location.href='mManage.do'">계정 관리</button>
					<br> 게시물&nbsp;&nbsp;&nbsp;&nbsp;팔로워&nbsp;&nbsp;&nbsp;&nbsp;팔로우<br>
					이름<br> 소개
				</div>
			</div>
			<div id="storylist">스토리</div>
		</div>
		<div id="main_contents"></div>
		<div style="clear:both;"></div>
	</div>
</body>
</html>