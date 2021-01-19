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
</style>
</head>
<body>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li><a href="mChangepw.do">비밀번호 변경</a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li style="border-left: 2px solid black;"><a href="mBuylist.do"><span
						style="font-weight: bold;">구매목록</span></a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span style="color:white; background:gray;">구매목록 조회</span>
			<div style="padding-top: 30px;">
				<c:if test="${orderimg.size() != 0}">
					<c:forEach var="ol" items="${orderlist}" varStatus="status">
					<img src="${orderimg }" width="150px" height="150px" style="float:left;">${ol }<br><br><br><br><br>
			</c:forEach>
				</c:if>
			</div>

		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>