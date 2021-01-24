<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 고객 센터</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/serviceCenter.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>

            <style>

            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="sc_big_con">
                    <div id="sc_title" style="cursor:pointer;">고객센터</div>
                    <div id="sc_con">
                        <div id="left_side">
                            <div id="cate1">
                                <div id="c1_1" class="cate">TA_IN 사용</div>
                                <div id="c1_2" class="cate">계정 관리</div>
                                <div id="c1_3" class="cate">문제 해결 및 로그인 도움말</div>
                                <div id="c1_4" class="cate">비즈니스용 TA_IN</div>
                            </div>
                            <div id="cate2_1" style="display: none;">
                                <div id="c2_1_1" class="cate">가입 및 시작하기</div>
                                <div id="c2_1_2" class="cate">사진 공유하기</div>
                                <div id="c2_1_3" class="cate">회원님의 프로필</div>
                                <div id="c2_1_4" class="cate">사진 탐색</div>
                                <div id="c2_1_5" class="cate">메시지</div>
                                <div id="c2_1_6" class="cate">스토리</div>
                                <div id="c2_1_7" class="cate">피드</div>
                                <div id="c2_1_8" class="cate">TA_IN 결제</div>
                                <div id="c2_1_9" class="cate">돌아가기</div>
                            </div>
                            <div id="cate2_2" style="display: none;">
                                <div id="c2_2_1" class="cate">계정 삭제</div>
                                <div id="c2_2_2" class="cate">계정 추가</div>
                                <div id="c2_2_3" class="cate">TA_IN 광고 정보</div>
                                <div id="c2_2_4" class="cate">돌아가기</div>
                            </div>
                            <div id="cate2_3" style="display: none;">
                                <div id="c2_3_1" class="cate">로그인할 수 없습니다.</div>
                                <div id="c2_3_2" class="cate">사용상 문제</div>
                                <div id="c2_3_3" class="cate">돌아가기</div>
                            </div>
                            <div id="cate2_4" style="display: none;">
                                <div id="c2_4_1" class="cate">TA_IN for Business</div>
                                <div id="c2_4_2" class="cate">돌아가기</div>
                            </div>
                            <div id="cate3_1_1" style="display: none;">
                                <div id="c3_1_1_1" class="cate">계정 및 사용자 이름 만들기</div>
                                <div id="c3_1_1_2" class="cate">앱 탐색</div>
                                <div id="c3_1_1_3" class="cate">팔로우할 친구 찾기</div>
                                <div id="c3_1_1_4" class="cate">팔로워 관리하기</div>
                                <div id="c3_1_1_5" class="cate">돌아가기</div>
                            </div>
                            <div id="cate3_1_2" style="display: none;">
                                <div id="c3_1_2_1" class="cate">웹캠 연동해서 사진 찍기</div>
                                <div id="c3_1_2_2" class="cate">효과 및 필터 추가</div>
                                <div id="c3_1_2_3" class="cate">게시물 수정 및 삭제</div>
                                <div id="c3_1_2_4" class="cate">게시물 url 공유</div>
                                <div id="c3_1_2_5" class="cate">해시태그</div>
                                <div id="c3_1_2_6" class="cate">돌아가기</div>
                            </div>
                            <div id="cate3_3_2" style="display: none;">
                                <div id="c3_3_2_1" class="cate">첫 단계</div>
                                <div id="c3_3_2_2" class="cate">알려진 문제</div>
                                <div id="c3_3_2_3" class="cate">돌아가기</div>
                            </div>
                        </div>
                        <div id="right_side">
                            <div id="main">
                                <h3 class="h3_title">새로운 TA_IN</h3>
                                <ul>
                                    <li class="li_ct">새로운 TA_IN <a href="${pageContext.request.contextPath}/aboutUs">살펴보기</a></li>
                                </ul>
                                <h3 class="h3_title">알려진 문제</h3>
                                <ul>
                                    <li class="li_ct">현재 알려진 문제가 없습니다. <a href="${pageContext.request.contextPath}/serviceCenter">TA_IN에서
									문제가 발생</a>한 경우 해결 방법을 자세히 알아보세요.
                                    </li>
                                </ul>
                                <h3 class="h3_title">인기 주제</h3>
                                <ul>
                                    <li class="li_ct"><a href="${pageContext.request.contextPath}/member/joinPage">TA_IN 가입</a></li>
                                    <li class="li_ct"><a href="${pageContext.request.contextPath}/serviceCenter">로그인 문제 해결</a></li>
                                </ul>
                            </div>
                            <div id="for_c3_1_1_1" style="display: none;">
                                <h3 class="h3_title">TA_IN 계정을 만들려면?</h3>
                                <ul>
                                    <li class="li_ct_no"><a href="${pageContext.request.contextPath}/member/loginPage">TA_IN 홈페이지</a>로 이동합니다.</li>
                                    <li class="li_ct_no">회원가입을 클릭하고 사용자 정보를 입력한 다음 계정을 생성합니다.</li>
                                    <li class="li_ct_no">등록된 이메일에 발송된 메일을 확인하세요.</li>
                                    <li class="li_ct_no">메일을 확인하지 않으면 메일을 확인하라는 메시지가 표시됩니다.</li>
                                </ul>
                                <h3 class="h3_title">프로필 정보를 업데이트하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">프로필 정보를 업데이트하려면 먼저 계정에 <a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 합니다.</li>
                                    <li class="li_ct_no"><a href="${pageContext.request.contextPath}/gnMain?m_id=${my_name}">프로필</a>로 이동합니다.</li>
                                    <li class="li_ct_no"><a href="#">프로필 수정</a>을 누릅니다.</li>
                                    <li class="li_ct_no">본인의 정보를 입력한 다음 확인 버튼을 누릅니다.</li>
                                </ul>
                                <h3 class="h3_title">내 이메일 주소로 메일이 도착하지 않아서 TA_IN에 가입할 수 없습니다.
                                </h3>
                                <ul>
                                    <li class="li_ct">본인의 이메일 주소에 가입한 적이 있지만 비밀번호가 기억나지 않는 경우 <a href="#">비밀번호를 재설정</a>하여 계정에 로그인할 수 있습니다.
                                    </li>
                                    <li class="li_ct">하나의 이메일 주소는 하나의 TA_IN 계정에만 연결할 수 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_1_2" style="display: none;">
                                <h3 class="h3_title">로그인 화면</h3>
                                <ul>
                                    <li class="li_ct"><a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 화면에서 새 계정을 만들거나 기존 계정에 로그인할 수 있습니다.</li>
                                    <li class="li_ct"><a href="#">아이디&비밀번호 찾기</a>를 눌러 아이디와 비밀번호를 찾을 수 있습니다.</li>
                                    <li class="li_ct">기존 계정에 로그인하는 경우 해당 계정의 사용자 이름과 비밀번호를 사용해야 합니다.
                                    </li>
                                </ul>
                                <h3 class="h3_title">프로필</h3>
                                <ul>
                                    <li class="li_ct">프로필에는 소개와 TA_IN 게시물이 표시됩니다. 여기에서 프로필 정보를 수정하고 계정 설정을 조정할 수도 있습니다.</li>
                                    <li class="li_ct_no">프로필 정보를 업데이트하려면 먼저 계정에 로그인 합니다.</li>
                                    <li class="li_ct_no"><a href="${pageContext.request.contextPath}/gnMain?m_id=${my_name}">프로필</a>로 이동합니다.</li>
                                    <li class="li_ct_no"><a href="#">프로필 수정</a>을 누릅니다.</li>
                                    <li class="li_ct_no">본인의 정보를 입력한 다음 확인 버튼을 누릅니다.</li>
                                </ul>
                                <h3 class="h3_title">웹캠</h3>
                                <ul>
                                    <li class="li_ct">웹캠을 사용하여 TA_IN 홈페이지 내에서 사진을 찍어 피드, 스토리에 공유하세요.
                                    </li>
                                    <li class="li_ct">웹캠 사용을 수락해야 사진찍기를 활성화 할 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">검색 및 탐색하기</h3>
                                <ul>
                                    <li class="li_ct">상단의 검색창에서 아직 팔로우하지 않는 계정이나 마음에 드는 사진을 찾을 수 있습니다.
                                    </li>
                                    <li class="li_ct">전체를 입력하지 않아도 자동으로 검색어를 완성하여 추천해줍니다.</li>
                                    <li class="li_ct">계정을 검색할 때는 @를 붙여서 검색해주세요.</li>
                                </ul>
                                <h3 class="h3_title">홈</h3>
                                <ul>
                                    <li class="li_ct">'홈'은 회원님과 친구가 게시한 사진 피드를 보여줍니다. 피드의 사진에 좋아요를 누르거나 댓글을 달 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">활동</h3>
                                <ul>
                                    <li class="li_ct">상단의 알림 창에서 현재 로그인 중인 친구를 확인할 수 있습니다.</li>
                                    <li class="li_ct">친구의 프로필 사진 아이콘을 눌러 친구에게 메세지를 보내보세요. '안녕!'</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_1_3" style="display: none;">
                                <h3 class="h3_title">TA_IN에서 팔로우할 만한 사람을 찾으려면?</h3>
                                <ul>
                                    <li class="li_ct">검색 기능을 통해 팔로우할 만한 사람을 찾을 수 있습니다. 화면 상단에 있는 검색창에서 검색할 수 있습니다.</li>
                                    <li class="li_ct">관심 있는 사람, 해시태그를 검색하려면 상단의 검색 창을 누릅니다.</li>
                                    <li class="li_ct">추천 탭에서 내가 아직 팔로우하지 않은 친구들을 팔로우 해보세요.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에서 검색하려면?</h3>
                                <ul>
                                    <li class="li_ct">화면 상단에 있는 검색창에서 검색할 수 있습니다.</li>
                                    <li class="li_ct">관심있는 해시태그나 사용자를 검색해보세요.</li>
                                    <li class="li_ct">해시태그는 #으로 시작하거나 아무 기호 없이 입력하여 검색할 수 있습니다.</li>
                                    <li class="li_ct">사용자는 @로 시작하게 입력하여 검색할 수 있습니다.</li>
                                    <li class="li_ct">검색어를 전체 입력하지 않아도 검색창 아래에 자동으로 검색어 추천을 해줍니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_1_4" style="display: none;">
                                <h3 class="h3_title">TA_IN에서 다른 사람을 팔로우 하려면?</h3>
                                <ul>
                                    <li class="li_ct">게시물 상단에 있는 <i class="fas fa-bars"></i>를 눌러 '팔로우 하기'를 클릭합니다.</li>
                                    <li class="li_ct">팔로우하고 싶은 해당 계정에서 '팔로우'를 클릭해서 팔로우 할 수 있습니다.</li>
                                    <li class="li_ct">팔로우 하면 해당 계정으로 알림이 도착합니다.</li>
                                    <li class="li_ct">내 프로필에서 내가 팔로우한 목록을 확인할 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에서 다른 사람을 팔로우 취소 하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">팔로우를 취소하려는 사람의 프로필로 이동합니다.</li>
                                    <li class="li_ct_no"><i class="fas fa-user-check" id="pre_unfollow"></i>를 눌러 팔로우를 취소할 수 있습니다.</li>
                                    <li class="li_ct">팔로우를 취소한 사람의 프로필에는 아이콘 대신 팔로우가 표시됩니다.</li>
                                    <li class="li_ct">팔로우를 취소해도 상대방은 알림을 받지 않습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_2_1" style="display: none;">
                                <h3 class="h3_title">웹캠</h3>
                                <ul>
                                    <li class="li_ct">웹캠을 사용하여 TA_IN 홈페이지 내에서 사진을 찍어 피드, 스토리에 공유하세요.</li>
                                    <li class="li_ct">웹캠 사용을 수락해야 사진찍기를 활성화 할 수 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_2_2" style="display: none;">
                                <h3 class="h3_title">사진을 찍고 필터를 적용하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">웹캠을 이용하여 사진을 찍습니다.</li>
                                    <li class="li_ct_no">찍은 사진을 확인하고 다운로드를 받습니다.</li>
                                    <li class="li_ct_no">사진 수정 탭에 들어가서 필터를 적용합니다.</li>
                                    <li class="li_ct_no">필터를 눌러 필터 강도를 세게 조절할 수 있습니다.</li>
                                    <li class="li_ct_no">필터가 적용된 사진을 확인하고 다운로드를 받습니다.</li>
                                </ul>
                                <h3 class="h3_title">내 사진에 필터를 적용하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">필터를 적용할 사진을 선택합니다.</li>
                                    <li class="li_ct_no">사진 수정 탭에 들어가서 필터를 적용합니다.</li>
                                    <li class="li_ct_no">필터를 눌러 필터 강도를 세게 조절할 수 있습니다.</li>
                                    <li class="li_ct_no">필터가 적용된 사진을 확인하고 다운로드를 받습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_2_3" style="display: none;">
                                <h3 class="h3_title">TA_IN에 게시한 사진을 삭제하려면?</h3>
                                <ul>
                                    <li class="li_ct">게시한 사진을 삭제하려면 게시물 위에서 <i class="fas fa-bars"></i>를 눌러 삭제를 누릅니다.</li>
                                    <li class="li_ct">게시물 삭제를 완료하면 복구할 수 없습니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에 게시물을 수정하려면?</h3>
                                <ul>
                                    <li class="li_ct">게시물을 수정하려면 게시물 위에서 <i class="fas fa-bars"></i>를 눌러 수정을 누릅니다.</li>
                                    <li class="li_ct">게시물의 사진은 수정할 수 없으며 텍스트만 수정 가능 합니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에서 댓글을 삭제및 수정하려면?</h3>
                                <ul>
                                    <li class="li_ct">회원님이 작성한 댓글만 삭제및 수정할 수 있습니다.</li>
                                    <li class="li_ct">댓글 옆에 있는 <i class="fas fa-bars"></i>를 눌러 삭제및 수정할 수 있습니다.</li>
                                    <li class="li_ct">다른 회원의 댓글을 삭제하고 싶으면 신고를 눌러 신고해주세요. 검토 후 삭제 조치 하겠습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_2_4" style="display: none;">
                                <h3 class="h3_title">TA_IN의 사진 링크(URL)을 얻으려면?</h3>
                                <ul>
                                    <li class="li_ct"><a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 된 상태여야 TA_IN의 모든 서비스를 이용할 수 있습니다.</li>
                                    <li class="li_ct_no">계정에 로그인합니다.</li>
                                    <li class="li_ct_no">게시한 사진을 삭제하려면 게시물 위에서 <i class="fas fa-bars"></i>를 눌러 공유하기를 누릅니다.</li>
                                    <li class="li_ct_no">자동으로 클립보드에 복사됩니다.</li>
                                    <li class="li_ct_no">브라우저에 붙여놓기하여 이동합니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_1_2_5" style="display: none;">
                                <h3 class="h3_title">해시태그를 적용하려면?</h3>
                                <ul>
                                    <li class="li_ct">게시글을 등록할 때 해시태그를 적용할 수 있습니다.</li>
                                    <li class="li_ct">해시태그 검색을 통해 회원님의 게시물을 찾을 수 있습니다.</li>
                                    <li class="li_ct">게시물에 등록된 해시태그를 클릭해 같은 해시태그를 사용한 다른 게시물을 확인할 수 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_1_3" style="display: none;">
                                <h3 class="h3_title">이메일, 주소, 프로필 사진과 같은 TA_IN 프로필 정보를 업데이트하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">프로필 정보를 업데이트하려면 먼저 계정에 <a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 합니다.</li>
                                    <li class="li_ct_no"><a href="${pageContext.request.contextPath}/gnMain?m_id=${my_name}">프로필</a>로 이동합니다.</li>
                                    <li class="li_ct_no"><a href="#">프로필 수정</a>을 누릅니다.</li>
                                    <li class="li_ct_no">본인의 정보를 입력한 다음 확인 버튼을 누릅니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_1_4" style="display: none;">
                                <h3 class="h3_title">TA_IN에 사진이 게시된 날짜를 보려면?</h3>
                                <ul>
                                    <li class="li_ct">게시물 하단의 설명과 댓글 아레에 사진이나 동영상이 게시된 날짜가 표시됩니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에 사진이나 동영상에 좋아요를 남기려면?</h3>
                                <ul>
                                    <li class="li_ct">좋아요를 남기려면 게시물 아래에서 <i class="far fa-heart"></i>아이콘을 누르세요.</li>
                                    <li class="li_ct">게시물에 실수로 좋아요를 남겼다면 아이콘을 다시 눌러 좋아요를 취소할 수 있습니다.</li>
                                    <li class="li_ct">게시물의 좋아요를 취소하면 좋아요를 남긴 사진 목록에서 게시물이 사라집니다.</li>
                                    <li class="li_ct">게시물의 좋아요를 남기면 해당 회원에게 알림이 도착합니다.</li>
                                </ul>
                                <h3 class="h3_title">내가 본 게시물을 저장하려면?</h3>
                                <ul>
                                    <li class="li_ct"><i class="fas fa-bars"></i>을 눌러 저장하기를 누릅니다.</li>
                                    <li class="li_ct">회원님의 계정에서 저장한 게시물을 확인 할 수 있습니다.</li>
                                    <li class="li_ct">저장한 게시물은 본인만 볼 수 있으며 다른 사람의 게시물을 저장해도 상대방은 회원님이 저장했다는 사실을 알 수 없습니다.</li>
                                </ul>
                                <h3 class="h3_title">댓글 대화에서 다른 사람에게 답글을 달려면?</h3>
                                <ul>
                                    <li class="li_ct_no">사진이나 게시물로 이동합니다.</li>
                                    <li class="li_ct_no">댓글 아래에서 답글달기를 누른 다음 댓글을 추가합니다.</li>
                                    <li class="li_ct_no">게시를 누릅니다.</li>
                                    <li class="li_ct">답글을 등록하면 상대방의 활동 피드에 댓글을 확인하라는 알림이 표시됩니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_1_5" style="display: none;">
                                <h3 class="h3_title">메시지를 보내려면?</h3>
                                <ul>
                                    <li class="li_ct">상단의 아이콘 또는 게시글의 아이콘틀 통하여 메시지를 보낼 수 있습니다.</li>
                                    <li class="li_ct">스토리를 확인하고 하단에 메시지 작성을 통해 메시지를 보낼 수 있습니다.</li>
                                    <li class="li_ct">활동 상태인 친구를 확인하고 메시지를 보낼 수 있습니다.</li>
                                    <li class="li_ct">친구의 프로필 페이지에서 메시지를 보낼 수 있습니다.</li>
                                    <li class="li_ct">메시지를 통해 보낸 사진은 TA_IN을 통해 URL을 공유할 수 없으며, 해시태그에 나타나지 않습니다.</li>
                                    <li class="li_ct">메시지를 보내면 상대방에게 알림이 도착합니다.</li>
                                </ul>
                                <h3 class="h3_title">대화를 삭제하려면?</h3>
                                <ul>
                                </ul>
                            </div>
                            <div id="for_c2_1_6" style="display: none;">
                                <h3 class="h3_title">스토리를 내 하이라이트에 추가하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">스토리 작성 페이지로 들어갑니다.</li>
                                    <li class="li_ct_no">내 스토리 탭에 들어가서 하이라이트에 추가할 스토리를 선택합니다.</li>
                                    <li class="li_ct_no">하이라이트 제목과 썸네일을 설정합니다.</li>
                                    <li class="li_ct_no">내 프로필에서 하이라이트를 확인 할 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">하이라이트를 수정하거나 삭제하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">먼저 계정에 <a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 합니다.</li>
                                    <li class="li_ct_no">스토리 작성 페이지로 들어갑니다.</li>
                                    <li class="li_ct_no">하이라이트 탭에 들어갑니다.</li>
                                    <li class="li_ct_no">하이라이트 전체를 삭제하거나 각각을 삭제할 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">사진을 찍고 필터를 적용하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">웹캠을 이용하여 사진을 찍습니다.</li>
                                    <li class="li_ct_no">찍은 사진을 확인하고 다운로드를 받습니다.</li>
                                    <li class="li_ct_no">사진 수정 탭에 들어가서 필터를 적용합니다.</li>
                                    <li class="li_ct_no">필터를 눌러 필터 강도를 세게 조절할 수 있습니다.</li>
                                    <li class="li_ct_no">필터가 적용된 사진을 확인하고 다운로드를 받습니다.</li>
                                </ul>
                                <h3 class="h3_title">내 사진에 필터를 적용하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">필터를 적용할 사진을 선택합니다.</li>
                                    <li class="li_ct_no">사진 수정 탭에 들어가서 필터를 적용합니다.</li>
                                    <li class="li_ct_no">필터를 눌러 필터 강도를 세게 조절할 수 있습니다.</li>
                                    <li class="li_ct_no">필터가 적용된 사진을 확인하고 다운로드를 받습니다.</li>
                                </ul>
                                <h3 class="h3_title">스토리가 사라지는 시간은?</h3>
                                <ul>
                                    <li class="li_ct">스토리에 고유하는 사진은 하이라이트로 추가하지 않는 한 24시간 후에 사라집니다.</li>
                                    <li class="li_ct">하이라이트에 추가한 스토리는 삭제하지 않는 한 사라지지 않습니다.</li>
                                    <li class="li_ct">회원님이 올린 하이라이트는 삭제하지 않는 한 '내 스토리'탭에서 확인 할 수 있으며 다운로드도 가능합니다.</li>
                                    <li class="li_ct">삭제한 하이라이트는 복구할 수 없습니다.</li>
                                </ul>
                                <h3 class="h3_title">스토리에서 메시지를 보내려면?</h3>
                                <ul>
                                    <li class="li_ct">스토리 하단에서 해당 회원에게 메시지를 보낼 수 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_1_7" style="display: none;">
                                <h3 class="h3_title">피드에는 어떤 게시물이 표시되나요?</h3>
                                <ul>
                                    <li class="li_ct">TA_IN에서는 팔로우하는 계정의 모든 게시물이 피드에 표시됩니다.</li>
                                    <li class="li_ct">TA_IN은 회원님이 팔로우하는 사람들의 게시물을 숨기지 않습니다.</li>
                                </ul>
                                <h3 class="h3_title">내 게시물의 순서를 어떻게 결정하나요?</h3>
                                <ul>
                                    <li class="li_ct_no">게시물이 공유된 날짜를 기반으로 최신 날짜부터 표시됩니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에 사진이 게시된 날짜를 보려면?</h3>
                                <ul>
                                    <li class="li_ct">게시물 하단의 설명과 댓글 아레에 사진이나 동영상이 게시된 날짜가 표시됩니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN에 사진이나 동영상에 좋아요를 남기려면?</h3>
                                <ul>
                                    <li class="li_ct">좋아요를 남기려면 게시물 아래에서 <i class="far fa-heart"></i>아이콘을 누르세요.</li>
                                    <li class="li_ct">게시물에 실수로 좋아요를 남겼다면 아이콘을 다시 눌러 좋아요를 취소할 수 있습니다.</li>
                                    <li class="li_ct">게시물의 좋아요를 취소하면 좋아요를 남긴 사진 목록에서 게시물이 사라집니다.</li>
                                    <li class="li_ct">게시물의 좋아요를 남기면 해당 회원에게 알림이 도착합니다.</li>
                                </ul>
                                <h3 class="h3_title">내가 본 게시물을 저장하려면?</h3>
                                <ul>
                                    <li class="li_ct"><i class="fas fa-bars"></i>을 눌러 저장하기를 누릅니다.</li>
                                    <li class="li_ct">회원님의 계정에서 저장한 게시물을 확인 할 수 있습니다.</li>
                                    <li class="li_ct">저장한 게시물은 본인만 볼 수 있으며 다른 사람의 게시물을 저장해도 상대방은 회원님이 저장했다는 사실을 알 수 없습니다.</li>
                                </ul>
                                <h3 class="h3_title">댓글 대화에서 다른 사람에게 답글을 달려면?</h3>
                                <ul>
                                    <li class="li_ct_no">사진이나 게시물로 이동합니다.</li>
                                    <li class="li_ct_no">댓글 아래에서 답글달기를 누른 다음 댓글을 추가합니다.</li>
                                    <li class="li_ct_no">게시를 누릅니다.</li>
                                    <li class="li_ct">답글을 등록하면 상대방의 활동 피드에 댓글을 확인하라는 알림이 표시됩니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_1_8" style="display: none;">
                                <h3 class="h3_title">결제에 대한 주문 확인은 어디에서 볼 수 있나요?</h3>
                                <ul>
                                    <li class="li_ct">상단의 장바구니와 프로필의 설정에서 볼 수 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_2_1" style="display: none;">
                                <h3 class="h3_title">내 TA_IN 계정을 삭제하려면?</h3>
                                <ul>
                                    <li class="li_ct_no">먼저 <a href="${pageContext.request.contextPath}/member/loginPage">로그인</a>을 합니다.</li>
                                    <li class="li_ct_no"><a href="${pageContext.request.contextPath}/out">계정 삭제 페이지</a>로 이동합니다.</li>
                                    <li class="li_ct_no">'계정을 삭제하시는 이유가 무엇인가요?' 옆의 드롭다운 메뉴에서 옵션을 선택하고 비밀번호를 다시 입력합니다.</li>
                                    <li class="li_ct_no">내 계정 삭제를 클릭합니다.</li>
                                    <li class="li_ct">계정 삭제를 신청한 후 3일 이내 로그인을 하면 계정은 삭제되지않고 복구됩니다.</li>
                                    <li class="li_ct">삭제 과정 시작 후 모든 게시물이 삭제되기까지는 최대 90일이 소요될 수 있습니다.</li>
                                    <li class="li_ct">TA_IN의 다른 사용자는 삭제 중인 정보에 엑세스 할 수 없습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_2_2" style="display: none;">
                                <h3 class="h3_title">TA_IN 계정을 추가하려면?</h3>
                                <ul>
                                    <li class="li_ct">같은 이메일로 또 하나의 TA_IN 계정을 생성할 수 없습니다.</li>
                                    <li class="li_ct">동일한 아이디로 TA_IN 계정을 생성할 수 없습니다.</li>
                                    <li class="li_ct">다른 계정에 접속하려면 먼저 상단에서 로그아웃을 하고 다시 <a href="${pageContext.request.contextPath}/member/loginPage">로그인</a> 합니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_2_3" style="display: none;">
                                <h3 class="h3_title">TA_IN에서 표시되는 광고는 어떻게 선정되나요?</h3>
                                <ul>
                                    <li class="li_ct">스토리 전체보기 시청시에 광고가 나타나며 일반 스토리 게시물과 3개의 텀을 가지고 광고가 나타나고 있습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c2_3_1" style="display: none;">
                                <h3 class="h3_title">비밀번호를 잊어버렸다면?</h3>
                                <ul>
                                    <li class="li_ct"><a href="#">비밀번호를 재설정</a>하여 계정에 로그인할 수 있습니다.</li>
                                </ul>
                                <h3 class="h3_title">TA_IN 계정에 대한 비밀번호 재설정 이메일을 받지 못하면 어떻게 해야되나요?</h3>
                                <ul>
                                    <li class="li_ct">이메일 계정의 스팸 필터를 확인합니다.</li>
                                    <li class="li_ct">이메일 서비스 제공업체에 문의하여 TA_IN 도메인에서 발송되는 이메일을 수신할 수 있는지 확인합니다.</li>
                                    <li class="li_ct">계정 가입 당시 이메일 주소를 잘못 입력한 경우에는 계정 액세스 권한을 부여해드릴 수 없습니다.</li>
                                </ul>
                                <h3 class="h3_title">잘못된 TA_IN 계정의 비밀번호 재설정 이메일을 받았습니다.</h3>
                                <ul>
                                    <li class="li_ct">잘못된 비밀번호 재설정 이메일을 받았다면 로그인하려는 계정에 다른 이메일 주소가 등록되어 있기 때문일 수 있습니다.</li>
                                    <li class="li_ct">올바른 계정에 다시 액세스하려면 사용했을 수 있는 다른 이메일 즈소로 시도해보세요.</li>
                                </ul>
                                <h3 class="h3_title">"강제 탈퇴된 회원입니다. 이메일을 확인하세요." 메일을 받았습니다.</h3>
                                <ul>
                                    <li class="li_ct">회원님의 계정은 많은 신고로 강제 탈퇴되었습니다.</li>
                                    <li class="li_ct">해킹으로 인한 신고 발생이나 신고 이유가 부적절하다면 해당 이메일 주소로 메일에 답장을 보내주세요.</li>
                                    <li class="li_ct">메일에는 회원님의 아이디, 이메일 정보가 포함되어야 합니다.</li>
                                    <li class="li_ct">검토에는 영업일 기준 30일이내로 소요됩니다.</li>
                                    <li class="li_ct">회원님 계정의 비밀번호를 요구하는 메일은 TA_IN 메일이 아닙니다.</li>
                                    <li class="li_ct">TA_IN은 회원님의 비밀번호 및 주민등록번호를 요구하지 않습니다.</li>
                                </ul>
                            </div>
                            <div id="for_c3_3_2_1" style="display: none;">
                                <h3 class="h3_title">TA_IN에서 문제가 발생합니다.</h3>
                                <ul>
                                    <li class="li_ct">고객 센터에서 해당 문제에 대해 찾아보고 실행합니다.</li>
                                    <li class="li_ct">윈도우 창을 완전히 껐다가 다시 접속합니다.</li>
                                    <li class="li_ct">계속해서 문제가 발생할 경우 잠시 뒤에 다시 시도해주세요.</li>
                                </ul>
                            </div>
                            <div id="for_c3_3_2_2" style="display: none;">
                                <h3 class="h3_title">TA_IN에서 문제가 발생합니다.</h3>
                                <ul>
                                    <li class="li_ct">현재 알려진 문제가 없습니다. <a href="${pageContext.request.contextPath}/serviceCenter">TA_IN에서
									문제가 발생</a>한 경우 해결 방법을 자세히 알아보세요.</li>
                                </ul>
                            </div>
                            <div id="for_c2_4_1" style="display: none;">
                                <h3 class="h3_title">TA_IN 비즈니스 바로가기</h3>
                                <ul>
                                    <li class="li_ct"><a href="#">프로페셔널 계정 설정</a></li>
                                    <li class="li_ct"><a href="#">TA_IN에서 광고 만들기</a></li>
                                    <li class="li_ct"><a href="#">TA_IN 인사이트 보기</a></li>
                                    <li class="li_ct"><a href="#">TA_IN 홍보 비용 지불하기</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </body>
        <script>
            $(function() {
                $("#sc_title").on('click', function() {
                    var url = "${pageContext.request.contextPath}/serviceCenter";
                    $(location).attr('href', url);
                });
                $("#c1_1").on('click', function() {
                    $("#cate1").css("display", "none");
                    $("#cate2_1").css("display", "block");
                    $("#c2_1_1").on('click', function() {
                        $("#cate2_1").css("display", "none");
                        $("#cate3_1_1").css("display", "block");
                        $("#c3_1_1_1").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "block");
                        });
                        $("#c3_1_1_2").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "block");
                        });
                        $("#c3_1_1_3").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "block");
                        });
                        $("#c3_1_1_4").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "block");
                        });
                        $("#c3_1_1_5").on('click', function() {
                            $("#cate3_1_1").css("display", "none");
                            $("#cate2_1").css("display", "block");

                        });
                    });
                    $("#c2_1_2").on('click', function() {
                        $("#cate2_1").css("display", "none");
                        $("#cate3_1_2").css("display", "block");
                        $("#c3_1_2_1").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_2").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "block");

                        });
                        $("#c3_1_2_2").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_2").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "block");

                        });
                        $("#c3_1_2_3").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_2").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "block");

                        });
                        $("#c3_1_2_4").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_2").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "block");

                        });
                        $("#c3_1_2_5").on('click', function() {
                            $("#main").css("display", "none");
                            $("#for_c3_1_1_1").css("display", "none");
                            $("#for_c3_1_1_2").css("display", "none");
                            $("#for_c3_1_1_3").css("display", "none");
                            $("#for_c3_1_1_4").css("display", "none");
                            $("#for_c3_1_2_1").css("display", "none");
                            $("#for_c3_1_2_2").css("display", "none");
                            $("#for_c3_1_2_3").css("display", "none");
                            $("#for_c3_1_2_4").css("display", "none");
                            $("#for_c2_1_3").css("display", "none");
                            $("#for_c2_1_4").css("display", "none");
                            $("#for_c2_1_5").css("display", "none");
                            $("#for_c2_1_6").css("display", "none");
                            $("#for_c2_1_7").css("display", "none");
                            $("#for_c2_1_8").css("display", "none");
                            $("#for_c2_2_1").css("display", "none");
                            $("#for_c2_2_2").css("display", "none");
                            $("#for_c2_2_3").css("display", "none");
                            $("#for_c2_3_1").css("display", "none");
                            $("#for_c3_3_2_1").css("display", "none");
                            $("#for_c3_3_2_2").css("display", "none");
                            $("#for_c2_4_1").css("display", "none");
                            $("#for_c3_1_2_5").css("display", "block");

                        });
                        $("#c3_1_2_6").on('click', function() {
                            $("#cate3_1_2").css("display", "none");
                            $("#cate2_1").css("display", "block");

                        });
                    });

                    $("#c2_1_3").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_3").css("display", "block");

                    });
                    $("#c2_1_4").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_4").css("display", "block");
                    });
                    $("#c2_1_5").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_5").css("display", "block");
                    });
                    $("#c2_1_6").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_6").css("display", "block");
                    });
                    $("#c2_1_7").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_7").css("display", "block");
                    });
                    $("#c2_1_8").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_1_8").css("display", "block");
                    });

                    $("#c2_1_9").on('click', function() {
                        $("#cate2_1").css("display", "none");
                        $("#cate1").css("display", "block");

                    });
                });
                $("#c1_2").on('click', function() {
                    $("#cate1").css("display", "none");
                    $("#cate2_2").css("display", "block");
                    $("#c2_2_1").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_2_1").css("display", "block");
                    });
                    $("#c2_2_2").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "block");
                    });
                    $("#c2_2_3").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_2_3").css("display", "block");
                    });

                    $("#c2_2_4").on('click', function() {
                        $("#cate2_2").css("display", "none");
                        $("#cate1").css("display", "block");

                    });

                });
                $("#c1_3").on('click', function() {
                    $("#cate1").css("display", "none");
                    $("#cate2_3").css("display", "block");
                    $("#c2_3_2").on('click', function() {
                        $("#cate2_3").css("display", "none");
                        $("#cate3_3_2").css("display", "block");
                        $("#c3_3_2_3").on('click', function() {
                            $("#cate3_3_2").css("display", "none");
                            $("#cate2_3").css("display", "block");

                        });
                    });

                    $("#c2_3_1").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c2_3_1").css("display", "block");
                    });
                    $("#c3_3_2_1").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "block");
                    });
                    $("#c3_3_2_2").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c2_4_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "block");
                    });

                    $("#c2_3_3").on('click', function() {
                        $("#cate2_3").css("display", "none");
                        $("#cate1").css("display", "block");

                    });
                });
                $("#c1_4").on('click', function() {
                    $("#cate1").css("display", "none");
                    $("#cate2_4").css("display", "block");
                    $("#c2_4_1").on('click', function() {
                        $("#main").css("display", "none");
                        $("#for_c3_1_1_1").css("display", "none");
                        $("#for_c3_1_1_2").css("display", "none");
                        $("#for_c3_1_1_3").css("display", "none");
                        $("#for_c3_1_1_4").css("display", "none");
                        $("#for_c3_1_2_1").css("display", "none");
                        $("#for_c3_1_2_2").css("display", "none");
                        $("#for_c3_1_2_3").css("display", "none");
                        $("#for_c3_1_2_4").css("display", "none");
                        $("#for_c3_1_2_5").css("display", "none");
                        $("#for_c2_1_3").css("display", "none");
                        $("#for_c2_1_4").css("display", "none");
                        $("#for_c2_1_5").css("display", "none");
                        $("#for_c2_1_6").css("display", "none");
                        $("#for_c2_1_7").css("display", "none");
                        $("#for_c2_1_8").css("display", "none");
                        $("#for_c2_2_1").css("display", "none");
                        $("#for_c2_2_2").css("display", "none");
                        $("#for_c2_2_3").css("display", "none");
                        $("#for_c2_3_1").css("display", "none");
                        $("#for_c3_3_2_1").css("display", "none");
                        $("#for_c3_3_2_2").css("display", "none");
                        $("#for_c2_4_1").css("display", "block");
                    });
                    $("#c2_4_2").on('click', function() {
                        $("#cate2_4").css("display", "none");
                        $("#cate1").css("display", "block");

                    });
                });
            });
        </script>

        </html>