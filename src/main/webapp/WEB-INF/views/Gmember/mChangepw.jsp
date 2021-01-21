<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mManage.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>계정 관리</title>
<style>
a {
	display: block;
}

td {
	text-align: left;
}
td{vertical-align:middle !important;}
</style>
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
</head>
<script>
	$(document).ready(function() {
		$("#lastpw").keyup(function() {
			var m_pw = "${profile.m_pw}";
			if ($("#lastpw").val() == m_pw) {
				$("#checklastpwinfo").css("color", "green");
				$("#checklastpwinfo").html("이전 비밀번호와 일치합니다.");
			} else {
				$("#checklastpwinfo").css("color", "red");
				$("#checklastpwinfo").html("비밀번호를 다시 확인해주세요.");
			}
		});

		$("#checknewpw").keyup(function() {
			if ($("#newpw").val() == $("#checknewpw").val()) {
				$("#checknewpwinfo").css("color", "green");
				$("#checknewpwinfo").html("새 비밀번호와 일치합니다.");
			} else {
				$("#checknewpwinfo").css("color", "red");
				$("#checknewpwinfo").html("비밀번호를 다시 확인해주세요.");
			}
		});

		$("#newpw").keyup(function() {
			if ($("#newpw").val() == $("#checknewpw").val()) {
				$("#checknewpwinfo").css("color", "green");
				$("#checknewpwinfo").html("새 비밀번호가 일치합니다.");
			} else {
				$("#checknewpwinfo").css("color", "red");
				$("#checknewpwinfo").html("비밀번호를 다시 확인해주세요.");
			}
		});

		$("#submit").click(function() {
			if ($("#checklastpwinfo").html() == "이전 비밀번호와 일치합니다.") {
				if ($("#checknewpwinfo").html() == "새 비밀번호와 일치합니다.") {
					return true;
				} else {
					alert("새 비밀번호를 확인해주세요.");
					$("#checknewpw").val("");
					$("#newpw").val("");
					$("#newpw").focus();
					return false;
				}
			} else {
				alert("이전 비밀번호를 확인해주세요.");
				$("#lastpw").val("");
				$("#lastpw").focus();
				return false;
			}
		});
	});
</script>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li style="border-left: 2px solid black;"><a href=""><span
						style="font-weight: bold;">비밀번호 변경</span></a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span style="color:white; background:gray;">비밀번호 변경</span>
			<hr style="width:80%; margin-top:30px; border:1px solid #EAEAEA;">
			<form id="changepw" method="post" action="changepw.do"
				style="padding-bottom: 75px; padding-top: 20px;">
				<table id="profiletable"
					style="width: 80%; margin: 0 auto; margin-bottom: 30px;">
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%"></td>
						<td width="35%" style="text-align: center;"><img
							src="${pageContext.request.contextPath}/resources/uploadFiles/${profile.m_img}"
							style="width: 50px; height: 50px; vertical-align: middle;"></td>
						<td>${profile.m_id }</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">이전 비밀번호</td>
						<td><input type="password" id="lastpw" name="lastpw" required
							style="width: 55%;"><label style="font-size: 7pt;"
							id="checklastpwinfo"></label></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">새 비밀번호</td>
						<td><input type="password" id="newpw" name="newpw" required
							style="width: 55%;"></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">새 비밀번호 확인</td>
						<td><input type="password" id="checknewpw" name="checknewpw"
							required style="width: 55%;"><label
							style="font-size: 7pt;" id="checknewpwinfo"></label></td>
					</tr>
				</table>
				<input type="submit" id="submit" value="저장"
					style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;">
				<input type="button"
					style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;"
					value="취소" onclick="location.href='mChangepw.do'">
			</form>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>

</html>