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
<div id="content">
	<div id="bbWrite" class="bbWrite">
	
	<form action="bbInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bb_type" value="G">
		<!-- <input type="hidden" name="bb_topid" value="123456321"> -->
		<div id="bbWriteText" class="bbWriteText">
			<div id="bbWriteFile" class="bbWriteFile">
				<div id="bbWriteImg" class="bbWriteImg">
					<div class='select_img fade'>
					
					</div>
				</div>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
				<div id="bbWriteAdd" class="bbWriteAdd">
					<input type="file" name="file" id="file" accept="image/*" multiple >
					<label for="file">
						<div>사진 추가</div>
					</label>
				</div>
			</div>
			<div id="bbWriteCon" class="bbWriteInfoCon">
				<div id="bbWriteName" class="bbWriteName">
					<input type="text" name="bb_name" placeholder="상품명">
				</div>
				<div id="bbWriteInfo" class="bbWriteInfo">
					<textarea cols="66" rows="14" name="bb_info">ㅁㅁ</textarea>
				</div>
			</div>
			<div id="bbWriteMore" class="bbWriteMore">
				<div id="bbWritePrice" class="bbWritePrice">
					가 격 : <input type="text" name="bb_price">
				</div>
				<div id="bbWriteOption" class="bbWriteOption">
					<div class="bbWriteOptionList">
						옵션1 : <input type="text" name="bb_option1" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션2 : <input type="text" name="bb_option2" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션3 : <input type="text" name="bb_option3" placeholder="option + price">
					</div>
					<div class="bbWriteOptionList">
						옵션4 : <input type="text" name="bb_option4" placeholder="option + price">
					</div>
				</div>
			</div>
		</div>
		<div id="bbWriteEdit" class="bbWriteEdit">
			<div id="bbWriteEditBox" class="bbWriteEditBox">
				(임시)아이디:<input type="text" name="m_id">
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
					var html = "<div class='f'><a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='" +f.name+"' class='selProductFile' title='Click to remove' width='240px' height='240px'></a></div>"; 
					
					$(".select_img").append(html);
					index++;
										
					showSlides(slideIndex);
					
				}
				reader.readAsDataURL(f);
			});
			
		}
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
		
		function deleteImageAction(index){
			console.log("index : " + index);
			sel_files.splice(index, 1);
			var img_id = "#img_id_"+index;
			$(img_id).remove();
			console.log(sel_files);
		}
		
	
	
	</script>
	
	
	<script>
	</script>
	
<%-- <script>
$(document).ready(function(){
	$("#profileImg").click(function(){
		$("#input_img").click() ;
		})			
	})

</script>


<script>
var sel_file;

$(document).ready(function() {
    $("#input_img").on("change", fileChange);
});

function fileChange(e) {
	e.preventDefault();


	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "100px")
        }
        reader.readAsDataURL(f);
    });

    var file = files[0]
    console.log(file)
    var formData = new FormData();

    formData.append("file", file);

		$.ajax({
    	url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){

			alert("프로필 이미지가 변경 되었습니다.")

		  }
		})


 		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}


 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}

 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);

 		}


 		function getImageLink(fileName){

 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);

 			return front + end;

 		}

}
</script>

<c:choose>
			 	<c:when test="${empty userImage }">
				<div>
					<img id ="profileImg" src = "/displayFile?fileName=/lion.gif" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:when>
				<c:otherwise>
				<div>
					<img id ="profileImg" src = "/displayFile?fileName=${userImage }" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:otherwise>
</c:choose> --%>
</body>
</html>