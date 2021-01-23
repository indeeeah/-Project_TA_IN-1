<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bssBtn2 {
	font-size: 15px;
	width: 100%;
	height: 50px;
	border: none;
	background-color: #586f9b;
	border-radius: 50px;
	background-size: 200%;
	border-color: white;
	color: #fff;
	outline: none;
}
</style>
<script>
	function checkOnlyOne(chk) {
		var obj = document.getElementsByName("bm_cate");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
</script>
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

</head>
<body>
	<div class="join_form">
		<form id="frm_businessjoin">
			<div class="join_box">
				<h2>Business</h2>
				<div class="form_group">
					<input type="text" class="form_control" id="m_id" name="m_id"
						placeholder="아이디">
					<div class="check_font" id="id_check"></div>
				</div>
				<div class="form_group">
					<input type="text" class="form_control" id="bm_name" name="bm_name"
						placeholder="브랜드명">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form_group_ck">

					<label> <input type="checkbox" class="form_control"
						id="bm_cate" onclick="checkOnlyOne(this)" name="bm_cate" value="1">
						패션
					</label> <label> <input type="checkbox" class="form_control"
						onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="2">
						전자 제품
					</label> <label> <input type="checkbox" class="form_control"
						onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="3">
						잡화
					</label> <label> <input type="checkbox" class="form_control"
						onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="4">
						화장품
					</label> <label><input type="checkbox" class="form_control"
						onclick="checkOnlyOne(this)" id="bm_cate" name="bm_cate" value="5">
						기타</label>
				</div>
				<div class="form_group">
					<input type="text" class="form_control" id="bm_url" name="bm_url"
						placeholder="홈페이지">
					<div class="check_font" id="birth_check"></div>
				</div>
				<div class="form_group">
					<input type="tel" class="form_control" id="bm_phone"
						name="bm_phone" placeholder="회사 번호">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="form_group">
					<input type="tel" class="form_control" id="bm_account"
						name="bm_account" placeholder="계좌번호">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="form_group">
					<input type="text" class="form_control" id="bm_intro"
						name="bm_intro" placeholder="회사 소개">
				</div>
				<div class="form_group">
					<input type="text" name="m_addr1" id="sample6_postcode"
						class="form_control" placeholder="우편번호" value="${bMemAddr[0] }">
					<input type="button" onclick="sample6_execDaumPostcode()"
						class="
" value="우편번호 찾기"
						style="background: white; border: 1px solid #D5D5D5;">
				</div>
				<div class="form_group">
					<input type="text" name="m_addr2" id="sample6_address" class="addr"
						placeholder="주소" value="${bMemAddr[1] }">
				</div>
				<div class="form_group">
					<input type="text" name="m_addr3" id="sample6_detailAddress"
						class="addr" placeholder="상세주소" value="${bMemAddr[2] }" required
						style="width: 295px;"> <input type="text"
						id="sample6_extraAddress" placeholder="참고항목"
						style="display: none;"> <input type="text" id="bm_addr"
						name="bm_addr" value="${bMember.bm_addr }" style="display: none;">
				</div>
				<button type="button" class="btn btn-primary bssBtn2"
					onclick="businessjoin('${my_name }');">비즈니시 계정 생성</button>
				<div class="bottom-text">
					<a href="${pageContext.request.contextPath}/member/loginPage">
						로그인으로 돌아가기</a>
				</div>
			</div>
		</form>
	</div>

</body>
<script>
	// 비즈니스회원가입 ajax
	function businessjoin(id) {
		var queryString = $("form[id=frm_businessjoin]").serialize();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/member/businessjoin.do",
					method : "POST",
					data : queryString,
					success : function(data) {
						console.log("success");
						alert(data.msg);
						// 정상적을 가입에 성공하면 로그인 페이지로 이동. + 이미 가입한 회원 + 관리자승인 대기중인 회원
						if (data.code == 1 || data.code == -3
								|| data.code == -4) {
							var url = "${pageContext.request.contextPath}/member/loginPage";
							$(location).attr('href', url);
						} // 그 외 오류 코드의 경우는 이 페이지 그대로 머무름
					},
					error : function(request, status, error) {
						console.log("error");
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
	}
</script>
</html>