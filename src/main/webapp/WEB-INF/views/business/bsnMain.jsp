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
  overflow: scroll;
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
					<!-- <label for="bb" style="cursor:pointer"> -->
						
					</label>
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
			  			${v.bb_info} <br>
			  			</div>
			  			<div id="mdReply">
			  			</div>
			  		</div>
			  		<div id="mdMore">
			  		</div>
			  		<div id="mdWrite">
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
// Get the modal
var modal = document.getElementsByClassName("modal");

/* // Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
} */

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

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
</script>
</body>
</html>