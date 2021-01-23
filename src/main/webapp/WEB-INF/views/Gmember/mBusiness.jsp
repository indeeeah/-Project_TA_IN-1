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

.wcon, .addr {
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
	text-align: left;
	vertical-align: middle !important;
}

a {
	padding: 15px 85px 15px 0 !important;
}

button:focus {
	border: none;
	outline: none;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$(".addr")
								.change(
										function() {
											$("#bm_addr")
													.val(
															$(
																	"#sample6_postcode")
																	.val()
																	+ "/"
																	+ $(
																			"#sample6_address")
																			.val()
																	+ "/"
																	+ $(
																			"#sample6_detailAddress")
																			.val());
										});

						$("#bmc").click(function() {
							$("#contents").css("display", "inline-block");
							$("#ask").css("display", "none");
						});

						$("#no").click(function() {
							$("#contents").css("display", "none");
							$("#ask").css("display", "inline-block");
						});
					});

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress").value = "";
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="sc_big_con">
			<div id="sc_title">비즈니스계정</div>
			<div id="sc_con">
				<div id="menu">
					<ul id="menulist">
						<li><a href="mManage.do">프로필 편집</a></li>
						<li><a href="mChangepw.do">비밀번호 변경</a></li>
						<li><a href="mCart.do">장바구니</a></li>
						<li><a href="mBuylist.do">구매목록</a></li>
						<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
						<li style="border-left: 2px solid black;"><a
							href="mBusiness.do"><span style="font-weight: bold;">비즈니스계정</span></a></li>
					</ul>
				</div>
				<c:if test="${bMember eq null}">
					<div id="ask"
						style="display: inline-block; width: 738px; text-align: center; margin: 0 auto;">
						<br> <br> <br> <br> <br>
						<h4>
							비즈니스 계정으로 전환하시면 상품을 판매하고 홍보할 수 있습니다.<br> <br>비즈니스 계정으로
							전환 하시겠습니까?
						</h4>
						<br> <br> <br> <br> <input type="button"
							id="bmc" class="btn2"
							style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
							value="확인"><br> <br> <br> <br> <br>
					</div>
					<div id="contents" style="padding-top: 30px; display: none;">
						<form id="editProfile" action="insertbMember.do" method="post"
							style="padding-bottom: 30px; padding-top: 30px;">
							<table id="profiletable" style="margin: 0 auto;">
								<tbody>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회원 ID</td>
										<td><input type="text" class="wcon" id="m_id" name="m_id"
											required readonly value="${my_name}"
											style="border-style: none;"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">계정분류</td>
										<td><select class="wcon" id="bm_cate" name="bm_cate"
											style="width: 177px;">
												<option>선택해주세요.</option>
												<option value="1">패션</option>
												<option value="2">전자제품</option>
												<option value="3">잡화</option>
												<option value="4">화장품</option>
												<option value="5">기타</option>
										</select></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사이름</td>
										<td><input type="text" class="wcon" id="bm_name"
											name="bm_name" value="" required></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사전화</td>
										<td><input type="text" class="wcon" id="bm_phone"
											name="bm_phone" value="" required></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사주소</td>
										<td><input type="text" name="m_addr1"
											id="sample6_postcode" class="addr" placeholder="우편번호"
											value=""> <input type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
											class="btn2"
											style="background: white; border: 1px solid #D5D5D5;"><br>
											<input type="text" name="m_addr2" id="sample6_address"
											class="addr" style="margin-bottom: 10px;" placeholder="주소"
											value=""><br> <input type="text" name="m_addr3"
											id="sample6_detailAddress" class="addr" placeholder="상세주소"
											value="" required style="width: 295px;"> <input
											type="text" id="sample6_extraAddress" placeholder="참고항목"
											style="display: none;"> <input type="text"
											id="bm_addr" name="bm_addr" style="display: none;"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">홈페이지 주소</td>
										<td><input type="text" class="wcon" id="bm_url"
											name="bm_url" value=""></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">계좌번호</td>
										<td><input type="text" class="wcon" id="bm_account"
											name="bm_account" value="" required> <span
											style="font-size: 7pt;"><br>*정확하게 기입하지 않으면, 수익금을
												수령하시지 못합니다.</span></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사 소개</td>
										<td><textarea rows="2" class="wcon" cols="40"
												style="resize: none;" id="bm_intro" name="bm_intro"></textarea>
											<input type="text" id="bm_approval" name="bm_approval"
											value="N" style="display: none"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<br> <input type="submit" class="btn2"
								style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
								value="저장">&nbsp;&nbsp;&nbsp;<input id="no"
								type="button" class="btn2"
								style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
								value="취소">
						</form>
					</div>
					<div style="clear: both;"></div>
				</c:if>
				<c:if test="${bMember ne null and bMember.bm_approval eq 'Y'}">
					<div id="contents" style="padding-top: 30px;">
						<div id="submenu" style="padding-top: 30px;">
							<input type="button" id="all" class="submenu" value="비즈니스 정보 "
								style="background: white; text-align: center; width: 120px; border: 2px solid black;"
								onclick="location.href='mBusiness.do'"> <input
								type="button" id="board" class="submenu" value="비즈니스 계정"
								style="background: white; text-align: center; width: 120px;"
								onclick="location.href='bOut.do'"> <input type="button"
								id="board" class="submenu" value="주문관리"
								style="background: white; text-align: center; width: 120px;"
								onclick="location.href='bOrder.do'"> <input
								type="button" id="bboard" class="submenu" value="카테고리"
								style="background: white; text-align: center; width: 120px;"
								onclick="location.href='bCategory.do'"> <input
								type="button" id="bboard" class="submenu" value="광고 컨텐츠"
								style="background: white; text-align: center; width: 120px;"
								onclick="location.href='bAD.do'">
						</div>
						<form id="editProfile" action="updatebMember.do" method="post"
							style="padding-bottom: 30px; padding-top: 30px;">
							<table id="profiletable" style="margin: 0 auto;">
								<tbody>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회원 ID</td>
										<td><input type="text" class="wcon" id="m_id" name="m_id"
											required readonly value="${bMember.m_id}"
											style="border-style: none;"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">계정분류</td>
										<td><select id="bm_cate" class="wcon" name="bm_cate"
											style="width: 177px;" required>
												<option>선택해주세요.</option>
												<option value="1"
													<c:if test="${bMember.bm_cate eq 1 }">selected</c:if>>패션
												</option>
												<option value="2"
													<c:if test="${bMember.bm_cate eq 2 }">selected</c:if>>전자제품
												</option>
												<option value="3"
													<c:if test="${bMember.bm_cate eq 3 }">selected</c:if>>잡화
												</option>
												<option value="4"
													<c:if test="${bMember.bm_cate eq 4 }">selected</c:if>>화장품
												</option>
												<option value="5"
													<c:if test="${bMember.bm_cate eq 5 }">selected</c:if>>기타
												</option>
										</select></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사이름</td>
										<td><input type="text" class="wcon" id="bm_name"
											name="bm_name" value="${bMember.bm_name }" required></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사전화</td>
										<td><input type="text" class="wcon" id="bm_phone"
											name="bm_phone" value="${bMember.bm_phone }" required></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사주소</td>
										<td><input type="text" name="m_addr1"
											id="sample6_postcode" class="addr" placeholder="우편번호"
											value="${bMemAddr[0] }"> <input type="button"
											onclick="sample6_execDaumPostcode()" class="btn2"
											value="우편번호 찾기"
											style="background: white; border: 1px solid #D5D5D5;"><br>
											<input type="text" name="m_addr2" id="sample6_address"
											style="margin-bottom: 10px;" class="addr" placeholder="주소"
											value="${bMemAddr[1] }"><br> <input type="text"
											name="m_addr3" id="sample6_detailAddress" class="addr"
											placeholder="상세주소" value="${bMemAddr[2] }" required
											style="width: 295px;"> <input type="text"
											id="sample6_extraAddress" placeholder="참고항목"
											style="display: none;"> <input type="text"
											id="bm_addr" name="bm_addr" value="${bMember.bm_addr }"
											style="display: none;"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">홈페이지 주소</td>
										<td><input type="text" class="wcon" id="bm_url"
											name="bm_url" value="${bMember.bm_url }"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">계좌번호</td>
										<td><input type="text" class="wcon" id="bm_account"
											name="bm_account" value="${bMember.bm_account }" required>
											&nbsp;&nbsp; <span style="font-size: 7pt;"><br>*정확히
												기입하지 않으면, 수익금을 수령하시지 못합니다.</span></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr class="register" height="30">
										<td width="35%" style="font-size: 14px;">회사 소개</td>
										<td><textarea rows="2" class="wcon" cols="40"
												style="resize: none; height: 50px;" id="bm_intro"
												name="bm_intro">${bMember.bm_intro }</textarea> <input
											type="text" id="bm_approval" name="bm_approval" value="Y"
											style="display: none"></td>
									</tr>
									<tr>
										<td colspan="3">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<br> <input type="submit" class="btn2"
								style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
								value="저장">&nbsp;&nbsp;&nbsp;<input id="no"
								type="button" class="btn2"
								style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
								value="취소">
						</form>
					</div>
				</c:if>
				<c:if test="${bMember ne null and bMember.bm_approval eq 'N'}">
					<div id="contents" style="padding-top: 30px;">
						<br> <br> <br> <br> <br> <br> <br>
						<span style="color: white; background: gray;">비즈니스 전환 승인
							대기중입니다.</span> <br> <br> <br> <br> <br>
						<h3>관리자의 승인을 기다리고 있습니다. 약 1~3일 정도가 소요됩니다.</h3>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br>
					</div>
					<div style="clear: both;"></div>
				</c:if>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>