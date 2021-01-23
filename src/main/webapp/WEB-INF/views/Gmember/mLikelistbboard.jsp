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
body {
	text-align: center;
	margin: 0;
	color: #262626;
	background-color: #FAFAFA;
}

#mManage {
	display: flex;
	justify-content: center;
	width: 100%;
}

#sc_big_con {
	width: 1000px;
	background-color: white;
}

#sc_con {
	width: 998px;
	height: 798px;
	border: 1px solid #C7C7C7;
	border-top: none;
	overflow-y: auto;	
}

#menu {
	float: left;
	width: 260px;
	margin: 0 auto;
}

#menulist {
	list-style: none;
	margin: 0 auto;
	padding-left: 0;
	width: 260px;
	border-right: 1px solid #C7C7C7;
	height: 798px;
}

#menulist>li {
	width: 228px;
	height: 21px;
	padding: 16px 16px 16px 16px;
	font-size: 14px;
	line-height: 21px;
	cursor: pointer;
	text-align: left;
}

#menulist>li>a {
	color: black;
	text-decoration: none;
}

#menulist>li:hover {
	background-color: #F6F6F6;
	border-left: 2px solid #D5D5D5;
}

#contents {
	display: inline-block;
	width: 705px;
	text-align: center;
	margin: 0 auto;
}

td {
	vertical-align: middle !important;
	text-align: left;
	font-size: 14px;
}

#imgmanageModal {
	width: 400px;
	height: 222px;
	display: none;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: white;
}

#parentModal {
	background: black;
	opacity: 0.5;
	position: fixed;
	width: 100%;
	height: 100%;
	display: none;
	margin: 0;
	z-index: 7;
}

#imgmanageModal {
	z-index: 7;
}

button:focus {
	border: none;
	outline: none;
}

#sc_title {
	padding: 20px 16px 20px 16px;
	width: 966px;
	height: 20px;
	color: #999999;
	font-size: 16px;
	line-height: 20px;
	border: 1px solid #C7C7C7;
	text-align: left;
}

.btn2 {
	height: 30px;
	border: none;
	margin-top: 15px;
	margin-bottom: 10px;
	cursor: pointer;
	outline: none;
	font-size: 13px;
	border-radius: 5px;
}

.wcon {
	outline: none;
	border: 1px solid #C7C7C7;
	height: 30px;
	padding: 0px 2px 0px 2px;
	box-sizing: border-box;
}

.submenu {
	border: 1px solid #D5D5D5;
	height: 35px;
}

td {
	vertical-align: middle !important;
}

a {
	padding: 15px 85px 15px 0 !important;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="sc_big_con">
			<div id="sc_title">좋아요 누른 목록</div>
			<div id="sc_con">
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
					<div id="submenu" style="padding-top: 30px;">
						<input type="button" id="all" class="submenu" value="전체"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='mLikelist.do'"> <input
							type="button" id="board" class="submenu" value="일반 게시글"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='mLikelistboard.do'"> <input
							type="button" id="bboard" class="submenu" value="비즈니스 게시글"
							style="background: white; text-align: center; width: 120px; border: 2px solid black;"
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
								<c:set var="value" value="${ll.b_id}" />
								<c:if test="${fn : contains(value, 'BB')}">
									<img src="${ll.b_img1}" width="200px" height="200px"
										onclick="location.href=''">
									<input type="text" value="${ll.b_id}" style="display: none">
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>