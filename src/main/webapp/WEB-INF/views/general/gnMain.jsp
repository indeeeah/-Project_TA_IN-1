<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #content_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #general_con {
                    width: 1000px;
                }
                
                #profile_con_top {
                    width: 100%;
                    height: 150px;
                }
                
                #profile_photo {
                    width: 150px;
                    height: 150px;
                    background-color: beige;
                    margin-left: 50px;
                    border-radius: 50%;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_left {
                    margin-left: 80px;
                    width: 720px;
                    float: left;
                }
                
                #profile_left_top_con {
                    height: 40px;
                }
                
                #profile_name {
                    height: 40px;
                    font-size: 28px;
                    line-height: 40px;
                    float: left;
                }
                
                .profile_btn {
                    float: left;
                    margin-left: 20px;
                    margin-top: 5px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid black;
                    font-size: 14px;
                    line-height: 18px;
                    cursor: pointer;
                }
                
                .setting_icon {
                    width: 20px;
                    height: 20px;
                    font-size: 20px;
                    margin-left: 15px;
                    margin-top: 10px;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_middle {
                    height: 18px;
                    width: 100%;
                    margin-top: 20px;
                }
                
                #profile_intro {
                    width: 100%;
                    margin-top: 20px;
                    font-size: 16px;
                }
                
                #highlight_con {
                    margin-top: 44px;
                    margin-bottom: 44px;
                    height: 130px;
                    width: 100%;
                }
                
                .highlight_small_con {
                    width: 87px;
                    height: 100%;
                    float: left;
                    padding: 0px 20px 0px 20px;
                }
                
                .highlight_photo {
                    height: 87px;
                    width: 87px;
                    background-color: green;
                    border-radius: 50%;
                    margin-top: 10px;
                    cursor: pointer;
                }
                
                .highlight_title {
                    height: 18px;
                    width: 100%;
                    text-align: center;
                    font-size: 14px;
                    margin-top: 15px;
                    cursor: pointer;
                }
                
                #hidden_follow_rec {
                    width: 988px;
                    height: 280px;
                    white-space: nowrap;
                    border: 1px solid black;
                    box-sizing: border-box;
                    padding: 20px 0px 20px 12px;
                    margin-bottom: 28px;
                    overflow-x: auto;
                    overflow-y: hidden;
                }
                
                #rec_title {
                    width: 975px;
                    height: 18px;
                    margin-left: 13px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_con {
                    margin-top: 14px;
                    width: 134px;
                    height: 156px;
                    padding: 20px;
                    border: 1px solid black;
                    margin-right: 24px;
                    text-align: center;
                    display: inline-block;
                }
                
                .each_rec_photo {
                    width: 54px;
                    height: 54px;
                    background-color: burlywood;
                    border-radius: 50%;
                    margin-bottom: 20px;
                    margin-left: 40px;
                }
                
                .each_rec_id {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_name {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 5px;
                }
                
                .each_rec_followbtn {
                    width: 114px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid black;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 12px;
                }
                
                #line {
                    margin: 0px;
                }
                
                #cate {
                    width: 100%;
                    height: 53px;
                    display: flex;
                    justify-content: center;
                }
                
                .cate_1 {
                    width: 52px;
                    height: 53px;
                    line-height: 53px;
                    font-size: 12px;
                }
                
                .cate_con {
                    float: left;
                    margin-top: 20px;
                }
                
                .category {
                    float: right;
                }
                
                #photo_con {
                    width: 100%;
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-between;
                }
                
                .each_photo {
                    width: 312px;
                    height: 312px;
                    background-color: beige;
                    margin-bottom: 32px;
                    cursor: pointer;
                }
                
                .nocursor {
                    cursor: auto;
                }
                
                .small_con {
                    margin-right: 40px;
                    float: left;
                    font-size: 16px;
                    line-height: 18px;
                }
                
                footer {
                    width: 100%;
                    height: 78px;
                    margin-bottom: 52px;
                    text-align: center;
                }
                
                #post_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 5;
                }
                
                #post_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 6;
                }
                
                #post_con {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 1000px;
                    height: 600px;
                    background: #fff;
                    z-index: 7;
                    text-align: center;
                    font-size: 14px;
                    background: #fff;
                    display: inline;
                }
                
                #for_stay_left {
                    width: 600px;
                    height: 600px;
                    float: left;
                }
                
                #slide_photo_con {
                    max-width: 600px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #photo {
                    /* width: 600px;
                    height: 600px;
                    background-color: beige;
                    float: left; */
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .photo_all {
                    width: 600px;
                    height: 600px;
                    background-color: beige;
                }
                
                #post_right {
                    width: 400px;
                    height: 600px;
                    background-color: green;
                    float: left;
                }
                
                #post_right_top {
                    width: 368px;
                    height: 40px;
                    background-color: white;
                    padding: 16px;
                }
                
                #post_profile_photo {
                    width: 40px;
                    height: 40px;
                    background-color: black;
                    border-radius: 50%;
                    float: left;
                }
                
                #post_profile_id {
                    margin-left: 14px;
                    height: 40px;
                    float: left;
                    font-size: 14px;
                    line-height: 40px;
                }
                
                #followbtn {
                    margin-left: 18px;
                    line-height: 40px;
                    float: left;
                    font-size: 14px;
                    cursor: pointer;
                }
                
                .fa-bars_post {
                    font-size: 16px;
                    float: right;
                    margin-top: 12px;
                }
                
                #post_right_middle {
                    width: 100%;
                    height: 364px;
                    background-color: brown;
                    padding-top: 13px;
                    overflow: auto;
                }
                
                .each_reply_con {
                    padding: 12px 13px 16px 16px;
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_com_con {
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_profile_photo {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    float: left;
                }
                
                .reply_right {
                    margin-left: 18px;
                    min-height: 47px;
                    width: 313px;
                    float: right;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .reply_right_com {
                    margin-left: 18px;
                    min-height: 47px;
                    width: 277px;
                    float: left;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .icon_com {
                    width: 12px;
                    height: 12px;
                    float: right;
                    cursor: pointer;
                }
                
                .icon {
                    width: 24px;
                    height: 24px;
                    float: left;
                    cursor: pointer;
                    margin-right: 16px;
                }
                
                .save_icon {
                    margin: 0px;
                    float: right;
                    background-color: black;
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
                
                .share_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-share-1.svg');
                    background-size: 24px;
                }
                
                .share_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-share.svg');
                    background-size: 24px;
                }
                
                .comment_lcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                    background-size: 12px;
                }
                
                .comment_lcon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                }
                
                .comment_unlcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                    display: none;
                }
                
                .reply_con {
                    width: 313px;
                }
                
                .reply_date {
                    height: 14px;
                    margin-top: 16px;
                }
                
                .rebot {
                    margin-right: 12px;
                    float: left;
                }
                
                .show_re_re {
                    padding: 16px 0px 0px 58px;
                    height: 18px;
                    width: 303px;
                    text-align: left;
                }
                
                #post_right_bottom {
                    width: 100%;
                    height: 151px;
                }
                
                #post_icon_box {
                    width: 368px;
                    height: 32px;
                    padding: 12px 16px 0px 16px;
                }
                
                #post_like {
                    width: 384px;
                    height: 20px;
                    background-color: white;
                    padding: 0px 0px 0px 16px;
                    text-align: left;
                    font-size: 14px;
                    line-height: 20px;
                }
                
                #post_date {
                    width: 384px;
                    height: 19px;
                    margin-top: 4px;
                    background-color: white;
                    font-size: 10px;
                    line-height: 19px;
                    text-align: left;
                    padding: 0px 0px 0px 16px;
                }
                
                #reply_box {
                    width: 368px;
                    height: 37px;
                    margin-top: 8px;
                    background-color: white;
                    padding: 18px 16px 0px 16px
                }
                
                #commentbox {
                    outline: none;
                    border: none;
                    background-color: none;
                    float: left;
                    font-size: 14px;
                    line-height: 18px;
                    width: 343px;
                    padding: 0px;
                }
                
                #sendbtn {
                    float: right;
                    cursor: pointer;
                }
                
                .cancel {
                    position: absolute;
                    right: 0px;
                }
            </style>
        </head>

        <body>
            <div id="post_back"></div>
            <div id="post_modal">
                <div id="post_con" style="display: none;">
                    <div id="for_stay_left">
                        <button type="button" class="slide_btn_prev" class="buttons">Prev</button>
                        <div id="slide_photo_con">
                            <div id="photo"></div>
                        </div>
                        <button type="button" class="slide_btn_next" class="buttons">Next</button>
                    </div>
                    <div id="post_right">
                        <div id="post_right_top">
                            <div id="post_profile_photo">${id_img_fwr.m_img }</div>
                            <div id="post_profile_id">${id_img_fwr.m_id }</div>
                            <c:if test="${id_img_fwr.m_id eq my_name}">
                                <i class="fas fa-bars fa-bars_post"></i>
                            </c:if>
                            <c:if test="${id_img_fwr.m_id ne my_name}">
                                <div id="followbtn">팔로잉</div>
                                <i class="fas fa-bars fa-bars_post"></i>
                            </c:if>
                        </div>
                        <div id="post_right_middle">
                            <div class="each_reply_con">
                                <div class="reply_profile_photo">${id_img_fwr.m_img }</div>
                                <div class="reply_right re_main_con" id="re_main_con">
                                </div>
                                <div class="reply_right" id="hashtag_con">
                                    <a href="#">#해시택,</a>
                                </div>
                            </div>
                            <div class="each_reply_con">
                                <div class="reply_com_con">
                                    <div class="reply_profile_photo"></div>
                                    <div class="reply_right_com">
                                        <div class="reply_con">aaab&nbsp;내용 들어갈 자</div>
                                        <div class="reply_right" id="hashtag_con_reply">
                                            <a href="#">#해시택,</a>
                                        </div>
                                        <div class="reply_date">
                                            <div class=" rebot">2020/01/01</div>
                                            <div class="rebot">좋아요 개</div>
                                            <div class="rebot">답글 달기</div>
                                        </div>
                                    </div>
                                    <i class="fas fa-bars fa-bars_reply_title"></i>
                                    <div class="icon_com like_icon comment_lcon"></div>
                                    <div class="icon_com unlike_icon comment_unlcon"></div>
                                </div>
                                <div class="show_re_re">답글 보기</div>
                            </div>
                        </div>
                        <div id="post_right_bottom">
                            <div id="post_icon_box">
                                <div class="icon like_icon likechk"></div>
                                <div class="icon unlike_icon unlikechk"></div>
                                <div class="icon write_icon"></div>
                                <div class="icon share_icon"></div>
                                <div class="icon save_icon"></div>
                            </div>
                            <div id="post_like"></div>
                            <div id="post_date"></div>
                            <div id="reply_box">
                                <input type="text" id="commentbox" placeholder="댓글 달기..">
                                <div id="sendbtn">게시</div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="button" class="cancel">
            </div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="general_con">
                    <div id="profile_con_top">
                        <div id="profile_photo" onclick="goStory('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                        <input type="hidden" id="storychk" value="${storychk.story }">
                        <div id="profile_left">
                            <div id="profile_left_top_con">
                                <div id="profile_name">${id_img_fwr.m_id }</div>
                                <c:if test="${id_img_fwr.m_id eq my_name}">
                                    <div id="setting" class="profile_btn">프로필 편집</div>
                                    <i class="fas fa-cog setting_icon"></i>
                                </c:if>
                                <c:if test="${id_img_fwr.m_id ne my_name}">
                                    <div id="send_message" class="profile_btn">메시지 보내기</div>
                                    <div id="followchk" class="profile_btn">
                                        <c:if test="${followchk.follow ne 0}">
                                            <i class="fas fa-user-check"></i>
                                        </c:if>
                                        <c:if test="${followchk.follow eq 0}">
                                            팔로우
                                        </c:if>
                                    </div>
                                    <label for="rf">
										<div id="recom_follow" class="profile_btn">
											<i class="fas fa-caret-down"></i>
										</div>
									</label>
                                    <input type="checkbox" id="rf" style="display: none;">
                                    <i class="fas fa-bars setting_icon"></i>
                                </c:if>
                            </div>
                            <div id="profile_middle">
                                <div class="small_con">게시물 ${gboard.post }+${bboard.post }</div>
                                <div class="small_con">팔로워 ${id_img_fwr.follower }</div>
                                <div class="small_con">팔로우 ${fw.follow }</div>
                            </div>
                            <div id="profile_intro">${id_img_fwr.m_intro }</div>
                        </div>
                    </div>
                    <div id="highlight_con">
                        <c:if test="${not empty highlight }">
                            <c:forEach var="vo" items="${highlight }" varStatus="s">
                                <div class="highlight_small_con">
                                    <div class="highlight_photo">${vo.h_img }</div>
                                    <div class="highlight_title">${vo.h_name }</div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="hidden_follow_rec" style="display: none;">
                        <div id="rec_title">
                            <div id="title1">추천계정</div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            <div class="each_rec_con">
                                <div class="each_rec_photo">dd</div>
                                <div class="each_rec_id">ddd</div>
                                <div class="each_rec_name">ddd</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                        </div>
                    </div>
                    <hr id="line">
                    <div id="cate">
                        <c:if test="${id_img_fwr.m_id ne my_name}">
                            <div class="cate_1">
                                <i class="fas fa-border-all cate_con"></i>
                                <div class="category">게시물</div>
                            </div>
                        </c:if>
                        <c:if test="${id_img_fwr.m_id eq my_name}">
                            <div class="cate_1" style="margin-right: 60px;">
                                <i class="fas fa-border-all cate_con"></i>
                                <div class="category">게시물</div>
                            </div>
                            <div class="cate_1">
                                <i class="fas fa-tags cate_con"></i>
                                <div class="category">저장됨</div>
                            </div>
                        </c:if>
                    </div>
                    <div id="photo_con">
                        <c:if test="${not empty showpost }">
                            <c:forEach var="vo" items="${showpost }" varStatus="s">
                                <div class="each_photo" onclick="showpost('${vo.b_id }','${vo.b_type }');">${vo.b_id } ${vo.b_img }</div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <footer> dddd </footer>
        </body>
        <script>
            $(function() {
                var postcount = $(".each_photo").length;
                var forflex = postcount % 3;
                if (forflex == 1) {
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                } else if (forflex == 2) {
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                }
            });

            function goStory(m_id) {
                var storychk = $("#storychk").val();
                if (storychk != 0) {
                    var url = "${pageContext.request.contextPath}/eachstory?id=" + m_id;
                    $(location).attr('href', url);
                } else {}
            }

            function showpost(b_id, b_type) {
                if (b_type == 'G') {
                    $("#post_back").css("display", "block");
                    $("#post_modal").css("display", "block");
                    $("#post_con").css("display", "block");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/showeachpost.do",
                        method: "POST",
                        data: {
                            b_id: b_id
                        },
                        dataType: "json",
                        success: function(data) {
                            console.log(data.showeachpost.b_img);
                            console.log(data.showeachpost.b_content);
                            console.log(data.showeachpost.b_date);
                            console.log(data.showeachpost.likecount);
                            var m_id = data.showeachpost.m_id;
                            var b_date = data.showeachpost.b_date;
                            var likecount = data.showeachpost.likecount;
                            var b_content = data.showeachpost.b_content;
                            var b_img = data.showeachpost.b_img.split(",");
                            for (i = 0; i < b_img.length; i++) {
                                if (b_img[i] != "" && b_img[i] != " ") {
                                    console.log(b_img[i]);
                                    //$("#photo").append('<img class="photo_all" src="${pageContext.request.contextPath}/resources/uploadFiles/' + b_img[i] + '">');
                                    $("#photo").append('<div class="photo_all">' + b_img[i] + '</div>');
                                }
                            }
                            if (b_content == null) {
                                b_content = "";
                                document.getElementById("re_main_con").innerHTML = m_id + "&nbsp;" + b_content;
                            } else {
                                document.getElementById("re_main_con").innerHTML = m_id + "&nbsp;" + b_content;
                            }
                            document.getElementById("post_like").innerHTML = likecount + "명이 좋아합니다";
                            document.getElementById("post_date").innerHTML = b_date;

                            // 게시물 슬라이드
                            var slideWrapper = document.querySelector('#slide_photo_con');
                            var slides = document.querySelectorAll('.photo_all');
                            var totalSlides = slides.length;
                            var sliderWidth = slideWrapper.clientWidth;
                            var slideIndex = 0;
                            var slider = document.querySelector('#photo');
                            slider.style.width = sliderWidth * totalSlides + 'px';

                            function showSlides(n) {
                                slideIndex = n;
                                if (slideIndex == -1) {
                                    slideIndex = totalSlides - 1;
                                } else if (slideIndex === totalSlides) {
                                    slideIndex = 0;
                                }
                                slider.style.left = -(sliderWidth * slideIndex) + 'px';
                            }

                            function plusSlides(n) {
                                showSlides(slideIndex += n);
                            }

                            function currentSlide(n) {
                                showSlides(slideIndex = n);
                            }
                            var nextBtn = document.querySelector('.slide_btn_next');
                            var prevBtn = document.querySelector('.slide_btn_prev');
                            nextBtn.addEventListener('click', function() {
                                plusSlides(1);
                            });
                            prevBtn.addEventListener('click', function() {
                                plusSlides(-1);
                            });
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
                }
            }

            $(".cancel").on('click', function() {
                $("#post_back").css("display", "none");
                $("#post_modal").css("display", "none");
                $("#post_con").css("display", "none");
            });

            $("#rf").change(function() {
                if ($("#rf").is(":checked")) {
                    $("#hidden_follow_rec").css("display", "block");
                } else {
                    $("#hidden_follow_rec").css("display", "none");
                }
            });
        </script>

        </html>