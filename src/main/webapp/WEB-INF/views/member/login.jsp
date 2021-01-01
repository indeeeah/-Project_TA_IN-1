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
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div style="float: none; margin: 0 auto;">
		<h1>Login</h1>
		<form action="/member/login" name="LoginForm" method="post">
			<h1>ID</h1>
			<input type="text" required name="id">
			<h1>PW</h1>
			<input type="password" required name="pw">
			<button type="submit">Login</button>
		</form>
		<button type="button" onclick="location.href='/user/joinPage'">JOIN</button>
		<button type="button" onclick="location.href='/user/findPage'">Find
			Id/Pw</button>
	</div>

</body>
</html>