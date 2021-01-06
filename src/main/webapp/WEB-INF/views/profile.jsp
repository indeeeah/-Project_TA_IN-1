<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#profile_image{
		float:left;
	}
	#profile{
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
	
</style>
<body>
<header id="header">
	<div id="header_con">
		<div id="header_left">
			<div id="fix_logo" onclick="location.href='timeLineList.do?m_id=aaab'"></div>
		</div>
		<input type="text" id="search" placeholder="검색" style="text-align:center;">
		<div id="header_right">
			<div id="header_icon_con">
				<div id="fix_home" class="fix_icon"></div>
				<div id="fix_message" class="fix_icon"></div>
				<div id="fix_alert" class="fix_icon"></div>
				<div id="fix_bag" class="fix_icon"></div>
				<div id="fix_profile" class="fix_icon"></div>
			</div>
		</div>
	</div>
</header>
<div>	
	<div id="profile_image"><img src="./image/mypage.png" width=200px height=200px></div>
	<div id="profile">
		<div id="profile_nickname">아이디</div>
		<button type="button" id="profile_button">프로필 편집</button>
		<a href="#" id="profile_option"><img src="image/mypage.png" width=22px height=22px></a>
	</div>
</div>
</body>
</html>