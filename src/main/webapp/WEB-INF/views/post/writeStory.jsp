<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>스토리 추가하기</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>

            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #write_stroy_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #write_big_con {
                    width: 1000px;
                    background-color: beige;
                }
                
                #top_menu {
                    width: 100%;
                    height: 54px;
                    background-color: cadetblue;
                }
                
                .tab_menu {
                    width: 333.3px;
                    height: 100%;
                    border-right: 1px solid black;
                    float: left;
                    box-sizing: border-box;
                    cursor: pointer;
                    line-height: 54px;
                    text-align: center;
                }
                
                .tab_menu:nth-of-type(4) {
                    border: none;
                }
                
                #write_main {
                    width: 100%;
                }
            </style>
        </head>

        <body>
            <jsp:include page="header.jsp"></jsp:include>
            <div id="write_stroy_con">
                <div id="write_big_con">
                    <div id="top_menu">
                        <div class="tab_menu">사진 추가</div>
                        <div class="tab_menu">동영상 추가</div>
                        <div class="tab_menu">사진 찍기</div>
                    </div>
                    <div id="write_main">
                        <form action="" method="post" enctype="multipart/form-data">
                            <input type="file" value="사진 추가">
                            <input type="submit" value="스토리 올리기">
                            <input type="button" id="backto_main" value="돌아가기">
                            <input type="hidden" name="m_id" class="m_id" value="${myProfile.m_id }">
                        </form>
                    </div>
                </div>
            </div>
        </body>
        <script>
            $("#backto_main").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine?m_id=" + memId;
                $(location).attr('href', url);
            });
        </script>

        </html>