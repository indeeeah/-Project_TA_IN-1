<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비즈니스 메인</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script> 
<style>
body {font-family: Arial, Helvetica, sans-serif;}
.content{
	width:1000px;
	margin:0 auto;
}
.bbList{
	display:flex;
	flex-wrap:wrap;
	
}
.selectBb{
	margin-bottom:20px;
	margin-right:20px;
}
.listImg{
	width:300px;
	height:300px;
}
#mdImg img{
	width:100%;
	height:100%;
}
/* The Modal (background) */
.modal {
  	display: none; /* Hidden by default */
  	position: fixed; /* Stay in place */
  	z-index: 10; /* Sit on top */
 	 padding-top: 100px; /* Location of the box */
  	left: 0;
  	top: 0;
  	width: 100%; /* Full width */
  	height: 100%; /* Full height */
  	overflow: auto; /* Enable scroll if needed */
  	background-color: rgb(0,0,0); /* Fallback color */
  	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  	background-color: #fefefe;
  	margin: auto;
  	padding: 10px;
  	border: 1px solid #888;
  	width: 90%;
  	max-width:930px;
  	display: flex;
}

/* The Close Button */
.close {
  	color: #aaaaaa;
  	float: right;
  	font-size: 28px;
  	font-weight: bold;
  	position: fixed;
    right: 0px;
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
    width: 335px;
    line-height: 50px;
}
#mdInfoImg {
    float: left;
    margin-right: 10px;
}
#mdBoard {
	height:65%;
    overflow-x: hidden;
}
.mrd{
	margin-bottom:20px;
}
.mrrd {
    padding-left: 40px;
}
.bbrImg {
    float: left;
    margin-right: 10px;
}
.bbrId {
    margin-right: 15px;
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
}
.bbrLike {
    float: left;
    margin-right: 10px;
}
.bbrrbtn {
    float: left;
    margin-right: 10px;
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
</style>
</head>
<body>
${listCount } : ${bbrLlke }
	<div id="content" class="content">
		<c:if test="${empty list }">
			게시물이 없습니다.
		</c:if>
		<div id="bbList" class="bbList">
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="v">
					<div id="selectBb" class="selectBb">
						<button type="button" id="bb" class="myBtn" value="${v.bb_id }" style="border:none; cursor:pointer">
							<img class="listImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${v.bb_img1 }">
						</button>
					</div>
				</c:forEach>
			</c:if>
		</div>
	<!-- The Modal -->
	<div id="modal" class="modal">
	    <button type="button" class="close">&times;</button>
		
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
			  			</div>
			  			<div id="mdReply" class="mdReply">
			  				
			  			</div>
			  		</div>
			  		<div id="mdMore">
			  		</div>
			  		<div id="mdWrite">
			  			<form action="bbrInsert.do" id="bbrInForm" class="bbrInForm" method="get">
			  				<input type="text" id="bb_info" class="bb_info" name="bb_info" placeholder="댓글 달기...">
			  				<button type="button" id="bbrInsert" class="bbrInsert" name="bbrInsert">게시</button>
			  			</form>
			  		</div>
			  	</div>
		</div>
			  	<div id="mdFooter">
			  		<div id="mdPrice">
			  		</div>
			  		<div id="mdOption">
						<select name="option" id="option">
						</select>
			  		</div>
			  		<div id="mdCart">
			  			<button type="button" class="cart" onclick="location.href='#';">장바구니</button>
			  		</div>
			  	</div>
	</div>
		
	<input type="button"  value="글쓰기" onclick="window.location='bbWriteForm.do'">
	</div>
<script>
// 모달창 open
$('.myBtn').on('click', function() {
	var a = $(this).val();
	console.log("모달창 열기a:"+a);
	var x = document.getElementById("modal");
	console.log("모달창 열기x:"+x);
    x.style.display="block";
    
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
    		console.log("bbDetail()"+resp.bbDetail.bb_img10);
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
    		$("#mdInfoText").html(resp.bbDetail.bb_id +' : '+resp.bbDetail.m_id +'<a href="bbDelete.do?bb_id='+resp.bbDetail.bb_id+'">삭제</a><a href="bbRenew.do?bb_id='+resp.bbDetail.bb_id+'">수정</a>');
   			// 상품명
    		$("#bbName").html(resp.bbDetail.m_id);
   			// 상품 소개
    		$("#bbInfo").html(resp.bbDetail.bb_info);
   			// 댓글 입력시 bb_topid 값을 세팅하기 위한 인풋박스
    		$("#bbrInForm").append('<input type="hidden" id="bb_topid" name="bb_topid" value="'+resp.bbDetail.bb_id+'">');
   			// 상품 가격
    		$("#mdPrice").html('가격 : '+resp.bbDetail.bb_price);
   			// 상품 옵션
    		var option = "";
    		if(resp.bbDetail.bb_option1!=null){
    			option +="<option value='"+resp.bbDetail.bb_option1+"''>"+resp.bbDetail.bb_option1+"</option>";
   			}
   			if(resp.bbDetail.bb_option2!=null){
   				option +="<option value='"+resp.bbDetail.bb_option2+"''>"+resp.bbDetail.bb_option2+"</option>";
       		}
   			if(resp.bbDetail.bb_option3!=null){
   				option +="<option value='"+resp.bbDetail.bb_option3+"''>"+resp.bbDetail.bb_option3+"</option>";
       		}
   			if(resp.bbDetail.bb_option3!=null){
   				option +="<option value='"+resp.bbDetail.bb_option4+"''>"+resp.bbDetail.bb_option4+"</option>";
       		}   			
   			$("#option").html(option);
    	},
    	error:function(){
    		alert("이미지를 불러 올 수 없습니다.");
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
											"<a class='bbrId'>"+
												"<span>" + r_m_id + "</span>"+
											"</a>"+
											"<span>"+r_bb_info+"</span>"+
										"</div>"+
										"<div class='mrrdOpt' >"+
											"<div class='bbrLike'>"+
												"<span class='bbrL' >좋아요:"+r_bbrlike+"</span>"+
											"</div>"+
											"<div class='bbrrbtn' >"+
												"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' \">답글달기</button>"+
											"</div>"+
											"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">댓글삭제</button>"+
											"<div id='bbrrInBox' class='bbrrInBox' >"+
												'<input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + r_bb_id + '">'+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='mrdDown' >"+
									"<div class='bbrrLine' ></div>"+
									"<a class='bbrrShow' id='bbrrshow"+r_bb_id+"' onclick=\"bbrrList('"+ r_bb_id +"')\">답글보기</a>"+
									"<a class='bbrrHide' style='display:none;'>답글숨기기</a>"+
									"<div id='bbrr' class='bbrr'>"+
									"</div>"+
								"</div>"+
							"</div>";
	    		}   
    			$(".mdReply").html(htmls);
    		} else {
    			$(".mdReply").html("<div class='mrd'>댓글이 없습니다.</div>");
    		}
			
    		/* 답글 조회 (추후삭제)*/
	    	/* $(".bbrrShow").on('click', function() {
	            $(this).parent().next().css("display", "block");
	            $(".rep_comment_upload").on('click', function() {
	                var memId = $(".m_id").val();
	                var bb_topid = $(this).next().val();
	                var bb_info = $(this).prev().val();
	                console.log(memId);
	                console.log(bb_topid);
	                console.log(bb_info);
	                if (bb_info == "" || bb_info == null) {
	                    console.log("reply comment won't be uploaded");
	                    $(".bbrrInBox").css("display", "none");
	                    $('.rep_comment_upload').off('click');
	                } else {
	                    $.ajax({
	                        url: "bbrrInsert",
	                        method: "POST",
	                        data: {
	                            bb_info: bb_info,
	                            bb_topid: bb_topid
	                        },
	                        success: function(resp) {
	                            console.log("comment:" + resp.data.bb_info +"postid:" +resp.data.bb_id);
	                            console.log(resp);
	                            $(".write_space").val('');
	                            $(".replyCo").css("display", "none");
	                            $('.rep_comment_upload').off('click');
	                            var htmls="";
	                    		if(resp.data!=null){
	                	    		for(i=0; i<resp.data.length; i++){
	                	    			var rr_m_id = resp.data[i].m_id;
	                	    			var rr_bb_info = resp.data[i].bb_info;
	                	    			var rr_bbrlike = resp.data[i].bbrlike;
	                	    			var rr_bb_id = resp.data[i].bb_id;
	                	    			htmls +="<div class='mrrd' style='padding-left:10px'>"+
	                								"<div id='bbrrImg' class='bbrrImg'>"+
	                								"<img src='#' width='50px' height='50px'/>"+
	                								"</div>"+
	                								"<div id='bbrrId' class='bbrrId'>"+
	                									"<span>" + rr_m_id + "</span>"+
	                								"</div>"+
	                								"<div id='bbrrCon' class='bbrrCon'>"+
	                									"<span>"+ rr_bb_info +"</span>"+
	                								"</div>"+
	                								"<div id='bbrrLike' class='bbrrLike'>"+
	                									"<span class='bbrrL' >좋아요:"+ rr_bbrlike +"</span>"+
	                								"</div>"+
	                								"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrDelete('"+ rr_bb_id +"')\">삭제</button>"+
	                							"</div>";
	                	    		}   
	                    			$(".bbrr").html(htmls);
	                    		}
	                        },
	                        error: function(request, status, error) {
	                            alert("code:" +request.status +"\n" +"message:" + request.responseText +"\n" + "error:" + error);
	                        }
	                    });
	                }
	            });
	        }); */
	        
    		/* 답글 달기 */
	    	$(".bbrrbtn").on('click', function() {
	    		// 답글달기 버튼 클릭시 텍스트입력박스 보여주기
	            $(this).parent().next().next().css("display", "block");
	    		// 게시버튼 클릭시(댓글인서트)
	            $(".rep_comment_upload").on('click', function() {
	                var memId = $(".m_id").val();
	                var bb_topid = $(this).next().val();
	                var bb_info = $(this).prev().val();
	                console.log(memId);
	                console.log(bb_topid);
	                console.log(bb_info);
	                if (bb_info == "" || bb_info == null) {
	                    console.log("reply comment won't be uploaded");
	                    $(".bbrrInBox").css("display", "none");
	                    $('.rep_comment_upload').off('click');
	                } else {
	                    $.ajax({
	                        url: "bbrrInsert",
	                        method: "POST",
	                        data: {
	                            bb_info: bb_info,
	                            bb_topid: bb_topid
	                        },
	                        success: function(resp) {
	                            console.log("comment:" + resp.data.bb_info +"postid:" +resp.data.bb_id);
	                            console.log(resp);
	                            $(".write_space").val('');
	                            $(".replyCo").css("display", "none");
	                            $('.rep_comment_upload').off('click');
	                            var htmls="";
	                    		if(resp.data!=null){
	                	    		for(i=0; i<resp.data.length; i++){
	                	    			var rr_m_id = resp.data[i].m_id;
	                	    			var rr_bb_info = resp.data[i].bb_info;
	                	    			var rr_bbrlike = resp.data[i].bbrlike;
	                	    			var rr_bb_id = resp.data[i].bb_id;
	                	    			htmls +="<div class='mrrd' style='padding-left:10px'>"+
	                								"<div id='bbrrImg' class='bbrrImg'>"+
	                								"<img src='#' width='50px' height='50px'/>"+
	                								"</div>"+
	                								"<div id='bbrrId' class='bbrrId'>"+
	                									"<span>" + rr_m_id + "</span>"+
	                								"</div>"+
	                								"<div id='bbrrCon' class='bbrrCon'>"+
	                									"<span>"+ rr_bb_info +"</span>"+
	                								"</div>"+
	                								"<div id='bbrrLike' class='bbrrLike'>"+
	                									"<span class='bbrrL' >좋아요:"+ rr_bbrlike +"</span>"+
	                								"</div>"+
	                								"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrDelete('"+ rr_bb_id +"')\">삭제</button>"+
	                							"</div>";
	                	    		}   
	                    			$(".bbrr").html(htmls);
	                    		}
	                        },
	                        error: function(request, status, error) {
	                            alert("code:" +request.status +"\n" +"message:" + request.responseText +"\n" + "error:" + error);
	                        }
	                    });
	                }
	            });
	        });
	    	
	        /* 답글지우기 클릭이벤트처리(추후삭제) */
    		/* $(".bbrDelete").on('click', function(){
				var bb_id = $(this).val();    			
    			console.log("댓글삭제 글번호:"+bb_id);
    			bbrDelete(bb_id);
				$(this).parent().remove();
    			
    		}); */
    	}, error:function(request, status, error){
    		alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		}
    	
    });
    
    /* 이미지 슬라이드 */
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("md_imgbox");
      if (n > slides.length) {slideIndex = 1}    
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";  
      }
      slides[slideIndex-1].style.display = "block";  
    }
    
});

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

/* 답글 조회  */
function bbrrList(bb_id){
	$("#bbrrShow").hide();
	console.log("bbrrList함수:"+bb_id);
	var a = "bbrrshow"+bb_id;
	var a2 = document.getElementById(a);
	var b = document.getElementById(bb_id);
	console.log("bbrrList함수:"+a+":"+b);
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
											"<span>" + rr_m_id + "</span>"+
										"</div>"+
										"<div id='bbrrCon' class='bbrrCon'>"+
											"<span>"+ rr_bb_info +"</span>"+
										"</div>"+
									"</div>"+
									"<div class='mrrdOpt' >"+
										"<div id='bbrrLike' class='bbrrLike'>"+
											"<span class='bbrrL' >좋아요:"+ rr_bbrlike +"</span>"+
										"</div>"+
										"<button type='button' id='"+ rr_bb_id +"' class='bbrDelete "+ rr_bb_id +"' onclick=\"bbrDelete('"+ rr_bb_id +"')\">삭제</button>"+
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

/* 답글 보여지기(추후삭제) */
/* function bbrrInBoxShow(bb_id){
	var a = document.getElementById("bb_id");
	$(a).show();
} */

// 모달창 close
$('.close').on('click', function() {
	/* $('#modal').hide(); */
	var a = $(this).val();
	console.log("모달창 닫기a:"+a);
	var x = document.getElementById("modal");
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
    //클로즈 버튼 누르면 댓글 지워지기
    $(".mdReply").empty();
});

// 윈도우 누르면 모달창 꺼지기
$(window).on('click', function() {
	var modal = document.getElementById('modal');
	console.log(modal);
  if (event.target == modal) {
    modal.style.display = "none";
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

</script>
</body>

<!-- 댓글 입력 에이작스 -->
<script type="text/javascript">

	$(function(){
/* 		교재삭제
		$('#replyForm').on('submit', function(event){
			if($('#reply_contents').val()==""){
				alert("내용을 입력해 주세요.");
				event.preventDefault();
			} else{
				$('#comments').val($('#reply_contents').val());
				return true;
			}
		}); */
		
		
		
/* 		교재(댓글수정)삭제
		$(".update").on('click', function(){
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			var commBody = parentDiv.children('.comment-body');
			var content = commBody.children('p').text().trim();
			
			if($(this).text()=="수정 및 삭제"){
				commBody.append('<textarea style="margin-top:7px;" rows="4" cols="70%" class="updateContent" name="updateContent" id="updateContent">'+content+'</textarea>');
				parentDiv.children('.comment-confirm').show();
				parentP.children(".delete").toggle("fast");
				parentP.children(".updateConfirm").toggle("fast");
				$(this).text("수정취소");
			} else {
				commBody.children(".updateContent").remove();
				parentDiv.children('.comment-confirm').hide();
				$(this).text("수정 및 삭제");
				parentP.children(".delete").toggle("fast");
				parentP.children(".updateConfirm").toggle("fast");
			}
		}); */
		
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
														"<a class='bbrId'>"+
															"<span>" + r_m_id + "</span>"+
														"</a>"+
														"<span>"+r_bb_info+"</span>"+
													"</div>"+
													"<div class='mrrdOpt' >"+
														"<div class='bbrLike'>"+
															"<span class='bbrL' >좋아요:"+r_bbrlike+"</span>"+
														"</div>"+
														"<div class='bbrrbtn' >"+
															"<button type='button'  class='bbrrbtn "+ r_bb_id+ "' \">답글달기</button>"+
														"</div>"+
														"<button type='button' id='"+r_bb_id+"' class='bbrDelete "+ r_bb_id +"' onclick=\"bbrDelete('"+r_bb_id+"')\">댓글삭제</button>"+
														"<div id='bbrrInBox' class='bbrrInBox' >"+
															'<input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + r_bb_id + '">'+
														"</div>"+
													"</div>"+
												"</div>"+
											"</div>"+
											"<div class='mrdDown' >"+
												"<a class='bbrrShow' id='bbrrshow"+r_bb_id+"' onclick=\"bbrrList('"+ r_bb_id +"')\">답글보기</a>"+
												"<a class='bbrrHide' style='display:none;'>답글숨기기</a>"+
												"<div id='bbrr' class='bbrr'>"+
												"</div>"+
											"</div>"+
										"</div>";
				    		}   
				    		$(".mdReply").html(htmls);
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
		
	});

</script>
</html>