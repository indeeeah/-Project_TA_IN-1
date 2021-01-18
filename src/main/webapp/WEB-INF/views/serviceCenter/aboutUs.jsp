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
                
                #intro1{
                top: 545px;
                position: absolute;
                color:white;
                font-size:15px;
                line-height:21px;
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
                    <div id="intro1">
                    	소셜 미디어는 뺄 수 없는 일상의 한 부분이 되었습니다.<br>
                    	우리는 오늘 입은 옷을 공유하고, 먹은 것, 보고 느낀 것을 공유합니다.<br>
                    	코로나 시대로 외출이 힘들어짐에 따라 웹캠 사용도 늘어가고 있습니다.<br>
                    	TA_IN에서는 모바일(모바일용 추후 업데이트 예정)뿐만 아니라 컴퓨터에서도 웹캠으로 사진을 찍고, 편집하여 일상을 바로 공유할 수 있습니다.<br>
                    	또한 간편한 프로페셔널 계정 전환으로 내 상품을 판매하고 고객과의 소통도 멈추지 마세요.
                    </div>
                </div>
            </div>
        </body>

        </html>