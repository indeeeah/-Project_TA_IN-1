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

button:focus {
	border: none;
	outline: none;
}
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

		$("#imgupload").click(function() {
			if ($("#imgfile").val() == null) {
				$("#imgmanageModal").css("display", "block");
				$("#parentModal").css("display", "block");
			} else {
				$("#imgmanageModal").css("display", "none");
				$("#parentModal").css("display", "none");
			}
		});
	});

	function emailchk() {
		var email = $("#email").val();
		$.ajax({
			url : "checkEmail.do",
			type : "post",
			data : {
				'email' : email
			},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "json",
			async : true,
			success : function(result) {
				console.log(result.check);
				var chk = result.check;
				if (chk == "F") {
					alert("이미 사용중인 이메일 입니다.");
					$("#emailcheck").attr("value", "N");
				} else if (chk == "T") {
					alert("사용 가능한 이메일 입니다.");
					$("#emailcheck").attr("value", "Y");
					return false;
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function updatecheck() {
		var update = $("#emailcheck").val();
		if (update == "N") {
			alert("이메일 중복확인 해주세요.");
		} else {
			$("form").attr("action", "updateProfile.do");
			$("form").submit();
		}
	}
</script>
<body>
	<header id="header">
		<div id="header_con">
			<div id="header_left">
				<div id="fix_logo"></div>
				<input type="hidden" name="m_id" class="m_id"
					value="${myProfile.m_id }">
			</div>
			<input type="text" id="search" placeholder="검색"
				style="text-align: center;">
			<div id="header_right">
				<div id="header_icon_con">
					<div id="fix_home" class="fix_icon"></div>
					<div id="fix_message" class="fix_icon"></div>
					<div id="fix_alert" class="fix_icon"></div>
					<div id="fix_bag" class="fix_icon"></div>
					<div id="fix_profile" class="fix_icon"></div>
				</div>
			</div>
		</div>
	</header>
	<div id="parentModal"></div>
	<div id="forheader"></div>
	<div id="mManage">
		<div id="imgmanageModal"
			style="border-radius: 0.5em; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;">
			<h3 style="margin-top: 22px; margin-bottom: 22px;">프로필 사진 바꾸기</h3>
			<hr style="color: #D5D5D5;">
			<button id="imgupload"
				style="width: 100%; height: 16%; border-style: none; background: white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer">
				<label for="imgfile" style="cursor: pointer;">사진 업로드</label>
			</button>
			<input id="imgfile" type="file" style="display: none;">
			<hr style="color: #D5D5D5;">
			<button id="imgdelete"
				style="width: 100%; height: 16%; border-style: none; background: white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer">현재
				사진 삭제</button>
			<hr style="color: #D5D5D5;">
			<button id="clear"
				style="width: 100%; height: 16%; border-style: none; background: white; color: black; font-size: 12pt; font-weight: bold; cursor: pointer">취소</button>
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
			<form id="editProfile" name="myForm" method="post"
				style="padding-bottom: 30px;">
				<table id="profiletable" style="margin: 0 auto;">
					<tbody>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%"></td>
							<td width="30%"><img src="${profile.m_img}"
								style="width: 50px; height: 50px"></td>
							<td>${profile.m_id }<br> <label id="changeimg"
								style="color: #0095f6; font-size: 10pt; font-weight: bold; cursor: pointer">프로필
									사진 바꾸기</label></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">회원 ID</td>
							<td><input type="text" id="id" name="m_id" required readonly
								value="${profile.m_id}" style="border-style:none;"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">이 름</td>
							<td><input type="text" id="m_name" name="m_name" required
								value="${profile.m_name}"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">휴대전화</td>
							<td><input type="text" id="userphone" name="m_phone"
								value="${profile.m_phone}" required></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">이메일</td>
							<td><input type="email" id="email" name="m_email"
								value="${profile.m_email}" required><input type="text"
								id="emailcheck" name="emailcheck" value="N"
								style="display: none;">&nbsp;<input type="button"
								value="중복체크" onclick="emailchk()"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">생년월일</td>
							<td><input type="date" id="userbirth" name="m_birth"
								style="width: 56%;" value="${profile.m_birth}" required></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">주소</td>
							<td><input type="text" id="sample4_postcode" name="m_addr1"
								onclick="sample4_execDaumPostcode()" placeholder="우편번호"
								class="jck_join_input" value="${profile.m_addr1}"> <input
								type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기"><br> <input type="text"
								id="sample4_roadAddress" name="m_addr2" placeholder="도로명주소"
								value="${profile.m_addr2}" class="jck_join_input"><br>
								<input type="text" size="43" id="sample4_detailAddress"
								name="m_addr3" placeholder="상세주소를 입력해주세요."
								value="${profile.m_addr3}" class="jck_join_input"></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%">*</td>
							<td width="30%">프로필 소개글</td>
							<td><textarea rows="2" cols="40" style="resize: none;"
									id="profileintro" name="m_intro">${profile.m_intro}</textarea></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<br> <input type="submit"
					style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;"
					value="저장하기" onclick="updatecheck()">&nbsp;&nbsp;&nbsp;<input
					type="button"
					style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;"
					value="취소" onclick="location.href='mManage.do'">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		// 자동 검색어 완성
		// var availableTags = [
		// 	"#ActionScript",
		// 	"#AppleScript",
		// 	"#Asp",
		// 	"#BASIC",
		// 	"#C",
		// 	"#C++",
		// 	"#Clojure",
		// 	"#COBOL",
		// 	"#ColdFusion",
		// 	"#Erlang",
		// 	"#Fortran",
		// 	"#Groovy",
		// 	"#Haskell",
		// 	"#Java",
		// 	"JavaScript",
		// 	"#Lisp",
		// 	"#Perl",
		// 	"#PHP",
		// 	"#Python",
		// 	"#Ruby",
		// 	"#Scala",
		// 	"Scheme"
		// ];

		// $("#search").autocomplete({
		// 	source:availableTags
		// });
		/* $("#search").autocomplete({
		    source: function (request, response) {
		        $.ajax({
		            url: "${pageContext.request.contextPath}/autocomplete.do",
		            type: "post",
		            dataType: "json",
		            data: request,
		            success: function (data) {
		                var result = data;
		                response(result);
		            },
		            error: function (request, status, error) {
		                alert("code:"
		                    + request.status
		                    + "\n"
		                    + "message:"
		                    + request.responseText
		                    + "\n" + "error:"
		                    + error);
		            }
		        });
		    } */

		/* $("#search").autocomplete({
		    serviceUrl:"${pageContext.request.contextPath}/autocomplete.do",
		    paramName : "word",
		    delimiter:",",
		    transformResult:function(response){
		        return{
		            suggestions: $.map($.parseJSON(response), function(item) {
		
		                  return { value: item.word, data: item.categoryId };
		               })
		        };
		    }
		}); */

		$("#search")
				.autocomplete(
						{
							source : function(request, response) { // 자동완성대
								var request = $("#search").val();
								console.log(request);
								$
										.ajax({
											url : "${pageContext.request.contextPath}/autocomplete.do",
											type : "post",
											dataType : "json",
											data : {
												word : request
											},
											success : function(data) {
												console.log(data);
												console.log(data[0].word);
												value1 = data[0].word;
												console.log(value);
												var value = new Array();
												for (var i = 0; i < data.length; i++) {
													value.push(data[i].word)
												}
												response($.map(value, function(
														item) { //json[i] 번째 에 있는게 item 임.
													return {
														//label: item+"label",    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
														value : item, //그냥 사용자 설정값?
														test : item + "test"
													/* response(
													    data = $.map(data, function(value, key) { //json[i] 번째 에 있는게 item 임.
													        /* return value;
													        console.log('key' + key[3]);
													        console.log('value' + value);
													        var word = data.word;
													        console.log('word' + word); */
													//   return {
													//     //label: value + "label", //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
													//     value: value, //그냥 사용자 설정값?
													//     test: value + "test"
													}

												})

												/* var result = autoword;
												console.log(result);
												console.log(response);
												// for (var i = 0; i < result.autoword.length; i++) {
												// 	var resultword = result.autoword[i].word;
												// 	console.log(resultword);
												// }
												// console.log(autoword);
												$.each(result, function(key, value) {
												    console.log('key:'+ key[2]);
												    console.log('value:'+ value[3]);
												    console.log('word:'+ value.word); */

												/* }); */

												)
											},
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
											}
										});
							}

						});

	});

	// function forautocomp() {
	// 		$.ajax({
	// 			url: "${pageContext.request.contextPath}/autocomplete.do",
	// 			type: "post",
	// 			dataType: "json",
	// 			success: function (autoword) {
	// 				var result = autoword;
	// 				console.log(result);
	// 				var resultword = result.autoword.word;
	// 				console.log(resultword);
	// 			},
	// 			error: function (request, status, error) {
	// 				alert("code:"
	// 					+ request.status
	// 					+ "\n"
	// 					+ "message:"
	// 					+ request.responseText
	// 					+ "\n" + "error:"
	// 					+ error);
	// 			}
	// 		});
	// 	}

	$("#fix_logo").on('click', function() {
		var memId = $(".m_id").val();
		var url = "${pageContext.request.contextPath}/timeLine?m_id=" + memId;
		$(location).attr('href', url);
	});

	$("#search")
			.on(
					"keypress",
					function(event) {
						if (window.event.keyCode == 13) {

							var memId = $(".m_id").val();
							var hashtag = $("#search").val();
							var url = "${pageContext.request.contextPath}/explore?hashtag="
									+ hashtag + "&&m_id=" + memId;
							$(location).attr('href', url);
						}
					});
</script>

</html>