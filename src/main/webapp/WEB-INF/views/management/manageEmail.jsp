<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
* {
	margin: 0;
}

#mManage {
	width: 1000px;
	margin: 0 auto;
	padding: 0;
}

#menu {
	float: left;
	width: 20%;
}

#menulist {
	list-style: none;
	padding-left: 0;
}

#menulist>li {
	text-align: left;
	padding: 20px 0px 20px 0px;
}

#menulist>li>a {
	color: black;
	text-decoration: none;
}

#menulist>li:hover {
	background-color: #F6F6F6;
	border-left: 2px solid #D5D5D5;
}

#contentmanage {
	display: inline-block;
	float: right;
	width: 78%;
	height: 100%;
	text-align: center;
}

.tit {
	font-size: 25px;
}

#table_top {
	line-height: 45px;
	vertical-align: middle;
	border-bottom: 1px solid gray;
}

#table_top td {
	padding: 0 20px;
	vertical-align: middle;
}

.table_body {
	line-height: 45px;
	text-align: center;
	border-bottom: 1px solid gray;
	vertical-align: middle;
}

.table_body_td td {
	line-height: 30px;
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px solid gray;
}

.table_bottom {
	line-height: 50px;
	text-align: center;
}

a {
	text-decoration: none;
	color: #000;
}

a:hover {
	cursor: pointer;
}

a.btn-action {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}
.mail_manage {
	line-height: 30px;
}
.form-control {
	
}
.btn-warning {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="membermanagelist.do">일반회원</a></li>
				<li><a href="bsmemberManagelist.do">비지니스회원</a></li>
				<li><a href="boardManagelist.do">일반게시글</a></li>
				<li><a href="bsboardManagelist.do">비지니스게시글</a></li>
				<li><a href="reportmemberManagelist.do">신고회원</a></li>
				<li><a href="reportBoardManagelist.do">신고(일반게시글)</a></li>
				<li><a href="reportBsboardManagelist.do">신고(비지니스게시글)</a></li>
			</ul>
		</div>
		<div id="contentmanage">
			<div id="head_aticle">
				<h2 class="tit">메일 보내기</h2>
				<br> <br>
			</div>
			<form action="mailSending.do" method="post">
				<div class="mail_manage" align="center">
					<input type="text" name="tomail" size="200" style="width: 50%"
						class="form-control" placeholder="수신자 이메일을 입력해주세요">
				</div>
				<div class="mail_manage" align="center">
					<!-- 제목 -->
					<input type="text" name="title" size="120" style="width: 50%"
						placeholder="제목을 입력해주세요" class="form-control">
				</div><br>
				<div class="mail_manage" align="center">
					<!-- 내용 -->
					<textarea name="content" cols="120" rows="12"
						style="width: 50%; resize: none" placeholder="내용을 입력해주세요"
						class="form-control"></textarea>
				</div>
				<div class="mail_manage" align="center">
					<input type="submit" value="메일 보내기" class="btn-warning">
				</div>
			</form>
		</div>
	</div>
</body>
</html>