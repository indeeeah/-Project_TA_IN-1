<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="script.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	border: 0px solid silver;
}

body {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	font-size: 1rem;
	line-height: 1.2rem;
	color: #181818;
	letter-spacing: 0.1px;
}

html {
	box-sizing: border-box;
}

.form-group {
	width: 30rem;
	margin: 0 auto;
	margin-top: 3.5rem;
}

input[type='button'].idw {
	border-bottom: 2px solid #144d2af8;
}

.group-1 {
	display: none;
}

main h1 {
	font-size: 2.3rem;
	letter-spacing: .2px;
	padding-bottom: 1rem;
	padding-top: 5rem;
	text-align: center;
}

.bc-form-input-item {
	position: relative;
	margin-bottom: 8px;
	height: 79px;
	width: 100%;
	padding: 0;
	top: 20px;
}

.bc-form-input-item input {
	position: absolute;
	top: 24px;
	height: 32px;
	border-radius: 0px;
	padding-left: 0px;
}

.bc-input-lable {
	font-size: 0.9rem;
	height: 20px;
	margin: 0px;
	padding-top: 4px;
}

input[type='email'], input[type='password'], input[type='tel'], select {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border: none;
	background-color: transparent;
	border-bottom: 1px solid #737373;
	line-height: 22px;
	width: 100%;
	padding-bottom: 7px;
}

input[type='email'] :hover, input[type='password'] :hover, input[type='tel'] :hover,
	select :hover {
	background-color: transparent;
}

input[type='email']:focus, input[type='password']:focus, input[type='tel']:focus,
	select:focus {
	border-bottom: 2px solid #144d2af8;
	padding-bottom: 6px;
	outline: none;
}

input[type='tel']::placeholder {
	padding-bottom: 0;
	font-size: 10px;
	opacity: .5;
}

.buybtn {
	width: 14rem;
	font-size: 0.8rem;
	margin: 0 auto;
	margin-top: 3rem;
	padding: 0.8rem 0;
	font-family: 'NEXON Lv2 Gothic Bold';
	text-align: center;
	cursor: pointer;
	position: relative;
	background: #144d2af8;
	color: #fff;
	transition: 1s;
	justify-content: space-between;
}

.buybtn:hover {
	filter: brightness(85%);
}

.fa-arrow-right {
	padding-left: 6rem;
	transition: 0.5s;
}

.findbtn {
	padding-left: 5.5rem;
}

.buybtn:hover .fa-arrow-right, .buybtn.hover .fa-arrow-right {
	padding-left: 1rem;
	animation: arrowbtn 1s;
	animation-delay: 0.5s;
	animation-fill-mode: forwards;
}

@
keyframes arrowbtn {from { transform:translateX(0);
	
}

to {
	transform: translateX(0.7rem);
}

}
.group-1 p {
	font-size: 0.5rem;
	padding-top: 0.2rem;
}

.group-1>:nth-child(4) {
	padding-top: 1rem;
}

main {
	padding-bottom: 2rem;
}

.know {
	font-size: 0.9rem;
	text-align: center;
	padding: 0.3rem 0;
	cursor: pointer;
}

.know:hover {
	text-decoration: underline;
}

.remute {
	width: 30rem;
	margin: 0 auto;
	position: relative;
	padding-top: 4rem;
}

input[type='button'] {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border: none;
	background-color: transparent;
	line-height: 22px;
	font-size: 1rem;
	padding: 0.4rem 0.5rem;
	font-family: 'NEXON Lv1 Gothic OTF';
	cursor: pointer;
	transition: .1s;
	position: absolute;
}

.pasw {
	margin-left: 8rem;
}

input[type='button']:hover {
	border-bottom: 2px solid #144d2af8;
}

input[type='button']:focus {
	border-bottom: 2px solid #144d2af8;
	outline: none;
}

.form-control {
	color: #333;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
	border: 1px solid silver;
	border-radius: 10px;
}

.btn-primary {
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
</style>
</head>
<body>
	<div class="container">
		<main role="main">

			<h1>계정 찾기</h1>
			<div class="remute">
				<input type="button" onclick="finded()" class="idw" value="아이디찾기">
				<input type="button" onclick="find()" class="pasw" value="비밀번호 찾기">
			</div>
			<div class="form-group group">

				<%@ include file="/WEB-INF/views/member/memberFindId.jsp"%>
			</div>
			<div class="form-group group-1">

				<%@ include file="/WEB-INF/views/member/memberFindPw.jsp"%>
			</div>

		</main>
	</div>



	<script type="text/javascript">
		var art1 = document.getElementsByClassName("group");
		var art2 = document.getElementsByClassName("group-1");
		var art3 = document.getElementsByClassName("idw");
		function finded() {
			art1[0].style.display = "block";
			art2[0].style.display = "none";
			art3[0].style.borderBottom = "2px solid  #144d2af8";

		}
		function find() {
			art1[0].style.display = "none";
			art2[0].style.display = "block";
			art3[0].style.borderBottom = "none";
		}
	</script>

</body>
</html>