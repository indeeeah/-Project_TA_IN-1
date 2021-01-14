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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>계정 관리</title>
<style>
a {
	display: block;
}

td {
	text-align: left;
}
</style>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
</head>
<script>
$(document).ready(function() {
	$("#lastpw").keyup(function(){
		var m_pw = "${profile.m_pw}";
		if($("#lastpw").val() == m_pw){
			$("#checklastpwinfo").css("color","green");
			$("#checklastpwinfo").html("이전 비밀번호와 일치합니다.");
		}else{
			$("#checklastpwinfo").css("color","red");
			$("#checklastpwinfo").html("비밀번호를 다시 확인해주세요.");
		}
	});
	
	$("#checknewpw").keyup(function(){
		if($("#newpw").val() == $("#checknewpw").val()){
			$("#checknewpwinfo").css("color","green");
			$("#checknewpwinfo").html("새 비밀번호와 일치합니다.");
		}else{
			$("#checknewpwinfo").css("color","red");
			$("#checknewpwinfo").html("비밀번호를 다시 확인해주세요.");
		}
	});
	
	$("#newpw").keyup(function(){
		if($("#newpw").val() == $("#checknewpw").val()){
			$("#checknewpwinfo").css("color","green");
			$("#checknewpwinfo").html("새 비밀번호가 일치합니다.");
		}else{
			$("#checknewpwinfo").css("color","red");
			$("#checknewpwinfo").html("비밀번호를 다시 확인해주세요.");
		}
	});
	
	$("#submit").click(function(){
		if($("#checklastpwinfo").html()=="이전 비밀번호와 일치합니다."){
			if($("#checknewpwinfo").html()=="새 비밀번호와 일치합니다."){
				return true;
			}else{
				alert("새 비밀번호를 확인해주세요.");
				$("#checknewpw").val("");
				$("#newpw").val("");
				$("#newpw").focus();
				return false;
			}
		}else{
			alert("이전 비밀번호를 확인해주세요.");
			$("#lastpw").val("");
			$("#lastpw").focus();
			return false;
		}
	});
});
</script>
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
				<li style="border-left: 2px solid black;"><a href=""><span
						style="font-weight: bold;">비밀번호 변경</span></a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li><a href="mBuylist.do">구매목록</a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span>비밀번호 변경</span>
			<form id="changepw" method="post" action="changepw.do"
				style="padding-bottom: 75px; padding-top:20px;">
				<table id="profiletable" style="width: 80%; margin: 0 auto; margin-bottom:30px;">
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%"></td>
						<td width="35%" style="text-align: center;"><img
							src="${pageContext.request.contextPath}/resources/uploadFiles/${profile.m_img}"
							style="width: 50px; height: 50px; vertical-align: middle;"></td>
						<td>${profile.m_id }</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">이전 비밀번호</td>
						<td><input type="password" id="lastpw" name="lastpw" required
							style="width: 55%;"><label style="font-size:7pt;"
							id="checklastpwinfo"></label></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">새 비밀번호</td>
						<td><input type="password" id="newpw" name="newpw" required
							style="width: 55%;"></td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr class="register" height="30">
						<td width="5%">*</td>
						<td width="30%">새 비밀번호 확인</td>
						<td><input type="password" id="checknewpw" name="checknewpw"
							required style="width: 55%;"><label style="font-size:7pt;"
							id="checknewpwinfo"></label></td>
					</tr>
				</table>
				<input type="submit" id="submit" value="저장" style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;">
				<input type="button" style="background: #0095f6; border-style: none; padding: 5px 5px 5px 5px; color: white;"
					value="취소" onclick="location.href='mChangepw.do'">
			</form>
		</div>
		<div style="clear: both;"></div>
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