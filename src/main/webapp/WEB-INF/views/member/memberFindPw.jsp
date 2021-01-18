<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div id="searchI">
					<form id="frmFindPw" action="${pageContext.request.contextPath}/member/find_pw.do" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="m_id" name="m_id"
								placeholder="아이디">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="m_email"
								name="m_email" placeholder="E-mail">
						</div>
						<div class="form-group">
							<button id="myBtn" type="button" onclick="idSearch_click()"
								class="btn btn-primary btn-block">이메일 전송</button>
						</div>
						<div class="bottom-text">
							<a href="${pageContext.request.contextPath}/member/loginPage">로그인으로
								돌아가기</a>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
	<script>
	function idSearch_click(){
		var frmfindPw = document.getElementById("frmFindPw");
		frmfindPw.submit();
	}
	</script>