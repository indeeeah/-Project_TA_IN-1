<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.modal-content {
	text-align: center;
	font-size: 30px;
	background-color: white;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	height: 50%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.full {
	width: 400px;
	background-color: #f1f1f1;
	height: 800px;
	padding: 40px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%)
}

.sub_title h3 {
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>

	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2"
						name="search_total" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="m_name">이름</label>
						<div>
							<input type="text" class="form-control" id="m_name" name="m_name">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="m_phone">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="m_phone"
								name="m_phone">
						</div>
					</div>
					<div class="form-group">
						<button id="myBtn" type="button" onclick="idSearch_click()"
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}/member/loginPage">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="m_id">아이디</label>
						<div>
							<input type="text" class="form-control" id="m_id" name="m_id">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="m_id">이메일</label>
						<div>
							<input type="email" class="form-control" id="m_email"
								name="m_email">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button"
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}/member/loginPage">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="myModal" class="modal">
		<div class="modal_content">
			<h4>
				<b>아이디는?</b><span class="close">&times;</span>
			</h4>
			<br>
			<h2 id="id_value"></h2>
			<br>
			<button type="button" id="pwSearch_btn"
				class="btn peach-gradient btn-rounded waves-effect">
				<i class="fa fa-envelope"></i>비밀번호 찾기
			</button>
		</div>

	</div>

	<script>
		var modal = document.getElementById("myModal");
		var btn = document.getElementById("myBtn");
		var span = document.getElementsByClassName("close")[0];
		btn.onclick = function() {
			modal.style.display = "block";
		}
		span.onclick = function() {
			modal.style.display = "none";
		}
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script>
		//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
	</script>
	<script>
		//아이디 & 스토어 값 저장하기 위한 변수
		var idV = "";
		// 아이디 값 받고 출력하는 ajax
		var idSearch_click = function() {
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/member/memberFindId?m_name="
								+ $('#m_name').val()
								+ "&m_phone="
								+ $('#m_phone').val(),
						success : function(data) {
							if (data == 0) {
								$('#id_value').text("회원 정보를 확인해주세요!");
							} else {
								$('#id_value').text(data);
								// 아이디값 별도로 저장
								idV = data;
							}
						}
					});
		}
	</script>

</body>
</html>