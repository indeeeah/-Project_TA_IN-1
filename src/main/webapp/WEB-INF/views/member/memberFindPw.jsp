<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="full">
	<div class="container">
		<div class="area_inputs wow fadeIn">
			<div id="searchI">
				<form id="frmFindPw" method="post">
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="m_id"
							name="m_id" required>
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="m_email" required>
					</p>
					<p class="w3-center">
						<button id="myBtn" type="button" onclick="pwSearch_click()"
							class="btn btn-primary btn-block">이메일 전송</button>
					</p>
				</form>
			</div>

		</div>

	</div>
</div>
<script>
	function pwSearch_click() {
		console.log("pwSearch_click");
		var queryString1 = $("form[id=frmFindPw]").serialize();
		$.ajax({
					url : "${pageContext.request.contextPath}/member/find_pw.do",
					method : "POST",
					data : queryString1,
					success : function(data) {
						console.log("data: " + data);
						if (data == "1") {
							console.log("success");
							alert('이메일로 임시 비밀번호를 발송하였습니다.');
					        var url = '${pageContext.request.contextPath}/member/loginPage';
					        $(location).attr('href', url);
						} else if (data == '-1') {
							alert('아이디가 없습니다. 다시 확인하고 시도해 주세요.');
						} else if (data == '-2') {
							alert('잘못된 이메일 입니다. 다시 확인하고 시도해 주세요.');
						} else if (data == '-3') {
							alert('새로운 패스워드 업데이트 실패했습니다.');
						} else {
							alert("예기치 못한 오류 발생하였습니다. 다시 로그인 시도해주세요.");
						}
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