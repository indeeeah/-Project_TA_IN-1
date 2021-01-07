<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<style>
	#profile{
	width:100%;
	height:200px;
	}
	#profile_image{
		float:left;
	}
	#profile_info{
		float:left;
	}
	#profile_nickname{
		float:left;
	}
	#profile_button{
		float:left;	
	}
	#profile_option{
		float:left;	
	}
	#profile_board{
		float:left;	
	}
	#profile_follower{
		float:left;
	}
	#profile_follow{
		float:left;
	}
	#profile_intro{
		float:left;
	}
	#board{

	}
	#board_section1{
		 display: flex;
  		justify-content: center;
  		margin-bottom:28px;
	}
	#board_section2{
		 display: flex;
  		justify-content: center;
  		margin-bottom:28px;
	}
	#board_section3{
		 display: flex;
  		justify-content: center;
  		margin-bottom:28px;
	}
	#board_section4{
		 display: flex;
  		justify-content: center;
	}
	#board_img1{
	margin-right:28px;
	}
	#board_img2{
	margin-right:28px;
	}
	#board_img3{
	margin-right:28px;
	}
	#board_img4{
	margin-right:28px;
	}
	#board_img5{
	margin-right:28px;
	}
	#board_img6{
	margin-right:28px;
	}
	#board_img7{
	margin-right:28px;
	}
	#board_img8{
	margin-right:28px;
	}
	#board_img9{
	margin-right:28px;
	}
	#board_img10{
	margin-right:28px;
	}
</style>
<body>
</header>
<div id="profile">	
	<div id="profile_image"><img src="./image/mypage.png" width=200px height=200px></div>
	<div id="profile_info">
		<div id="profile_nickname">아이디</div>
		<button type="button" id="profile_button">프로필 편집</button>
		<a href="#" id="profile_option"><img src="image/mypage.png" width=22px height=22px></a><br>
		<div id="profile_board">게시물</div>
		<a href="#" id="profile_follower">팔로워</a>
		<a href="#" id="profile_follow">팔로우</a><br>
		<div id="profile_intro">소개글</div>
	</div>
</div>
<br>
<div id="board">
	<div id="board_section1">
		<a href="#" id="board_img1"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img2"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img3"><img src="image/home.png" width=293px height=293px></a>
	</div>
	<div id="board_section2">
		<a href="#" id="board_img4"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img5"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img6"><img src="image/home.png" width=293px height=293px></a>
	</div>
	<div id="board_section3">
		<a href="#" id="board_img7"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img8"><img src="image/home.png" width=293px height=293px></a>
		<a href="#" id="board_img9"><img src="image/home.png" width=293px height=293px></a>
	</div>
	<div id="board_section4">
		<a href="#" id="board_img10"><img src="image/home.png" width=293px height=293px></a>
	</div>
</div>
</body>
</html>