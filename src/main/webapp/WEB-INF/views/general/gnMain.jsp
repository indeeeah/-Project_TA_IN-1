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
                    background-color: beige;
                    height: 150px;
                }
                
                #profile_photo {
                    width: 150px;
                    height: 150px;
                    background-color: white;
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
                
                #profile_name {
                    height: 40px;
                    width: 100%;
                    font-size: 28px;
                    line-height: 40px;
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
                
                #line {
                    margin-top: 44px;
                }
                
                #cate {
                    width: 100%;
                    height: 53px;
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
            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="general_con">
                    <div id="profile_con_top">
                        <div id="profile_photo" onclick="goStory('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                        <input type="hidden" id="storychk" value="${storychk.story }">
                        <div id="profile_left">
                            <div id="profile_name">${id_img_fwr.m_id }</div>
                            <div id="profile_middle">
                                <div class="small_con">게시물 ${gboard.post }+${bboard.post }</div>
                                <div class="small_con">팔로워 ${id_img_fwr.follower }</div>
                                <div class="small_con">팔로우 ${fw.follow }</div>
                            </div>
                            <div id="profile_intro">${id_img_fwr.m_intro }</div>
                        </div>
                    </div>
                    <div id="highlight_con">
                        <div class="highlight_small_con">
                            <div class="highlight_photo"></div>
                            <div class="highlight_title">ddd</div>
                        </div>
                        <div class="highlight_small_con">
                            <div class="highlight_photo"></div>
                            <div class="highlight_title">ddd</div>
                        </div>
                        <div class="highlight_small_con">
                            <div class="highlight_photo"></div>
                            <div class="highlight_title">ddd</div>
                        </div>
                        <div class="highlight_small_con">
                            <div class="highlight_photo"></div>
                            <div class="highlight_title">ddd</div>
                        </div>
                        <div class="highlight_small_con">
                            <div class="highlight_photo"></div>
                            <div class="highlight_title">ddd</div>
                        </div>
                    </div>
                    <hr id="line">
                    <div id="cate"></div>
                    <div id="photo_con">
                        <c:if test="${not empty showpost }">
                            <c:forEach var="vo" items="${showpost }" varStatus="s">
                                <div class="each_photo">${vo.b_img }</div>
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
                if ($("#storychk") != 0) {
                    var url = "${pageContext.request.contextPath}/eachstory?id=" + m_id;
                    $(location).attr('href', url);
                } else {
                    var url = "${pageContext.request.contextPath}/gnMain?m_id=" + m_id;
                    $(location).attr('href', url);
                }
            }
        </script>

        </html>