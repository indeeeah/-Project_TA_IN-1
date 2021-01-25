<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비즈니스 메인</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<style>
a{
	text-decoration:none;
}
body {
	font-family: Arial, Helvetica, sans-serif;
	color: #262626;
	background-color: #FAFAFA;
}
button{
	padding:1px;
	outline: none;
    border: none;
    font-size: 12px;
    line-height: 18px;
    background-color: transparent;
    cursor:pointer;
}
input {
    border: 1px solid #C7C7C7;
    border-radius:5px;
}
.content{
	width:1000px;
	margin:0 auto;
}
#general_con {
    width: 1000px;
}

#profile_con_top {
    width: 100%;
    height: 150px;
}

#profile_photo img{
    width: 150px;
    height: 150px;
    margin-left: 50px;
    border-radius: 50%;
    float: left;
    cursor: pointer;
}

#profile_left {
    margin-left: 80px;
    width: 720px;
    float: left;
}

#profile_left_top_con {
    height: 40px;
}

#profile_name {
    height: 40px;
    font-size: 28px;
    line-height: 40px;
    float: left;
}

.profile_btn {
    float: left;
    margin-left: 20px;
    margin-top: 5px;
    height: 18px;
    padding: 5px 9px 5px 9px;
    border: 1px solid #C7C7C7;
    font-size: 14px;
    line-height: 18px;
    cursor: pointer;
}

.setting_icon {
    width: 20px;
    height: 20px;
    font-size: 20px;
    margin-left: 15px;
    margin-top: 10px;
    float: left;
    cursor: pointer;
}

#profile_middle {
    height: 18px;
    width: 100%;
    margin-top: 20px;
}

#profile_intro {
    width: 100%;
    margin-top: 20px;
    font-size: 16px;
}

#highlight_con {
    margin-top: 44px;
    margin-bottom: 44px;
    height: 130px;
    width: 100%;
    display: none;
}

.highlight_small_con {
    width: 87px;
    height: 100%;
    float: left;
    padding: 0px 20px 0px 20px;
}

.highlight_photo {
    height: 87px;
    width: 87px;
    background-color: green;
    border-radius: 50%;
    margin-top: 10px;
    cursor: pointer;
    border: 1px solid #C7C7C7;
    box-sizing: border-box;
}

.highlight_title {
    height: 18px;
    width: 100%;
    text-align: center;
    font-size: 14px;
    margin-top: 15px;
    cursor: pointer;
}

#hidden_follow_rec {
    width: 988px;
    height: 280px;
    white-space: nowrap;
    border: 1px solid #C7C7C7;
    box-sizing: border-box;
    padding: 20px 0px 20px 12px;
    margin-bottom: 28px;
    overflow-x: auto;
    overflow-y: hidden;
}

#rec_title {
    width: 975px;
    height: 18px;
    margin-left: 13px;
    font-size: 14px;
    line-height: 18px;
}

.each_rec_con {
    margin-top: 14px;
    width: 134px;
    height: 156px;
    padding: 20px;
    border: 1px solid #C7C7C7;
    margin-right: 24px;
    text-align: center;
    display: inline-block;
}

.each_rec_photo {
    width: 54px;
    height: 54px;
    background-color: burlywood;
    border-radius: 50%;
    margin-bottom: 20px;
    margin-left: 40px;
}

.each_rec_id {
    height: 18px;
    font-size: 14px;
    line-height: 18px;
}

.each_rec_name {
    height: 18px;
    font-size: 14px;
    line-height: 18px;
    margin-top: 5px;
}

.each_rec_followbtn {
    width: 114px;
    height: 18px;
    padding: 5px 9px 5px 9px;
    border: 1px solid #C7C7C7;
    font-size: 14px;
    line-height: 18px;
    margin-top: 12px;
}

#line {
    margin: 0px 0px 20px 0px;
    background: #C7C7C7;
    
}
#cate {
    width: 100%;
    height: 53px;
    display: flex;
    justify-content: center;
}

.cate_1 {
    width: 52px;
    height: 53px;
    line-height: 53px;
    font-size: 12px;
}

.cate_con {
    float: left;
    margin-top: 20px;
}

.category {
    float: right;
}

#photo_con {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.each_photo {
    width: 312px;
    height: 312px;
    margin-bottom: 32px;
    cursor: pointer;
}

.nocursor {
    cursor: auto;
}

.small_con {
    margin-right: 40px;
    float: left;
    font-size: 16px;
    line-height: 18px;
}


#categoryBox {
    text-align: center;
    margin-bottom:20px;
}
.bbList{
	display:flex;
	flex-wrap:wrap;
	
}
.selectBb{
	margin-bottom:28px;
	margin-right:28px;
	position:relative;
}
.selectBb img{
	opacity: 1;
	display: block;
	transition: .1s ease;
	backface-visibility: hidden;
}
.selectBb:hover img{
	background-color:black;
	opacity:0.3;
}
.listImg{
	width:293px;
	height:293px;
}


.middle {
  transition: .1s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}
.myBtn img{
	border:1px solid #C7C7C7 !important;
}
#mdImg img{
	width:600px;
	height:600px;
}
/* 모달 상세페이지 (배경) */
.modal {
  	display: none; /* Hidden by default */
  	position: fixed; /* Stay in place */
  	z-index: 10; /* Sit on top */
  	left: 0;
  	top: 0;
  	width: 100%; /* Full width */
  	height: 100%; /* Full height */
  	overflow: auto; /* Enable scroll if needed */
  	background-color: rgb(0,0,0); /* Fallback color */
  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* 모달 상세페이지(내용)*/
.modal-content {
    background-color: #fefefe;
    margin: auto;
    border: 1px solid #C7C7C7;
    width: 1000px;
    height: 600px;
    display: flex;
    margin-top: 50px;
}
/* close */
.close {
    float: right;
    font-size: 28px;
    position: fixed;
    right: 0px;
    margin: 50px;
    font-size: 60px;
    color: white;
    cursor:pointer;
}


.close:hover,
.close:focus {
  	color: #000;
  	text-decoration: none;
  	cursor: pointer;
}

#md2 {
    display: contents;
}
#mdImg {
    width: 600px;
    height: 600px;
}
#mdText {
    max-height: 600px;
   	width: 400px;
   	position:relative;
   	border-left:1px solid #C7C7C7;
}
#mdInfo {
    height: 40px;
    right: 0;
    line-height: 50px;
    border-bottom:1px solid #C7C7C7;
    padding:16px;
    position:relative;
}
#mdInfoText>a{
	margin-right:15px;
	color: black;
}
#bbUpdate {
    position: absolute;
    right: 95px;
}
#bbDelete {
    position: absolute;
    right: 55px;
}
#mdInfoImg {
    float: left;
    margin-right: 10px;
}
#mdInfoImg img{
    border-radius:50%;
}
#follow{
	color: rgb(56, 151, 240);
}
#unFollow{
	display:none;
	color: rgb(56, 151, 240);
}

#mdBoard {
	clear:both;
	height:372px;
    overflow-x: hidden;
    min-height: 250px;
    padding-top:16px;
    padding-right:16px;
    padding-left:16px;
}
#mdBoard::-webkit-scrollbar {
    display: none;
}
#mdContent {
    margin-bottom: 10px;
    position:relative;
}
#mdContent>pre {
    border-bottom: 1px dashed #C7C7C7;
    padding-bottom: 10px;
}
#bbName{
	padding-bottom:10px;
	border-bottom:1px dashed #C7C7C7;
}
#bbInfo{
    white-space: pre-wrap;
    overflow-wrap: anywhere;
}
.translate {
	color: rgb(0, 149, 246);
    right: 0px;
    bottom:34px;
    position: absolute;
}.
.mrd{
	margin-bottom:20px;
	position: relative;
}

.bbrImg {
    float: left;
    margin-right: 10px;
}
.bbrImg img{
    border-radius:50%;
}
.mrrd{
	margin-bottom:15px;
}
.mrrdRight {
    padding-left: 60px;
}
.bbrId {
    margin-right: 15px;
}
.mrrdCont{
	margin-bottom:10px;
}
.mrrdCont span {
    word-break: break-all;
}
.bbrLike {
    float: left;
    margin-right: 10px;
    margin-bottom: 10px;
}
.mrrdOpt {
    position: relative;
}
.bbrDelete{
	position:absolute;
	right:47px;
}
.mrdDown {
    display: block;
    clear: both;
    margin-top: 10px;
    margin-left: 45px;
}
.bbrrLine{
	border-bottom: 1px solid #C7C7C7;
    display: inline-block;
    height: 0;
    margin-right: 16px;
    margin-left: 16px;
    vertical-align: middle;
    width: 24px;
}
.bbrrShow{
	cursor:pointer;
}
#bbrr {
    padding-left: 15px;
    margin: 13px 0;
}
.bbrrbtn {
    float: left;
    margin-right: 10px;
}
#bbrrInBox {
    clear: both;
}


.bbrrImg{
	float:left;
	margin-right:10px;
}
.bbrrImg img{
    border-radius:50%;
}
.bbrrCon span {
    word-break: break-all;
}
.bbrrId {
    margin-right: 15px;
}
.bbrrOpt {
    display: flex;
    justify-content: space-between;
    position: relative;
}
#mdMore {
    position: absolute;
    bottom: 52px;
    width: 367px;
    background-color: white;
    border-bottom: 1px solid #C7C7C7;
    border-top: 1px solid #C7C7C7;
    padding:5px 16px 16px 16px;
}
#mdWrite{
	position:absolute;
	bottom:0px;
	padding:16px;
}
#bb_info {
    width: 329px;
    height: 18px;
    outline: none;
    border: none;
    padding: 0px;
    float: left;
    background-color: transparent;
    font-size: initial;
}
.showlCount {
    border: none;
    background-color: white;
}
#bbrInsert{
	font-size: large;
}
#cartBtn{
	font-size: inherit;
}
#mdFooter{
	background-color: #fefefe;
	margin: auto;
  	padding: 10px;
  	border: 1px solid #C7C7C7;
  	width: 980px;
  	display: flex;
  	margin-top: 20px;
  	justify-content: space-around;
  	bottom:0px;
}

<!-- 이미지 슬라이드 -->
 	.md_imgbox {display: none}
	
	/* Slideshow container */
	.mdImg {
	  position: relative;
	}
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  padding: 16px;
	  margin-top: -22px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Fading animation */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	/* On smaller screens, decrease text size */
	@media only screen and (max-width: 300px) {
	  .prev, .next,.text {font-size: 11px}
	}
	
	.bbrrInBox{
		display:none;
		border-bottom:1px solid #C7C7C7;
		border-top:1px dashed #C7C7C7;
	}
	.bbrrInBox input{
		margin-left: 0px;
   		margin-right: 10px;
   		margin-top: 10px;
   		margin-bottom: 10px;
    	width: 230px;
		border:none;
		outline: none;
		
	}
	
	/* 모달 장바구니 (배경) */
	#mdCart {
	  	display: none; /* Hidden by default */
	  	position: fixed; /* Stay in place */
	  	z-index: 10; /* Sit on top */
	 	padding-top: 400px; /* Location of the box */
	  	left: 0;
	  	top: 0;
	  	width: 100%; /* Full width */
	  	height: 100%; /* Full height */
	  	overflow: auto; /* Enable scroll if needed */
	  	background-color: rgb(0,0,0); /* Fallback color */
	  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* 모달 장바구니(내용)*/
	#mdcContent {
	  	background-color: #fefefe;
	  	margin: auto;
	  	padding: 10px;
	  	border: 1px solid #C7C7C7;
	  	width: 400px;
	  	height:96px;
	  	max-width:400px;
	  	border-radius: 12px;
	  	text-align:center;
	}
	#goCart{
		height:48px;
		line-height:48px;
	}
	#shopping{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	
	/* 모달 게시물 (배경) */
	#mdBb {
	  	display: none; /* Hidden by default */
	  	position: fixed; /* Stay in place */
	  	z-index: 10; /* Sit on top */
	 	padding-top: 400px; /* Location of the box */
	  	left: 0;
	  	top: 0;
	  	width: 100%; /* Full width */
	  	height: 100%; /* Full height */
	  	overflow: auto; /* Enable scroll if needed */
	  	background-color: rgb(0,0,0); /* Fallback color */
	  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* 모달 게시물(내용)*/
	#mdbbContent {
	  	background-color: #fefefe;
	  	margin: auto;
	  	padding: 10px;
	  	border: 1px solid #C7C7C7;
	  	width: 400px;
	  	height:190px;
	  	max-width:400px;
	  	border-radius: 12px;
	  	text-align:center;
	}
	#mdBbBtn{
		position:absolute;
		right: 20px;
	}
	.mdBbBtn{
		position:absolute;
		right: 20px;
	}
	#mdBbrBtn{
		right: 20px;
		position: absolute;
	}
	#bbReport{
		height:48px;
		line-height:48px;
	}
	#goBbPage{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	#shareBb{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	#linkBb{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	#saveBb{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	.cancel{
		height:48px;
		border-top: 1px solid #C7C7C7;
    	line-height: 48px;
	}
	
	/* 모달 답글+댓글 (배경) */
	#mdBbr {
	  	display: none; /* Hidden by default */
	  	position: fixed; /* Stay in place */
	  	z-index: 10; /* Sit on top */
	 	padding-top: 400px; /* Location of the box */
	  	left: 0;
	  	top: 0;
	  	width: 100%; /* Full width */
	  	height: 100%; /* Full height */
	  	overflow: auto; /* Enable scroll if needed */
	  	background-color: rgb(0,0,0); /* Fallback color */
	  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* 모달 답글+댓글 (내용)*/
	#mdbbrContent {
	  	background-color: #fefefe;
	  	margin: auto;
	  	padding: 10px;
	  	border: 1px solid #C7C7C7;
	  	width: 400px;
	  	height:96px;
	  	max-width:400px;
	  	border-radius: 12px;
	  	text-align:center;
	}
	#bbReport{
		height:48px;
		line-height:48px;
	}
	
	.pointer{
		cursor:pointer;
	}
	
	/* 모달 팔로우+팔로워 +신고*/
	#report_back,
	#follow_back {
	    display: none; /* Hidden by default */
	  	position: fixed; /* Stay in place */
	  	z-index: 10; /* Sit on top */
	  	left: 0;
	  	top: 0;
	  	width: 100%; /* Full width */
	  	height: 100%; /* Full height */
	  	overflow: auto; /* Enable scroll if needed */
	  	background-color: rgb(0,0,0); /* Fallback color */
	  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	#report_modal,
	#follow_modal {
		position: fixed;
        width: 100%;
        height: 100%;
        display: none;
        z-index: 11;
	}
	
	
	.timeline_icon_con {
	    width: 100%;
	    height: 40px;
	    margin-top: 4px;
	}
	
	#see_follow,
    #see_follower {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        height: 400px;
        width: 400px;
        background: #fff;
        z-index: 9;
        border-radius: 20px;
        text-align: center;
        font-size: 14px;
        overflow: auto;
    }
    
    .top_con {
        width: 100%;
        height: 42px;
        border-bottom: 1px solid #C7C7C7;
    }
    
    .blank {
        width: 48px;
        height: 42px;
        float: left;
    }
    
    .fo_title {
        width: 304px;
        height: 100%;
        float: left;
        font-size: 16px;
        line-height: 42px;
    }
    
    .people_con {
        width: 363px;
        height: 38px;
        padding: 8px 16px 8px 21px;
    }
    
    .people_photo {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        margin-top: 5px;
        float: left;
    }
    
    .people_middle {
        margin-left: 12px;
        float: left;
        width: 250px;
        height: 38px;
        text-align: left;
    }
    
    .people_id,
    .people_name {
        width: 100%;
        height: 18px;
        font-size: 14px;
        line-height: 18px;
    }
    
    .people_btn {
        float: right;
        font-size: 14px;
        line-height: 38px;
        height: 32px;
        width: 56px;
        border: 1px solid #C7C7C7;
    }
    
    .cate_mine {
        color: #C7C7C7;
        cursor: pointer;
    }
    
    .fa-times {
        font-size: 21px;
        margin-top: 10.5px;
        cursor: pointer;
    }
	.icon {
	    width: 24px;
	    height: 24px;
	    float: left;
	    margin-top: 8px;
	    margin-right: 16px;
	    cursor: pointer;
	}
	.list_icon {
	    width: 24px;
	    height: 24px;
	    float: left;
	}
	.icon_reply {
	    width: 12px;
	    height: 12px;
	    margin-top: 5px;
	    cursor: pointer;
	    position:absolute;
	    right:0px;
	}
	.save_icon {
	    margin-right: 0px;
	    float: right;
	}
	.list_like_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
	    background-size: 24px;
	}
	.like_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
	    background-size: 24px;
	}
	.like_icon_reply {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
	    background-size: 12px;
	}
	
	.like_icon:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 24px;
	}
	.like_icon_reply:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 12px;
	}
	
	.unlike_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 24px;
	    display: none;
	}
	.unlike_icon_reply {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 12px;
	    display: none;
	}
	
	.share_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-share-1.svg');
	    background-size: 24px;
	}
	
	.share_icon:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-share.svg');
	    background-size: 24px;
	}
	
	.list_write_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-speech-bubble-1.svg');
	    background-size: 24px;
	}
	.write_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-speech-bubble-1.svg');
	    background-size: 24px;
	}
	
	.write_icon:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-speech-bubble.svg');
	    background-size: 24px;
	}
	
	.save_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-tag.svg');
	    background-size: 24px;
	}
	
	.save_icon:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/006-price-tag.svg');
	    background-size: 24px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="content" class="content">
	<input type="hidden" id="my_name" value="${my_name }"/>
	<input type="hidden" id="bb_id" value="${bbDetail.bb_id }"/>
	<input type="hidden" id="m_id" value="${id_img_fwr.m_id }"/>
		
		
		<!-- Modal content -->
		<div id="modalContent" class="modal-content">
				<div id="mdImg" class="mdImg">
			  	</div>
			  	<div id="mdText">
			  		<div id="mdInfo">
			  			<div id="mdInfoImg">
			  				
			  			</div>
			  			<div id="mdInfoText">
			  			</div>
			  		
			  		</div>
			  		<div id="mdBoard">
			  			<div id="mdContent">
			  				<div id="bbName"></div> 
			  				<br>
			  				<pre id="bbInfo" name="bbInfo" class="bbInfo"></pre> 
			  				<br>
			  				<button class="translate" >번역하기</button>
			  				<div id="bbHashtag">
			  					
			  				</div>
			  			</div>
			  			<div id="mdReply" class="mdReply">
			  				
			  			</div>
			  		</div>
			  		<div id="mdMore">
			  		
			  		</div>
			  		<div id="mdWrite">
			  			<form action="bbrInsert.do" id="bbrInForm" class="bbrInForm" method="post">
			  				<input type="text" id="bb_info" class="bb_info" name="bb_info" placeholder="댓글 달기...">
			  				<button type="button" id="bbrInsert" class="bbrInsert" name="bbrInsert" style="cursor:pointer">게시</button>
			  				<div id="hiddenTopid"></div>
			  			</form>
			  		</div>
			  	</div>
		</div>
			  	<div id="mdFooter">
			  		<div id="mdPrice">
			  			가격 : <span id="mdprices"></span>
			  		</div>
			  		<div id="hidePrice">
			  			
			  		</div>
			  		<div id="mdOption">
						<select name="option" id="option">
						</select>
			  		</div>
			  		<div id="cart">
			  			<button type="button" id="cartBtn" class="cartBtn" >장바구니 담기</button>
			  		</div>
			  	</div>
	
	<!-- 모달 (장바구니) -->
	<div id="mdCart">
		<div id="mdcContent" class="mdcContent">
			<div id="goCart" onclick="location.href='${pageContext.request.contextPath}/mCart.do'">
				장바구니로 가기
			</div>
			<div id="shopping">
				계속 쇼핑하기
			</div>
		</div>
	</div>
	
	<!-- 모달 (게시물) -->
	<div id="mdBb">
		<div id="mdbbContent" class="mdcContent">
			<div id="bbReport" class="bbReport" onclick="bbRepoart(this)">
				<span class="pointer">게시물 신고</span>
			</div>
			<div id="goBbPage" class="goBbPage" onclick="location.href='#'">
				<span class="pointer">게시물로 이동</span>
			</div>
			<div id="shareBb" class="shareBb">
				<span class="pointer">게시물 공유하기</span>
			</div>
			<div id="cancel" class="cancel">
				<span class="pointer">취소</span>
			</div>
		</div>
	</div>
	
	<!-- 모달 (댓글 + 답글) -->
	<div id="mdBbr">
		<div id="mdbbrContent" class="mdcContent">
			<div id="bbReport" class="bbReport" onclick="bbRepoart(this)">
				<span class="report pointer">신고</span>
			</div>
			<div id="cancel" class="cancel">
				<span class="pointer">취소</span>
			</div>
		</div>
	</div>
	
	<input type="button"  value="글쓰기" onclick="window.location='bbWriteForm.do'">
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
<script>
var m_id = document.getElementById("m_id").value;
var my_name = $("#my_name").val();
var memId = $(".m_id").val();
console.log("게시물아이디:"+m_id);
console.log("나의아이디:"+my_name);
console.log("게시물아이디:"+memId);
/* 이미지 슬라이드 */ 
var slideIndex = 1;
function plusSlides(n) {
   	console.log("plusSlides");
     showSlides(slideIndex += n);
   }
function showSlides(n) {
     var i;
     var slides = document.getElementsByClassName("md_imgbox");
  console.log(slides);
     if (n > slides.length) {slideIndex = 1}    
     if (n < 1) {slideIndex = slides.length}
     for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";  
     }
     console.log(slides.length);
     slides[slideIndex-1].style.display = "block";  
   }

    
window.onload = function(){
    	   	
    var a = $("#bb_id").val();
    var m_id = $("#my_name").val();
    console.log("로드");
    $.ajax({
    	url:"bbDetail",
    	type:"post",
    	async:false,
    	data:{
    		bb_id:a,
    	},
/*     		m_id:m_id */
    	dataType:"json",
    	success:function(resp){
    		// 이미지 로드
    		console.log("로드2");
    		var htmls="";
    		console.log("bbDetail()"+resp.bbDetail.m_id);
    		console.log("bbDetail()"+resp.bbDetail.bb_img1);
   			if(resp.bbDetail.bb_img1!=null){
   				htmls +="<div class='md_imgbox fade'>"+
							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img1+"'/>"+
						"</div>";
   			}
   			if(resp.bbDetail.bb_img2!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img2+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img3!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img3+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img4!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img4+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img5!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img5+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img6!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img6+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img7!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img7+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img8!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img8+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img9!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img9+"'/>"+
   						"</div>";
       		}
   			if(resp.bbDetail.bb_img10!=null){
       			htmls +="<div class='md_imgbox fade'>"+
   							"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img10+"'/>"+
   						"</div>";
       		}
   			htmls += "<a class='prev' onclick='plusSlides(-1)''>&#10094;</a>"+
   					"<a class='next' onclick='plusSlides(1)'>&#10095;</a>";
    		
   			// 게시물 이미지
    		$(".mdImg").html(htmls);
   			// 게정 프로필 이미지
    		$("#mdInfoImg").html("<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.m_img+"' width='40px' height='40px'/>");
   			// 게시글번호 및 멤버아이디(추후삭제)
   			console.log("#my_name:"+$("#my_name").val());
   			if(resp.bbDetail.m_id==$("#my_name").val()){
    			$("#mdInfoText").html('<a href="${pageContext.request.contextPath}/gnMain?m_id='+resp.bbDetail.m_id+'">'+resp.bbDetail.m_id +'</a><a id="bbUpdate" href="bbRenew.do?bb_id='+resp.bbDetail.bb_id+'">수정</a><a id="bbDelete" href="bbDelete.do?bb_id='+resp.bbDetail.bb_id+'">삭제</a><span id="mdBbBtn" class="mdBbBtn" onclick="mdBb()" style="cursor:pointer">&#149;&#149;&#149;</span>');
   			} else {
    			$("#mdInfoText").html('<a href="${pageContext.request.contextPath}/gnMain?m_id='+resp.bbDetail.m_id+'">'+resp.bbDetail.m_id + '</a><span id="follow" value="'+resp.bbDetail.m_id+'" onclick="follow(\''+resp.bbDetail.m_id+'\')">팔로우</span><span id="unFollow" value="'+resp.bbDetail.m_id+'" onclick="unFollow(\''+resp.bbDetail.m_id+'\')" style="cursor:pointer">팔로잉</span><span id="mdBbBtn" onclick="mdBb()" style="cursor:pointer">&#149;&#149;&#149;</span>');
   			}
   			// 상품명
    		$("#bbName").html(resp.bbDetail.bb_name);
   			// 상품 소개
    		$("#bbInfo").html(resp.bbDetail.bb_info);
   			// 상품 소개
   			var timeline = "";
   			timeline += '<div class="timeline_comment_con">'+
				            '<div class="inner_comment_con">'+
					            '<div class="timeline_icon_con">'+
					                '<div class="icon like_icon likechk'+resp.bbDetail.bb_id+'" onclick="pressLike(\''+resp.bbDetail.bb_id+'\');"></div>'+
					                '<div class="icon unlike_icon unlikechk'+resp.bbDetail.bb_id+'" onclick="pressUnlike(\''+resp.bbDetail.bb_id+'\');"></div>'+
					                '<div class="icon write_icon" id="write_icon" onclick="write_icon()"></div>'+
					                '<div class="icon share_icon" onclick="shareurl(\''+resp.bbDetail.bb_id+','+resp.bbDetail.bb_id+'\')"></div>'+
					                /* '<div class="icon save_icon"></div>'+ */
					            '</div>'+
					            '<div class="timeline_likes_con">좋아요 <input type="button" class="lCount'+resp.bbDetail.bb_id+' showlCount" value="'+resp.bbDetail.bb_like+'" readonly>개</div>'+
					            '<input type="hidden" class="hidden_likechk" onclick="likechk(\''+resp.bbDetail.bb_id+'\');"> <input type="hidden" class="hidden_commentchk" onclick="showAllCoHidden(\''+resp.bbDetail.bb_id+'\');">'+
                                /* '<input type="hidden" name="t_type" class="t_type'+resp.bbDetail.bb_id+'" value="${vo.t_type }">'+ */
					            '<input type="hidden" value="'+resp.bbDetail.bb_id+'" class="countLike_trigger" onclick="countLike(\''+resp.bbDetail.bb_id+', '+resp.bbDetail.bb_id+'\');">'+
					            '<div class="timeline_time">${vo.t_time }</div>'+
					        '</div>'+
					    '</div>';
    		$("#mdMore").html(timeline);
   			// 해시 태그
   			var hashtag="";
   			console.log("태그갯수"+resp.bbTags.length);
   			for(var i = 0; i < resp.bbTags.length; i++){
   				hashtag+="<a href='${pageContext.request.contextPath}/explore?hashtag="+resp.bbTags[i].h_tag+"'>#"+resp.bbTags[i].h_tag+"</a>";
   			}
   			$("#bbHashtag").html(hashtag);
   			// 댓글 입력시 bb_topid 값을 세팅하기 위한 인풋박스
    		$("#hiddenTopid").html('<input type="hidden" id="bb_topid" name="bb_topid" value="'+resp.bbDetail.bb_id+'">');
   			// 상품 가격
    		$("#mdprices").html(resp.bbDetail.bb_price);
   			// 상품 가격 (하이드)
    		$("#hidePrice").html('<input id="mdPriceHide" type="hidden" value="'+resp.bbDetail.bb_price+'"/>');
   			// 상품 옵션
    		var option = "";
    			option +="<option value=''>옵션을 선택해주세요.</option>";
    		if(resp.bbDetail.bb_option1!=null){
    			option +="<option value='"+resp.bbDetail.bb_option1+"'>"+resp.bbDetail.bb_option1+"</option>";
   			}
   			if(resp.bbDetail.bb_option2!=null){
   				option +="<option value='"+resp.bbDetail.bb_option2+"'>"+resp.bbDetail.bb_option2+"</option>";
       		}
   			if(resp.bbDetail.bb_option3!=null){
   				option +="<option value='"+resp.bbDetail.bb_option3+"'>"+resp.bbDetail.bb_option3+"</option>";
       		}
   			if(resp.bbDetail.bb_option3!=null){
   				option +="<option value='"+resp.bbDetail.bb_option4+"'>"+resp.bbDetail.bb_option4+"</option>";
       		}   			
   			$("#option").html(option);
   			
   			/* 이미지 슬라이드 */
   		   var slideIndex = 1;
   		   showSlides(slideIndex);

    	},
    	error:function(){
    		alert("이미지를 불러 올 수 없습니다.");
    	}
    	
    });
    
    // 게시물 좋아요 체크
    $.ajax({
    	url:"bb_like_chk",
    	type:"post",
    	async:false,
    	data:{bb_id:a},
    	dataType:"json",
    	success:function(resp){
    		console.log("좋아요 체크 : "+resp.bbLikeChk)
    		console.log("좋아요 체크 : "+a)
    		if(resp.bbLikeChk=="0"){
                $(".likechk" + a).css("display", "block");
    			$(".unlikechk" + a).css("display", "none");
    		} else {
    			$(".likechk" + a).css("display", "none");
                $(".unlikechk" + a).css("display", "block");
    		}
    	}, error:function(){
    		alert("error");
    	}
    });
    
    // 팔로우 체크
    var m_id=document.getElementById("m_id").value;
    console.log("팔로우체크아이디"+m_id);
    $.ajax({
    	url:"bb_follow_chk",
    	type:"post",
    	async:false,
    	data:{m_id:m_id},
    	dataType:"json",
    	success:function(resp){
    		console.log("팔로우 체크 : "+resp.bbFollowChk)
    		console.log("팔로우 체크 : "+a)
    		if(resp.bbFollowChk=="0"){
                $("#follow").show();
    			$("#unFollow").hide();
    		} else {
    			$("#follow").hide();
                $("#unFollow").show();
    		}
    	}, error:function(){
    		alert("error");
    	}
    });
    
	/* 댓글 조회 */
	var my_name=$("#my_name").val();
    $.ajax({
    	url:"bbrList",
    	type:"POST",
    	async:false,
    	data:{ bb_id : a,
    		m_id:my_name
    		},
    	dataType:"json",
    	success:function(resp){
    		console.log("내 아이디:"+$("#my_name").val());
    		if(resp.data!=null){
	    		for(i=0; i<resp.data.length; i++){
	    			var htmls="";
	    			var r_m_id = resp.data[i].m_id;
	    			var r_bb_info = resp.data[i].bb_info;
	    			var r_bbrlike = resp.data[i].bbrlike;
	    			var r_bb_id = resp.data[i].bb_id;
	    			var r_like_chk = resp.data[i].like_chk;
	    			var r_m_img = resp.data[i].m_img;
	    			console.log("댓글 조회 좋아요 체크 :"+r_like_chk);
	    			htmls += "<div class='mrd' >"+
	    						"<div class='mrdUp' >"+
									"<div class='bbrImg'>"+
										"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+r_m_img+"' width='40px' height='40px'/>"+
									"</div>"+
									"<div class='mrrdRight' >"+
										"<div class='mrrdCont' >"+
											"<a href='${pageContext.request.contextPath}/bbList.do?m_id="+ r_m_id+ "' class='bbrId'>"+
												"<span>" + r_m_id + "</span>"+
											"</a>"+
											"<span>"+r_bb_info+"</span>"+
										"</div>"+
										"<div class='mrrdOpt' >"+
											"<div class='bbrLike'>"+
												"<span class='bbrL' >좋아요:<input type='button' class='lCount"+r_bb_id+" showlCount' value='"+r_bbrlike+"' readonly></span>"+
												
											"</div>"+
											"<div class='bbrrbtn' >"+
												"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' onclick='bbrrWrite(this)' \">답글달기</button>"+
											"</div>";
											
					if(r_m_id==$("#my_name").val()){
						htmls += 				"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">삭제</button>";
					}
					htmls +=				"<button type='button'  id='mdBbBtn' onclick='mdReport(this)' style='cursor:pointer'>&#149;&#149;&#149;</button>"+
											"<div class='icon_reply like_icon_reply likechk"+r_bb_id+"' onclick='pressLike(\""+r_bb_id+"\");' width='10px' height='10px'></div>"+
							                "<div class='icon_reply unlike_icon_reply unlikechk"+r_bb_id+"' onclick='pressUnlike(\""+r_bb_id+"\");'></div>"+
							                "<div></div>"+
											"<div id='bbrrInBox' class='bbrrInBox' >"+
												"<input type='text' class='replyCoWri write_space' placeholder='답글 작성...'/>"+
												"<button id='bbrrup"+r_bb_id+"' onclick='bbrrInsert(this)'>게시</button>"+
												"<input type='hidden' value='" + r_bb_id + "'/>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='mrdDown' >"+
									"<div class='bbrrLine' ></div>"+
									"<a class='bbrrShow' id='bbrrshow"+r_bb_id+"' onclick=\"bbrrListShow('"+ r_bb_id +"')\">답글보기</a>"+
									"<a class='bbrrHide' id='bbrrhide"+r_bb_id+"' onclick=\"bbrrListHide('"+ r_bb_id +"')\" style='display:none;'>답글숨기기</a>"+
									"<div id='bbrr' class='bbrr'>"+
									"</div>"+
								"</div>"+
							"</div>";
    			$(".mdReply").append(htmls);
	    			if(r_like_chk==null){
	    				$(".likechk" + r_bb_id).css("display", "block");
			    		$(".unlikechk" + r_bb_id).css("display", "none");
	    			} else{
	    				$(".likechk" + r_bb_id).css("display", "none");
		                $(".unlikechk" + r_bb_id).css("display", "block");
	    			}
	    		}   
    			// 좋아요 체크
    			$('.close').on('click', function() {
    				/* $('#modal').hide(); */
    				var a = $(this).val();
    				console.log("모달창 닫기a:"+a);
    				var x = document.getElementById("modal");
    				console.log("모달창 닫기x:"+x);
    			    x.style.display="none";
    			    //클로즈 버튼 누르면 댓글 지워지기
    			    $(".mdReply").empty();
    			    slideIndex = 1;
    			});
    		} else {
    			$(".mdReply").html("<div class='mrd'>댓글이 없습니다.</div>");
    		}
			
    	}, error:function(request, status, error){
    		alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		}
    	
    });
}


/* 댓글 삭제 */
function bbrDelete(r_bb_id){
	console.log("bbrDelete함수:"+r_bb_id);
	var a = r_bb_id;
	var b = document.getElementById(r_bb_id);
	console.log("bbrDelete함수:"+a+":"+b);
	$.ajax({
		url:"bbrDelete",
		method:"POST",
		async: false,
		data:{ bb_id:r_bb_id},
		dataType:"json",
		success:function(resp){
			console.log("댓글삭제 resp:"+resp+":"+resp.ack);
			$(b).parent().parent().parent().parent().remove();
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
};
/* 답글 삭제 */
function bbrrDelete(rr_bb_id){
	console.log("bbrDelete함수:"+rr_bb_id);
	var a = rr_bb_id;
	var b = document.getElementById(rr_bb_id);
	console.log("bbrDelete함수:"+a+":"+b);
	$.ajax({
		url:"bbrDelete",
		method:"POST",
		async: false,
		data:{ bb_id:rr_bb_id},
		dataType:"json",
		success:function(resp){
			console.log("댓글삭제 resp:"+resp+":"+resp.ack);
			$(b).parent().parent().parent().remove();
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
};
/* 답글 조회(답글 div 열기)  */
function bbrrListShow(bb_id){
	console.log("bbrrListShow함수:"+bb_id);
	var a = "bbrrshow"+bb_id;
	var a2 = document.getElementById(a);
	var b = "bbrrhide"+bb_id;
	var b2 = document.getElementById(b);
	/* var b = document.getElementById(bb_id); */
	console.log("bbrrListShow함수:"+a+":"+bb_id);
	$(a2).hide();
	$(b2).show();
	$.ajax({
		url:"bbrrList",
		method:"POST",
		async: false,
		data:{ bb_id:bb_id,
			m_id:my_name
		},
		dataType:"json",
		success:function(resp){
			/* $(a2).next().next().empty(); 추후 삭제*/
    		if(resp.data!=null){
	    		for(i=0; i<resp.data.length; i++){
	    			var rr_m_img = resp.data[i].m_img;
	    			var rr_m_id = resp.data[i].m_id;
	    			var rr_bb_info = resp.data[i].bb_info;
	    			var rr_bbrlike = resp.data[i].bbrlike;
	    			var rr_bb_id = resp.data[i].bb_id;
	    			var rr_like_chk = resp.data[i].like_chk;
	    			console.log("답글 조회 좋아요 체크 :"+rr_like_chk);
	    			var htmls="";
	    			htmls +="<div class='mrrd' >"+
								"<div class='bbrrImg'>"+
									"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+rr_m_img+"' width='40px' height='40px'/>"+
								"</div>"+
								"<div class='mrrdRight' >"+
									"<div class='mrrdCont' >"+
										"<div id='bbrrId' class='bbrrId'>"+
											"<a href='${pageContext.request.contextPath}/gnMain?m_id="+rr_m_id+"' class='bbrrId'>"+
												"<span>" + rr_m_id + "</span>"+
											"</a>"+
											"<span id='bbrrCon' class='bbrrCon'>"+ rr_bb_info +"</span>"+
										"</div>"+
									"</div>"+
									"<div class='bbrrOpt' >"+
										"<div id='bbrrLike' class='bbrrLike'>"+
											"<span class='bbrrL' >좋아요:<input type='button' class='lCount"+rr_bb_id+" showlCount' value='"+rr_bbrlike+"' readonly></span>"+
											
										"</div>";
					if(rr_m_id==$("#my_name").val()){
						htmls += 		"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrrDelete('"+ rr_bb_id +"')\">삭제</button>";
					}
					htmls +=			"<button id='mdBbrBtn' class='mdBbrBtn' onclick='mdReport(this)' style='cursor:pointer'>&#149;&#149;&#149;</button>"+
										"<div class='icon_reply like_icon_reply likechk"+rr_bb_id+"' onclick='pressLike(\""+rr_bb_id+"\");' width='10px' height='10px'></div>"+
						                "<div class='icon_reply unlike_icon_reply unlikechk"+rr_bb_id+"' onclick='pressUnlike(\""+rr_bb_id+"\");'></div>"+
						                "<div></div>"+
									"</div>"+
								"</div>"+
							"</div>";
					$(a2).next().next().append(htmls);
					if(rr_like_chk==null){
	    				$(".likechk" + rr_bb_id).css("display", "block");
			    		$(".unlikechk" + rr_bb_id).css("display", "none");
	    			} else{
	    				$(".likechk" + rr_bb_id).css("display", "none");
		                $(".unlikechk" + rr_bb_id).css("display", "block");
	    			}
							
	    		}   
    		} else {
    			$(a2).next().next().html("답글이 없습니다.");
    		}
			
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
};

/* 답글 div 닫기  */
function bbrrListHide(bb_id){
	console.log("bbrrListShow함수:"+bb_id);
	var a = "bbrrshow"+bb_id;
	var a2 = document.getElementById(a);
	var b = "bbrrhide"+bb_id;
	var b2 = document.getElementById(b);
	$(b2).hide();
	$(a2).show();
	$(a2).next().next().html("");
};

// 답글달기 버튼 클릭시 텍스트입력박스 보여주기
function bbrrWrite(e){
	$(".bbrrInBox").css("display", "none");
	console.log($(e).attr("class"));
    $(e).parent().next().next().next().next().next().css("display", "block");
    $(e).parent().next().next().next().next().next().next().css("display", "block");
};


// 답글 게시 버튼 클릭시(답글인서트)
function bbrrInsert(e){
    var bb_topid = $(e).next().val();
    var bb_info = $(e).prev().val();
    var a = "bbrrshow"+bb_topid;
    var a2 = document.getElementById(a);
    var b = "bbrrhide"+bb_topid;
    var b2 = document.getElementById(b);
    console.log("memId: "+memId+" bb_topid: "+bb_topid+" bb_info:"+bb_info);
    
    if (bb_info == "") {
        console.log("reply comment won't be uploaded");
        $(".bbrrInBox").css("display", "none");
        $('.rep_comment_upload').off('click');
    } else {
        $.ajax({
            url: "bbrrInsert",
            method: "POST",
            data: {
                bb_info: bb_info,
                bb_topid: bb_topid,
                m_id:my_name
            },
            dataType:"json",
            success: function(resp) {
            	$(e).parent().parent().parent().parent().next().children('div:eq(1)').html("");
                console.log("답글게시:"+resp.data);
                $(".write_space").val('');
                $(".bbrrInBox").css("display", "none");
        		if(resp.data!=null){
    	    		for(i=0; i<resp.data.length; i++){
    	    			var rr_m_img = resp.data[i].m_img;
    	    			var rr_m_id = resp.data[i].m_id;
    	    			var rr_bb_info = resp.data[i].bb_info;
    	    			var rr_bbrlike = resp.data[i].bbrlike;
    	    			var rr_bb_id = resp.data[i].bb_id;
    	    			var rr_like_chk = resp.data[i].like_chk;
    	    			var htmls="";
    	    			htmls +="<div class='mrrd' >"+
    								"<div class='bbrrImg'>"+
    									"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+rr_m_img+"' width='40px' height='40px'/>"+
    								"</div>"+
    								"<div class='mrrdRight' >"+
    									"<div class='mrrdCont' >"+
    										"<div id='bbrrId' class='bbrrId'>"+
    											"<a href='${pageContext.request.contextPath}/gnMain?m_id="+rr_m_id+"' class='bbrrId'>"+
    												"<span>" + rr_m_id + "</span>"+
    											"</a>"+
    											"<span id='bbrrCon' class='bbrrCon'>"+ rr_bb_info +"</span>"+
    										"</div>"+
    									"</div>"+
    									"<div class='bbrrOpt' >"+
    										"<div id='bbrrLike' class='bbrrLike'>"+
    											"<span class='bbrrL' >좋아요:<input type='button' class='lCount"+rr_bb_id+" showlCount' value='"+rr_bbrlike+"' readonly></span>"+
    										"</div>";
    					if(rr_m_id==$("#my_name").val()){
    						htmls += 		"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrrDelete('"+ rr_bb_id +"')\">삭제</button>";
    					}
    					htmls +=			"<button id='mdBbrBtn' class='mdBbrBtn' onclick='mdReport(this)' style='cursor:pointer'>&#149;&#149;&#149;</button>"+
    										"<div class='icon_reply like_icon_reply likechk"+rr_bb_id+"' onclick='pressLike(\""+rr_bb_id+"\");' width='10px' height='10px'></div>"+
    						                "<div class='icon_reply unlike_icon_reply unlikechk"+rr_bb_id+"' onclick='pressUnlike(\""+rr_bb_id+"\");'></div>"+
    						                "<div></div>"+
    									"</div>"+
    								"</div>"+
    							"</div>";
    					
    					$(e).parent().parent().parent().parent().next().children().next().next().next().append(htmls);
    					if(rr_like_chk==null){
    	    				$(".likechk" + rr_bb_id).css("display", "block");
    			    		$(".unlikechk" + rr_bb_id).css("display", "none");
    	    			} else{
    	    				$(".likechk" + rr_bb_id).css("display", "none");
    		                $(".unlikechk" + rr_bb_id).css("display", "block");
    	    			}
    					console.log(htmls);
    	    		}   
        			
        		}
        	    $(b2).show();
        		$(a2).hide();
            },
            error: function(request, status, error) {
                alert("code:" +request.status +"\n" +"message:" + request.responseText +"\n" + "error:" + error);
            }
        });
    }
};

//모달(장바구니) 열기
$('#cartBtn').on('click', function() {
	if(confirm('장바구니에 추가하시겠습니까?')==false){
		return;
	}
	// 게시물 번호 구하기
	var bb_id= document.getElementById("bb_topid").value;
	console.log("카트 bb_id:"+bb_id);
	// 옵션 명 구하기
	var option = document.getElementById("option").value;
	var optSplit = option.split("+");
	var od_option= optSplit[0];
	if(od_option==""){
		od_option=null;
	}
	console.log("카트 od_option:"+od_option);
	// 옵션가격 구하기
	var od_price= parseInt($("#mdprices").html());
	console.log("카트 od_price:"+od_price);
	
	
	$.ajax({
		url:"cartInsert",
		type:"post",
		async:false,
		data:{
			bb_id: bb_id,
		},
		dataType:"json",
		success:function(resp){
			alert("장바구니에 추가 되었습니다.");
			console.log("카트 ack:"+resp.ack);
			var x = document.getElementById("mdCart");
		    x.style.display="block";
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
	
	
});
//장바구니로 가기
$('#goCart').on('click', function() {
	
});
//모달(장바구니) 닫기
$('#shopping').on('click', function() {
	var x = document.getElementById("mdCart");
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
});


//모달(게시물) 열기
function mdBb(){
	// 게시물 번호 구하기
	console.log("mdBbBtn");
	var x = document.getElementById("mdBb");
    x.style.display="block";
	
}

//모달(게시물) 닫기
$('.cancel').on('click', function() {
	var x = document.getElementById("mdBb");
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
});

//모달(댓글+답글) 열기
function mdReport(e){
	$("#mdBbr").css("display", "block");
}
//모달(댓글+답글) 닫기
$('.cancel').on('click', function() {
	$("#mdBbr").css("display", "none");
});

//윈도우 누르면 모달창 꺼지기
$(window).on('click', function() {
	var mdCart = document.getElementById('mdCart');
	if (event.target == mdCart) {
		mdCart.style.display = "none";
	}
	var mdBb = document.getElementById('mdBb');
	if (event.target == mdBb) {
		mdBb.style.display = "none";
	}
	var mdBbr = document.getElementById('mdBbr');
	if (event.target == mdBbr) {
		mdBbr.style.display = "none";
	}
	
	
});
    
// 번역(상품소개만)
$(".translate").on("click", function(){
	/* var a = $(this).val();
	console.log(a);
	var b = document.getElementsByClassName(a);
	console.log(b); */
	var a = document.getElementById("bbInfo");
	var  source = $(this).prev().prev().html();
	console.log(source);
	$.ajax({
		url : "translate",
		type : "post",
		dataType : "json",
		data : { source : source },
		success:function(resp){
			if(resp.result=="ko"){
				$.ajax({
					url : "TranslateProcKo",
					type : "post",
					dataType : "json",
					data : { source : source },
					success:function(resp){
						$(a).html(resp.result);
					}
				});
			} else if(resp.result=="en"){
				$.ajax({
					url : "TranslateProcEn",
					type : "post",
					dataType : "json",
					data : { source : source },
					success:function(resp){
						$(a).html(resp.result);
					}
				});
			} else {
				alert("번역할 수 없습니다.");
			}
		}, error : function(err1){
			$(a).html("오류가 발생하였습니다.");
		}
	});
});


$("#chkAll").click(function(){
		$(".chkAll").show();
		$("input[name=cateChk]").prop("checked", true);
});

// 카테고리 체크
function cateChk(e){
	console.log("cateChk:"+$(e).attr('for'));
	var a = $(e).attr('for');
	var b1 = document.getElementById(a);
	var b2 = document.getElementsByClassName(a);
	var c = $(b1).prop("checked");
	console.log($("input[name=cateChk]:checked").length+ " : "+$("input[name=cateChk]").length);
	if($("input[name=cateChk]:checked").length < $("input[name=cateChk]").length){
		$("#chkAll").prop("checked", false);
		$("input[type=checkbox]").css("font-weight", "100");
		if($(b1).prop("checked")==true){
			$(b2).show();
		} else {
			$(b2).hide();
		}
	}else{
		$("#chkAll").prop("checked", true);
		$("input[type=checkbox]").css("font-weight", "bold");
		$(".chkAll").show();
	}
};
		/* 글자 굵기 변화
 		$(e).parent().children().css("font-weight", "100");
		$(e).css("font-weight", "bold"); */
		
// 글쓰기 아이콘 클릭 시 포커스 이동
function write_icon(){
	$("#bb_info").focus();			
}

// 팔로우 인서트
function follow(m_id) {
	var my_name=document.getElementById("my_name").value;
	console.log("팔로우 m_id:"+m_id);
    console.log("팔로우 my_name:"+my_name);
    
	$.ajax({
	    url: "bbFollow",
	    method: "POST",
	    data: {
	        m_id: m_id,
	        my_name: my_name
	    },
	    success: function(resp) {
	    	console.log("follow성공 : " +resp.bbFollow);
	    	$("#follow").hide();
			$("#unFollow").show();
	    },
	    error: function(request, status, error) {
	        alert("code:" +
	            request.status +
	            "\n" +
	            "message:" +
	            request.responseText +
	            "\n" + "error:" +
	            error);
	    }
	});
    
}

// 팔로우 취소
function unFollow(m_id) {
    var my_name=document.getElementById("my_name").value;
    console.log("언팔 m_id:"+m_id);
    console.log("언팔 my_name:"+my_name);
    
	// 팔로우 좋아요 취소 
	$.ajax({
	    url: "bbUnFollow",
	    method: "POST",
	    data: {
	        m_id: m_id,
	        my_name: my_name
	    },
	    success: function(resp) {
	    	console.log("unFollow성공 :m_id : " +resp.bbUnFollow);
	    	$("#follow").show();
			$("#unFollow").hide();
	    },
	    error: function(request, status, error) {
	        alert("code:" +
	            request.status +
	            "\n" +
	            "message:" +
	            request.responseText +
	            "\n" + "error:" +
	            error);
	    }
	});
}

// 게시물 좋아요
function pressLike(t_id) {
    var lcount = $(".lCount" + t_id).val();
    console.log("게시물 좋아요:"+t_id);
    console.log("게시물 좋아요 lCount:"+lcount);
    lcount++;
    console.log("게시물 좋아요 lCount:"+lcount);
    console.log("게시물 좋아요 m_id:"+m_id);

	$.ajax({
	    url: "${pageContext.request.contextPath}/pressLikeB.do",
	    method: "POST",
	    data: {
	        m_id: my_name,
	        m_id2: m_id,
	        t_id: t_id
	    },
	    success: function(data) {
	        console.log("m_id : " +
	        		m_id +
	            " t_id : " +
	            t_id);
	        $(".likechk" + t_id).css("display", "none");
	        $(".unlikechk" + t_id).css("display", "block");
	        $(".lCount" + t_id).val(lcount);
	        /* $(".lCount" + t_id).load(location.href+".lCount" + t_id); */
	    },
	    error: function(request, status, error) {
	        alert("code:" +
	            request.status +
	            "\n" +
	            "message:" +
	            request.responseText +
	            "\n" + "error:" +
	            error);
	    }
	});
    
}

// 게시물 좋아요 취소
function pressUnlike(t_id) {
    var lcount = $(".lCount" + t_id).val();
    console.log("좋아요 취소 lcount1:"+lcount);
    lcount--;
    console.log("좋아요 취소 lcount2:"+lcount);

        // 게시물 좋아요 취소 - 비즈니스 게시판
        $.ajax({
            url: "${pageContext.request.contextPath}/pressUnLikeB.do",
            method: "POST",
            data: {
                m_id: my_name,
                m_id2: m_id,
                t_id: t_id
            },
            success: function(data) {
                console.log("m_id : " +
                		m_id +
                    " t_id : " +
                    t_id);
                $(".likechk" + t_id).css("display", "block");
                $(".unlikechk" + t_id).css("display", "none");
               	$(".lCount" + t_id).val(lcount);
               	/* $(".lCount" + t_id).load(location.href+".lCount" + t_id); */
            },
            error: function(request, status, error) {
                alert("code:" +
                    request.status +
                    "\n" +
                    "message:" +
                    request.responseText +
                    "\n" + "error:" +
                    error);
            }
        });
}

//공유
/* function shareurl(m_id, b_id) {
    $("#report_modal").css("display", "block");
    $("#report_back").css("display", "block");
    $("#pre_report_choose").css("display", "none");
    $("#share_con").css("display", "block");
    var url = "http://localhost:8090/tain/gnEachPage?b_id=" + b_id;
    $("#url").val(url);
    $("#share_chk").on('click', function() {
        var curl = document.getElementById("url");
        curl.select();
        document.execCommand('copy');
        curl.setSelectionRange(0, 0);
        $("#share_con").css("display", "none");
        $("#share_con_result").css("display", "block");
    });
} */

function pre_report(b_id, id, type) {
    $("#report_modal").css("display", "block");
    $("#report_back").css("display", "block");
    $("#pre_report_choose").css("display", "block");
    $(".toreport").on('click', function() {
        $("#pre_report_choose").css("display", "none");
        report(b_id, id, type);
    });
    $("#pre_go").on('click', function() {
        var url = "${pageContext.request.contextPath}/gnEachPage?&b_id=" + b_id;
        $(location).attr('href', url);
    });
    $("#pre_unfollow").on('click', function() {
        $("#pre_report_choose").css("display", "none");
        if (memId == id) {
            $("#cantunfollow").css("display", "block");
            $("#askunfollow").css("display", "none");
        } else {
            $("#askunfollow").css("display", "block");
            $("#yes_unfollow").on('click', function() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/unfollow.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        id: id
                    },
                    success: function(data) {
                        console.log("언팔 완료");
                        $("#askunfollow").css("display", "none");
                        $("#unfollowchk").css("display", "block");
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            });
        }
    });
}

// 댓글 신고 (일반 & 비즈니스 게시판 분리)
function report(b_id, id, type) {
    console.log(b_id);
    console.log(id);
    console.log(memId);
    console.log(type);
    $.ajax({
        url: "${pageContext.request.contextPath}/reportchk.do",
        method: "POST",
        data: {
            b_id: b_id,
            m_id: memId
        },
        dataType: "json",
        success: function(hLike) {
            if (hLike == 0) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#report_choose").css("display", "block");
                $("#report_result").css("display", "none");
                $("#report_already").css("display", "none");

                if (type == "G") {
                    $(".send_report").on('click', function() {
                        var report_reason = $(this).next().val();
                        console.log(report_reason);
                        console.log(b_id);
                        console.log(id);
                        console.log(memId);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/insertReport.do",
                            method: "POST",
                            data: {
                                b_id: b_id,
                                m_id: memId,
                                r_reason: report_reason
                            },
                            success: function(data) {
                                console.log("신고 완료");
                                $("#report_choose").css("display", "none");
                                $("#report_write").css("display", "none");
                                $("#pre_report_choose").css("display", "none");
                                $("#report_result").css("display", "block");
                                $(".send_report").off('click');
                                $(".toreport").off('click');

                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    });
                    $(".send_report_text").on('click', function() {
                        var report_reason = $("#etx_write_space").val();
                        console.log(report_reason);
                        console.log(b_id);
                        console.log(id);
                        console.log(memId);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/insertReport.do",
                            method: "POST",
                            data: {
                                b_id: b_id,
                                m_id: memId,
                                r_reason: report_reason
                            },
                            success: function(data) {
                                console.log("신고 완료");
                                $("#report_choose").css("display", "none");
                                $("#report_write").css("display", "none");
                                $("#report_result").css("display", "block");
                                $("#pre_report_choose").css("display", "none");
                                $("#etx_write_space").val('');
                                $(".send_report_text").off('click');
                                $(".toreport").off('click');
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    });
                } else if (type == "B") {
                    $(".send_report").on('click', function() {
                        var report_reason = $(this).next().val();
                        console.log(report_reason);
                        console.log(b_id);
                        console.log(id);
                        console.log(memId);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/insertReportB.do",
                            method: "POST",
                            data: {
                                b_id: b_id,
                                m_id: memId,
                                r_reason: report_reason
                            },
                            success: function(data) {
                                console.log("신고 완료");
                                $("#report_choose").css("display", "none");
                                $("#report_write").css("display", "none");
                                $("#pre_report_choose").css("display", "none");
                                $("#report_result").css("display", "block");
                                $(".send_report").off('click');
                                $(".toreport").off('click');
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    });
                    $(".send_report_text").on('click', function() {
                        var report_reason = $("#etx_write_space").val();
                        console.log(report_reason);
                        console.log(b_id);
                        console.log(id);
                        console.log(memId);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/insertReportB.do",
                            method: "POST",
                            data: {
                                b_id: b_id,
                                m_id: memId,
                                r_reason: report_reason
                            },
                            success: function(data) {
                                console.log("신고 완료");
                                $("#report_choose").css("display", "none");
                                $("#report_write").css("display", "none");
                                $("#pre_report_choose").css("display", "none");
                                $("#report_result").css("display", "block");
                                $("#etx_write_space").val('');
                                $(".send_report_text").off('click');
                                $(".toreport").off('click');
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    });
                }
            } else if (hLike >= 1) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#report_already").css("display", "block");
                $("#report_choose").css("display", "none");
                $("#pre_report_choose").css("display", "none");


            }
        },
        error: function(request,
            status, error) {
            console.log("code:" +
                request.status +
                "\n" +
                "message:" +
                request.responseText +
                "\n" + "error:" +
                error);
        }
    });

}

$(".cancel").on('click', function() {
    $("#report_modal").css("display", "none");
    $("#report_back").css("display", "none");
    $("#report_write").css("display", "none");
    $("#report_result").css("display", "none");
    $("#report_choose").css("display", "none");
    $("#report_already").css("display", "none");
    $("#pre_report_choose").css("display", "none");
    $("#unfollowchk").css("display", "none");
    $("#askunfollow").css("display", "none");
    $("#cantunfollow").css("display", "none");
    $("#share_con").css("display", "none");
    $("#share_con_result").css("display", "none");
});

$("#etc").on('click', function() {
    $("#report_choose").css("display", "none");
    $("#report_write").css("display", "block");
});
</script>
</body>

<!-- 댓글 입력 에이작스 -->
<script type="text/javascript">
var m_id = document.getElementById("m_id").value;
var my_name = $("#my_name").val();
var memId = $(".m_id").val();
console.log("m_id:"+m_id+"my_name:"+my_name+"memId:"+memId);
$(function(){
	console.log("로드완료!!!!!!!!!!!!!!!!!!!!!!!!");
	
	
	/* 댓글등록 */
	$(".bbrInsert").on('click', function(){
		var a = $("#bb_topid").val();
		var c1 = document.getElementById(a);
		var c2 = $("#bb_info").val();
		console.log("댓글인서트a:"+a+"c1:"+c1+"c2:"+c2);
		if(c2==""){
			alert("내용을 입력해주세요");
			event.preventDefault();
		} else {
			$.ajax({
				url:"bbrInsert",
				method:"POST",
				async:false,
				data:{
					bb_topid : a,
					bb_info : c2,
					m_id:my_name
				},
				dataType:"json",
				success: function(resp){
					console.log(resp.data.length);
					$(".mdReply").empty();
		    		if(resp.data!=null){
			    		for(i=0; i<resp.data.length; i++){
							var htmls="";
			    			var r_m_img = resp.data[i].m_img;
			    			var r_m_id = resp.data[i].m_id;
			    			var r_bb_info = resp.data[i].bb_info;
			    			var r_bbrlike = resp.data[i].bbrlike;
			    			var r_bb_id = resp.data[i].bb_id;
			    			var r_like_chk = resp.data[i].like_chk;
			    			htmls += "<div class='mrd' >"+
			    						"<div class='mrdUp' >"+
											"<div class='bbrImg'>"+
												"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+r_m_img+"' width='40px' height='40px'/>"+
											"</div>"+
											"<div class='mrrdRight' >"+
												"<div class='mrrdCont' >"+
													"<a href='${pageContext.request.contextPath}/bbList.do?m_id="+ r_m_id+ "' class='bbrId'>"+
														"<span>" + r_m_id + "</span>"+
													"</a>"+
													"<span>"+r_bb_info+"</span>"+
												"</div>"+
												"<div class='mrrdOpt' >"+
													"<div class='bbrLike'>"+
														"<span class='bbrL' >좋아요:<input type='button' class='lCount"+r_bb_id+" showlCount' value='"+r_bbrlike+"' readonly></span>"+
														
													"</div>"+
													"<div class='bbrrbtn' >"+
														"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' onclick='bbrrWrite(this)' \">답글달기</button>"+
													"</div>";
													
							if(r_m_id==$("#my_name").val()){
								htmls += 				"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">삭제</button>";
							}
							htmls +=				"<button type='button'  id='mdBbBtn' onclick='mdReport(this)' style='cursor:pointer'>&#149;&#149;&#149;</button>"+
													"<div class='icon_reply like_icon_reply likechk"+r_bb_id+"' onclick='pressLike(\""+r_bb_id+"\");' width='10px' height='10px'></div>"+
									                "<div class='icon_reply unlike_icon_reply unlikechk"+r_bb_id+"' onclick='pressUnlike(\""+r_bb_id+"\");'></div>"+
									                "<div></div>"+
													"<div id='bbrrInBox' class='bbrrInBox' >"+
														"<input type='text' class='replyCoWri write_space' placeholder='답글 작성...'/>"+
														"<button id='bbrrup"+r_bb_id+"' onclick='bbrrInsert(this)'>게시</button>"+
														"<input type='hidden' value='" + r_bb_id + "'/>"+
													"</div>"+
												"</div>"+
											"</div>"+
										"</div>"+
										"<div class='mrdDown' >"+
											"<div class='bbrrLine' ></div>"+
											"<a class='bbrrShow' id='bbrrshow"+r_bb_id+"' onclick=\"bbrrListShow('"+ r_bb_id +"')\">답글보기</a>"+
											"<a class='bbrrHide' id='bbrrhide"+r_bb_id+"' onclick=\"bbrrListHide('"+ r_bb_id +"')\" style='display:none;'>답글숨기기</a>"+
											"<div id='bbrr' class='bbrr'>"+
											"</div>"+
										"</div>"+
									"</div>";
		    			$(".mdReply").append(htmls);
			    			if(r_like_chk==null){
			    				$(".likechk" + r_bb_id).css("display", "block");
					    		$(".unlikechk" + r_bb_id).css("display", "none");
			    			} else{
			    				$(".likechk" + r_bb_id).css("display", "none");
				                $(".unlikechk" + r_bb_id).css("display", "block");
			    			}
			    		}   
			    		$("#bb_info").val("");
			    		
		    		} else {
		    			$(".mdReply").html("<div class='mrd'>댓글이 없습니다.</div>");
		    		}
				},
				error:function(request, status, error){
					alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				}
			});
		}
	});
	
	
	/* 상품가격 + 옵션 */
	$("#option").on("change", function(){
		var option = document.getElementById("option").value;
		console.log(option);
		var optSplit = option.split("+");
		var optInt = optSplit[1];
		var mdprice = $("#mdPriceHide").val();
		console.log("mdprice:"+mdprice);
		var priceSum = parseInt(mdprice) + parseInt(optInt);
		console.log("priceSum:"+priceSum);
		if(option==""){
			$("#mdprices").html(mdprice);
		} else{
			$("#mdprices").html(priceSum);
		}
	});
	
	
});
//페이지 로딩 시 처음 두개 댓글 나타내기 trigger - .hidden_commentchk
// 댓글 좋아요 표시 외 수정 불가
function showAllCoHidden(t_id) {
    var type = $(".t_type" + t_id).val();

    // 두개 댓글 나타내기
    $.ajax({
        url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
        method: "POST",
        data: {
            t_id: t_id
        },
        dataType: "json",
        success: function(hComment) {
            var count = hComment;
            for (var i = 0; i < 2; i++) {
                var id = count.hComment[i].m_id;
                var b_content = count.hComment[i].b_content;
                var b_id = count.hComment[i].b_id;
                var b_type = count.hComment[i].b_type;
                var countr = count.hComment[i].count;
                var b_date = count.hComment[i].b_date;

                // 댓글 append - cm2 // 댓글 좋아요 체크 trigger 사용
                $(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                    id + '</div><div class="commentResult post_content">' +
                    b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                    '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                    '<input type="hidden" value="' + b_id + '"></div></div>');
                $(".cm2" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                    "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
            }

            // 댓글 좋아요 체크 trigger 호출
            $(".hidden_likechk").trigger('click');
        }
    });

    // (일반 & 비즈니스 게시판 분리)
    if (type == "G") {
        // 댓글 좋아요 - 일반 게시판
        $(".comment_lcon").on('click', function() {
            var b_id = $(this).next().next().val();
            console.log(memId);
            console.log(b_id);
            $.ajax({
                url: "${pageContext.request.contextPath}/pressLike.do",
                method: "POST",
                data: {
                    m_id: memId,
                    t_id: b_id
                },
                success: function(data) {
                    console.log("memId : " +
                        memId +
                        " b_id : " +
                        b_id);
                    $(".likechk" + b_id).css("display", "none");
                    $(".unlikechk" + b_id).css("display", "block");
                },
                error: function(request, status, error) {
                    alert("code:" +
                        request.status +
                        "\n" +
                        "message:" +
                        request.responseText +
                        "\n" + "error:" +
                        error);
                }
            });
        });

        // 댓글 좋아요 취소 - 일반 게시판
        $(".comment_unlcon").on('click', function() {
            var b_id = $(this).next().val();
            console.log(memId);
            console.log(b_id);
            $.ajax({
                url: "${pageContext.request.contextPath}/pressUnLike.do",
                method: "POST",
                data: {
                    m_id: memId,
                    t_id: b_id
                },
                success: function(data) {
                    console.log("memId : " +
                        memId +
                        " b_id : " +
                        b_id);
                    $(".likechk" + b_id).css("display", "block");
                    $(".unlikechk" + b_id).css("display", "none");
                },
                error: function(request, status, error) {
                    alert("code:" +
                        request.status +
                        "\n" +
                        "message:" +
                        request.responseText +
                        "\n" + "error:" +
                        error);
                }
            });

        });

        // 두개 댓글 나타내기 - 비즈니스 게시판
    } else if (type = "B") {

        // 댓글 좋아요 - 비즈니스 게시판
        $(".comment_lcon").on('click', function() {
            var b_id = $(this).next().next().val();
            console.log(memId);
            console.log(b_id);
            $.ajax({
                url: "${pageContext.request.contextPath}/pressLikeB.do",
                method: "POST",
                data: {
                    m_id: memId,
                    t_id: b_id
                },
                success: function(data) {
                    console.log("memId : " +
                        memId +
                        " b_id : " +
                        b_id);
                    $(".likechk" + b_id).css("display", "none");
                    $(".unlikechk" + b_id).css("display", "block");
                },
                error: function(request, status, error) {
                    alert("code:" +
                        request.status +
                        "\n" +
                        "message:" +
                        request.responseText +
                        "\n" + "error:" +
                        error);
                }
            });
        });

        // 댓글 좋아요 취소 - 비즈니스 게시판
        $(".comment_unlcon").on('click', function() {
            var b_id = $(this).next().val();
            console.log(memId);
            console.log(b_id);
            $.ajax({
                url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                method: "POST",
                data: {
                    m_id: memId,
                    t_id: b_id
                },
                success: function(data) {
                    console.log("memId : " +
                        memId +
                        " b_id : " +
                        b_id);
                    $(".likechk" + b_id).css("display", "block");
                    $(".unlikechk" + b_id).css("display", "none");
                },
                error: function(request, status, error) {
                    alert("code:" +
                        request.status +
                        "\n" +
                        "message:" +
                        request.responseText +
                        "\n" + "error:" +
                        error);
                }
            });
        });
    }
}
</script>
</html>