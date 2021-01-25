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
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap" rel="stylesheet">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <header id="header">
                <div id="big_con">
                    <div id="header_con">
                        <div id="header_left">
                            <div id="fix_logo">TA_IN</div>
                            <input type="hidden" name="m_id" class="m_id" value="${my_name }">
                            <input type="hidden" name="alarmcheck" id="alarmcheck" value="${alarmcheck }">
                        </div>
                        <input type="text" id="search" placeholder="검색" style="text-align: center;">
                        <div id="header_right">
                            <div id="header_icon_con">
                                <div id="fix_home" class="fix_icon"><i class="fas fa-home"></i></div>
                                <div id="fix_write" class="fix_icon"><i class="fas fa-arrow-circle-up"></i></div>
                                <div id="fix_message" class="fix_icon">
                                    <i class="fas fa-comment-dots"></i>
                                    <div id="circle1" class="circle1" style="<c:if test="${messagecheck ne null}">display:block;</c:if>
								<c:if test="${messagecheck eq null}">display:none;</c:if>position:relative;right:4px;top:10px;background-color: #ED4956; width: 5px; height: 5px;
            border-radius: 75px; text-align: center; margin: 0 auto; font-size: 12px; vertical-align: middle;
            line-height: 150px;"></div>
                                </div>
                                <label for="alert" style="cursor: pointer;">
                                    <div id="fix_alert" class="fix_icon" onclick="turny('${my_name}');">
                                        <i class="fas fa-bell"></i>
                                        <div id="circle2" class="circle2" style="display:none;position:relative;right:4px;top:10px;background-color: #ED4956; width: 5px; height: 5px;
            border-radius: 75px; text-align: center; margin: 0 auto; font-size: 12px; vertical-align: middle;
            line-height: 150px;"></div>
                                    </div>
                                </label>

                                <input type="checkbox" id="alert" style="display:none;">
                                <div id="fix_bag" class="fix_icon"><i class="fas fa-shopping-bag"></i></div>
                                <div id="fix_profile" class="fix_icon"><i class="fas fa-user-circle"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div id="alert_con">
                <div>
                    <c:if test="${not empty chkfollow }">
                        <div class="chk_my_follower">
                            <c:forEach var="vo" items="${chkfollow }" varStatus="s">
                                <div class="fo_con">
                                    <img src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.m_img }" class="fo_photo fo_photo${vo.id }">
                                    <div class="fo_id fo_id${vo.id }">${vo.id }</div>
                                    <%-- <div class="fo_id">${vo.id }
                                </div> --%>
                                        <input type="hidden" class="fo_act fo_act${vo.id }" onclick="showfollowchk('${vo.id }', '${vo.m_activity }');" value="${vo.m_activity }">
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <!-- 아래에 실시간 알림 -->
                    <c:if test="${not empty shownotice }">
                    <div class="hck_con">
                    <c:forEach var="vo" items="${shownotice }" varStatus="s">
                    	<div class="chk_my_follower2" onclick="goEachProf('${vo.m_id }');" style="cursor:pointer;">
                    	<img src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.m_img }" class="fo_photo2 fo_photo${vo.m_id }">
                    	<div class="alert_cont alert_text">${vo.n_contents }</div>
                    	</div>
                    	</c:forEach>
                    </div>
                    </c:if>
                </div>
            </div>
            <div id="forheader"></div>
        </body>
        <script>
            $(document).ready(function() {
                var socket = null;

                function connect() {
                    var ws = new WebSocket(
                        "ws://localhost:8090/tain/replyEcho?ID=${my_name}");
                    socket = ws;

                    //접속 처리
                    ws.onopen = function() {
                        console.log('Info: connection opened.');
                    };

                    //메시지 처리
                    ws.onmessage = function(event) {
                        console.log("ReceiveMessage : ", event.data + '\n');
                        var arr = [];
                        arr = event.data.split(",");
                        var id = arr[0];
                        var msg = arr[1];
                        if (msg == "!Alarm") {
                            $(".circle2").css("display", "block");
                        }
                        if (msg != "!Alarm") {
                            $(".circle1").css("display", "block");
                        }
                    };

                    //접속 끊겼을때
                    ws.onclose = function(event) {
                        console.log('Info: connection closed.');
                        //setTimeout(function(){connect();}, 1000);   // retry connection!!
                    };
                    ws.onerror = function(err) {
                        console.log('Err:', err);
                    };

                }

                connect();

                //댓글등록 버튼, 팔로우 버튼, 좋아요버튼
                $('.socket').on('click', function(evt) {
                    evt.preventDefault();
                    if (socket.readyState !== 1)
                        return;
                    var id = "${my_name}"; //내 아이디
                    var msg = "!Alarm";
                    var toid = $("#toid").val(); //알림을 받을 사람 아이디
                    var date = new Date;
                    var year = date.getFullYear();
                    var month = date.getMonth();
                    var day = date.getDate();
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var seconds = date.getSeconds();
                    socket.send(id + "," + toid + "," + msg + "," + year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds);
                });
            });
        </script>
        <script type="text/javascript">
            var memId = $(".m_id").val();
            var alarmcheck = $("#alarmcheck").val();
            console.log("alarmcheck : " + alarmcheck);
            if (alarmcheck > 0) {
                $("#circle2").css("display", "block");
            }
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

                $("#alert").change(function() {
                    if ($("#alert").is(":checked")) {
                        $("#alert_con").css("display", "flex");
                    } else {
                        $("#alert_con").css("display", "none");
                    }
                });

                $(".fo_act").trigger('click');

            });
            $("#fix_logo").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });
            $("#fix_home").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });
            $("#fix_message").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/chatlist.do";
                $(location).attr('href', url);
            });
            $("#fix_write").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/gnWrite";
                $(location).attr('href', url);
            });
            $("#fix_bag").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/mCart.do";
                $(location).attr('href', url);
            });
            $("#fix_profile").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + memId;
                $(location).attr('href', url);
            });

            $("#search").on("keypress", function(event) {
                if (window.event.keyCode == 13) {
                    var at = "@";
                    var hashtag = $("#search").val();
                    if (hashtag.startsWith(at)) {
                        hashtag = hashtag.replace(/[@]/g, '');

                        $.ajax({
                            url: "${pageContext.request.contextPath}/showMemberType.do",
                            type: "post",
                            data: {
                                m_id: hashtag
                            },
                            success: function(data) {
                                console.log(data);
                                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + hashtag;
                                $(location).attr('href', url);
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
                    } else {
                        hashtag = hashtag.replace(/[#]/g, '');
                        var url = "${pageContext.request.contextPath}/explore?hashtag=" + hashtag;
                        $(location).attr('href', url);

                    }
                }
            });

            function showfollowchk(id, m_activity) {
                if (m_activity == 1) {
                    $(".fo_id" + id).css("color", "#262626");
                }
            }

            function turny(my_name) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/turny.do",
                    type: "post",
                    data: {
                        m_id: my_name
                    },
                    success: function(data) {
                        console.log(my_name);
                        console.log("success turn to Y");
                        console.log(data);
                        $("#circle2").css("display", "none");
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
            
            function goEachProf(m_id){
            	var url = "${pageContext.request.contextPath}/gnMain?m_id=" + m_id;
                $(location).attr('href', url);
            }
        </script>

        </html>