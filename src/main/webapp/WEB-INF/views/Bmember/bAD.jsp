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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>계정 관리</title>
<style>
a {
	display:block;
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
	z-index:1;
}


#ADaddModal {
	display: none;
	width: 400px;
	height: 650px;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: white;
	z-index:1;
}

.deleteAD{
	opacity:0.7;
}

.deleteAD:hover{
	opacity:1;
}
</style>
<script>
	$(document).ready(function() {
		$("#parentModal").click(function() {
			$("#ADaddModal").css("display", "none");
			$("#parentModal").css("display", "none");
		});
		
		$("#ADADD").click(function(){
			$("#ADaddModal").css("display", "block");
			$("#parentModal").css("display", "block");
		});
		
		$("#upfile").on("change", function(){
			
				 var reader = new FileReader(); reader.onload = function(event) {
						var img = $("#imgpreview");
						img.prop("src", event.target.result);
						};
					reader.readAsDataURL(event.target.files[0]);
		});
	
		$(".deleteAD").click(function(){
			if(confirm("해당 컨텐츠를 삭제하시겠습니까?") == true){
				var a = $(this).parent().find("input").val();
				location.href="deletebAd.do?s_id=" + a;
			}else{
				return false;
			}
		});
		
		$("#submit").click(function(){
			if($("#imgupload").val() == null){
				alert("컨텐츠를 첨부해주세요.");
			}else{
				$("#insertbAd").submit();
			}
		});
	});
</script>
</head>
<body>
	<div id="parentModal"></div>
	<div id="ADaddModal"
		style="border-radius: 0.5em; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;">
		<form id="insertbAd" action="insertbAd.do" method="post" enctype="multipart/form-data">
			<label for="upfile" id="imgupload"
				style="display: inline-block; width: 70%; padding: 18px 0 10px 0; border-style: none; background: white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer">
				광고컨텐츠 업로드</label> <input id="upfile" type="file" accept="image/gif, image/jpeg, image/png" name="upfile" style="display:none" required>
				<hr style="color: #D5D5D5;">
				<div id="preview" style="height:420px;">
				<img id="imgpreview" src="" width="340px" height="auto" style="position: relative; top:50%; transform:translateY(-50%);">
				</div>
				<hr style="color: #D5D5D5;">
				관련 링크 url : <input type="text" name="s_link" required>
			<hr style="color: #D5D5D5;">
			<input type="submit" id="submit"
				style="width: 100%; height: 36px; border-style: none; background: white; color:#0095f6; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="등록">
			<hr style="color: #D5D5D5;">
			<input type="button" id="clear"
				style="width: 100%; height: 36px; border-style: none; background: white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="취소" onclick="location.href='bAD.do'">
		</form>
	</div>
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
			<span style="color:white; background:gray;">광고 컨텐츠 관리</span>
			<hr style="width:80%; margin-top:30px; border:1px solid #EAEAEA;">
			<div id="submenu" style="padding-top: 30px;">
					<input type="button" id="all" class="submenu" value="비즈니스 정보"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='mBusiness.do'">
					<input type="button" id="board" class="submenu" value="비즈니스 계정"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bOut.do'">
					<input type="button" id="board" class="submenu" value="주문관리"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bOrder.do'">
					<input	type="button" id="bboard" class="submenu" value="카테고리"
					style="background: white; text-align: center; width: 120px;"
					onclick="location.href='bCategory.do'">
					<input	type="button" id="bboard" class="submenu" value="광고 컨텐츠"
					style="background: white; text-align: center; width: 120px; border: 2px solid black;"
					onclick="location.href='bAD.do'">
			</div>
			<br><br>
			<span style="font-size:8pt;font-weight:bold;">등록된 광고 컨텐츠는 랜덤으로 다른 사용자들에게 노출됩니다.<br>'추가'버튼을 클릭해 추가, 'x'버튼을 클릭해 삭제할 수 있습니다.</span>
			<div style="padding-top:40px;">
				<c:if test="${ADList.size() eq 0}">
					<br><br>
					<h4>등록된 광고 컨텐츠가 없습니다.</h4>
				</c:if>
				</div>
				<div style="padding-top:40px; padding-left: 50px; text-align:left;">
				<c:if test="${ADList.size() ne 0}">
					<c:forEach var="si" items="${ADList}" varStatus="status">
						<span class="img">
							<img class="adimg" style="margin:10px;"
							src="${pageContext.request.contextPath}/resources/uploadFiles/${si.s_img}" width="200px" height="200px"
							align=top>
							<input id="s_id" type="text" value="${si.s_id }" style="display:none;">
							<button class="deleteAD" style="margin-left:-35px; margin-top:11px;background:white; border-style:none; cursor:pointer;">x</button>
						</span>
					</c:forEach>
				</c:if>
				<br>
				<br>
			</div>
				<button id="ADADD" style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;">추가</button>
				<br><br>
		</div>
		<div style="clear:both;"></div>
	</div>
</body>
</html>