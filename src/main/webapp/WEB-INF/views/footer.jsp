<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                footer {
                    width: 100%;
                    height: 110px;
                    text-align: center;
                    padding-top: 20px;
                }
                
                .footera {
                    font-size: 12px;
                    text-decoration: none;
                    color: #8E8E8E;
                    line-height: 21px;
                    margin-bottom: 12px;
                }
            </style>
        </head>

        <body>
            <footer>
                <a class="footera" href="${pageContext.request.contextPath}/serviceCenter">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                <a class="footera" href="${pageContext.request.contextPath}/aboutUs">사이트
                    소개&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                <a class="footera" href="#" onclick="logout('${my_name }');">로그아웃</a>
                <c:if test="${not empty my_name }">
                    <div class="footera">© 2020 TA_IN</div>
                    <div class="footera">
                        <a class="footera" href="https://github.com/JeongWoonJin">정운진&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                        <a class="footera" href="https://github.com/jiyong26">김지용&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                        <a class="footera" href="https://github.com/tae85">김경태&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                        <a class="footera" href="https://github.com/indeeeah">김수민&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                        <a class="footera" href="https://github.com/kwakej/Spring-project">곽은지</a>
                    </div>
                </c:if>

            </footer>
        </body>
        <script>
            //로그아웃
            function logout(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/member/logout.do",
                    method: "POST",
                    data: {
                        m_id: id
                    },
                    success: function(data) {
                        console.log("success");
                        alert(data);
                        var url = "${pageContext.request.contextPath}/member/loginPage";
                        $(location).attr('href', url);
                    },
                    error: function(request, status, error) {
                        console.log("error");
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
        </script>

        </html>