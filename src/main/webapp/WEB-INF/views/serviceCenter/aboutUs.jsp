<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>About TA_IN</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    width: 100%;
                    height: 100%;
                }
                
                #content_con {
                    position: fixed;
                    width: 100%;
                    height: 1200px;
                    background-color: #91d370;
                    background-image: linear-gradient(319deg, #91d370 0%, #bca0ff 37%, #f2cd54 100%);
                    overflow: auto;
                }
                
                #content_big_con {
                    padding: 0px 64px 0px 64px;
                }
                
                #title1 {
                    top: 285px;
                    position: absolute;
                    font-size: 62px;
                    color: white;
                }
                
                #title2 {
                    top: 347px;
                    position: absolute;
                    font-size: 62px;
                    color: white;
                }
                
                #title3 {
                    top: 409px;
                    position: absolute;
                    font-size: 80px;
                    color: white;
                    left: 406px;
                }
            </style>
        </head>

        <body>
            <div id="content_con">
                <div id="content_big_con">
                    <div id="title1">
                        타인과 일상을 공유하다
                    </div>
                    <div id="title2">
                        Share daily life with others
                    </div>
                    <div id="title3">
                        타인 TA_IN
                    </div>
                </div>
            </div>
        </body>

        </html>