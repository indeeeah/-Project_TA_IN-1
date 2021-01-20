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
<script src="http://code.jquery.com/jquery-3.4.0.js"></script> 
<style>
a{
	text-decoration:none;
}
body {font-family: Arial, Helvetica, sans-serif;}
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
    outline: none;
    border: none;
    font-size: 12px;
    line-height: 18px;
    background-color: transparent;
    padding: 0px;
    cursor:pointer;
}
.content{
	width:1000px;
	margin:0 auto;
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
.selectBb:hover .middle{
	opacity:1;
}
.text {
  color: grey;
  font-size: 16px;
  padding: 16px 32px;
}




#mdImg img{
	width:100%;
	height:100%;
    min-width: 450px;
    min-height: 450px;
    max-width: 600px;
    max-height: 600px;
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
  	padding: 10px;
  	border: 1px solid #888;
  	width: 90%;
  	max-width:930px;
  	display: flex;
  	margin-top: 150px;
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
#mdImg {
    margin-right: 20px;
    min-width:450px;
	min-height:450px;
	max-width:600px;
	max-height:600px;
}
#mdText {
    max-height: 600px;
   	width: 100%;
}
#mdInfo {
    height: 72px;
    padding-top: 16px;
    right: 0;
    width: 100%;
    line-height: 50px;
    position:relative;
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
#unFollow{
	display:none;
}
#mdBoard {
	height:55%;
    overflow-x: hidden;
}
#mdContent {
    margin-bottom: 10px;
    position:relative;
}
.translate {
    right: 0px;
    top: 0px;
    position: absolute;
}
.mrd{
	margin-bottom:20px;
}

.bbrImg {
    float: left;
    margin-right: 10px;
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
.mrrdCont span {
    word-break: break-all;
}
.bbrLike {
    float: left;
    margin-right: 10px;
}
.mrdDown {
    display: block;
    clear: both;
}
.bbrrLine{
	border-bottom: 1px solid rgba(var(--f52,142,142,142),1);
    display: inline-block;
    height: 0;
    margin-right: 16px;
    margin-left: 16px;
    vertical-align: middle;
    width: 24px;
}
#bbrr {
    padding-left: 40px;
    margin-top: 7px;
}
.bbrrbtn {
    float: left;
    margin-right: 10px;
}
#mdBoard {
    margin-bottom: 15px;
}
.bbrrImg{
	float:left;
	margin-right:10px;
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
}
#mdWrite{
	margin-top:10px;
}
#bb_info {
    width: 353px;
    height: 18px;
    outline: none;
    border: none;
    padding: 0px;
    float: left;
    background-color: transparent;
    font-size: initial;
}
#mdFooter{
	background-color: #fefefe;
	margin: auto;
  	padding: 10px;
  	border: 1px solid #888;
  	width: 90%;
  	max-width:930px;
  	display: flex;
  	margin-top: 20px;
  	justify-content: space-around;
  	bottom:0px;
}

<!-- 이미지 슬라이드 -->
 	.md_imgbox {display: none}
	
	/* Slideshow container */
	.mdImg {
	  max-width: 500px;
	  position: relative;
	  margin: auto;
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
	  	border: 1px solid #888;
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
		border-top: 1px solid rgb(133,133,133);
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
	  	border: 1px solid #888;
	  	width: 400px;
	  	height:290px;
	  	max-width:400px;
	  	border-radius: 12px;
	  	text-align:center;
	}
	#mdBbBtn{
		position:absolute;
		right: 20px;
	}
	#bbReport{
		height:48px;
		line-height:48px;
	}
	#goBbPage{
		height:48px;
		border-top: 1px solid rgb(133,133,133);
    	line-height: 48px;
	}
	#shareBb{
		height:48px;
		border-top: 1px solid rgb(133,133,133);
    	line-height: 48px;
	}
	#linkBb{
		height:48px;
		border-top: 1px solid rgb(133,133,133);
    	line-height: 48px;
	}
	#saveBb{
		height:48px;
		border-top: 1px solid rgb(133,133,133);
    	line-height: 48px;
	}
	.cancel{
		height:48px;
		border-top: 1px solid rgb(133,133,133);
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
	  	border: 1px solid #888;
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
	
	
	
	
	
	
	.timeline_icon_con {
	    width: 100%;
	    height: 40px;
	    margin-top: 4px;
	}
	
	.icon {
	    width: 24px;
	    height: 24px;
	    float: left;
	    margin-top: 8px;
	    margin-right: 16px;
	    cursor: pointer;
	}
	.save_icon {
	    margin-right: 0px;
	    float: right;
	}
	.like_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
	    background-size: 24px;
	}
	
	.like_icon:hover {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 24px;
	}
	
	.unlike_icon {
	    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
	    background-size: 24px;
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
${listCount } : ${my_name }
	<div id="content" class="content">
		<input type="hidden" id="my_name" class="my_name" value="${my_name }">
		<!-- 카테고리 -->
		<div id="categoryBox">
			<input type="hidden" id="cateLength" value="${fn:length(category)}">
			<input id="chkAll" class="inputChkAll" type="checkbox" style="display:none;" checked><label id="allLabel" for="chkAll" style="font-weight:bold">전체보기</label>
			<c:if test="${not empty category }">
				<c:forEach items="${category }" var="v">
					<input id="${v.c_name }" name="cateChk" for="${v.c_name }" onclick="cateChk(this)" type="checkbox" checked><label for="${v.c_name }" onclick="cateChk(this)" style="font-weight:bold">${v.c_name }</label>
				</c:forEach>
			</c:if>	
		</div>
		<!-- 게시물 리스트 -->
		<c:if test="${empty list }">
			게시물이 없습니다.
		</c:if>
		<div id="bbList" class="bbList">
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="v">
					<div id="selectBb" class="selectBb ${v.c_name } chkAll">
						<button type="button" id="bb" class="myBtn" onclick="mdOpen(this)" value="${v.bb_id }" style="border:none; cursor:pointer">
							<img class="listImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${v.bb_img1 }">
							<div class="middle">
								<div class="text">좋아요 : ${v.bb_like }  댓글 : ${v.bbrcnt }</div>
							</div>
						</button>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
	<!-- 모달 (상세페이지) -->
	<div id="modal" class="modal">
	    <span type="button" class="close">&times;</span>
		
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
		  				<span id="bbName"></span> 
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
		  				<span id="bbrInsert" class="bbrInsert" name="bbrInsert" style="cursor:pointer">게시</span>
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
	</div>
	
	<!-- 모달 (장바구니) -->
	<div id="mdCart">
		<div id="mdcContent" class="mdcContent">
			<div id="goCart" onclick="location.href='#'">
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
				신고
			</div>
			<div id="goBbPage" class="goBbPage" onclick="location.href='#'">
				게시물로 이동
			</div>
			<div id="shareBb" class="shareBb">
				공유 대상...
			</div>
			<div id="linkBb" class="linkBb">
				링크 복사
			</div>
			<div  id="saveBb" class="saveBb">
				퍼가기
			</div>
			<div id="cancel" class="cancel">
				취소
			</div>
		</div>
	</div>
	
	<!-- 모달 (댓글 + 답글) -->
	<div id="mdBbr">
		<div id="mdbbrContent" class="mdcContent">
			<div id="bbReport" class="bbReport" onclick="bbRepoart(this)">
				신고
			</div>
			<div id="cancel" class="cancel">
				취소
			</div>
		</div>
	</div>
	
	<input type="button"  value="글쓰기" onclick="window.location='bbWriteForm.do'">
	</div>
	
<script>

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

// 모달(상세페이지) open
function mdOpen(e){
	var a = $(e).val();
	console.log("모달창 열기a:"+a);
	var x = document.getElementById("modal");
	console.log("모달창 열기x:"+x);
    x.style.display="block";
    $('body').css("overflow", "hidden");
    
    // 모달창 내부(상세 페이지) 로드
    $.ajax({
    	url:"bbDetail",
    	type:"post",
    	async:false,
    	data:{
    		bb_id:a
    	},
    	dataType:"json",
    	success:function(resp){
    		// 이미지 로드
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
    		$("#mdInfoImg").html("<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.m_img+"' width='50px' height='50px'/>");
   			// 게시글번호 및 멤버아이디(추후삭제)
   			console.log("#my_name:"+$("#my_name").val());
   			if(resp.bbDetail.m_id==$("#my_name").val()){
    			$("#mdInfoText").html(resp.bbDetail.bb_id +' : '+resp.bbDetail.m_id +'<a id="follow">팔로우</a><a id="unFollow">팔로잉</a><a id="bbUpdate" href="bbRenew.do?bb_id='+resp.bbDetail.bb_id+'">수정</a><a id="bbDelete" href="bbDelete.do?bb_id='+resp.bbDetail.bb_id+'">삭제</a><span id="mdBbBtn" onclick="mdBb()" style="cursor:pointer">&#149;&#149;&#149;</span>');
   			} else {
    			$("#mdInfoText").html(resp.bbDetail.bb_id +' : '+resp.bbDetail.m_id + '<a id="follow">팔로우</a><span id="mdBbBtn" style="cursor:pointer">...</span>');
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
					                '<div class="icon save_icon"></div>'+
					            '</div>'+
					            '<div class="timeline_likes_con">좋아요 <input type="button" class="lCount'+resp.bbDetail.bb_id+' showlCount" value="'+resp.bbDetail.bb_like+'" readonly>개</div>'+
					            '<input type="hidden" class="hidden_likechk" onclick="likechk(\''+resp.bbDetail.bb_id+'\');"> <input type="hidden" class="hidden_commentchk" onclick="showAllCoHidden(\''+resp.bbDetail.bb_id+'\');">'+
                                /* '<input type="hidden" name="t_type" class="t_type'+resp.bbDetail.bb_id+'" value="${vo.t_type }">'+ */
					            '<input type="hidden" value="'+resp.bbDetail.bb_id+'" class="countLike_trigger" onclick="countLike(\''+resp.bbDetail.bb_id+'\');">'+
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
	/* 댓글 조회 */
	var m_id = "aaaa";
    $.ajax({
    	url:"bbrList",
    	type:"POST",
    	async:false,
    	data:{ bb_id : a },
    	dataType:"json",
    	success:function(resp){
    		var htmls="";
    		console.log("내 아이디:"+$("#my_name").val());
    		if(resp.data!=null){
	    		for(i=0; i<resp.data.length; i++){
	    			var r_m_id = resp.data[i].m_id;
	    			var r_bb_info = resp.data[i].bb_info;
	    			var r_bbrlike = resp.data[i].bbrlike;
	    			var r_bb_id = resp.data[i].bb_id;
	    			htmls += "<div class='mrd' >"+
	    						"<div class='mrdUp' >"+
									"<div class='bbrImg'>"+
										"<img src='#' width='50px' height='50px'/>"+
									"</div>"+
									"<div class='mrrdRight' >"+
										"<div class='mrrdCont' >"+
											"<a href='#' class='bbrId'>"+
												"<span>" + r_m_id + "</span>"+
											"</a>"+
											"<span>"+r_bb_info+"</span>"+
										"</div>"+
										"<div class='mrrdOpt' >"+
											"<div class='bbrLike'>"+
												"<span class='bbrL' >좋아요:"+r_bbrlike+"</span>"+
											"</div>"+
											"<div class='bbrrbtn' >"+
												"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' onclick='bbrrWrite(this)' \">답글달기</button>"+
											"</div>";
											
					if(r_m_id==$("#my_name").val()){
						htmls += 				"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">댓글삭제</button>";
					}
					htmls +=				"<button type='button'  id='mdBbBtn' style='cursor:pointer'>...</button>"+
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
	    		}   
    			$(".mdReply").html(htmls);
    			
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
		data:{ bb_id:bb_id},
		dataType:"json",
		success:function(resp){
			var htmls="";
    		if(resp.data!=null){
	    		for(i=0; i<resp.data.length; i++){
	    			var rr_m_id = resp.data[i].m_id;
	    			var rr_bb_info = resp.data[i].bb_info;
	    			var rr_bbrlike = resp.data[i].bbrlike;
	    			var rr_bb_id = resp.data[i].bb_id;
	    			htmls +="<div class='mrrd' >"+
								"<div class='bbrrImg'>"+
									"<img src='#' width='50px' height='50px'/>"+
								"</div>"+
								"<div class='mrrdRight' >"+
									"<div class='mrrdCont' >"+
										"<div id='bbrrId' class='bbrrId'>"+
											"<a href='#' class='bbrrId'>"+
												"<span>" + rr_m_id + "</span>"+
											"</a>"+
											"<span id='bbrrCon' class='bbrrCon'>"+ rr_bb_info +"</span>"+
										"</div>"+
									"</div>"+
									"<div class='bbrrOpt' >"+
										"<div id='bbrrLike' class='bbrrLike'>"+
											"<span class='bbrrL' >좋아요:"+ rr_bbrlike +"</span>"+
										"</div>";
					if(rr_m_id==$("#my_name").val()){
						htmls += 		"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrDelete('"+ rr_bb_id +"')\">삭제</button>";
					}
					htmls +=			"<span id='mdBbrBtn' style='cursor:pointer'>...</span>"+
									"</div>"+
								"</div>"+
							"</div>";
	    		}   
    			$(a2).next().next().html(htmls);
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
    $(e).parent().next().next().css("display", "block");
};

// 답글 게시 버튼 클릭시(답글인서트)
function bbrrInsert(e){
    var memId = $(".m_id").val();
    var bb_topid = $(e).next().val();
    var bb_info = $(e).prev().val();
    var a = "bbrrshow"+bb_topid;
    var a2 = document.getElementById(a);
    var b = "bbrrhide"+bb_topid;
    var b2 = document.getElementById(b);
    console.log("memId: "+memId+" bb_topid: "+bb_topid+" bb_info:"+bb_info);
    
    if (bb_info == "" || bb_info == null) {
        console.log("reply comment won't be uploaded");
        $(".bbrrInBox").css("display", "none");
        $('.rep_comment_upload').off('click');
    } else {
        $.ajax({
            url: "bbrrInsert",
            method: "POST",
            async:false,
            data: {
                bb_info: bb_info,
                bb_topid: bb_topid
            },
            dataType:"json",
            success: function(resp) {
                console.log("comment:" + resp.data.bb_info +"postid:" +resp.data.bb_id);
                console.log(resp);
                $(".write_space").val('');
                $(".bbrrInBox").css("display", "none");
                var htmls="";
        		if(resp.data!=null){
    	    		for(i=0; i<resp.data.length; i++){
    	    			var rr_m_id = resp.data[i].m_id;
    	    			var rr_bb_info = resp.data[i].bb_info;
    	    			var rr_bbrlike = resp.data[i].bbrlike;
    	    			var rr_bb_id = resp.data[i].bb_id;
    	    			htmls +="<div class='mrrd' >"+
	 								"<div class='bbrrImg'>"+
										"<img src='#' width='50px' height='50px'/>"+
									"</div>"+
									"<div class='mrrdRight' >"+
										"<div class='mrrdCont' >"+
											"<div id='bbrrId' class='bbrrId'>"+
												"<a href='#' class='bbrrId'>"+
													"<span>" + rr_m_id + "</span>"+
												"</a>"+
												"<span id='bbrrCon' class='bbrrCon'>"+ rr_bb_info +"</span>"+
											"</div>"+
										"</div>"+
										"<div class='bbrrOpt' >"+
											"<div id='bbrrLike' class='bbrrLike'>"+
												"<span class='bbrrL' >좋아요:"+ rr_bbrlike +"</span>"+
											"</div>";
						if(rr_m_id==$("#my_name").val()){
							htmls += 		"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrDelete('"+ rr_bb_id +"')\">삭제</button>";
						}
						htmls +=			"<span id='mdBbrBtn' style='cursor:pointer'>...</span>"+
										"</div>"+
									"</div>"+
								"</div>";
    	    			
    	    		}   
        			$(e).parent().parent().parent().parent().next().children().next().next().next().html(htmls);
        		}
        		$(a2).hide();
        	    $(b2).show();
            },
            error: function(request, status, error) {
                alert("code:" +request.status +"\n" +"message:" + request.responseText +"\n" + "error:" + error);
            }
        });
    }
};

// 모달창(상세페이지) close
$('.close').on('click', function() {
	/* $('#modal').hide(); */
	var a = $(this).val();
	console.log("모달창 닫기a:"+a);
	var x = document.getElementById("modal");
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
    $('body').css("overflow", "scroll");
    //클로즈 버튼 누르면 댓글 지워지기
    $(".mdReply").empty();
    slideIndex = 1;
});

// 윈도우 누르면 모달창(상세페이지) 꺼지기
$(window).on('click', function() {
	var modal = document.getElementById('modal');
	console.log(modal);
	var a = $(this)
	var insertBox = document.getElementById(a);
	console.log(insertBox);
	if (event.target == modal) {
		$('body').css("overflow", "scroll");
		modal.style.display = "none";
	}
	/* if(event.target != insertBox){
		insertBox.style.display = "none";
	} */
});

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
$('#mdBbrBtn').on('click', function() {
	if(confirm('장바구니에 추가하시겠습니까?')==false){
		return;
	}
	// 게시물 번호 구하기
	var x = document.getElementById("mdBbr");
    x.style.display="block";
	
});

//모달(댓글+답글) 닫기
$('#shopping').on('click', function() {
	var x = document.getElementById("mdCart");
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
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

// 게시글 좋아요 카운트 trigger - countLike_trigger
function countLike(b_id) {
    $.ajax({
        url: "${pageContext.request.contextPath}/countLike.do",
        method: "POST",
        data: {
            t_id: b_id
        },
        success: function(data) {
            var result = data;
            $(".lCount" + b_id).val(data);
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

// 게시물 좋아요 체크 trigger - .hidden_likechk
/* function likechk(t_id) {
    $.ajax({
        url: "${pageContext.request.contextPath}/hiddenShowLike.do",
        method: "POST",
        data: {
            b_id: t_id,
            m_id: memId
        },
        dataType: "json",
        success: function(hLike) {
            if (hLike >= 1) {
                $(".likechk" + t_id).css("display", "none");
                $(".unlikechk" + t_id).css("display", "block");
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
} */

// 게시물 좋아요 (일반 & 비즈니스 게시판 분리)
function pressLike(t_id) {
    var type = $(".t_type" + t_id).val();
    var lcount = $(".lCount" + t_id).val();
    console.log(t_id);
    console.log(lcount);
    lcount++;
    console.log(lcount);

    // 게시물 좋아요 - 일반 게시판
    if (type == "G") {
        $.ajax({
            url: "${pageContext.request.contextPath}/pressLike.do",
            method: "POST",
            data: {
                m_id: memId,
                t_id: t_id
            },
            success: function(data) {
                console.log("memId : " + memId + " t_id : " + t_id);
                $(".likechk" + t_id).css("display", "none");
                $(".unlikechk" + t_id).css("display", "block");
                //$(".lCount" + t_id).val(lcount);

                // 게시물 좋아요 수 카운트 trigger 호출
                $(".countLike_trigger").trigger('click');
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

        // 게시물 좋아요 - 비즈니스 게시판
    } else if (type = "B") {
        $.ajax({
            url: "${pageContext.request.contextPath}/pressLikeB.do",
            method: "POST",
            data: {
                m_id: memId,
                t_id: t_id
            },
            success: function(data) {
                console.log("memId : " +
                    memId +
                    " t_id : " +
                    t_id);
                $(".likechk" + t_id).css("display", "none");
                $(".unlikechk" + t_id).css("display", "block");
                //$(".lCount" + t_id).val(lcount);

                // 게시물 좋아요 수 카운트 trigger 호출
                $(".countLike_trigger").trigger('click');
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
}

// 게시물 좋아요 취소 (일반 & 비즈니스 게시판 분리)
function pressUnlike(t_id) {
    var type = $(".t_type" + t_id).val();
    var lcount = $(".lCount" + t_id).val();
    lcount--;

    // 게시물 좋아요 취소 - 일반 게시판
    if (type == "G") {
        $.ajax({
            url: "${pageContext.request.contextPath}/pressUnLike.do",
            method: "POST",
            data: {
                m_id: memId,
                t_id: t_id
            },
            success: function(data) {
                console.log("memId : " +
                    memId +
                    " t_id : " +
                    t_id);
                $(".likechk" + t_id).css("display", "block");
                $(".unlikechk" + t_id).css("display", "none");
                $(".lCount" + t_id).val(lcount);
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

        // 게시물 좋아요 취소 - 비즈니스 게시판
    } else if (type = "B") {
        $.ajax({
            url: "${pageContext.request.contextPath}/pressUnLikeB.do",
            method: "POST",
            data: {
                m_id: memId,
                t_id: t_id
            },
            success: function(data) {
                console.log("memId : " +
                    memId +
                    " t_id : " +
                    t_id);
                $(".likechk" + t_id).css("display", "block");
                $(".unlikechk" + t_id).css("display", "none");
                $(".lCount" + t_id).val(lcount);
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
}

function shareurl(m_id, b_id) {
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
}

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

$(function(){
	// 페이지 로딩 시 처음 두개 댓글 나타내기 trigger 호출
    $(".hidden_commentchk").trigger('click');

    // 게시물 좋아요 체크 trigger 호출
    $(".hidden_likechk").trigger('click');

    // 게시물 좋아요 수 카운트 trigger 호출
    $(".countLike_trigger").trigger('click');

    // 게시물 이미지 보기 trigger 호출
    $(".hidden_showphoto").trigger('click');

    // 해쉬태그 보기 trigger 호출
    $(".hidden_showhashtag").trigger('click');
	
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
				},
				dataType:"json",
				success: function(resp){
					console.log(resp.data.length);
					var htmls="";
		    		if(resp.data!=null){
			    		for(i=0; i<resp.data.length; i++){
			    			var r_m_id = resp.data[i].m_id;
			    			var r_bb_info = resp.data[i].bb_info;
			    			var r_bbrlike = resp.data[i].bbrlike;
			    			var r_bb_id = resp.data[i].bb_id;
			    			htmls += "<div class='mrd' >"+
			    						"<div class='mrdUp' >"+
										"<div class='bbrImg'>"+
											"<img src='#' width='50px' height='50px'/>"+
										"</div>"+
										"<div class='mrrdRight' >"+
											"<div class='mrrdCont' >"+
												"<a href='#' class='bbrId'>"+
													"<span>" + r_m_id + "</span>"+
												"</a>"+
												"<span>"+r_bb_info+"</span>"+
											"</div>"+
											"<div class='mrrdOpt' >"+
												"<div class='bbrLike'>"+
													"<span class='bbrL' >좋아요:"+r_bbrlike+"</span>"+
												"</div>"+
												"<div class='bbrrbtn' >"+
													"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' onclick='bbrrWrite(this)' \">답글달기</button>"+
												"</div>";
							if(r_m_id==$("#my_name").val()){
								htmls += 			"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">댓글삭제</button>";
							}
							htmls += 			"<button type='button' id='mdBbBtn' style='cursor:pointer'>...</button>"+
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
			    		}   
			    		$(".mdReply").html(htmls);
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
		$("#mdprices").html(priceSum);
	});
	
	
	/* 스크롤 페이징 */
	var page = 1;  // page선언
	
	$(function(){  // 첫 화면 로드시 page 증가.
		console.log("페이지로드:"+page);
	     getList(page);	// 리스트 추가 조회
	     page++;
	}); 
	 
	$(window).scroll(function(){   //스크롤이 최하단으로 내려가면 리스트 조회 후 page 증가.
		console.log("스크롤:"+page);
	    if($(window).scrollTop() >= $(document).height() - $(window).height()){
			getList(page);		// 리스트 추가 조회
			page++;   
		} 
	});
	
	function getList(page){	// 리스트 추가 조회
	    $.ajax({
	        url : 'bbListA',
	        method : 'post',  
	        data : {"page" : page},
	        dataType : 'json', 
	        success: function(resp){
	        	console.log("resp:"+resp.list);
	            console.log("data:"+resp.list.length);
	            var data = resp.list.length;
	            var htmls = "";
	            if (page==1){ //페이지 1일 경우 id가 page인 html을 비운다.
	                  $("#page").html(""); 
	            }
	            console.log(resp.currentPage+":"+resp.maxPage);
	            if (resp.currentPage<=resp.maxPage){
	            	if(data>0){
	                	for(var i = 0; i < data; i++){
	                		console.log("resp.list[i].bb_id:"+resp.list[i].bb_id);
		                	htmls += "<div id='selectBb' class='selectBb "+resp.list[i].c_name+" chkAll'>"+
										"<button type='button' id='bb' class='myBtn' onclick='mdOpen(this)' value='"+resp.list[i].bb_id+"' style='border:none; cursor:pointer'>"+
											"<img class='listImg' src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.list[i].bb_img1+"'>"+
											"<div class='middle'>"+
												"<div class='text'>좋아요 : "+resp.list[i].bb_like+"  댓글 : "+resp.list[i].bbrcnt+"</div>"+
											"</div>"+
										"</button>"+
									"</div>";
	                	}
	                }else{
	                }
	            }
	            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
	                $("#bbList").append(""); 
	            }else{
	                $("#bbList").append(htmls);
	                /* $("#content").load(location.href+".selectBb"); */
	            }
	            
	       },error:function(e){
	    	   alert("데이터 실패.");
	           if(e.status==300){
	               alert("데이터를 가져오는데 실패하였습니다.");
	           };
	       }
	    });
	
	}
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