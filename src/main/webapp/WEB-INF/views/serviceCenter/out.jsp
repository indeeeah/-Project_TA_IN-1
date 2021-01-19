<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 탈퇴하기</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                    color: #262626;
                    background-color: #FAFAFA;
                }
                
                #content_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #out_big_con {
                    width: 926px;
                    height: 800px;
                    border: 1px solid #C7C7C7;
                    padding: 32px 40px 0px 32px;
                }
                
                #out_title {
                    margin-bottom: 25px;
                    font-size: 36px;
                }
                
                #ask_again {
                    font-size: 14px;
                    color: #222222;
                    line-height: 20px;
                    margin-bottom: 10px;
                }
                
                #rs,
                #chkps,
                #chkdate,
                #chkdatee {
                    width: 926px;
                    height: 60px;
                }
                
                #out_sub,
                #pswd {
                    margin-top: 40px;
                    font-size: 14px;
                    line-height: 20px;
                    color: #222222;
                    width: 330px;
                    float: left;
                }
                
                #o_reason,
                #pw,
                #pchk {
                    margin-top: 40px;
                    float: left;
                }
                
                #ask,
                #dates,
                #dates2 {
                    margin-top: 20px;
                    font-size: 14px;
                    line-height: 20px;
                    color: rgb(63, 114, 155);
                    text-decoration: none;
                    width: 926px;
                    margin-bottom: 40px;
                }
                
                #for_flex {
                    display: flex;
                    justify-content: center;
                }
                
                #sub {
                    margin-top: 20px;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <input type="hidden" id="m_id" value="${my_name }">
            <div id="content_con">
                <div id="out_big_con">
                    <div id="out_title">계정 삭제</div>
                    <div id="ask_again">TA_IN은 회원님이 원하는 소셜 미디어가 되려고 노력하고 있습니다.</div>
                    <hr>
                    <form id="reason">
                        <div id="rs">
                            <div id="out_sub">${my_name }을(를) 삭제하려는 이유가 무엇인가요?</div>
                            <select name="o_reason" id="o_reason">
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
                            <div id="for_flex" style="display:none;" >
                                <input type="submit" id="sub" value="${my_name } 삭제">
                            </div>
                            <div id="chkdatee" style="display:none;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
                today.setDate(today.getDate() + 3);

                var a = document.getElementById("chkdate");
                var b = document.getElementById("chkdatee");
                var htmls = "";
                var htmls2 = "";
                htmls += '<div id="dates" style="color:#262626;">계속하면 회원님의 프로필과 계정 상세 정보가 ' + today + '에 삭제됩니다. 지금부터 그때까지 회원님은 TA_IN에 표시되지 않습니다. 생각이 바뀌면 삭제 날짜 전에 다시 로그인하여 계정을 유지할 수 있습니다.</div>';
                htmls2 += '<div id="dates2" style="color:#262626;">회원님의 프로필과 계정 상세 정보는 ' + today + '까지 숨겨지며 해당 날짜에 삭제됩니다.</div>';
                $(a).html(htmls);
                $(b).html(htmls2);
                
            });
            $("#pchk").on('click', function(){
            	
            	var pw = $("#pw").val();
            	$.ajax({
                    url: "chkpwd.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        m_id:memId,
                        m_pw : pw
                    },
                    success: function(resp) {
                    	console.log(resp);
                    	if(resp==0){
                    		alert("비밀번호를 다시 입력해주세요.")
                    		$("#pw").val('');
                    		$("#for_flex").css("display", "none");
                    		$("#chkdatee").css("display", "none");
                    	} else if(resp>0){
                    		$("#for_flex").css("display", "flex");
                    		$("#chkdatee").css("display", "block");
                    	}
                    }
                });
            });
            
        </script>

        </html>