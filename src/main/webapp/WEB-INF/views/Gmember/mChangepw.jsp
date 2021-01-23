<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link href="${pageContext.request.contextPath}/resources/css/mManage.css" rel="stylesheet" type="text/css" />
                        <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <title>계정 관리</title>
            <style>
                body {
                    text-align: center;
                    margin: 0;
                    color: #262626;
                    background-color: #FAFAFA;
                }
                
                #mManage {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #sc_big_con {
                    width: 1000px;
                    background-color: white;
                }
                
                #sc_con {
                    width: 998px;
                    height: 798px;
                    border: 1px solid #C7C7C7;
                    border-top: none;
                }
                
                #menu {
                    float: left;
                    width: 260px;
                    margin: 0 auto;
                }
                
                #menulist {
                    list-style: none;
                    margin: 0 auto;
                    padding-left: 0;
                    width: 260px;
                    border-right: 1px solid #C7C7C7;
                    height: 798px;
                }
                
                #menulist>li {
                    width: 228px;
                    height: 21px;
                    padding: 16px 16px 16px 16px;
                    font-size: 14px;
                    line-height: 21px;
                    cursor: pointer;
                    text-align: left;
                }
                
                #menulist>li>a {
                    color: black;
                    text-decoration: none;
                }
                
                #menulist>li:hover {
                    background-color: #F6F6F6;
                    border-left: 2px solid #D5D5D5;
                }
                
                #contents {
                    display: inline-block;
                    width: 705px;
                    text-align: center;
                    margin: 0 auto;
                    display: flex;
                    justify-content: center;
                }
                
                
                td {
                    vertical-align: middle !important;
                    text-align: left;
                    font-size: 14px;
                }
                
                button:focus {
                    border: none;
                    outline: none;
                }
                
                #sc_title {
                    padding: 20px 16px 20px 16px;
                    width: 966px;
                    height: 20px;
                    color: #999999;
                    font-size: 16px;
                    line-height: 20px;
                    border: 1px solid #C7C7C7;
                    text-align: left;
                }
                
                .btn2 {
                    height: 30px;
                    border: none;
                    margin-top: 15px;
                    margin-bottom: 10px;
                    cursor: pointer;
                    outline: none;
                    font-size: 13px;
                    border-radius: 5px;
                }
                
                .wcon {
                    outline: none;
                    border: 1px solid #C7C7C7;
                    height: 30px;
                    padding: 0px 2px 0px 2px;
                    box-sizing: border-box;
                    width:187px;
                }
                a{
                	padding:15px 85px 15px 0 !important; 
                }
                #changepw{
               	width:526px;
                }
            </style>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
        </head>
        <script>
            $(document).ready(function() {
                $("#lastpw").keyup(function() {
                    var m_pw = "${profile.m_pw}";
                    if ($("#lastpw").val() == m_pw) {
                        $("#checklastpwinfo").css("color", "green");
                        $("#checklastpwinfo").html("일치합니다.");
                    } else {
                        $("#checklastpwinfo").css("color", "red");
                        $("#checklastpwinfo").html("다시 확인해주세요.");
                    }
                });

                $("#checknewpw").keyup(function() {
                    if ($("#newpw").val() == $("#checknewpw").val()) {
                        $("#checknewpwinfo").css("color", "green");
                        $("#checknewpwinfo").html("일치합니다.");
                    } else {
                        $("#checknewpwinfo").css("color", "red");
                        $("#checknewpwinfo").html("다시 확인해주세요.");
                    }
                });

                $("#newpw").keyup(function() {
                    if ($("#newpw").val() == $("#checknewpw").val()) {
                        $("#checknewpwinfo").css("color", "green");
                        $("#checknewpwinfo").html("일치합니다.");
                    } else {
                        $("#checknewpwinfo").css("color", "red");
                        $("#checknewpwinfo").html("다시 확인해주세요.");
                    }
                });

                $("#submit").click(function() {
                    if ($("#checklastpwinfo").html() == "일치합니다.") {
                        if ($("#checknewpwinfo").html() == "일치합니다.") {
                            return true;
                        } else {
                            alert("새 비밀번호를 확인해주세요.");
                            $("#checknewpw").val("");
                            $("#newpw").val("");
                            $("#newpw").focus();
                            return false;
                        }
                    } else {
                        alert("이전 비밀번호를 확인해주세요.");
                        $("#lastpw").val("");
                        $("#lastpw").focus();
                        return false;
                    }
                });
            });
        </script>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="mManage">
                <div id="sc_big_con">
                    <div id="sc_title">비밀번호 변경</div>
                    <div id="sc_con">
                        <div id="menu">
                            <ul id="menulist">
						<li onclick="location.href='mManage.do'">프로필 편집</li>
						<li style="border-left: 2px solid black;" onclick="location.href='mChangepw.do'"><span
							style="font-weight: bold;">비밀번호 변경</span></li>
						<li onclick="location.href='mCart.do'">장바구니</li>
						<li onclick="location.href='mBuylist.do'">구매목록</li>
						<li onclick="location.href='mLikelist.do'">내가 누른 좋아요 조회</li>
						<li onclick="location.href='mBusiness.do'">비즈니스 계정</li>
					</ul>
                        </div>
                        <div id="contents" style="padding-top: 30px;">
                            <form id="changepw" method="post" action="changepw.do" style="padding-bottom: 30px; padding-top: 30px;">
                                <table id="profiletable" style="margin: 0 auto;">
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td style="font-size: 14px;" width="40%">이전 비밀번호</td>
                                        <td><input class="wcon" width="40%" type="password" id="lastpw" name="lastpw" required><label style="display:none;" id="checklastpwinfo"></label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td style="font-size: 14px;" width="40%">새 비밀번호</td>
                                        <td><input class="wcon" width="40%" type="password" id="newpw" name="newpw" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="register" height="30">
                                        <td style="font-size: 14px;" width="40%">새 비밀번호 확인</td>
                                        <td><input class="wcon" width="40%" type="password" id="checknewpw" name="checknewpw" required><label style="display:none;" id="checknewpwinfo"></label></td>
                                    </tr>
                                    <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                </table>
                                <br><input type="submit" class="btn2" style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;" id="submit" value="저장">&nbsp;&nbsp;&nbsp;
                                <input type="button" class="btn2" style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;" color: white;" value="취소" onclick="location.href='mChangepw.do'">
                            </form>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </body>

        </html>