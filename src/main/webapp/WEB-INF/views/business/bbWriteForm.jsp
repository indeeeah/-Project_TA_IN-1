<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비즈니스 게시글 작성</title>
</head>
<body>
	<form action="bbInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bb_type" value="G">
		<input type="hidden" name="bb_topid" value="123456321">
		<table align="center">
			<tr>
				<td>첨부파일</td>
				<!-- 원래 vo에 있는 이름을 사용하게 되면 String 형태 여야함. file 형태로 가져가야 하므로 name을 다르게 지정함. -->
				<td><input type="file" name="bb_image1" multiple></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="bb_name"></td>
			</tr>
			<tr>
				<td>상품안내</td>
				<td><textarea cols="50" rows="7" name="bb_info"></textarea></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bb_price"></td>
			</tr>
			<tr>
				<td>옵션1</td>
				<td><input type="text" name="bb_option1" placeholder="option + price"></td>
			</tr>
			<tr>
				<td>옵션2</td>
				<td><input type="text" name="bb_option2" placeholder="option + price"></td>
			</tr>
			<tr>
				<td>옵션3</td>
				<td><input type="text" name="bb_option3" placeholder="option + price"></td>
			</tr>
			<tr>
				<td>옵션4</td>
				<td><input type="text" name="bb_option4" placeholder="option + price"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="등록하기">&nbsp;&nbsp;
				<c:url var="bbList" value="bbList.do">
					<c:param name="page" value="1"/>
				</c:url>
				<a href=${bbList }>목록으로</a>
				</td>
			</tr>
		</table>
	</form>

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