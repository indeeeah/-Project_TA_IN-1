<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bbRenew.bb_id }번 게시물 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
<style>
body {
	width: 100%;
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
	color: #262626;
	background-color: #FAFAFA;
}

#content_con {
	display: flex;
	justify-content: center;
	width: 100%;
}

#write_con {
	width: 1000px;
}

#top_menu {
	width: 100%;
	height: 54px;
	display: flex;
	justify-content: center;
}

.tab_menu:nth-of-type(3) {
	border: none;
}

.upload {
	width: 540px;
	border: 1px solid #C7C7C7;
	background-color: white;
	margin-left: 229px;
}

.story_img_con {
	display: flex;
	justify-content: center;
	width: 80%;
	margin-left: 10%;
	margin-top: 30px;
}

.image {
	width: 100%;
}

.cate_mine {
	color: #C7C7C7;
	cursor: pointer;
}

.cate_1 {
	height: 53px;
	line-height: 53px;
	font-size: 12px;
	float: left;
}

.cate_con {
	float: left;
	margin-top: 20px;
	margin-right: 5px;
}

.category {
	float: right;
}

.upload_id {
	width: 505px;
	height: 25px;
	padding: 10px 15px 10px 20px;
	font-size: 13px;
	line-height: 25px;
	border-bottom: 1px solid #C7C7C7;
}

.form_up {
	padding: 0px 20px 0px 20px;
}

.b_content {
	width: 500px;
	height: 80px;
	padding: 0px;
	border: none;
	margin-top: 10px;
	outline: none;
	resize: none;
}

.image_icon {
	font-size: 24px;
	color: #8E8E8E;
	float: right;
	margin-top: 10px;
	cursor: pointer;
}

.hashtag_con {
	border-top: 1px Dashed #C7C7C7;
}

#filter_con {
	border-bottom: 1px solid #C7C7C7;
	width: 500px;
	display: flex;
	justify-content: center;
}

.tags {
	width: 500px;
	padding: 0px;
	border: none;
	height: 26px;
	padding: 10px 0px 10px 0px;
	outline: none;
}

.btn {
	height: 30px;
	border: none;
	margin-top: 15px;
	margin-bottom: 10px;
	background-color: transparent;
	cursor: pointer;
	color: rgb(56, 151, 240);
	outline: none;
	font-size: 13px;
}

.btn2 {
	height: 30px;
	border: none;
	margin-top: 15px;
	margin-bottom: 10px;
	cursor: pointer;
	outline: none;
	font-size: 13px;
}

a {
	text-decoration: none;
}

.upload_post {
	float: right;
}

#webcamBtn {
	float: right;
}

#canvas1 {
	border: 1px solid #C7C7C7;
}

#down_con {
	width: 500px;
	height: 55px;
}

#canvas_down {
	float: right;
	line-height: 30px;
}
#bb_name{
	width: 500px;
    border: none;
    height: 26px;
    padding: 10px 0px 10px 0px;
    outline: none;
    border-bottom: 1px Dashed #C7C7C7;
}
.bbWriteMore{
	display:flex;
	border-top: 1px Dashed #C7C7C7;
    border-bottom: 1px solid #C7C7C7;
    padding: 10px 0 10px 0;
}
.bbWritePrice{
	border-bottom: 1px Dashed #C7C7C7;
	height:50%;
}
.bbWriteMoreLeft input{
	width: 240px;
    border: none;
    height: 20px;
    padding: 20px 0px 10px 0px;
    outline: none;
}
#categoryBox{
	padding: 10px 0 10px 0;
}
#category {
    width: 240px;
}
.bbWriteMoreRight input{
	width: 240px;
    border: none;
    height: 15px;
    padding: 5px 0px 5px 0px;
    outline: none;
}
#bb_option1{
	border-bottom: 1px Dashed #C7C7C7;
}
#bb_option2{
	border-bottom: 1px Dashed #C7C7C7;
}
#bb_option3{
	border-bottom: 1px Dashed #C7C7C7;
}
#bbWriteMoreLeft{
	width:50%;
	border-right:1px dashed #C7C7C7;
	margin-right:10px;
}
#bbWriteMoreRight{
	width:50%;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<input type="hidden" value="${my_name }" id="m_id">
	<input type="radio" id="ctm1" name="x" checked style="display: none;">
	<input type="radio" id="ctm2" name="x" style="display: none;">
	<input type="radio" id="ctm3" name="x" style="display: none;">
	<div id="content_con">
		<div id="write_con">
			<div id="top_menu">
				<label for="ctm1">
					<div class="cate_1 cate_mine forctm1 add_photo tab_menu"
						style="margin-right: 60px;">
						<i class="far fa-image cate_con"></i>
						<div class="category">게시글 추가</div>
					</div>
				</label> <label for="ctm2">
					<div class="cate_1 cate_mine forctm2 add_captured tab_menu"
						style="margin-right: 60px;">
						<i class="fas fa-camera cate_con"></i>
						<div class="category">사진 찍기</div>
					</div>
				</label> <label for="ctm3">
					<div class="cate_1 cate_mine forctm3 add_edit tab_menu">
						<i class="far fa-edit cate_con"></i>
						<div class="category">사진 수정</div>
					</div>
				</label>
			</div>
			<div class="upload photo_upload">
				<div class="upload_id">${my_name }</div>
				<div class="story_img_con select_img">
					<img class="image" src="${pageContext.request.contextPath}/resources/uploadFiles/${bbRenew.bb_img1 }"/>
				</div>
				<form class="form_up" action="bbUpdate.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="m_id" value="${my_name }">
                    <input type="hidden" name="bb_id" value="${bbRenew.bb_id }">
                    <input type="hidden" value="${chkseq}" name="seq" id="for_seq">
                    <label for="file"><i class="far fa-image" class="image_icon"></i></label>
                    <input type="text" id="bb_name" name="bb_name" placeholder="상품명" value="${bbRenew.bb_name}">
                    <textarea rows="5" cols="40" name="bb_info" class="b_content bb_info" placeholder="상품 소개">${bbRenew.bb_info}</textarea>
                    <input type="file" id="file" name="file" class="file" accept="image/*" multiple style="display:none;">
                    <div class="hashtag_con">
                        <input type="text" class="tags" id="tags" name="tags" placeholder="#해시태그 입력"  value="<c:forEach items="${bbTags }" var="v">#${v.h_tag }</c:forEach>"/>
                    </div>
                    <div id="bbWriteMore" class="bbWriteMore">
	                    <div id="bbWriteMoreLeft" class="bbWriteMoreLeft">
							<div id="bbWritePrice" class="bbWritePrice">
								<input type="text" name="bb_price" placeholder="가 격" value="${bbRenew.bb_price}" required>
							</div>
							<div id="categoryBox">
								<select id="category" name="c_name">
									<option value=''>카테고리 설정</option>
									<c:forEach items="${category }" var="v">
										<option value="${v.c_name }"> ${v.c_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div id="bbWriteMoreRight" class="bbWriteMoreRight">
							<div id="bbWriteOption" class="bbWriteOption">
								<div class="bbWriteOptionList">
									<input type="text" id="bb_option1" name="bb_option1" onblur="option_onblur(this)" placeholder="옵션1 : option + price" value="${bbRenew.bb_option1 }">
								</div>
								<div class="bbWriteOptionList">
									<input type="text" id="bb_option2" name="bb_option2" onblur="option_onblur(this)" placeholder="옵션2 : option + price" value="${bbRenew.bb_option2 }">
								</div>
								<div class="bbWriteOptionList">
									<input type="text" id="bb_option3" name="bb_option3" onblur="option_onblur(this)" placeholder="옵션3 : option + price" value="${bbRenew.bb_option3 }">
								</div>
								<div class="bbWriteOptionList">
									<input type="text" id="bb_option4" name="bb_option4" onblur="option_onblur(this)" placeholder="옵션4 : option + price" value="${bbRenew.bb_option4 }">
								</div>
							</div>
						</div>
					</div>
                    <div>
                        <c:url var="bbList" value="bbList.do">
							<c:param name="page" value="1"/>
							<c:param name="m_id" value="${m_id }"/>
						</c:url>
						<input type="button" id="backto_main" class="btn backto_main" value="돌아가기">
						<input type="submit" class="btn upload_post" value="등록하기">&nbsp;&nbsp;
                    </div>
                </form>

			</div>
			<div class="upload capture_video" style="display: none;">
				<div class="upload_id">${my_name }</div>
				<div class="story_img_con">
					<img class="image">
				</div>
				<div class="form_up">
					<video id="video" class="video" width="500" height="375" autoplay></video>
					<canvas id="canvas" class="video" width="500" height="375"
						style="display: none;"></canvas>
					<input type="button" class="backto_main btn" value="돌아가기">
					<button type="button" id="webcamBtn" class="btn">캡쳐하기</button>
					<a href="" download="capture.png" class="btn" id="downl">다운로드</a> <input
						type="hidden" name="m_id" class="m_id" value="${myProfile.m_id }">
				</div>
			</div>
			<div class="upload edit" style="display: none;">
				<div class="upload_id">${my_name }</div>
				<div class="story_img_con">
					<img class="image">
				</div>
				<div class="form_up">
					<canvas id="canvas1" width="500" height="500"></canvas>
					<div style="float: right;">
						<label for="loadButton"><i class="far fa-image"
							class="image_icon"></i></label>
					</div>
					<input id="loadButton" type="file" accept="image/*"
						style="display: none;">
					<div id="filter_con">
						<button id="invertFilter" class="btn2">invertFilter</button>
						&nbsp;&nbsp;&nbsp;
						<button id="brightnessFilter" class="btn2">brightnessFilter</button>
						&nbsp;&nbsp;&nbsp;
						<button id="grayscaleFilter" class="btn2">grayscaleFilter</button>
						&nbsp;&nbsp;&nbsp;
						<button id="sepiaFilter" class="btn2">sepiaFilter</button>
					</div>
					<div id="down_con">
						<input type="button" id="backto_main" class="btn backto_main"
							value="돌아가기"> <a href="" id="canvas_down" class="btn">다운로드</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
            $("#backto_main").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });

            $(".forctm1").css("color", "#262626");
            $("#ctm1").change(function() {
                if ($("#ctm1").is(':checked')) {
                    $(".photo_upload").css("display", "block");
                    $(".capture_video").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".forctm1").css("color", "#262626");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#C7C7C7");
                }

            });
            $("#ctm2").change(function() {
                if ($("#ctm2").is(':checked')) {
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "block");
                    $(".edit").css("display", "none");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#262626");
                    $(".forctm3").css("color", "#C7C7C7");
                }

            });
            $("#ctm3").change(function() {
                if ($("#ctm3").is(':checked')) {
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "block");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#262626");
                }

            });
            $("#backto_main").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });

            $(function() {
                $(".fs").trigger('click');
                $(".add_photo").on('click', function() {
                    $('.file').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "block");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "none");
                    $(".forctm1").css("color", "#262626");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#C7C7C7");

                });
                $(".add_captured").on('click', function() {
                    $('.file').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "block");
                    $(".edit").css("display", "none");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#262626");
                    $(".forctm3").css("color", "#C7C7C7");

                });
                $(".add_edit").on('click', function() {
                    $('.file').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#262626");
                });
            });

            // 웹캠 연결
            if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia({
                    video: true
                }).then(function(stream) {
                    var video = document.getElementById('video');
                    video.srcObject = stream;
                    video.play();
                });
            }

            // 웹캠 화면 캡쳐
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var video = document.getElementById('video');
            document.getElementById("webcamBtn").addEventListener("click", function() {
                $("#canvas").css("display", "block");
                context.drawImage(video, 0, 0, 500, 375);
            });

            document.querySelector('a').addEventListener('click', event => 
                event.target.href = canvas.toDataURL()
            );

            // 업로드 파일 미리보기

            var file = document.querySelector('.file');

            file.onchange = function() {
                var fileList = file.files;

                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);
                console.log(reader);

                //로드 한 후
                reader.onload = function() {
                    document.querySelector('.image').src = reader.result;
                };
            };

            // 이미지 클릭 시 다운로드
            function dataURLtoBlob(dataurl) {
                var arr = dataurl.split(','),
                    mime = arr[0].match(/:(.*?);/)[1],
                    bstr = atob(arr[1]),
                    n = bstr.length,
                    u8arr = new Uint8Array(n);
                while (n--) {
                    u8arr[n] = bstr.charCodeAt(n);
                }
                return new Blob([u8arr], {
                    type: mime
                });
            }

            function downloadImg(imgSrc) {
                var image = new Image();
                image.crossOrigin = "anonymous";
                image.src = imgSrc;
                var fileName = image.src.split("/").pop();
                image.onload = function() {
                    var canvas = document.createElement('canvas');
                    canvas.width = this.width;
                    canvas.height = this.height;
                    canvas.getContext('2d').drawImage(this, 0, 0);
                    if (typeof window.navigator.msSaveBlob !== 'undefined') {
                        window.navigator.msSaveBlob(dataURLtoBlob(canvas.toDataURL()), fileName);
                    } else {
                        var link = document.createElement('a');
                        link.href = canvas.toDataURL();
                        link.download = fileName;
                        link.click();
                    }
                };
            }

            // 사진 수정
            var canvas1 = $('#canvas1')[0];
            var ctx = canvas1.getContext('2d');

            function drawImageData(image) {
                image.height *= canvas1.offsetWidth / image.width;
                image.width = canvas1.offsetWidth;

                if (image.height > canvas1.offsetHeight) {
                    image.width *= canvas1.offsetHeight / image.height;
                    image.height = canvas1.offsetHeight;
                }

                ctx.drawImage(image, 0, 0, image.width, image.height);
                console.log(ctx.getImageData(0, 0, canvas1.width, canvas1.height));
            }

            $('#loadButton').on('change', function(e) {
                var file = e.target.files[0];
                var fileReader = new FileReader();

                fileReader.onload = function(e) {
                    var image = new Image();
                    image.src = e.target.result;
                    image.onload = function() {
                        drawImageData(image);
                    }
                };

                fileReader.readAsDataURL(file);
            });

            // 수정본 다운로드
            $("#canvas_down").on('click', function() {
                var dataURL = canvas1.toDataURL('image/png');
                dataURL = dataURL.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
                dataURL = dataURL.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');
                var aTag = document.createElement('a');
                aTag.download = 'from_canvas.png';
                aTag.href = dataURL;
                aTag.click();
            });

            // 필터 클릭
            $('#invertFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = invertFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#brightnessFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = brightnessFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#grayscaleFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = grayscaleFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#sepiaFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = sepiaFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });


            // 필터
            function invertFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < pixels.data.length; i += 4) {
                    d[i] = 255 - d[i]; // R
                    d[i + 1] = 255 - d[i + 1]; // G
                    d[i + 2] = 255 - d[i + 2]; // B
                    d[i + 3] = 255; // Alpha
                }
                return pixels;
            }

            function brightnessFilter(pixels, value) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    d[i] += value / 3;
                    d[i + 1] += value / 3;
                    d[i + 2] += value / 3;
                }
                return pixels;
            }

            function grayscaleFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    var r = d[i];
                    var g = d[i + 1];
                    var b = d[i + 2];

                    var v = 0.2126 * r + 0.7152 * g + 0.0722 * b; // 보정값
                    d[i] = d[i + 1] = d[i + 2] = v // RBG 색을 같게 맞추자
                }
                return pixels;
            }

            function sepiaFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    var r = d[i];
                    var g = d[i + 1];
                    var b = d[i + 2];

                    d[i] = r * 0.3588 + g * 0.7044 + b * 0.1368;
                    d[i + 1] = r * 0.2990 + g * 0.5870 + b * 0.1140;
                    d[i + 2] = r * 0.2392 + g * 0.4696 + b * 0.0912;
                }
                return pixels;
            }

            $(".delete").on('click', function() {
                var s_img = $(this).next().val();
                var memId = $(this).next().next().val();
                console.log(memId);
                console.log(s_img);
                $(this).parent().remove();

                var count = $(".count_story").length;
                console.log(count);
                $.ajax({
                    url: "${pageContext.request.contextPath}/deleteStory.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        s_img: s_img
                    },
                    async: false,
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " s_img : " +
                            s_img);

                        if (count == 0) {
                            $("#recom_upload2").css("display", "block");
                        }
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
            
        	// 옵션 정규표현식
        	var regEx=/^([0-9a-zA-Z가-힣]{1,30})[+]([0-9]{1,8})$/;
        	function option_onblur(e){
        		console.log($(e).val());
        		if($(e).val()!=""){
	        		if(regEx.test($(e).val())){
	        			
	        		} else{
	        			alert("형식에 맞게 입력해주세요!!");
	        			$(e).focus();
	        			return false;
	        		}
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

</html>