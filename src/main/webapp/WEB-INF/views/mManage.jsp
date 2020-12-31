<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
td {
	text-align: left;
}

a {
	display: block;
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
}

button:focus{
	border:none;
	outline:none;
}
</style>
</head>
<script>
	$(document).ready(function() {
		$("#changeimg").click(function() {
			$("#imgmanageModal").css("display", "block");
			$("#parentModal").css("display", "block");
		});
		$("#parentModal").click(function() {
			$("#imgmanageModal").css("display", "none");
			$("#parentModal").css("display", "none");
		});
		$("#imgdelete").click(function() {
			$("#imgmanageModal").css("display", "none");
			$("#parentModal").css("display", "none");
		});
		$("#clear").click(function() {
			$("#imgmanageModal").css("display", "none");
			$("#parentModal").css("display", "none");
		});
		
		$("a").click(function(){
			$("li").css("background", "#D5D5D5");
		});

		$("#imgupload").click(function() {
			if ($("#imgfile").val() == null) {
				$("#imgmanageModal").css("display", "block");
				$("#parentModal").css("display", "block");
			} else{
				$("#imgmanageModal").css("display", "none");
				$("#parentModal").css("display", "none");
			}
		});
	});
</script>
<body>
	<div id="parentModal"></div>
	<div id="mManage">
		<div id="imgmanageModal">
			<h3>프로필 사진 바꾸기</h3>
			<hr style="color: #D5D5D5;">
			<button id="imgupload" 
				style="width:100%; height:16%; border-style:none; background:white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer">
				<label for="imgfile" style="cursor:pointer;">사진 업로드</label></button> <input id="imgfile" type="file" style="display: none;">
			<hr style="color: #D5D5D5;">
			<button id="imgdelete"
				style="width:100%; height:16%; border-style:none; background:white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer">현재
				사진 삭제</button>
			<hr style="color: #D5D5D5;">
			<button id="clear"
				style="width:100%; height:16%; border-style:none; background:white; color: black; font-size: 12pt; font-weight: bold; cursor: pointer">취소</button>
		</div>
		<div id="menu">
			<ul id="menulist">
				<li style="border-left: 2px solid black;"><a href="mManage.do"><span
						style="font-weight: bold;">프로필 편집</span></a></li>
				<li><a href="mChangepw.do">비밀번호 변경</a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents">
			<form id="editProfile" action="editProfile.do" method="post">
				<table id="profiletable" style="margin: 0 auto;">
					<tbody>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%"></td>
							<td width="30%"><img src=""
								style="width: 50px; height: 50px"></td>
							<td>아이디<br> <label id="changeimg"
								style="color: #0095f6; font-size: 10pt; font-weight: bold; cursor: pointer">프로필
									사진 바꾸기</label></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">이 름</td>
							<td><input type="text" id="username" name="username"
								required value=""></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">회원 ID</td>
							<td><input type="text" id="id" name="id" required value=""></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">휴대전화</td>
							<td><input type="text" id="userphone" name="userphone"
								value="" required></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">이메일</td>
							<td><input type="email" id="email" name="email" readonly
								value="" required>&nbsp;<input type="button"
								value="중복체크" onclick="emailDupCheck()"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">생년월일</td>
							<td><input type="date" id="userbirth" name="userbirth"
								style="width: 56%;" value="" required></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">주소</td>
							<td><input type="text" id="sample4_postcode"
								onclick="sample4_execDaumPostcode()" placeholder="우편번호"
								class="jck_join_input"> <input type="button"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" name="roadAddress"
								placeholder="도로명주소" value="" class="jck_join_input"><br>
								<input type="text" size="43" id="sample4_detailAddress"
								name="detailAddress" placeholder="상세주소를 입력해주세요." value=""
								class="jck_join_input"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">프로필 소개글</td>
							<td><textarea rows="2" cols="40" style="resize: none;"
									id="profileintro" name="profileintro"></textarea></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>