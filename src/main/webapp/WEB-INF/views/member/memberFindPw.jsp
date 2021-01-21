<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="full">
	<div class="container">
		<div class="area_inputs wow fadeIn">
			<div id="searchI">
				<form id="frmFindPw"
					action="${pageContext.request.contextPath}/member/find_pw.do"
					method="post">
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="m_id"
							name="m_id" required>
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="m_email" required>
					</p>
					<p class="w3-center">
						<button id="myBtn" type="button" onclick="idSearch_click()"
							class="btn btn-primary btn-block">이메일 전송</button>
					</p>
				</form>
			</div>

		</div>

	</div>
</div>
<script>
	function idSearch_click() {
		var frmfindPw = document.getElementById("frmFindPw");
		frmfindPw.submit();
	}
</script>