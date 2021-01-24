<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 탈퇴하기</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/out.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <input type="hidden" id="m_id" value="${my_name }">
            <div id="content_con">
                <div id="out_big_con">
                    <div id="out_title">계정 삭제</div>
                    <div id="ask_again">TA_IN은 회원님이 원하는 소셜 미디어가 되려고 노력하고 있습니다.</div>
                    <hr>
                    <form id="reason" action="outmember" method="post">
                        <input type="hidden" name="m_id" value="${my_name }">
                        <div id="rs">
                            <div id="out_sub">${my_name }을(를) 삭제하려는 이유가 무엇인가요?</div>
                            <select name="o_reasontx" id="o_reason">
                            <option value="">---</option>
                            <option value="2차 계정을 만들었습니다">2차 계정을 만들었습니다</option>
                            <option value="광고가 너무 많음">광고가 너무 많음</option>
                            <option value="삭제하고 싶은 내용이 있음">삭제하고 싶은 내용이 있음</option>
                            <option value="너무 내용이 많고 산만함">너무 내용이 많고 산만함</option>
                            <option value="팔로우할 사람을 찾을 수 없음">팔로우할 사람을 찾을 수 없음</option>
                            <option value="시작할 때 문제가 있음">시작할 때 문제가 있음</option>
                            <option value="개인 정보 보호 문제">개인 정보 보호 문제</option>
                        </select>
                        </div>

                        <div id="nonecon" style="display:none;">
                            <div id="chkps">
                                <div id="pswd">비밀번호를 다시 입력하세요</div>
                                <input type="password" id="pw" required>
                                <input type="button" id="pchk" value="비밀번호 체크" required>
                            </div>
                            <div id="ask">
                                <a href="#">비밀번호를 잊으셨나요?</a>
                            </div>
                            <div id="chkdate">
                            </div>
                            <hr>
                            <div id="for_flex" style="display:none;">
                                <input type="submit" id="sub" value="${my_name } 삭제">
                            </div>
                            <div id="chkdatee" style="display:none;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </body>
        <script>
            var memId = $("#m_id").val();
            $(function() {
                $("#o_reason").change(function() {
                    $("#nonecon").css("display", "block");
                    var state = $("#o_reason option:selected").val();
                    if (state == "기타") {

                    }
                });
                var today = new Date();
                console.log(today);
                //today.setDate(today.getDate() + 3);

                var a = document.getElementById("chkdate");
                var b = document.getElementById("chkdatee");
                var htmls = "";
                var htmls2 = "";
                htmls += '<div id="dates" style="color:#262626;">계속하면 회원님의 프로필과 계정 상세 정보가 TA_IN에서 삭제됩니다. 탈퇴를 진행하시면 회원님의 모든 게시글과 댓글은 복구할 수 없습니다.</div>';
                htmls2 += '<div id="dates2" style="color:#262626;">삭제를 클릭하시면 회원님의 프로필과 계정 상세 정보는 ' + today + '에 삭제되며 모든 게시글과 댓글은 복구할 수 없습니다.</div>';
                $(a).html(htmls);
                $(b).html(htmls2);

            });
            $("#pchk").on('click', function() {

                var pw = $("#pw").val();
                $.ajax({
                    url: "chkpwd.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        m_id: memId,
                        m_pw: pw
                    },
                    success: function(resp) {
                        console.log(resp);
                        if (resp == 0) {
                            alert("비밀번호를 다시 입력해주세요.")
                            $("#pw").val('');
                            $("#for_flex").css("display", "none");
                            $("#chkdatee").css("display", "none");
                        } else if (resp > 0) {
                            $("#for_flex").css("display", "flex");
                            $("#chkdatee").css("display", "block");
                        }
                    }
                });
            });
        </script>

        </html>