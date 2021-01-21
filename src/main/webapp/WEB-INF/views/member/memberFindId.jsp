<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<style type="text/css">
body {
	font-family: Arial;
}

.w3-black {
	font-size: 15px;
	text-align: center;
	position: relative;
	margin: 7px 0;
	color: #f7f7f7;
	background-color: #144d2af8;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
	border-radius: 10px;
	text-align: center;
}

.w3-input {
	color: #333;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
}

p label {
	font-size: 15px;
}
</style>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form id="frm_findId"
				action="${pageContext.request.contextPath}/member/find_Id.do"
				method="post">
				<div class="w3-center w3-large w3-margin-top"></div>
				<div>
					<p>
						<label>이름</label> <input class="w3-input" type="text" id="name"
							name="m_name" required>
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="m_email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">아이디 찾기</button>
						
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
<!--  <script>
	function findId(id) {
		var queryString = $("form[id=frm_findId]").serialize();
		$.ajax({
					url : "${pageContext.request.contextPath}/member//find_Id.do",
					method : "POST",
					data : queryString,
					success : function(data) {
						console.log("data: " + data);
						if (data == "1") {
							console.log("success");
							href.location = "${pageContext.request.contextPath}/find_Id";
						} else if (data == '-1') {
							alert('가입된 이메일이 없습니다.');

						} else {
							alert("예기치 못한 오류가 발생했습니다. 다시 찾기를 시도해 주세요.");
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
-->
</html>