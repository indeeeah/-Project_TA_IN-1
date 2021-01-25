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
                }
                
                
                td {
                    vertical-align: middle !important;
                    text-align: left;
                    font-size: 14px;
                }
                
                #imgmanageModal {
                    width: 400px;
                    height: 222px;
                    display: none;
                    position: fixed;
                    left: 50%;
                    top: 50%;
                    transform: translate(-50%, -50%);
                    background: white;
                }
                
                #parentModal {
                    background: black;
                    opacity: 0.5;
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    margin: 0;
                    z-index: 7;
                }
                
                #imgmanageModal {
                    z-index: 7;
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
                }
            </style>

            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        </head>
        <script>
            $(document).ready(function() {
                $("#changeimg").click(function() {
                    $("#imgmanageModal").css("display", "block");
                    $("#parentModal").css("display", "block");
                });
                $("#parentModal").click(function() {
                    $("#imgmanageModal").css("display", "none");
                    $("#parentModal").css("display", "none");
                });
                $("#imgdelete").click(function() {
                    $("#imgmanageModal").css("display", "none");
                    $("#parentModal").css("display", "none");
                });
                $("#clear").click(function() {
                    $("#imgmanageModal").css("display", "none");
                    $("#parentModal").css("display", "none");
                });

                $("#imgupload").click(function() {
                    if ($("#imgfile").val() == null) {
                        $("#imgmanageModal").css("display", "block");
                        $("#parentModal").css("display", "block");
                    } else {
                        $("#imgmanageModal").css("display", "none");
                        $("#parentModal").css("display", "none");
                    }
                });

                $("#changeemail").click(function() {
                    if ($("#changeemail").val() == "이메일 변경하기") {
                        $("#changeemail").attr("value", "취소");
                        $("#emailchk").css("display", "inline-block");
                        $("#emailcheck").attr("value", "N");
                        $("#email").attr("readonly", false);
                        $("#email").css("border-style", "solid");
                    } else {
                        $("#changeemail").attr("value", "이메일 변경하기");
                        $("#emailchk").css("display", "none");
                        $("#emailcheck").attr("value", "Y");
                        $("#email").attr("readonly", true);
                        $("#email").css("border-style", "none");
                    }
                });

            });

            function checkemail() {
                var email = $("#email").val();
                $.ajax({
                    url: "checkEmail.do",
                    type: "post",
                    data: {
                        'email': email
                    },
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    dataType: "json",
                    async: true,
                    success: function(result) {
                        console.log(result.check);
                        var chk = result.check;
                        if (chk == "F") {
                            alert("이미 사용중인 이메일 입니다.");
                            $("#emailcheck").attr("value", "N");
                        } else if (chk == "T") {
                            alert("사용 가능한 이메일 입니다.");
                            $("#emailcheck").attr("value", "Y");
                            return false;
                        }
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" +
                            request.responseText + "\n" + "error:" + error);
                    }
                });
            }

            function updatepimg() {
                $("#updatepimg").attr("action", "updateProfileImg.do");
                $("#updatepimg").submit();
            }

            function deleteProfileImg() {
                $("#updatepimg").attr("action", "deleteProfileImg.do");
                $("#updatepimg").submit();
            }

            function updatecheck() {
                var update = $("#emailcheck").val();
                if (update == "N") {
                    alert("이메일 중복확인 해주세요.");
                    return false;
                } else {
                    $("#editProfile").attr("action", "updateProfile.do");
                    $("#editProfile").submit();
                }
            }

            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' &&
                                /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' &&
                                data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', ' +
                                    data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample6_extraAddress").value = extraAddr;

                        } else {
                            document.getElementById("sample6_extraAddress").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode;
                        document.getElementById("sample6_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").value = "";
                        document.getElementById("sample6_detailAddress")
                            .focus();
                    }
                }).open();
            }
        </script>

        <body>
            <div id="parentModal"></div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="imgmanageModal" style="border-radius: 0.5em; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;">
                <form id="updatepimg" method="post" enctype="multipart/form-data">
                    <h3 style="margin-top: 22px; margin-bottom: 22px;">프로필 사진 바꾸기</h3>
                    <hr style="color: #D5D5D5;">
                    <label for="upfile" id="imgupload" style="display: inline-block; width: 100%; padding: 10px 0 10px 0; border-style: none; background: white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer">사진
						업로드</label> <input id="upfile" type="file" name="upfile" accept="image/gif, image/jpeg, image/png" onchange="updatepimg()" style="display: none;">
                    <hr style="color: #D5D5D5;">
                    <input type="button" id="imgdelete" style="width: 100%; height: 36px; border-style: none; background: white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer; outline:none;" value="프로필 사진 삭제" onclick="deleteProfileImg()">
                    <hr style="color: #D5D5D5;">
                    <input type="button" id="clear" style="width: 100%; height: 36px; border-style: none; background: white; color: black; font-size: 12pt; font-weight: bold; cursor: pointer; outline:none;" value="취소">
                </form>
            </div>
            <div id="mManage">
                <div id="sc_big_con">
                    <div id="sc_title">회원정보 수정</div>
                    <div id="sc_con">
                        <div id="menu">
                            <ul id="menulist">
						<li style="border-left: 2px solid black;" onclick="location.href='mManage.do'"><span
							style="font-weight: bold;">프로필 편집</span></li>
						<li onclick="location.href='mChangepw.do'">비밀번호 변경</li>
						<li onclick="location.href='mCart.do'">장바구니</li>
						<li onclick="location.href='mBuylist.do'">구매목록</li>
						<li onclick="location.href='mLikelist.do'">내가 누른 좋아요 조회</li>
						<li onclick="location.href='mBusiness.do'">비즈니스 계정</li>
					</ul>
                        </div>
                        <div id="contents" style="padding-top: 30px;">
                            <form id="editProfile" name="myForm" method="post" style="padding-bottom: 30px; padding-top: 30px;">
                                <table id="profiletable" style="margin: 0 auto;">
                                    <tbody>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%"><img src="${pageContext.request.contextPath}/resources/uploadFiles/${profile.m_img}" style="width: 50px; height: 50px; vertical-align: middle; border-radius:50%; border: 1px solid #C7C7C7;">
                                            </td>
                                            <td>${profile.m_id }<br> <label id="changeimg" style="color: rgb(0, 149, 246); font-size: 10pt; cursor: pointer;">프로필
													사진 바꾸기</label><br></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">회원 ID</td>
                                            <td><input class="wcon" type="text" id="id" name="m_id" required readonly value="${profile.m_id}" style="border-style: none;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">이 름</td>
                                            <td><input class="wcon" type="text" id="m_name" name="m_name" required value="${profile.m_name}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">휴대전화</td>
                                            <td><input class="wcon" type="text" id="userphone" name="m_phone" value="${profile.m_phone}" required></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">이메일</td>
                                            <td><input class="wcon" type="email" id="email" name="m_email" value="${profile.m_email}" required readonly style="border-style: none"><input type="text" id="emailcheck" name="emailcheck" value="Y" style="display: none;">&nbsp;
                                                <input type="button" id="emailchk" class="btn2" value="중복체크" style="display: none; background: white;border: 1px solid #D5D5D5; color: rgb(0, 149, 246);" onclick="checkemail()">&nbsp;
                                                <input type="button" id="changeemail" value="이메일 변경하기" class="btn2" style="background: white; border: 1px solid #D5D5D5;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">생년월일</td>
                                            <td><input class="wcon" type="date" id="userbirth" name="m_birth" style="width: 56%;" value="${profile.m_birth}" required></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">주소</td>
                                            <td><input class="wcon" type="text" name="m_addr1" id="sample6_postcode" placeholder="우편번호" value="${profile.m_addr1}" readonly>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn2" onclick="sample6_execDaumPostcode()"
                                                    value="우편번호 찾기" style="background: white; border: 1px solid #D5D5D5;"><br>
                                                <input class="wcon" type="text" name="m_addr2" id="sample6_address" placeholder="주소" value="${profile.m_addr2}" readonly><br> <input class="wcon" type="text" name="m_addr3" id="sample6_detailAddress" placeholder="상세주소"
                                                    value="${profile.m_addr3}" style="width: 295px;margin-top:12px;"> <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display: none;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="register" height="30">
                                            <td width="35%" style="font-size: 14px;">프로필 소개글</td>
                                            <td><textarea class="wcon" rows="2" cols="40" style="resize: none; height:50px;" id="profileintro" name="m_intro">${profile.m_intro}</textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br> <input type="button" class="btn2" style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;" value="저장" onclick="updatecheck()">&nbsp;&nbsp;&nbsp;<input class="btn2" type="button" style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
                                    value="취소" onclick="location.href='mManage.do'">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </body>

        </html>