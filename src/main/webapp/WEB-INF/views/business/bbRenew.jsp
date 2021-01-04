<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비즈니스 게시글 수정</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<style type="text/css">
	#content{
		width:1000px;
		margin:0 auto;
	}
	.bbWriteText{
		display:flex;
		flex-wrap:wrap;
		margin-bottom:25px;
	}
	.bbWriteFile{
		display:block;
	}
	.bbWriteImg img{
		width:240px;
		height:240px;
		border:1px solid black;
	}
	.bbWriteAdd{
		width:240px;
		text-align:center;
	}
	.bbWriteCon{
		width:480px;
	}
	.bbWriteMore{
		display:block;
	}
	.bbWritePrice{
		border:1px solid black;
		width:250;
	}
	.bbWritePrice > input[type="text"]{
		border:none;
		width:150;
	}
	.bbWriteOptionList{
		display:block;
	}
</style>
</head>
<body>
<div id="content">
	<div id="bbWrite" class="bbWrite">
	
	<form name="renewForm" action="bbUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bb_type" value="G">
		<!-- <input type="hidden" name="bb_topid" value="123456321"> -->
		<div id="bbWriteText" class="bbWriteText">
			<div id="bbWriteFile" class="bbWriteFile">
				<div id="bbWriteImg" class="bbWriteImg">
					<div class="select_img"><img src="${pageContext.request.contextPath}/resources/uploadFiles/${bbRenew.bb_img1 }"/></div>
				</div>
				<div id="bbWriteAdd" class="bbWriteAdd">
					<input type="file" name="imgfile" id="imgfile" multiple required style="display:none">
					<label for="imgfile">
						<div>사진 추가</div>
					</label>
				</div>
			</div>
			<div id="bbWriteCon" class="bbWriteInfoCon">
				<div id="bbWriteName" class="bbWriteName">
					<input type="text" name="bb_name" placeholder="상품명" value="${bbRenew.bb_name}">
				</div>
				<div id="bbWriteInfo" class="bbWriteInfo">
					<textarea cols="66" rows="14" name="bb_info" value="${bbRenew.bb_info}">ㅁㅁ</textarea>
				</div>
			</div>
			<div id="bbWriteMore" class="bbWriteMore">
				<div id="bbWritePrice" class="bbWritePrice">
					가 격 : <input type="text" name="bb_price" value="${bbRenew.bb_price}">
				</div>
				<div id="bbWriteOption" class="bbWriteOption">
					<div class="bbWriteOptionList">
						옵션1 : <input type="text" name="bb_option1" placeholder="option + price" value="${bbRenew.bb_option1 }">
					</div>
					<div class="bbWriteOptionList">
						옵션2 : <input type="text" name="bb_option2" placeholder="option + price" value="${bbRenew.bb_option2 }">
					</div>
					<div class="bbWriteOptionList">
						옵션3 : <input type="text" name="bb_option3" placeholder="option + price" value="${bbRenew.bb_option3 }">
					</div>
					<div class="bbWriteOptionList">
						옵션4 : <input type="text" name="bb_option4" placeholder="option + price" value="${bbRenew.bb_option4 }">
					</div>
				</div>
			</div>
		</div>
		<div id="bbWriteEdit" class="bbWriteEdit">
			<div id="bbWriteEditBox" class="bbWriteEditBox">
				(임시)아이디:<input type="text" name="m_id" value="${bbRenew.m_id}">
			</div>
		</div>
		<input type="submit" value="등록하기">&nbsp;&nbsp;
		<c:url var="bbList" value="bbList.do">
			<c:param name="page" value="1"/>
		</c:url>
		<a href=${bbList }>목록으로</a>
	</form>
	</div>
</div>
	<script>
		$("#imgfile").change(function(){
			if(this.files && this.files[0]){
				var reader = new FileReader;
				reader.onload = function(data){
					$(".select_img img").attr("src", data.target.result).width(240).height(240);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
	</script>
</body>
</html>