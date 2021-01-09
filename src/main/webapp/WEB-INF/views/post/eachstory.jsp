<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 스토리</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #story_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                    height: 800px;
                }
                
                #story_big_con {
                    width: 1000px;
                    max-height: 98%;
                    margin-top: 1%;
                    margin-bottom: 1%;
                }
                
                #show_story {
                    max-width: 1000px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #story {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                
            </style>
        </head>

        <body>
            <jsp:include page="header.jsp"></jsp:include>
            <div id="story_con">
                <div id="story_big_con">
                    <div id="show_story">
                        <div id="story">
                            <c:if test="${not empty eachstory}">
                                <c:forEach var="vo" items="${eachstory}" varStatus="s">
                                    <div class="story_photo_con">${vo.m_id}
                                    <br> ${vo.s_img}</div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>