<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mManage.css"
	rel="stylesheet" type="text/css" />
<title>계정 관리</title>
<style>
a {
	display: block;
}
</style>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<header id="header">
		<div id="header_con">
			<div id="header_left">
				<div id="fix_logo"></div>
				<input type="hidden" name="m_id" class="m_id"
					value="${myProfile.m_id }">
			</div>
			<input type="text" id="search" placeholder="검색"
				style="text-align: center;">
			<div id="header_right">
				<div id="header_icon_con">
					<div id="fix_home" class="fix_icon"></div>
					<div id="fix_message" class="fix_icon"></div>
					<div id="fix_alert" class="fix_icon"></div>
					<div id="fix_bag" class="fix_icon"></div>
					<div id="fix_profile" class="fix_icon"></div>
				</div>
			</div>
		</div>
	</header>
	<div id="forheader"></div>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li style="border-left: 2px solid black;"><a href=""><span style="font-weight:bold;">비밀번호 변경</span></a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents"></div>
		<div style="clear:both;"></div>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		// 자동 검색어 완성
		// var availableTags = [
		// 	"#ActionScript",
		// 	"#AppleScript",
		// 	"#Asp",
		// 	"#BASIC",
		// 	"#C",
		// 	"#C++",
		// 	"#Clojure",
		// 	"#COBOL",
		// 	"#ColdFusion",
		// 	"#Erlang",
		// 	"#Fortran",
		// 	"#Groovy",
		// 	"#Haskell",
		// 	"#Java",
		// 	"JavaScript",
		// 	"#Lisp",
		// 	"#Perl",
		// 	"#PHP",
		// 	"#Python",
		// 	"#Ruby",
		// 	"#Scala",
		// 	"Scheme"
		// ];

		// $("#search").autocomplete({
		// 	source:availableTags
		// });
		/* $("#search").autocomplete({
		    source: function (request, response) {
		        $.ajax({
		            url: "${pageContext.request.contextPath}/autocomplete.do",
		            type: "post",
		            dataType: "json",
		            data: request,
		            success: function (data) {
		                var result = data;
		                response(result);
		            },
		            error: function (request, status, error) {
		                alert("code:"
		                    + request.status
		                    + "\n"
		                    + "message:"
		                    + request.responseText
		                    + "\n" + "error:"
		                    + error);
		            }
		        });
		    } */

		/* $("#search").autocomplete({
		    serviceUrl:"${pageContext.request.contextPath}/autocomplete.do",
		    paramName : "word",
		    delimiter:",",
		    transformResult:function(response){
		        return{
		            suggestions: $.map($.parseJSON(response), function(item) {
		
		                  return { value: item.word, data: item.categoryId };
		               })
		        };
		    }
		}); */

		$("#search")
				.autocomplete(
						{
							source : function(request, response) { // 자동완성대
								var request = $("#search").val();
								console.log(request);
								$
										.ajax({
											url : "${pageContext.request.contextPath}/autocomplete.do",
											type : "post",
											dataType : "json",
											data : {
												word : request
											},
											success : function(data) {
												console.log(data);
												console.log(data[0].word);
												value1 = data[0].word;
												console.log(value);
												var value = new Array();
												for (var i = 0; i < data.length; i++) {
													value.push(data[i].word)
												}
												response($.map(value, function(
														item) { //json[i] 번째 에 있는게 item 임.
													return {
														//label: item+"label",    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
														value : item, //그냥 사용자 설정값?
														test : item + "test"
													/* response(
													    data = $.map(data, function(value, key) { //json[i] 번째 에 있는게 item 임.
													        /* return value;
													        console.log('key' + key[3]);
													        console.log('value' + value);
													        var word = data.word;
													        console.log('word' + word); */
													//   return {
													//     //label: value + "label", //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
													//     value: value, //그냥 사용자 설정값?
													//     test: value + "test"
													}

												})

												/* var result = autoword;
												console.log(result);
												console.log(response);
												// for (var i = 0; i < result.autoword.length; i++) {
												// 	var resultword = result.autoword[i].word;
												// 	console.log(resultword);
												// }
												// console.log(autoword);
												$.each(result, function(key, value) {
												    console.log('key:'+ key[2]);
												    console.log('value:'+ value[3]);
												    console.log('word:'+ value.word); */

												/* }); */

												)
											},
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
											}
										});
							}

						});

	});

	// function forautocomp() {
	// 		$.ajax({
	// 			url: "${pageContext.request.contextPath}/autocomplete.do",
	// 			type: "post",
	// 			dataType: "json",
	// 			success: function (autoword) {
	// 				var result = autoword;
	// 				console.log(result);
	// 				var resultword = result.autoword.word;
	// 				console.log(resultword);
	// 			},
	// 			error: function (request, status, error) {
	// 				alert("code:"
	// 					+ request.status
	// 					+ "\n"
	// 					+ "message:"
	// 					+ request.responseText
	// 					+ "\n" + "error:"
	// 					+ error);
	// 			}
	// 		});
	// 	}

	$("#fix_logo").on('click', function() {
		var memId = $(".m_id").val();
		var url = "${pageContext.request.contextPath}/timeLine?m_id=" + memId;
		$(location).attr('href', url);
	});

	$("#search")
			.on(
					"keypress",
					function(event) {
						if (window.event.keyCode == 13) {

							var memId = $(".m_id").val();
							var hashtag = $("#search").val();
							var url = "${pageContext.request.contextPath}/explore?hashtag="
									+ hashtag + "&&m_id=" + memId;
							$(location).attr('href', url);
						}
					});
</script>

</html>