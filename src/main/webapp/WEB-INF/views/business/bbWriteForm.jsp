<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비즈니스 게시글 작성</title>
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
		margin-right: 20px;
	}
	.bbWriteImg{
		width:240px;
		height:240px;
		border:1px solid black;
	}
	.bbWriteAdd{
		width:240px;
		text-align:center;
	}
	#bbWriteCon{
		width:480px;
		margin-right:20px;
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

<!-- 이미지 슬라이드 -->
<style>
	.f {display: none}
	
	/* Slideshow container */
	.bbWriteImg {
	  max-width: 1000px;
	  position: relative;
	  margin: auto;
	}
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  width: auto;
	  padding: 2px;
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
	  color:white;
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
<div id="content">
	<div id="bbWrite" class="bbWrite">
	
	<form action="bbInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bb_type" value="B">
		<div id="bbWriteText" class="bbWriteText">
			<div id="bbWriteFile" class="bbWriteFile">
				<div id="bbWriteImg" class="bbWriteImg">
					<div class='select_img fade'>
					
					</div>
				</div>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				<div id="bbWriteAdd" class="bbWriteAdd">
					<label for="file">
						사진 추가
					</label>
					<input type="file" name="file" id="file" accept="image/*" multiple>
				</div>
			</div>
			<div id="bbWriteCon" class="bbWriteInfoCon">
				<div id="bbWriteName" class="bbWriteName">
					<input type="text" name="bb_name" placeholder="상품명">
				</div>
				<div id="bbWriteInfo" class="bbWriteInfo">
					<textarea cols="66" rows="12" name="bb_info" placeholder="상품 소개">ㅁㅁ</textarea>
					<input type="text" class="tags" id="tags" name="tags" placeholder="태그 입력" />
				</div>
			</div>
			<div id="bbWriteMore" class="bbWriteMore">
				<div id="bbWritePrice" class="bbWritePrice">
					가 격 : <input type="text" name="bb_price">
				</div>
				<div id="bbWriteOption" class="bbWriteOption">
					<div class="bbWriteOptionList">
						옵션1 : <input type="text" id="bb_option1" name="bb_option1" onblur="option_onblur(this)" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션2 : <input type="text" id="bb_option2" name="bb_option2" onblur="option_onblur(this)" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션3 : <input type="text" id="bb_option3" name="bb_option3" onblur="option_onblur(this)" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션4 : <input type="text" id="bb_option4" name="bb_option4" onblur="option_onblur(this)" placeholder="option + price">
					</div>
				</div>
				<div id="categoryBox">
					<div>
						카테고리 설정
					</div>
					<select id="category" name="c_name">
						<option value=''>옵션을 선택해주세요.</option>
						<c:forEach items="${category }" var="v">
							<option value="${v.c_name }"> ${v.c_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div id="bbWriteEdit" class="bbWriteEdit">
			<div id="bbWriteEditBox" class="bbWriteEditBox">
				<!-- (임시)아이디:<input type="text" name="m_id"> -->
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
	/* $("#imgfile").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				$(".select_img img").attr("src", data.target.result).width(240).height(240);
			}
			reader.readAsDataURL(this.files[0]);
		}
	}); */
	
	
	/* 선택한 이미지 썸네일 */
	var sel_files=[];
	$(document).ready(function(){
		$("#file").on("change", handleImgsFilesSelect);
	});
	
	function fileUploadAction(){
		console.log("fileUploadAction");
		$("#file").trigger('click');
	}
	
	function handleImgsFilesSelect(e){
		sel_files=[];
		$(".select_img").empty();
		var files=e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index=0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 가능합니다.");
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				/* var img_html = "<img src=\"" + e.target.result+ "\"/>"; */
				var html = "<div class='f'><img src=\"" + e.target.result + "\" data-file='" +f.name+"' class='selProductFile' title='Click to remove' width='240px' height='240px'></div>"; 
				
				$(".select_img").append(html);
				index++;
									
				showSlides(slideIndex);
				
			}
			reader.readAsDataURL(f);
		});
		
	}
	
	/* 이미지 슬라이드 */
	var slideIndex = 1;
	function plusSlides(n) {
		  showSlides(slideIndex += n);
	}
	function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("f");
		  console.log(slides.length);
		  if (n > slides.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";  
		  }
		  slides[slideIndex-1].style.display = "block";  
		}

	
	// 옵션 정규표현식
	var regEx=/^([0-9a-zA-Z가-힣]{1,30})[+]([0-9]{1,8})$/;
	function option_onblur(e){
		console.log($(e).val());
		if(regEx.test($(e).val())){
			
		} else{
			alert("형식에 맞게 입력해주세요!!");
			$(e).focus();
			return false;
		}
	};
	
	// 파일 업로드 개수 제한(10개)
	$('#file').on('change', function(){
		var x = document.getElementById("file");
		console.log("x:"+x);
		console.log("x길이:"+x.files.length);
		var txt = "";
		if ('files' in x) {
		    if (x.files.length > 10) {
		        alert("파일 개수가 초과되었습니다.");
		        document.getElementById("file").value = "";
		        return;
		        /* event.preventDefault(); */
		    }
		}
	});
</script>
</body>
</html>