<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>About TA_IN</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/aboutUs.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
            <style>

            </style>
        </head>

        <body>
            <div id="content_con">
                <i class="fas fa-arrow-left"></i>
            </div>
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
                    소셜 미디어는 뺄 수 없는 일상의 한 부분이 되었습니다.<br> 우리는 오늘 입은 옷을 공유하고, 먹은 것, 보고 느낀 것을 공유합니다.<br> 코로나 시대로 외출이 힘들어짐에 따라 웹캠 사용도 늘어가고 있습니다.<br> TA_IN에서는 모바일(모바일용 추후 업데이트 예정)뿐만 아니라 컴퓨터에서도 웹캠으로 사진을 찍고, 편집하여 일상을 바로 공유할 수 있습니다.
                    <br> 또한 간편한 프로페셔널 계정 전환으로 내 상품을 판매하고 고객과의 소통도 멈추지 마세요.
                </div>
            </div>
            <div id="big_con">
                <div id="con">
                    <div id="title">
                        Introduce <br>TA_IN Developer
                    </div>
                    <div id="top">
                        <div class="each">
                            <div class="photo" id="p1">
                                <a href="https://github.com/JeongWoonJin"><img class="photo2" src="${pageContext.request.contextPath}/resources/images/KakaoTalk_Photo_2021-01-21-09-10-57.jpeg"></a><a href="https://github.com/JeongWoonJin" class="name">정운진</a></div>
                        </div>
                        <div class="each">
                            <div class="photo" id="p4">
                                <a href="https://github.com/indeeeah"><img class="photo2" src="${pageContext.request.contextPath}/resources/images/KakaoTalk_Photo_2021-01-22-01-31-30.jpeg"></a><a href="https://github.com/indeeeah" class="name">김수민</a></div>
                        </div>
                        <div class="each">
                            <div class="photo" id="p5">
                                <a href="https://github.com/kwakej/Spring-project"><img class="photo2" src="${pageContext.request.contextPath}/resources/images/KakaoTalk_Photo_2021-01-21-09-11-00.jpeg"></a><a href="https://github.com/kwakej/Spring-project" class="name">곽은지</a></div>
                        </div>
                    </div>
                    <div id="bottom">
                        <div class="each">
                            <div class="photo" id="p2">
                                <a href="https://github.com/jiyong26"><img class="photo2" src="${pageContext.request.contextPath}/resources/images/KakaoTalk_Photo_2021-01-21-09-10-41.jpeg"></a><a href="https://github.com/jiyong26" class="name">김지용</a></div>
                        </div>
                        <div class="each">
                            <div class="photo" id="p3">
                                <a href="https://github.com/tae85"><img class="photo2" src="${pageContext.request.contextPath}/resources/images/KakaoTalk_Photo_2021-01-21-09-10-48.jpeg"></a><a href="https://github.com/tae85" class="name">김경태</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <script>
            $(".fa-arrow-left").on('click', function() {
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });
        </script>

        </html>