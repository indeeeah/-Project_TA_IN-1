<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
}
#mdBoard {
	height:65%;
    overflow-x: hidden;
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

			<!-- The Modal -->
			<div id="${v.bb_id }" class="modal">
			    <button type="button" class="close" value="${v.bb_id }">&times;</button>
			
			  <!-- Modal content -->
			  <div id="modalContent" class="modal-content">
			  	<div id="mdImg" class="mdImg">
			  		
			  		
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
			  	</div>
			  	<div id="mdText">
			  		<div id="mdInfo">
			  		${v.bb_id}
			  		${v.m_id}
			  		<c:url var="bbupview" value="bbRenew.do">
						<c:param name="bb_id" value="${v.bb_id }"/>
					</c:url>
			  		<c:url var="bbdel" value="bbDelete.do">
						<c:param name="bb_id" value="${v.bb_id }"/>
					</c:url>
					<a href="${bbdel }">삭제</a>
					<a href="${bbupview }">수정</a>
			  		</div>
			  		<div id="mdBoard">
			  			<div id="mdContent">
			  			${v.bb_name} <br>
			  			<pre name="info" class="${v.bb_id}">${v.bb_info}</pre> <br>
			  			<button class="translate" value="${v.bb_id }">번역하기</button>
			  			</div>
			  			<div id="mdReply" class="mdReply">
			  				
			  			</div>
			  		</div>
			  		<div id="mdMore">
			  		</div>
			  		<div id="mdWrite">
			  			<form action="bbrInsert.do" id="bbrInForm" class="bbrInForm" method="get">
<!-- 			  				<input type="hidden" id="bb_name" name="bb_name" value="O">
			  				<input type="hidden" id="bb_type" name="bb_type" value="C">
			  				<input type="hidden" id="bb_price" name="bb_price" value="0"> -->
			  				<input type="hidden" id="bb_topid" class="${v.bb_id }" name="bb_topid" value="${v.bb_id }">
			  				<input type="text" id="bb_info" class="bb_info" name="${v.bb_id }" placeholder="댓글 달기...">
			  				<button type="button" id="bbrInsert" class="bbrInsert" name="bbrInsert" value="${v.bb_id }">게시</button>
			  			</form>
			  		</div>
			  		
			  	</div>
			  </div>
			  	<div id="mdFooter">
			  		<div id="mdPrice">
			  		가격 : ${v.bb_price}
			  		</div>
			  		<div id="mdOption">
						<select name="option" id="option">
						<c:if test="${v.bb_option1 ne null }">
						  <option value="${v.bb_option1}">${v.bb_option1}</option>
						</c:if>
						<c:if test="${v.bb_option2 ne null }">
						  <option value="${v.bb_option2}">${v.bb_option2}</option>
						</c:if>
						<c:if test="${v.bb_option3 ne null }">
						  <option value="${v.bb_option3}">${v.bb_option3}</option>
						</c:if>
						<c:if test="${v.bb_option4 ne null }">
						  <option value="${v.bb_option4}">${v.bb_option4}</option>
						</c:if>
						</select>
			  		</div>
			  		<div id="mdCart">
			  			<button type="button" class="cart" onclick="location.href='#';">장바구니</button>
			  		</div>
			  	</div>
			</div>
			</c:forEach>
		</c:if>
		</div>
	<input type="button"  value="글쓰기" onclick="window.location='bbWriteForm.do'">
	</div>
<script>
// 모달창 open
$('.myBtn').on('click', function() {
	var a = $(this).val();
	console.log("모달창 열기a:"+a);
	var x = document.getElementById(a);
	console.log("모달창 열기x:"+x);
    x.style.display="block";
    
    $.ajax({
    	url:"bbDetail",
    	type:"post",
    	async:false,
    	data:{
    		bb_id:a
    	},
    	dataType:"json",
    	success:function(resp){
    		var htmls="";
    		console.log("bbDetail()"+resp.bbDetail.m_id);
    		if(resp.bbDetail.bb_img1!=null){
    		console.log("bbDetail()"+resp.bbDetail.bb_img1);
    		console.log("bbDetail()"+resp.bbDetail.bb_img10);
    			if(resp.bbDetail.bb_img1!=null){
    			htmls += "<div class='md_imgbox fade'>"+
									"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img1+"'/>"+
									"</div>";
    			}
    			if(resp.bbDetail.bb_img2!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img2+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img3!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img3+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img4!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img4+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img5!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img5+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img6!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img6+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img7!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img7+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img8!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img8+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img9!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img9+"'/>"+
    								"</div>";
        		}
    			if(resp.bbDetail.bb_img10!=null){
        			htmls += "<div class='md_imgbox fade'>"+
    								"<img src='${pageContext.request.contextPath}/resources/uploadFiles/"+resp.bbDetail.bb_img10+"'/>"+
    								"</div>";
        		}
    		}
    		$(".mdImg").html(htmls);
    	},
    	error:function(){
    		
    	}
    });
    
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
	    			htmls += "<div class='mrd' >"+
								"<div id='bbrImg' class='bbrImg'>"+
								"<img src='#'/>"+
								"</div>"+
								"<div id='bbrId' class='bbrId'>"+
									"<span>" + resp.data[i].m_id + "</span>"+
								"</div>"+
								"<div id='bbrCon' class='bbrCon'>"+
									"<span>"+resp.data[i].bb_info+"</span>"+
								"</div>"+
								"<div id='bbrLike' class='bbrLike'>"+
									"<span class='bbrL' >좋아요:"+resp.data[i].bbrlike+"</span>"+
								"</div>"+
								"<div id='bbrrInBox' class='bbrrInBox' >"+
									"<button type='button' id='"+resp.data[i].bb_id+"' class='bbrrInsert"+resp.data[i].bb_id+"' onclick=\"bbrrInsert('"+resp.data[i].bb_id+"')\">답글달기</button>"+
								"</div>"+
								"<div id='bbrr' class='bbrr' onclick=\"bbrrList('"+resp.data[i].bb_id+"')\">답글보기"+
									
								"</div>"+
									"<button type='button' id='"+resp.data[i].bb_id+"' class='bbrDelete "+resp.data[i].bb_id+"' onclick=\"bbrDelete('"+resp.data[i].bb_id+"')\">삭제</button>"+
							"</div>";
	    		}   
    			$(".mdReply").html(htmls);
    		} else {
    			$(".mdReply").html("<div class='mrd'>댓글이 없습니다.</div>");
    		}
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
});
/* 댓글 삭제 */
function bbrDelete(bb_id){
	console.log("bbrDelete함수:"+bb_id);
	var a = bb_id;
	var b = document.getElementById(bb_id);
	console.log("bbrDelete함수:"+a+":"+b);
	$.ajax({
		url:"bbrDelete",
		method:"POST",
		async: false,
		data:{ bb_id:bb_id},
		dataType:"json",
		success:function(resp){
			console.log("댓글삭제 resp:"+resp+":"+resp.ack);
			$(b).parent().remove();
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
	$(this).parent().remove();
};

/* 답글 조회  */
function bbrList(bb_id){
	console.log("bbrDelete함수:"+bb_id);
	var a = bb_id;
	var b = document.getElementById(bb_id);
	console.log("bbrDelete함수:"+a+":"+b);
	$.ajax({
		url:"bbrrList",
		method:"POST",
		async: false,
		data:{ bb_id:bb_id},
		dataType:"json",
		success:function(resp){
			console.log("댓글삭제 resp:"+resp+":"+resp.ack);
			$(b).parent().remove();
		},
		error:function(request, status, error){
			alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			event.preventDefault();
		}
	});
	$(this).parent().remove();
};


// 모달창 close
$('.close').on('click', function() {
	/* $('#modal').hide(); */
	var a = $(this).val();
	console.log("모달창 닫기a:"+a);
	var x = document.getElementById(a);
	console.log("모달창 닫기x:"+x);
    x.style.display="none";
    //클로즈 버튼 누르면 댓글 지워지기
    $(".mdReply").empty();
});

// 윈도우 누르면 모달창 꺼지기
// When the user clicks anywhere outside of the modal, close it
/* $(window).on('click', function() {
	var modal1 = document.getElementsByClassName('modal');
	console.log(modal1);
	var modal2 = document.getElementById('modal1');
	console.log(modal2);
  if (event.target == modal1) {
    modal1.style.display = "none";
  }
}); */

// 번역하기(상품소개만)
$(".translate").on("click", function(){
	var a = $(this).val();
	console.log(a);
	var b = document.getElementsByClassName(a);
	console.log(b);
	var  source = $(b).html();
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
						$(b).html(resp.result);
					}
				});
			} else if(resp.result=="en"){
				$.ajax({
					url : "TranslateProcEn",
					type : "post",
					dataType : "json",
					data : { source : source },
					success:function(resp){
						$(b).html(resp.result);
					}
				});
			} else {
				alert("번역할 수 없습니다.");
			}
		}, error : function(err1){
			$(b).html("오류가 발생하였습니다.");
		}
	});
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
</script>
</body>

<!-- 댓글 에이작스 -->
<script type="text/javascript">

	$(function(){
		$(".mdr").on('click', function(){
			alert("bbrLike");
		});
/* 	교재
		$('#replyForm').on('submit', function(event){
			if($('#reply_contents').val()==""){
				alert("내용을 입력해 주세요.");
				event.preventDefault();
			} else{
				$('#comments').val($('#reply_contents').val());
				return true;
			}
		}); */
		
		
		
/* 		교재(댓글수정)
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
			var a = $(this).val();
			var c1 = document.getElementsByName(a);
			var c2 = $(c1).val();
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
				    			htmls += "<div class='mrd' >"+
											"<div id='bbrImg' class='bbrImg'>"+
											"<img src='#'/>"+
											"</div>"+
											"<div id='bbrId' class='bbrId'>"+
												"<span>" + resp.data[i].m_id + "</span>"+
											"</div>"+
											"<div id='bbrCon' class='bbrCon'>"+
												"<span>"+resp.data[i].bb_info+"</span>"+
											"</div>"+
											"<div id='bbrLike' class='bbrLike'>"+
												"<span class='bbrL' >좋아요:"+resp.data[i].bbrlike+"</span>"+
											"</div>"+
											"<div id='bbrr' class='bbrr'>...."+
											"</div>"+
												"<button type='button' value='"+resp.data[i].bb_id+";' class='bbrDelete "+resp.data[i].bb_id+"' onclick=\"bbrDelete('"+resp.data[i].bb_id+"')\">삭제</button>"+
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