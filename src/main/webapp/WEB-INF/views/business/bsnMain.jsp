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
	max-width:500px;
	max-height:500px;
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
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  display: flex;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
#mdImg {
    margin-right: 20px;
}
</style>
</head>
<body>
${listCount }
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
			  	<div id="mdImg">
					<img src="${pageContext.request.contextPath}/resources/uploadFiles/${v.bb_img1 }"/>
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
					<a href="${bbdel }">[글 삭제]</a>
					<a href="${bbupview }">[수정 페이지로 이동]</a>
			  		</div>
			  		<div id="mdBoard">
			  			<div id="mdContent">
			  			${v.bb_name} <br>
			  			<pre name="info" class="${v.bb_id}">${v.bb_info}</pre> <br>
			  			<button class="translate" value="${v.bb_id }">번역하기</button>
			  			</div>
			  			<div id="mdReply">
			  				<c:forEach items="${bbrList }" var="v">
			  					<div>
			  						${v.m_img }
			  					</div>
			  					<div>
			  						${v.m_id}
			  					</div>
			  					<div>
			  						${v.bb_info }
			  					</div>
			  					<div>
			  						
			  					</div>
			  					<div>
			  						
			  					</div>
			  				</c:forEach>
			  			</div>
			  		</div>
			  		<div id="mdMore">
			  		</div>
			  		<div id="mdWrite">
			  			<form action="bbrInsert.do" id="bbrInForm" class="bbrInForm" method="get">
			  				<input type="hidden" id="bb_topid" name="bb_topid" value="${v.bb_id }">
			  				<input type="hidden" id="bb_name" name="bb_name" value="O">
			  				<input type="hidden" id="bb_price" name="bb_price" value="0">
			  				<input type="hidden" id="bb_type" name="bb_type" value="C">
			  				<input type="text" id="bb_info" class="bb_info" name="bb_info" placeholder="댓글 달기...">
			  				<input type="submit" value="게시">
			  			</form>
			  		</div>
			  		
			  	</div>
			  	<div id="mdFooter">
			  		<div id="mdPrice">
			  		가격 : ${v.bb_price}
			  		</div>
			  		<div id="mdOption">
						<select name="option" id="option">
						  <option value="${v.bb_option1}">${v.bb_option1}</option>
						  <option value="${v.bb_option2}">${v.bb_option2}</option>
						  <option value="${v.bb_option3}">${v.bb_option3}</option>
						  <option value="${v.bb_option4}">${v.bb_option4}</option>
						</select>
			  		</div>
			  		<div id="mdCart">
			  			<button type="button" class="cart" onclick="location.href='#';">장바구니</button>
			  		</div>
			  	</div>
			  </div>
			
			</div>
			</c:forEach>
		</c:if>
		</div>
	<input type="button"  value="글쓰기" onclick="window.location='bbWriteForm.do'">
	</div>
<%-- <c:forEach items="${listImg }" var="v">
${v.bb_img1 }
</c:forEach>
<c:forEach items="${bbDetail }" var="v">
${v.m_id }
${v.bb_name}
${v.bb_info}
${v.bb_price}
${v.bb_option1}
${v.bb_option2}
${v.bb_option3}
${v.bb_option4}
</c:forEach> --%>
<script>

$('.myBtn').on('click', function() {
	var a = $(this).val();
	console.log(a);
	var x = document.getElementById(a);
	console.log(x);
    x.style.display="block";
});

$('.close').on('click', function() {
	/* $('#modal').hide(); */
	var a = $(this).val();
	console.log(a);
	var x = document.getElementById(a);
	console.log(x);
    x.style.display="none";
});

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
</script>
</body>
<!-- <script type="text/javascript">
	$(function(){
		$('#replyForm').on('submit', function(event){
			if($('#reply_contents').val()==""){
				alert("내용을 입력해 주세요.");
				event.preventDefault();
			} else{
				$('#comments').val($('#reply_contents').val());
				return true;
			}
		});
		
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
		});
		
		$(".bbrInForm").on('click', function(){
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			/* if(parentDiv.find('input[name=pwd_chk]').val() != parentDiv.children('input[name=rep_pwd]').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else{ 
				
			} */
				$.ajax({
					url:"${pageContext.request.contextPath}/bbrInsert.do",
					method:"POST",
					async:false,
					data:{
						comment_id:parentDiv.find("input[name=rep_id]").val(),
						comment_pwd:parentDiv.find("input[name=pwd_chk]").val(),
						comments:parentDiv.find('.updateContent').val()
					},
					success: function(data){
						alert(data);
						parentDiv.find(".comment-body p").text(parentDiv.find('.updateContent').val());
					},
					error:function(request, status, error){
						alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			
			parentDiv.find(".updateContent").remove();
			parentDiv.find(".comment-confirm").val("");
			parentDiv.find(".comment-confirm").hide();
			parentP.children(".updateConfirm").toggle("fast");
			parentP.children(".delete").toggle("fast");
			parentP.children(".update").text("수정 및 삭제");
		});
		
		$(".delete").on('click', function(){
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			
			if(parentDiv.find('input[name=pwd_chk]').val() != parentDiv.children('input[name=rep_pwd]').val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else{
				$.ajax({
					url:"${pageContext.request.contextPath}/brDeleteRB.do",
					method:"POST",
					data:{
						comment_id:parentDiv.find("input[name=rep_id]").val(),
						comment_pwd:parentDiv.find("input[name=pwd_chk]").val()
					},
					success:function(data){
						alert(data);
						parentDiv.remove();
					},
					error:function(request, status, error){
						alert("code : " +request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			}
		});
	});
</script> -->
</html>