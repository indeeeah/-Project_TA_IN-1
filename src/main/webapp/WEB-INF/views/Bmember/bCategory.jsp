<%@page import="java.io.Console"%>
<%@page
	import="com.project.tain.membermanage.model.service.mMemberServiceImpl"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
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

#parentModal {
	display: none;
	background: black;
	opacity: 0.5;
	position: fixed;
	width: 100%;
	height: 100%;
	margin: 0;
	z-index: 8;
}

#ADaddModal {
	display: none;
	width: 400px;
	height: 210px;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: white;
	z-index: 8;
}

.deleteCate {
	background: white;
}

.deleteCate:hover {
	background: black;
	color: white;
}

td {
	vertical-align: middle !important;
}

::-webkit-scrollbar {
	width: 6px;
	height: 6px;
}

::-webkit-scrollbar-track {
	background: transparent;
}

::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background: rgba(0, 0, 0, 0.35);
}

::-webkit-scrollbar-corner {
	background: #0c0c0c;
}
</style>
<script>
	$(document).ready(function() {
		$("#parentModal").click(function() {
			$("#ADaddModal").css("display", "none");
			$("#parentModal").css("display", "none");
		});

		$("#CateADD").click(function() {
			$("#ADaddModal").css("display", "block");
			$("#parentModal").css("display", "block");
		});

		$("#submit").click(function() {
			if ($("#imgupload").val() == null) {
				alert("컨텐츠를 첨부해주세요.");
			} else {
				$("#insertbAd").submit();
			}
		});

		$(".deleteCate").click(function() {
			if (confirm("해당 카테고리를 삭제하시겠습니까?") == true) {
				var a = $(this).parent().find("div[class=cate]").html();
				location.href = "deletebCate.do?c_name=" + a;
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div id="parentModal"></div>
	<div id="ADaddModal"
		style="border-radius: 0.5em; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;">
		<form id="insertbCate" action="insertbCate.do" method="post">
			<span id="imgupload"
				style="display: inline-block; width: 70%; padding: 18px 0 10px 0; border-style: none; background: white; font-size: 12pt; font-weight: bold;">
				카테고리 추가</span>
			<hr style="color: #D5D5D5;">
			카테고리 이름 : <input type="text" name="c_name" required>
			<hr style="color: #D5D5D5;">
			<input type="submit" id="submit"
				style="width: 100%; height: 36px; border-style: none; background: white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="등록">
			<hr style="color: #D5D5D5;">
			<input type="button" id="clear"
				style="width: 100%; height: 36px; border-style: none; background: white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="취소" onclick="location.href='bCategory.do'">
		</form>
	</div>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="sc_big_con">
			<div id="sc_title">비즈니스 계정</div>
			<div id="sc_con">
				<div id="menu">
					<ul id="menulist">
						<li onclick="location.href='mManage.do'">프로필 편집</li>
						<li onclick="location.href='mChangepw.do'">비밀번호 변경</li>
						<li onclick="location.href='mCart.do'">장바구니</li>
						<li onclick="location.href='mBuylist.do'">구매목록</li>
						<li onclick="location.href='mLikelist.do'">내가 누른 좋아요 조회</li>
						<li style="border-left: 2px solid black;"
							onclick="location.href='mBusiness.do'"><span
							style="font-weight: bold;">비즈니스 계정</span></li>
					</ul>
				</div>
				<div id="contents" style="padding-top: 30px;">
					<div id="submenu" style="padding-top: 30px;">
						<input type="button" id="all" class="submenu" value="비즈니스 정보"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='mBusiness.do'"> <input
							type="button" id="board" class="submenu" value="비즈니스 계정"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='bOut.do'"> <input type="button"
							id="board" class="submenu" value="주문관리"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='bOrder.do'"> <input type="button"
							id="bboard" class="submenu" value="카테고리"
							style="background: white; text-align: center; width: 120px; border: 2px solid black;"
							onclick="location.href='bCategory.do'"> <input
							type="button" id="bboard" class="submenu" value="광고 컨텐츠"
							style="background: white; text-align: center; width: 120px;"
							onclick="location.href='bAD.do'">
					</div>
					<br> <br> <span
						style="font-size: 8pt; font-weight: bold;">등록된 카테고리를 추가하시면
						보다 편리하게 상품을 분류할 수 있습니다.<br>'추가'버튼을 클릭해 추가, 'x'버튼을 클릭해 삭제할 수
						있습니다.
					</span>
					<div style="padding-top: 40px;">
						<c:if test="${CateList.size() eq 0}">
							<br>
							<br>
							<h4>등록된 카테고리가 없습니다.</h4>
						</c:if>
					</div>
					<div
						style="padding-top: 50px; padding-left: 50px; text-align: left;">
						<c:if test="${CateList.size() ne 0}">
							<c:forEach var="cl" items="${CateList}" varStatus="status">
								<c:set var="index" value="${status.index}" />
								<div style="display: inline-block;">
									<div class="cate"
										style=" text-align:center; display:inline-block;width:70px;border-radius: 0.5em;
						border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em;
						border-bottom-right-radius: 0.5em; margin-left: 8px;margin-bottom:50px; height:40px; padding:30px 50px 15px 50px; background:rgb(${color[index]},0.6)">${cl.c_name }</div>
									<button class="deleteCate"
										style="margin-left: -40px; margin-right: 50px; border-style: none; cursor: pointer;">x</button>
								</div>
							</c:forEach>
						</c:if>
						<br>
						<br>
						<br>
					</div>
					<button id="CateADD" class="btn2"
						style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;">추가</button>
					<br> <br> <br>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>