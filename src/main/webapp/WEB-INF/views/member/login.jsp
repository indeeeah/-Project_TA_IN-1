<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	box-sizing: border-box;
}

body {
	min-height: 100vh;
}

.login_box {
	width: 400px;
	background-color: #f1f1f1;
	height: 500px;
	padding: 80px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%)
}

.login_logo {
	text-align: center;
	font-size: 30px;
}

.lofin_msg {
	text-align: center;
	margin-bottom: 60px;
}

.form_group {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 30px 0;
}

.form_group input {
	font-size: 15px;
	color: #333;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
}

.btn-primary {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background: -webkit-linear-gradient(to right, #ff9068, #fd746c);
	background: linear-gradient(120deg, #ff9068, #fd746c); D 0%, #B721FF
	100%);
	border-radius: 10px;
	background-size: 200%;
	border-color: white;
	color: #fff;
	outline: none;
	cusor: pointer;
	transition: .5s;
	background: linear-gradient(120deg, #ff9068, #fd746c); D 0%, #B721FF
	100%);
	border-radius: 10px;
}

.btn-primary: hover {
	background-position: right;
}

.find_link {
	margin-top: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="login_box">
		<div class="login_logo">
			<b>TAIN</b>
		</div>
		<div class="login_box_body">
			<p class="lofin_msg">Login page</p>
			<form action="${pageContext.request.contextPath}/member/login.do"
				method="post">
				<div class="form_group">
					<input type="text" name="m_id" class="form_control"
						placeholder="아이디">
				</div>
				<div class="form_group">
					<input type="password" name="m_pw" class="form_control"
						placeholder="비밀번호">
				</div>
				<div class="row">
					<div class="login">
						<button type="submit" class="btn btn-primary ">LOGIN</button>
					</div>
				</div>
			</form>
			<div class="find_link">
				<a href="${pageContext.request.contextPath}/member/memberFindId.do">아이디/비밀번호를 잊으셨나요?</a>
			</div>
			<div class="find_link">
				계정이 없으신가요?<a href="${pageContext.request.contextPath}/member/joinPage">가입하기</a>
			</div>
		</div>
	</div>
</body>
</html>