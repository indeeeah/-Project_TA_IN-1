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
</head>
<body>
	<div class="login_box">
		<div class="login_logo">
			<b>TAIN</b>
		</div>
		<div class="login_box_body">
			<p class="lofin_msg">Login page</p>
			<form action="${pageContext.request.contextPath}/member/login"
				name="LoginForm" method="post">
				<div class="form_group">
				<input type ="text" name="m_id" class="form_control" placeholder="아이디">
				</div>
				<div class="form_group">
				<input type="password" name="m_pw" class="form_control" placeholder="비밀번호">
				</div>
				<div class="row">
				<div class="login">
				<button type="submit" class="btn">
				LOGIN
				</button> <br>
				<button type="submit" class="btn">
				JOIN
				</button>
				</div>
				</div>
			</form>
			<div class="find_link">
			<a href="#">비밀번호 찾기</a> <a href="#">아이디 찾기</a>
			</div>
		</div>
	</div>
</body>
</html>