<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/resources/css/timeLine.css" rel="stylesheet" type="text/css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<style>
				#fix_logo {
					cursor: pointer;
				}

				.timeline_likes_con {
					font-size: 14px;
					color: #262626;
					line-height: 18px;
				}

				.com_detail {
					font-size: 14px;
					color: #262626;
					line-height: 18px;
					width: 100%;
					height: 18px;
					margin-bottom: 4px;
				}

				.comment_more {
					font-size: 14px;
					line-height: 18px;
					color: #8E8E8E;
					cursor: pointer;
				}

				.cm1 {
					display: none;
				}

				.post_id {
					float: left;
				}

				.post_content {
					float: left;
					margin-left: 5px;
					width: 550px;
					/* overflow: hidden;
					text-overflow: ellipsis;
					white-space: nowrap; */

				}

				/* .post_content.overflow {
					overflow: visible;
					white-space: normal;
					width: 570px;

				}

				.commentViewAll {
					float: left;
					width: 1.2em;
					height: 100%;
					cursor: pointer;
				} */

				.t_prof_photo {
					width: 28px;
					height: 28px;
					border-radius: 50%;
					background-color: crimson;
					margin: 16px;
					float: left;
				}

				.t_prof_id {
					float: left;
					font-size: 14px;
					color: #262626;
					line-height: 60px;
				}

				#my_id {
					font-size: 14px;
					color: #262626;
					line-height: 56px;
				}

				.story_id {
					font-size: 12px;
					color: #262626;
					line-height: 27px;
				}

				.follow_recom_title {
					font-size: 14px;
					line-height: 19px;
				}

				.timeline_time {
					font-size: 10px;
					line-height: 19px;
					color: #8E8E8E;
				}

				.icon {
					width: 24px;
					height: 24px;
					background-color: crimson;
					float: left;
					margin-top: 8px;
					margin-right: 16px;
					cursor: pointer;
				}

				.like_icon {
					background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
					background-size: 24px;
				}

				.like_icon:hover {
					background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
					background-size: 24px;
				}

				.unlike_icon {
					background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
					background-size: 24px;
					display: none;
				}

				.save_icon {
					margin-right: 0px;
					float: right;
				}

				#footer_infoc {
					font-size: 13px;
					color: #C7C7C7
				}

				.clcon {
					width: 12px;
					height: 12px;
					margin-top: 3px;
					float: right;
					cursor: pointer;
				}

				.comment_lcon {
					background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
					background-size: 12px;
				}

				.comment_lcon:hover {
					background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');

				}

				.comment_unlcon {
					background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
					background-size: 12px;
					display: none;
				}

				#follow_recom_con {
					height: 200px;
					overflow: hidden;
				}

				.moreCo {
					float: left;
					margin-left: 5px;
					font-size: 12px;
										margin-right: 11px;
					color: #8E8E8E;
					line-height: 18px;
					cursor: pointer;
				}

				.moreCoW {
					float: left;
					margin-right: 11px;
					margin-left: 5px;
					font-size: 12px;
					color: #8E8E8E;
					line-height: 18px;
					cursor: pointer;
				}

				.moreCoD {
					float: right;
					margin-right: 12px;
					font-size: 10px;
					color: #8E8E8E;
					line-height: 18px;
					width: 84px;

				}
			</style>
		</head>

		<body>
			<header id="header">
				<div id="header_con">
					<div id="header_left">
						<div id="fix_logo" onclick="location.href='timeLineList.do?m_id=aaab'"></div>
					</div>
					<input type="text" id="search" placeholder="검색" style="text-align:center;">
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
			<div id="content_con">
				<div id="timeline_big_con">
					<div id="timeline_left">
						<div id="story_con">
							<div id="blank_for_story"></div>
							<div id="story_inner_con">
								<div class="story_small_con">
									<div class="story_profile"></div>
									<div class="story_id">내 스토리</div>
								</div>
								<c:if test="${not empty storyList }">
									<c:forEach var="vo" items="${storyList }" varStatus="s">
										<div class="story_small_con">
											<div class="story_profile">${vo.m_img }</div>
											<div class="story_id">${vo.m_id }</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<div id="timeline_blank"></div>
						<c:if test="${not empty timeLineList }">
							<c:forEach var="vo" items="${timeLineList }" varStatus="s">
								<div class="timeline_contents">
									<div class="timeline_profile">
										<div class="t_prof_photo">${vo.m_img }</div>
										<div class="t_prof_id">${vo.m_id }</div>
									</div>
									<div class="timeline_photo"></div>
									<div class="timeline_comment_con">
										<div class="inner_comment_con">
											<div class="timeline_icon_con">
												<div class="icon like_icon likechk${vo.t_id }"
													onclick="pressLike('${vo.t_id}');"></div>
												<div class="icon unlike_icon unlikechk${vo.t_id }"
													onclick="pressUnlike('${vo.t_id}');"></div>
												<div class="icon comment_icon"></div>
												<div class="icon share_icon"></div>
												<div class="icon save_icon"></div>
											</div>
											<div class="timeline_likes_con">좋아요 <input type="text"
													class="lCount${vo.t_id}" value="${vo.t_likes }" readonly>개</div>
											<div class="comment_con">
												<div class="com_detail post_title">
													<div class="post_id">${vo.m_id }</div>
													<div class="post_content">${vo.t_content }</div>
												</div>
												<div class="com_detail comment_more"
													onclick="showAllCo('${vo.t_id }');">댓글 전체 보기</div>
												<div class="com_detail cm1 cm1${vo.t_id }">
													<div class="commentRId post_id commentRIdf"></div>
													<div class="commentResult post_content commentResultf">
													</div>
													<!-- <a class="commentViewAll"></a> -->
												</div>
												<ul class="cm2${vo.t_id }">
												</ul>
												<ul class="cm3${vo.t_id }">
												</ul>
												<input type="hidden" class="hidden_likechk"
													onclick="likechk('${vo.t_id }');"> <input type="hidden"
													class="hidden_commentchk" onclick="showAllCoHidden('${vo.t_id }');">
												<input type="hidden" name="t_type" value="${vo.t_type }">
											</div>
											<div class="timeline_time">${vo.t_time }</div>
										</div>
									</div>
									<div class="upload_comment">
										<div class="inner_comment_con inner_upload">
											<input type="text" class="write_space" placeholder="댓글 달기..."
												name="t_comment">
											<button class="comment_upload">게시</button>
											<input type="hidden" name="t_id" value="${vo.t_id }"> <input type="hidden"
												name="t_type" value="${vo.t_type }" class="t_type${vo.t_id }">
										</div>
									</div>

								</div>
							</c:forEach>
						</c:if>
					</div>
					<div id="timeline_right">
						<div id="right_small_con">
							<div id="my_profile_con">
								<div id="my_profile_photo">${myProfile.m_img }</div>
								<div id="my_id">${myProfile.m_id }</div>
								<input type="hidden" name="m_id" class="m_id" value="${myProfile.m_id }">
							</div>
							<div id="follow_recom_title">회원님을 위한 추천</div>
							<div id="follow_recom_con">
								<c:if test="${not empty recomFollow }">
									<c:forEach var="vo" items="${recomFollow }" varStatus="s">
										<div class="follow_recom_id">
											<div class="recom_profile">${vo.m_img }</div>
											<div class="recom_middle">
												<div class="recom_id">${vo.r_mid }</div>
												<div class="recom_info">${vo.count }명이 팔로우합니다</div>
											</div>
											<button class="recom_follow followBtn" style="cursor:pointer;">팔로우</button>
											<input type="hidden" value="${vo.r_mid }">
										</div>
									</c:forEach>
								</c:if>
							</div>
							<div id="footer_info"></div>
							<div id="footer_infoc">© 2020 TA_IN</div>
						</div>
					</div>
				</div>
			</div>
		</body>
		<script type="text/javascript">
			$(function () {
				$(".hidden_commentchk").trigger('click');
				$(".hidden_likechk").trigger('click');

				//댓글 overflow 더보기 (css 오류있어서 보류)
				/* document.querySelector('.commentViewAll').addEventListener('click', function (e) {
					e.target.previousElementSibling.classList.toggle('overflow');
				}); */
				//회원 추천 팔로우
				$(".followBtn").on('click', function () {
					var memId = $(".m_id").val();
					var r_mid = $(this).next().val();
					console.log(memId);
					console.log(r_mid);
					$(this).next().parent().remove();
					$.ajax({
						url: "${pageContext.request.contextPath}/insertFollow.do",
						method: "POST",
						data: {
							m_id: memId,
							r_mid: r_mid
						},
						async : false,
						success: function (data) {
							console.log("memId : "
								+ memId
								+ " r_mid : "
								+ r_mid);
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
				});

				//댓글 ajax insert
				$(".comment_upload").on('click', function () {
					var postid = $(this).next().val();
					var comment = $(this).prev().val();
					var memId = $(".m_id").val();
					var type = $(this).next().next().val();
					console.log(postid);
					console.log(comment);
					console.log(memId);
					console.log(type);
					if (comment == "" || comment == null) {
						console.log("comment won't be uploaded");
						return false;
					} else {
						$(this).parent().parent().prev().find(".comment_more").css("display", "block");
						$(this).parent().parent().prev().find(".cm1").css("display", "block");
						$(this).parent().parent().prev().find(".commentRIdf").text(memId);
						$(this).parent().parent().prev().find(".commentResultf").text(comment);
						if (type == "G") {
							console.log("board comment upload!");
							$.ajax({
								url: "${pageContext.request.contextPath}/coInsert.do",
								method: "POST",
								data: {
									m_id: memId,
									t_comment: comment,
									t_id: postid
								},
								async : false,
								success: function (data) {
									console.log("memId : "
										+ memId
										+ " comment : "
										+ comment
										+ " postid : "
										+ postid);
									$(".write_space").val('');
									/* $(".comment_lcon").on('click', function () {
										var memId = $(".m_id").val();
										var b_id = $(this).next().next().val();
										console.log(memId);
										console.log(b_id);
										$.ajax({
											url: "${pageContext.request.contextPath}/pressLike.do",
											method: "POST",
											async: false,
											data: {
												m_id: memId,
												t_id: b_id
											},
											success: function (data) {
												console.log("memId : "
													+ memId
													+ " b_id : "
													+ b_id);
												$(this).css("display", "none");
												$(this).next().css("display", "block");
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
									});
									$(".comment_unlcon").on('click', function () {
										var memId = $(".m_id").val();
										var b_id = $(this).next().val();
										console.log(memId);
										console.log(b_id);
										$.ajax({
											url: "${pageContext.request.contextPath}/pressUnLike.do",
											method: "POST",
											async: false,
											data: {
												m_id: memId,
												t_id: b_id
											},
											success: function (data) {
												console.log("memId : "
													+ memId
													+ " b_id : "
													+ b_id);
												$(this).css("display", "none");
												$(this).prev().css("display", "block");
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
									}); */
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
						} else if (type == "B") {
							console.log("businessboard comment upload!");
							$.ajax({
								url: "${pageContext.request.contextPath}/coInsertB.do",
								method: "POST",
								data: {
									m_id: memId,
									t_comment: comment,
									t_id: postid
								},
								async : false,
								success: function (data) {
									console.log("memId : "
										+ memId
										+ " comment : "
										+ comment
										+ " postid : "
										+ postid);
									$(".write_space").val('');
									/* $(".comment_lcon").on('click', function () {
										var memId = $(".m_id").val();
										var b_id = $(this).next().next().val();
										console.log(memId);
										console.log(b_id);
										$.ajax({
											url: "${pageContext.request.contextPath}/pressLikeB.do",
											method: "POST",
											async: false,
											data: {
												m_id: memId,
												t_id: b_id
											},
											success: function (data) {
												console.log("memId : "
													+ memId
													+ " t_id : "
													+ t_id);
												$(this).css("display", "none");
												$(this).next().css("display", "block");
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
									});
									$(".comment_unlcon").on('click', function () {
										var memId = $(".m_id").val();
										var b_id = $(this).next().val();
										console.log(memId);
										console.log(b_id);
										$.ajax({
											url: "${pageContext.request.contextPath}/pressUnLikeB.do",
											method: "POST",
											async: false,
											data: {
												m_id: memId,
												t_id: b_id
											},
											success: function (data) {
												console.log("memId : "
													+ memId
													+ " b_id : "
													+ b_id);
												$(this).css("display", "none");
												$(this).prev().css("display", "block");
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
									}); */
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
						}
					}
				});

			});

			// 전체 댓글보기 눌렀을 때
			function showAllCo(t_id) {
				var type = $(".t_type" + t_id).val();
				var mem_id = $(".m_id").val();

				if (type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
						method: "POST",
						   async : false,
						data: {
							t_id: t_id
						},
						dataType: "json",
						success: function (hComment) {
							var count = hComment;

							for (var i = 0; i < count.hComment.length; i++) {
								var id = count.hComment[i].m_id;
								var b_content = count.hComment[i].b_content;
								var b_id = count.hComment[i].b_id;
								var b_type = count.hComment[i].b_type;
								var countr = count.hComment[i].count;
								var b_date = count.hComment[i].b_date;
								$(".cm1" + t_id).remove();
								$(".cm2" + t_id).remove();
								$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id">'
									+ id + '</div><div class="commentResult post_content">'
									+ b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon clcon' + b_id + '"></div>'
									+ '<div class="comment_unlcon clcon cunlcon' + b_id + '"></div>'
									+ '<input type="hidden" value="' + b_id + '"></div></div>');
								$(".cm3" + t_id).append("<input type='hidden' class='" + b_id + "lBtn rlikechkBtn' onclick='rlikechk(\"" + b_id + "\");' value='" + b_id + "'>"
									+ "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
								if (countr != 0) {
									if(id==mem_id){
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div>'
										+ '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
										+ '<div class="moreCo' + b_id + ' moreCo">답글 보기(' + countr + ')개</div>'
										+ '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>'
										+ '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>'
										+ '<input type="hidden" value="' + b_id + '">'
										+ '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									} else{
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div>'
										+ '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
										+ '<div class="moreCo' + b_id + ' moreCo">답글 보기(' + countr + ')개</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
										
									}
								} else {
									if(id==mem_id){
										$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
												+ id + '</div><div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
												+ '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>'
												+ '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>'
												+ '<input type="hidden" value="' + b_id + '">'
												+'<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									} else{
									
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div><div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									}

								}
							}
							
							$(".rlikechkBtn").trigger('click');
							
							/* //댓글 삭제
							$(".moreCoDe").on('click', function(){
								var memId = $(".m_id").val();
								var b_id = $(this).next().val();
								console.log(memId);
								console.log(b_id);
								$(this).parent().prevAll().remove();
								$(this).parent().remove();
								$.ajax({
									url: "${pageContext.request.contextPath}/deleteComment.do",
									method: "POST",
									data: {
										b_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
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
							}); */
							
							// 댓글 좋아요
							$(".comment_lcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressLike.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " t_id : "
											+ t_id);
										$(".clcon" + b_id).css("display", "none");
										$(".cunlcon" + b_id).css("display", "block");
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
							});
							
							// 댓글 싫어요
							$(".comment_unlcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressUnLike.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "block");
										$(".cunlcon" + b_id).css("display", "none");
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

							});
						}
					});
				} else if (type = "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowAllCoB.do",
						method: "POST",
						data: {
							t_id: t_id
						},
						dataType: "json",
						async : false,
						success: function (hComment) {
							var count = hComment;
							for (var i = 0; i < count.hComment.length; i++) {
								var id = count.hComment[i].m_id;
								var b_content = count.hComment[i].b_content;
								var b_id = count.hComment[i].b_id;
								var b_type = count.hComment[i].b_type;
								var countr = count.hComment[i].count;
								var b_date = count.hComment[i].b_date;

								$(".cm1" + t_id).remove();
								$(".cm2" + t_id).remove();
								$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id">'
									+ id + '</div><div class="commentResult post_content">'
									+ b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon clcon' + b_id + '"></div>'
									+ '<div class="comment_unlcon clcon cunlcon' + b_id + '"></div>'
									+ '<input type="hidden" value="' + b_id + '"></div></div>');
								$(".cm3" + t_id).append("<input type='hidden' class='" + b_id + "lBtn rlikechkBtn' onclick='rlikechk(\"" + b_id + "\");' value='" + b_id + "'>"
									+ "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
								if (countr != 0) {
									if(id==mem_id){
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div>'
										+ '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
										+ '<div class="moreCo' + b_id + ' moreCo">답글 보기(' + countr + ')개</div>'
										+ '<div class="moreCoMo' + b_id + ' moreCo">댓글 수정</div>'
										+ '<div class="moreCoDe' + b_id + ' moreCo">댓글 삭제</div>'
										+ '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									} else{
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div>'
										+ '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
										+ '<div class="moreCo' + b_id + ' moreCo">답글 보기(' + countr + ')개</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
										
									}
								} else {
									if(id==mem_id){
										$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
												+ id + '</div><div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
												+ '<div class="moreCoMo' + b_id + ' moreCo">댓글 수정</div>'
												+ '<div class="moreCoDe' + b_id + ' moreCo">댓글 삭제</div>'
												+'<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									} else{
									
									$(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div><div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
									}

								}
							}
							$(".rlikechkBtn").trigger('click');
							$(".comment_lcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressLikeB.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " t_id : "
											+ t_id);
										$(".clcon" + b_id).css("display", "none");
										$(".cunlcon" + b_id).css("display", "block");
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
							});
							$(".comment_unlcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressUnLikeB.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "block");
										$(".cunlcon" + b_id).css("display", "none");
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
							});

						}
					});

				}

			}

			// 페이지 로딩 시 처음 두개 댓글 나타내기
			function showAllCoHidden(t_id) {
				var type = $(".t_type" + t_id).val();
				if (type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
						method: "POST",
						data: {
							t_id: t_id
						},
						dataType: "json",
						async : false,
						success: function (hComment) {
							var count = hComment;
							for (var i = 0; i < 2; i++) {
								var id = count.hComment[i].m_id;
								var b_content = count.hComment[i].b_content;
								var b_id = count.hComment[i].b_id;
								var b_type = count.hComment[i].b_type;
								var countr = count.hComment[i].count;
								var b_date = count.hComment[i].b_date;

								$(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id">'
									+ id + '</div><div class="commentResult post_content">'
									+ b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon clcon' + b_id + '"></div>'
									+ '<div class="comment_unlcon clcon cunlcon' + b_id + '"></div>'
									+ '<input type="hidden" value="' + b_id + '"></div></div>');
								$(".cm2" + t_id).append("<input type='hidden' class='" + b_id + "lBtn rlikechkBtn' onclick='rlikechk(\"" + b_id + "\");' value='" + b_id + "'>"
									+ "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
							}
							$(".rlikechkBtn").trigger('click');
							$(".comment_lcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressLike.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "none");
										$(".cunlcon" + b_id).css("display", "block");
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
							});
							$(".comment_unlcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressUnLike.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "block");
										$(".cunlcon" + b_id).css("display", "none");
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

							});
						}
					});

				} else if (type = "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowAllCoB.do",
						method: "POST",
						data: {
							t_id: t_id
						},
						dataType: "json",
						async : false,
						success: function (hComment) {
							var count = hComment;

							for (var i = 0; i < 2; i++) {
								var id = count.hComment[i].m_id;
								var b_content = count.hComment[i].b_content;
								var b_id = count.hComment[i].b_id;
								var b_type = count.hComment[i].b_type;
								var countr = count.hComment[i].count;
								var b_date = count.hComment[i].b_date;

								$(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id">'
									+ id + '</div><div class="commentResult post_content">'
									+ b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon clcon' + b_id + '"></div>'
									+ '<div class="comment_unlcon clcon cunlcon' + b_id + '"></div>'
									+ '<input type="hidden" value="' + b_id + '"></div></div>');
								$(".cm2" + t_id).append("<input type='hidden' class='" + b_id + "lBtn rlikechkBtn' onclick='rlikechk(\"" + b_id + "\");' value='" + b_id + "'>"
									+ "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
								/* if (countr != 0) {
									$(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div>'
										+ '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>'
										+ '<div class="moreCo' + b_id + ' moreCo">답글 보기(' + countr + ')개</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');
								} else {
									$(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">'
										+ id + '</div><div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>');

								} */
							}
							$(".rlikechkBtn").trigger('click');
							$(".comment_lcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressLikeB.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "none");
										$(".cunlcon" + b_id).css("display", "block");
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
							});
							$(".comment_unlcon").on('click', function () {
								var memId = $(".m_id").val();
								var b_id = $(this).next().val();
								console.log(memId);
								console.log(b_id);
								$.ajax({
									url: "${pageContext.request.contextPath}/pressUnLikeB.do",
									method: "POST",
									data: {
										m_id: memId,
										t_id: b_id
									},
									async : false,
									success: function (data) {
										console.log("memId : "
											+ memId
											+ " b_id : "
											+ b_id);
										$(".clcon" + b_id).css("display", "block");
										$(".cunlcon" + b_id).css("display", "none");
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
							});
						}
					});
				}

			}

			// 게시물 좋아요 선택 유무 표시
			function likechk(t_id) {
				var memId = $(".m_id").val();
				var type = $(".t_type" + t_id).val();
				if (type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowLike.do",
						method: "POST",
						data: {
							t_id: t_id,
							m_id: memId
						},
						dataType: "json",
						async : false,
						success: function (hLike) {
							if (hLike >= 1) {
								$(".likechk" + t_id).css("display", "none");
								$(".unlikechk" + t_id).css("display", "block");
							}
						},
						error: function (request,
							status, error) {
							console.log("code:"
								+ request.status
								+ "\n"
								+ "message:"
								+ request.responseText
								+ "\n" + "error:"
								+ error);
						}
					});
				} else if (type == "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenShowLikeB.do",
						method: "POST",
						data: {
							t_id: t_id,
							m_id: memId
						},
						dataType: "json",
						async : false,
						success: function (hLike) {
							if (hLike >= 1) {
								$(".likechk" + t_id).css("display", "none");
								$(".unlikechk" + t_id).css("display", "block");
							}
						},
						error: function (request,
							status, error) {
							console.log("code:"
								+ request.status
								+ "\n"
								+ "message:"
								+ request.responseText
								+ "\n" + "error:"
								+ error);
						}
					});
				}

			}

			// 게시물 좋아요
			function pressLike(t_id) {
				var memId = $(".m_id").val();
				var type = $(".t_type" + t_id).val();
				var lcount = $(".lCount" + t_id).val();
				lcount++;
				if (type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/pressLike.do",
						method: "POST",
						data: {
							m_id: memId,
							t_id: t_id
						},
						async : false,
						success: function (data) {
							console.log("memId : "
								+ memId
								+ " t_id : "
								+ t_id);
							$(".likechk" + t_id).css("display", "none");
							$(".unlikechk" + t_id).css("display", "block");
							$(".lCount" + t_id).attr('value', lcount);
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
				} else if (type = "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/pressLikeB.do",
						method: "POST",
						data: {
							m_id: memId,
							t_id: t_id
						},
						async : false,
						success: function (data) {
							console.log("memId : "
								+ memId
								+ " t_id : "
								+ t_id);
							$(".likechk" + t_id).css("display", "none");
							$(".unlikechk" + t_id).css("display", "block");
							$(".lCount" + t_id).attr('value', lcount);
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
				}
			}

			// 게시물 좋아요 취소
			function pressUnlike(t_id) {
				var memId = $(".m_id").val();
				var type = $(".t_type" + t_id).val();
				var lcount = $(".lCount" + t_id).val();
				lcount--;
				if (type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/pressUnLike.do",
						method: "POST",
						data: {
							m_id: memId,
							t_id: t_id
						},
						async : false,
						success: function (data) {
							console.log("memId : "
								+ memId
								+ " t_id : "
								+ t_id);
							$(".likechk" + t_id).css("display", "block");
							$(".unlikechk" + t_id).css("display", "none");
							$(".lCount" + t_id).attr('value', lcount);
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
				} else if (type = "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/pressUnLikeB.do",
						method: "POST",
						data: {
							m_id: memId,
							t_id: t_id
						},
						async : false,
						success: function (data) {
							console.log("memId : "
								+ memId
								+ " t_id : "
								+ t_id);
							$(".likechk" + t_id).css("display", "block");
							$(".unlikechk" + t_id).css("display", "none");
							$(".lCount" + t_id).attr('value', lcount);
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
				}
			}

			// 댓글 좋아요 유무 체크
			function rlikechk(b_id) {
				var memId = $(".m_id").val();
				var b_type = $("." + b_id + "forRbtn").val();
				if (b_type == "G") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenCShowLike.do",
						method: "POST",
						data: {
							b_id: b_id,
							m_id: memId
						},
						dataType: "json",
						async : false,
						success: function (hLike) {
							if (hLike >= 1) {
								$(".clcon" + b_id).css("display", "none");
								$(".cunlcon" + b_id).css("display", "block");
							}
						},
						error: function (request,
							status, error) {
							console.log("code:"
								+ request.status
								+ "\n"
								+ "message:"
								+ request.responseText
								+ "\n" + "error:"
								+ error);
						}
					});
				} else if (b_type == "B") {
					$.ajax({
						url: "${pageContext.request.contextPath}/hiddenCShowLikeB.do",
						method: "POST",
						data: {
							b_id: b_id,
							m_id: memId
						},
						dataType: "json",
						async : false,
						success: function (hLike) {
							if (hLike >= 1) {
								$(".clcon" + b_id).css("display", "none");
								$(".cunlcon" + b_id).css("display", "block");
							}
						},
						error: function (request,
							status, error) {
							console.log("code:"
								+ request.status
								+ "\n"
								+ "message:"
								+ request.responseText
								+ "\n" + "error:"
								+ error);
						}
					});
				}

			}



		</script>

		</html>