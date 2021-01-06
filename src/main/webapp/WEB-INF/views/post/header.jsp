<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                #header {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    position: fixed;
                    border-bottom: 0.5px solid black;
                    background-color: white;
                }
                
                #big_con {
                    width: 1000px;
                }
                
                #header_con {
                    height: 54px;
                }
                
                #alert_con {
                    width: 500px;
                    top: 54px;
                    float: right;
                    z-index: 5;
                }
                
                #chk_my_follower {
                    width: 100%;
                    height: 65px;
                    background-color: crimson;
                }
            </style>
        </head>

        <body>
            <header id="header">
                <div id="big_con">
                    <div id="header_con">
                        <div id="header_left">
                            <div id="fix_logo"></div>
                            <input type="hidden" name="m_id" class="m_id" value="${myProfile.m_id }">
                        </div>
                        <input type="text" id="search" placeholder="검색" style="text-align: center;">
                        <div id="header_right">
                            <div id="header_icon_con">
                                <div id="fix_home" class="fix_icon"><i class="fas fa-home"></i></div>
                                <div id="fix_message" class="fix_icon"><i class="fas fa-comment-dots"></i></div>
                                <div id="fix_alert" class="fix_icon"><i class="fas fa-bell"></i></div>
                                <div id="fix_bag" class="fix_icon"><i class="fas fa-shopping-bag"></i></div>
                                <div id="fix_profile" class="fix_icon"><i class="fas fa-user-circle"></i></div>
                            </div>
                        </div>
                    </div>
                    <div id="alert_con">
                        <div id="chk_my_follower"></div>
                    </div>
                </div>
            </header>
            <div id="forheader"></div>
        </body>
        <script type="text/javascript">
            $(function() {
                $("#search").autocomplete({
                    source: function(request, response) {
                        var request = $("#search").val();
                        console.log(request);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/autocomplete.do",
                            type: "post",
                            dataType: "json",
                            data: {
                                word: request
                            },
                            success: function(data) {
                                console.log(data);
                                console.log(data[0].word);
                                value1 = data[0].word;
                                console.log(value);
                                var value = new Array();
                                for (var i = 0; i < data.length; i++) {
                                    value.push(data[i].word)
                                }
                                response(
                                    $.map(value, function(item) {
                                        return {
                                            //label: item+"label",    
                                            value: item,
                                            test: item + "test"
                                        }
                                    })
                                )
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
                });
            });
            $("#fix_logo").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine?m_id=" + memId;
                $(location).attr('href', url);
            });
            $("#fix_home").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine?m_id=" + memId;
                $(location).attr('href', url);
            });

            $("#search").on("keypress", function(event) {
                if (window.event.keyCode == 13) {
                    var at = "@";
                    var memId = $(".m_id").val();
                    var hashtag = $("#search").val();
                    if (hashtag.startsWith(at)) {

                    } else {
                        hashtag = hashtag.replace(/[#]/g, '')
                        var url = "${pageContext.request.contextPath}/explore?hashtag=" + hashtag + "&&m_id=" + memId;
                        $(location).attr('href', url);

                    }
                }
            });
        </script>

        </html>