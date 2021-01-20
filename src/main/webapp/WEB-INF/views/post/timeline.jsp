<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 타임라인</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <%-- <link href="${pageContext.request.contextPath}/resources/css/timeLine.css" rel="stylesheet"
                type="text/css"> --%>
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
                    
                    #timeline_big_con {
                        width: 1000px;
                    }
                    
                    #timeline_left {
                        width: 660px;
                        float: left;
                    }
                    /* 스토리 */
                    
                    #story_con {
                        width: 100%;
                        height: 118px;
                        border: 1px solid #C7C7C7;
                        background-color: white;
                    }
                    
                    #blank_for_story {
                        width: 10px;
                        height: 100%;
                        float: left;
                    }
                    
                    #story_inner_con {
                        width: 650px;
                        height: 84px;
                        float: left;
                        margin-top: 16px;
                        overflow: hidden;
                    }
                    
                    .story_small_con {
                        width: 66px;
                        height: 84px;
                        margin: 0px 7px 0px 7px;
                        float: left;
                        cursor: pointer;
                    }
                    
                    .story_profile {
                        width: 66px;
                        height: 66px;
                        border-radius: 50%;
                        border: 1px solid #C7C7C7;
                        box-sizing: border-box;
                    }
                    
                    .story_profile_a {
                        width: 66px;
                        height: 66px;
                        border-radius: 50%;
                        border: 1px solid #C7C7C7;
                        box-sizing: border-box;
                        background-color: #fee2f8;
                        background-image: linear-gradient(315deg, #fee2f8 0%, #dcf8ef 74%);
                    }
                    
                    #sa_icon {
                        height: 64px;
                        width: 64px;
                        border-radius: 50%;
                        cursor: pointer;
                        background-image: url('${pageContext.request.contextPath}/resources/images/signal.svg');
                        background-size: 40px;
                        background-repeat: no-repeat;
                        background-position: center;
                    }
                    
                    .story_id {
                        text-align: center;
                        width: 66px;
                        height: 18px;
                        width: 66px;
                    }
                    /* 타임라인 */
                    
                    #timeline_blank {
                        width: 100%;
                        height: 30px;
                    }
                    
                    .timeline_contents {
                        width: 100%;
                        margin-bottom: 60px;
                        border: 1px solid #C7C7C7;
                    }
                    
                    .timeline_profile {
                        width: 100%;
                        height: 60px;
                        background-color: white;
                        border-bottom: 1px solid #C7C7C7;
                    }
                    
                    .t_prof_photo {
                        width: 28px;
                        height: 28px;
                        border-radius: 50%;
                        border: 1px solid #C7C7C7;
                        box-sizing: border-box;
                        margin: 16px;
                        float: left;
                    }
                    
                    .t_prof_id {
                        float: left;
                        font-size: 14px;
                        color: #262626;
                        line-height: 60px;
                    }
                    
                    #timeline_right {
                        width: 340px;
                        height: 100%;
                        float: right;
                    }
                    
                    .timeline_photo {
                        width: 100%;
                        height: 660px;
                    }
                    
                    .timeline_comment_con {
                        width: 100%;
                        padding: 0px 16px;
                    }
                    
                    .inner_comment_con {
                        width: 628px;
                    }
                    
                    .timeline_icon_con {
                        width: 100%;
                        height: 40px;
                        margin-top: 4px;
                    }
                    
                    .timeline_likes_con {
                        width: 100%;
                        height: 18px;
                        margin-bottom: 8px;
                    }
                    
                    .comment_con {
                        width: 100%;
                    }
                    
                    .timeline_time {
                        width: 100%;
                        height: 19px;
                        margin-bottom: 4px;
                    }
                    
                    .upload_comment {
                        width: 100%;
                        height: 56px;
                        margin-top: 4px;
                        border-top: 1px solid #C7C7C7;
                    }
                    
                    .inner_upload {
                        margin-top: 19px;
                        padding: 0px 16px;
                    }
                    
                    .write_space {
                        width: 603px;
                        height: 18px;
                        outline: none;
                        border: none;
                        padding: 0px;
                        float: left;
                        background-color: transparent;
                    }
                    
                    .comment_upload {
                        font-size: 14px;
                        width: 25px;
                        height: 18px;
                        outline: none;
                        border: none;
                        padding: 0px;
                        background-color: transparent;
                        cursor: pointer;
                    }
                    
                    #my_profile_con {
                        margin-top: 21.5px;
                        margin-bottom: 21.5px;
                        width: 100%;
                        height: 56px;
                    }
                    
                    #my_profile_photo {
                        width: 56px;
                        height: 56px;
                        border-radius: 50%;
                        border: 1px solid #C7C7C7;
                        box-sizing: border-box;
                        float: left;
                    }
                    
                    #my_id {
                        width: 242px;
                        height: 18px;
                        line-height: 56px;
                        float: right;
                    }
                    
                    #follow_recom_title {
                        width: 100%;
                        height: 19px;
                        font-size: 14px;
                        line-height: 19px;
                        color: #8E8E8E;
                    }
                    
                    #follow_recom_con {
                        width: 100%;
                        padding-top: 8px;
                        padding-bottom: 8px;
                    }
                    
                    .follow_recom_id {
                        width: 100%;
                        height: 32px;
                        margin-top: 8px;
                        margin-bottom: 8px;
                    }
                    
                    .recom_profile {
                        width: 32px;
                        height: 32px;
                        border-radius: 50%;
                        border: 1px solid #C7C7C7;
                        box-sizing: border-box;
                        float: left;
                    }
                    
                    .recom_middle {
                        width: 231px;
                        margin-left: 10px;
                        height: 32px;
                        float: left;
                    }
                    
                    .followBtn {
                        font-size: 12x;
                        width: 37px;
                        height: 32px;
                        outline: none;
                        border: none;
                        padding: 0px;
                        background-color: transparent;
                        color: #0095F6;
                    }
                    
                    .recom_follow {
                        float: right;
                    }
                    
                    .recom_id {
                        width: 100%;
                        height: 18px;
                        font-size: 14px;
                        color: #262626;
                        line-height: 18px;
                    }
                    
                    .recom_info {
                        width: 100%;
                        height: 14px;
                        font-size: 12px;
                        line-height: 14px;
                        color: #8E8E8E;
                    }
                    
                    #footer_info {
                        margin-top: 20px;
                        margin-bottom: 3px;
                        width: 100%;
                        height: 36px;
                    }
                    
                    #footer_infoc {
                        margin-top: 16px;
                        width: 100%;
                        height: 13px;
                    }
                    
                    .footera {
                        font-size: 11px;
                        text-decoration: none;
                        color: #C7C7C7;
                    }
                    
                    #fix_logo {
                        cursor: pointer;
                    }
                    
                    .timeline_likes_con {
                        font-size: 14px;
                        color: #262626;
                        line-height: 18px;
                    }
                    
                    .com_detail {
                        font-size: 14px;
                        color: #262626;
                        line-height: 18px;
                        width: 100%;
                        height: 18px;
                        margin-bottom: 4px;
                    }
                    
                    .comment_more {
                        font-size: 14px;
                        line-height: 18px;
                        color: #8E8E8E;
                        cursor: pointer;
                    }
                    
                    .cm1 {
                        display: none;
                    }
                    
                    .post_id {
                        float: left;
                    }
                    
                    .post_content {
                        float: left;
                        margin-left: 5px;
                        width: 515px;
                        /* overflow: hidden;
					text-overflow: ellipsis;
					white-space: nowrap; */
                    }
                    /* .post_content.overflow {
					overflow: visible;
					white-space: normal;
					width: 570px;

				}

				.commentViewAll {
					float: left;
					width: 1.2em;
					height: 100%;
					cursor: pointer;
				} */
                    
                    #my_id {
                        font-size: 14px;
                        color: #262626;
                        line-height: 56px;
                    }
                    
                    .story_id {
                        font-size: 12px;
                        color: #262626;
                        line-height: 27px;
                    }
                    
                    .follow_recom_title {
                        font-size: 14px;
                        line-height: 19px;
                    }
                    
                    .timeline_time {
                        font-size: 10px;
                        line-height: 19px;
                        color: #8E8E8E;
                    }
                    
                    .icon {
                        width: 24px;
                        height: 24px;
                        float: left;
                        margin-top: 8px;
                        margin-right: 16px;
                        cursor: pointer;
                    }
                    
                    .save_icon {
                        margin-right: 0px;
                        float: right;
                    }
                    
                    #footer_infoc {
                        font-size: 13px;
                        color: #C7C7C7
                    }
                    
                    .fa-bars {
                        line-height: 18px;
                        cursor: pointer;
                        display: none;
                        float: left;
                        margin-left: 12px;
                    }
                    
                    .com_detail:hover>.fa-bars {
                        display: block;
                    }
                    
                    .clcon {
                        width: 12px;
                        height: 12px;
                        margin-top: 3px;
                        float: right;
                        cursor: pointer;
                    }
                    
                    #follow_recom_con {
                        height: 200px;
                        overflow: hidden;
                    }
                    
                    .moreCo {
                        float: left;
                        margin-left: 5px;
                        font-size: 12px;
                        margin-right: 11px;
                        color: #8E8E8E;
                        line-height: 18px;
                        cursor: pointer;
                    }
                    
                    .moreCoW {
                        float: left;
                        margin-right: 11px;
                        margin-left: 5px;
                        font-size: 12px;
                        color: #8E8E8E;
                        line-height: 18px;
                        cursor: pointer;
                    }
                    
                    .moreCoD {
                        float: right;
                        margin-right: 12px;
                        font-size: 10px;
                        color: #8E8E8E;
                        line-height: 18px;
                        width: 84px;
                    }
                    
                    .replyCoWri {
                        margin-left: 5px;
                        width: 500px;
                        outline: none;
                        border: none;
                        padding: 0px;
                        float: left;
                    }
                    
                    .rep_comment_upload {
                        width: 28px;
                        float: right;
                        padding: 0px;
                        border: none;
                        outline: none;
                        margin-right: 12px;
                        cursor: pointer;
                        background-color: transparent;
                    }
                    
                    .replyCoMo {
                        margin-left: 5px;
                        width: 500px;
                        outline: none;
                        border: none;
                        padding: 0px;
                        float: left;
                    }
                    
                    .rep_comment_modify {
                        width: 28px;
                        float: right;
                        padding: 0px;
                        border: none;
                        outline: none;
                        margin-right: 12px;
                        cursor: pointer;
                        background-color: transparent;
                    }
                    
                    .reply_commentResult {
                        width: 520px;
                    }
                    
                    .showlCount {
                        outline: none;
                        border: none;
                        font-size: 12px;
                        line-height: 18px;
                        background-color: transparent;
                        padding: 0px;
                    }
                    
                    .countLike_trigger {
                        display: none;
                    }
                    
                    .like_icon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                        background-size: 24px;
                    }
                    
                    .like_icon:hover {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                        background-size: 24px;
                    }
                    
                    .unlike_icon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                        background-size: 24px;
                        display: none;
                    }
                    
                    .share_icon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-share-1.svg');
                        background-size: 24px;
                    }
                    
                    .share_icon:hover {
                        background-image: url('${pageContext.request.contextPath}/resources/images/002-share.svg');
                        background-size: 24px;
                    }
                    
                    .write_icon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/002-speech-bubble-1.svg');
                        background-size: 24px;
                    }
                    
                    .write_icon:hover {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-speech-bubble.svg');
                        background-size: 24px;
                    }
                    
                    .save_icon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-tag.svg');
                        background-size: 24px;
                    }
                    
                    .save_icon:hover {
                        background-image: url('${pageContext.request.contextPath}/resources/images/006-price-tag.svg');
                        background-size: 24px;
                    }
                    
                    .comment_lcon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                        background-size: 12px;
                    }
                    
                    .comment_lcon:hover {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    }
                    
                    .comment_unlcon {
                        background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                        background-size: 12px;
                        display: none;
                    }
                    
                    .timeline_photo {
                        width: 660px;
                        height: 660px;
                        position: relative;
                        overflow: hidden;
                        z-index: -1;
                    }
                    
                    .timephoto {
                        display: flex;
                        position: absolute;
                        top: 0px;
                        left: 0px;
                    }
                    
                    .show_t_img {
                        width: 660px;
                        height: 660px;
                        z-index: 2;
                    }
                    
                    #right_small_con {
                        width: 320px;
                        float: right;
                        margin-left: 20px;
                        position: fixed;
                    }
                    
                    #report_back {
                        position: fixed;
                        width: 100%;
                        height: 100%;
                        background-color: black;
                        opacity: 0.5;
                        display: none;
                        z-index: 5;
                    }
                    
                    #report_modal {
                        position: fixed;
                        width: 100%;
                        height: 100%;
                        display: none;
                        z-index: 6;
                    }
                    
                    #report_choose,
                    #report_write,
                    #report_result,
                    #report_already,
                    #pre_report_choose,
                    #unfollowchk,
                    #askunfollow,
                    #cantunfollow,
                    #share_con,
                    #share_con_result {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        width: 400px;
                        background: #fff;
                        z-index: 7;
                        border-radius: 20px;
                        text-align: center;
                        font-size: 14px;
                    }
                    
                    .modal_in {
                        width: 100%;
                        height: 48px;
                        line-height: 48px;
                        cursor: pointer;
                        border-bottom: 1px solid #8E8E8E;
                        color: #262626;
                    }
                    
                    .cancel {
                        border: none;
                    }
                    
                    #etc_write_con {
                        height: 192px;
                    }
                    
                    #etx_write_space {
                        margin-top: 5px;
                        margin-left: 16px;
                        width: 364px;
                        height: 182px;
                        padding: 0px;
                        border: none;
                        outline: none;
                    }
                    
                    .modal_title {
                        height: 42px;
                    }
                    
                    #report {
                        color: #ED4956;
                    }
                    
                    .modal_nocursor {
                        cursor: default;
                    }
                    
                    .modal_result {
                        height: 96px;
                    }
                    
                    .fa-bars_title {
                        display: block;
                        margin-right: 16px;
                        float: right;
                        line-height: 60px;
                        margin-top: 22px;
                    }
                    
                    .h_tag {
                        text-decoration: none;
                        color: rgb(0, 149, 246);
                        font-size: 14px;
                        line-height: 18px;
                    }
                    
                    .translate {
                        color: rgb(0, 149, 246);
                        float: right;
                    }
                </style>
        </head>

        <body>
            <div id="report_back"></div>
            <div id="report_modal">
                <div id="report_choose" style="display: none;">
                    <div id="report" class="modal_in modal_title modal_nocursor">신고하기</div>
                    <div id="fword" class="modal_in send_report">욕설</div><input type="hidden" value="욕설">
                    <div id="pornography" class="modal_in send_report">음란물</div><input type="hidden" value="음란물">
                    <div id="falsecon" class="modal_in send_report">허위내용</div><input type="hidden" value="허위내용">
                    <div id="embezzlement" class="modal_in send_report">도용된 자료 포함</div><input type="hidden" value="도용된 자료 포함">
                    <div id="etc" class="modal_in">기타</div>
                    <div id="cancel" class="modal_in cancel">취소</div>
                </div>
                <div id="report_write" style="display: none;">
                    <div id="etc_con" class="modal_in modal_title modal_nocursor">이 게시물을 신고한는 이유</div>
                    <div id="etc_write_con" class="modal_in">
                        <textarea id="etx_write_space"></textarea>
                    </div>
                    <div id="send_r" class="modal_in send_report_text">신고하기</div>
                    <div id="cancel_2" class="modal_in cancel">취소</div>
                </div>
                <div id="report_result" style="display: none;">
                    <div class="modal_in  modal_title modal_nocursor">신고 완료</div>
                    <div class="modal_in modal_nocursor modal_result">${my_name }님의 신고가 정상적으로 접수되었습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.
                    </div>
                    <div id="cancel_3" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="report_already" style="display: none;">
                    <div class="modal_in modal_nocursor modal_result">이미 신고하셨습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.</div>
                    <div id="cancel_4" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="askunfollow" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우를 취소하시겠습니까?</div>
                    <div id="yes_unfollow" class="modal_in">팔로우 취소하기</div>
                    <div id="cancel_7" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="unfollowchk" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우가 취소되었습니다.</div>
                    <div id="cancel_6" class="modal_in cancel" onclick="location.href='timeLineList.do'">화면으로 돌아가기</div>
                </div>
                <div id="cantunfollow" style="display: none;">
                    <div class="modal_in modal_nocursor">나 자신은 팔로우 취소할 수 없어요!</div>
                    <div id="cancel_8" class="modal_in cancel" onclick="location.href='timeLineList.do'">화면으로 돌아가기</div>
                </div>
                <div id="pre_report_choose" style="display: none;">
                    <div id="pre_report_re" class="modal_in toreport" onclick="report('b_id', 'id', 'type');">게시물 신고하기
                    </div>
                    <div id="pre_unfollow" class="modal_in">팔로우 취소</div>
                    <div id="pre_go" class="modal_in">게시물로 이동하기</div>
                    <div id="cancel_5" class="modal_in cancel">취소</div>
                </div>
                <div id="share_con" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물 공유하기</div>
                    <div id="url_con" class="modal_in">
                        <textarea id="url" readonly></textarea>
                    </div>
                    <div id="share_chk" class="modal_in">복사하기</div>
                    <div id="cancel_9" class="modal_in cancel">취소</div>
                </div>
                <div id="share_con_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물의 주소가 복사됐습니다.</div>
                    <div id="cancel_10" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
            </div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="timeline_big_con">
                    <div id="timeline_left">
                        <div id="story_con">
                            <div id="blank_for_story"></div>
                            <div id="story_inner_con">
                                <div class="story_small_con my_story_add">
                                    <div class="story_profile"></div>
                                    <div class="story_id">내 스토리</div>
                                </div>
                                <c:if test="${not empty storyList }">
                                    <div class="story_small_con show_all_story">
                                        <div class="story_profile_a">
                                            <div id="sa_icon"></div>
                                        </div>
                                        <div class="story_id">스토리 전체 보기</div>
                                    </div>
                                    <c:forEach var="vo" items="${storyList }" varStatus="s">
                                        <div class="story_small_con eachstory" onclick="eachstory('${vo.m_id }');">
                                            <div class="story_profile">${vo.m_img }</div>
                                            <div class="story_id">${vo.m_id }</div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div id="timeline_blank"></div>
                        <div id="page_con">
                            <c:if test="${not empty timeLineList }">
                                <c:forEach var="vo" items="${timeLineList }" varStatus="s">
                                    <div class="timeline_contents" id="timeline_contents">
                                        <div class="timeline_profile">
                                            <div class="t_prof_photo" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_img }</div>
                                            <div class="t_prof_id" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_id }
                                            </div>
                                            <i class="fas fa-bars fa-bars_title" onclick="pre_report('${vo.t_id}','${vo.m_id }','${vo.t_type}');"></i>
                                        </div>
                                        <div class="timeline_photo timeline_photo${vo.t_id }">
                                            <ul class="photo${vo.t_id } timephoto" id="photo${vo.t_id }">
                                            </ul>
                                            <input type="hidden" class="hidden_showphoto" onclick="showphoto('${vo.t_id }','${vo.t_img }');">
                                        </div>
                                        <button type="button" class="slidebtn slidebtn${vo.t_id } slide_btn_prev slide_btn_prev${vo.t_id }" style="display:none;">Prev</button>
                                        <button type="button" class="slidebtn slidebtn${vo.t_id } slide_btn_next slide_btn_next${vo.t_id }" style="display:none;">Next</button>
                                        <div class="timeline_comment_con">
                                            <div class="inner_comment_con">
                                                <div class="timeline_icon_con">
                                                    <div class="icon like_icon likechk${vo.t_id }" onclick="pressLike('${vo.t_id}','${vo.m_id }');"></div>
                                                    <div class="icon unlike_icon unlikechk${vo.t_id }" onclick="pressUnlike('${vo.t_id}');"></div>
                                                    <div class="icon write_icon"></div>
                                                    <div class="icon share_icon" onclick="shareurl('${vo.m_id }','${vo.t_id}')"></div>
                                                    <!-- <div class="icon save_icon"></div> -->
                                                </div>
                                                <div class="timeline_likes_con">좋아요 <input type="button" class="lCount${vo.t_id} showlCount" value="" readonly>개</div>
                                                <div class="comment_con">
                                                    <div class="com_detail post_title">
                                                        <div class="post_id" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_id }</div>
                                                        <div class="post_content" id="post_content${vo.t_id}">${vo.t_content }
                                                        </div>
                                                        <div class="translate" onclick="translatec('${vo.t_content }', '${vo.t_id}');" style="cursor: pointer;">번역하기</div>
                                                    </div>
                                                    <ul class="hashtag${vo.t_id }" id="hashtag${vo.t_id }">
                                                    </ul>
                                                    <input type="hidden" class="hidden_showhashtag" onclick="showhashtag('${vo.t_id }');">
                                                    <div class="com_detail comment_more" onclick="showAllCo('${vo.t_id }');">댓글 전체 보기</div>
                                                    <div class="com_detail cm1 cm1${vo.t_id }">
                                                        <div class="commentRId post_id commentRIdf"></div>
                                                        <div class="commentResult post_content commentResultf">
                                                        </div>
                                                        <!-- <a class="commentViewAll"></a> -->
                                                    </div>
                                                    <ul class="cm2${vo.t_id }" id="cm2${vo.t_id }">
                                                    </ul>
                                                    <ul class="cm3${vo.t_id }" id="cm3${vo.t_id }">
                                                    </ul>
                                                    <input type="hidden" class="hidden_likechk" onclick="likechk('${vo.t_id }');"> <input type="hidden" class="hidden_commentchk" onclick="showAllCoHidden('${vo.t_id }');">
                                                    <input type="hidden" name="t_type" class="t_type${vo.t_id }" value="${vo.t_type }">

                                                    <!-- ---------------------------------게시물 좋아요 수 카운트 trigger---------------------------------- -->
                                                    <input type="hidden" value="${vo.t_id}" class="countLike_trigger" onclick="countLike('${vo.t_id}');">
                                                    <!-- -------------------------------------------------------------------------------------------- -->
                                                </div>
                                                <div class="timeline_time">${vo.t_time }</div>
                                            </div>
                                        </div>
                                        <div class="upload_comment">
                                            <div class="inner_comment_con inner_upload">
                                                <input type="text" class="write_space" placeholder="댓글 달기..." name="t_comment">
                                                <button class="comment_upload">게시</button>
                                                <input type="hidden" name="t_id" value="${vo.t_id }"> <input type="hidden" name="t_type" value="${vo.t_type }" class="t_type${vo.t_id }">
                                                <input type="hidden" value="${vo.m_id }">
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div id="timeline_right">
                        <div id="right_small_con">
                            <div id="my_profile_con">
                                <div id="my_profile_photo" onclick="goboard('${my_name }');" style="cursor:pointer;">
                                    ${myProfile.m_img }</div>
                                <div id="my_id" onclick="goboard('${my_name }');" style="cursor:pointer;">${my_name }
                                </div>
                                <input type="hidden" name="m_id" class="m_id" value="${my_name }">
                            </div>
                            <div id="follow_recom_title">회원님을 위한 추천</div>
                            <div id="follow_recom_con">
                                <c:if test="${not empty recomFollow }">
                                    <c:forEach var="vo" items="${recomFollow }" varStatus="s">
                                        <div class="follow_recom_id">
                                            <div class="recom_profile" onclick="goboard('${vo.r_mid }');" style="cursor:pointer;">${vo.m_img }</div>
                                            <div class="recom_middle">
                                                <div class="recom_id" onclick="goboard('${vo.r_mid }');" style="cursor:pointer;">${vo.r_mid }</div>
                                                <div class="recom_info">${vo.count }명이 팔로우합니다</div>
                                            </div>
                                            <button class="recom_follow followBtn" style="cursor:pointer;">팔로우</button>
                                            <input type="hidden" value="${vo.r_mid }">
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div id="footer_info">
                                <a class="footera" href="${pageContext.request.contextPath}/serviceCenter">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                                <a class="footera" href="${pageContext.request.contextPath}/aboutUs">사이트
                                    소개&nbsp;&nbsp;|&nbsp;&nbsp;</a>
                                <a class="footera" href="#" onclick="logout('${my_name }');">로그아웃</a>
                                <div id="footer_infoc">© 2020 TA_IN</div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </body>
        <script type="text/javascript">
            var memId = $(".m_id").val();
            $(function() {

                // 페이지 로딩 시 처음 두개 댓글 나타내기 trigger 호출
                $(".hidden_commentchk").trigger('click');

                // 게시물 좋아요 체크 trigger 호출
                $(".hidden_likechk").trigger('click');

                // 게시물 좋아요 수 카운트 trigger 호출
                $(".countLike_trigger").trigger('click');

                // 게시물 이미지 보기 trigger 호출
                $(".hidden_showphoto").trigger('click');

                // 해쉬태그 보기 trigger 호출
                $(".hidden_showhashtag").trigger('click');
                //회원 추천 팔로우
                $(".followBtn").on('click', function() {
                    var r_mid = $(this).next().val();
                    console.log(memId);
                    console.log(r_mid);
                    $(this).next().parent().remove();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/insertFollow.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            r_mid: r_mid,
                            m_id2:r_mid
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " r_mid : " +
                                r_mid);
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
                });


                /* 스크롤 페이징 */
                var page = 1; // page선언

                $(function() { // 첫 화면 로드시 page 증가.
                    console.log("페이지로드:" + page);
                    getList(page); // 리스트 추가 조회
                    page++;
                });

                $(window).scroll(function() { //스크롤이 최하단으로 내려가면 리스트 조회 후 page 증가.
                    console.log("스크롤:" + page);
                    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
                        getList(page); // 리스트 추가 조회
                        page++;
                    }
                });

                function getList(page) { // 리스트 추가 조회
                    $.ajax({
                        url: 'timeLineScroll.do',
                        method: 'post',
                        data: {
                            "page": page
                        },
                        dataType: 'json',
                        success: function(resp) {
                            console.log("resp:" + resp.list);
                            console.log("data:" + resp.list.length);
                            var data = resp.list.length;
                            var htmls = "";
                            if (page == 1) { //페이지 1일 경우 id가 page인 html을 비운다.
                                $("#page").html("");
                            }
                            console.log(resp.currentPage + ":" + resp.maxPage);
                            if (resp.currentPage <= resp.maxPage) {
                                if (data > 0) {
                                    for (var i = 0; i < data; i++) {
                                        htmls += '<div class="timeline_contents" id="timeline_contents">' +
                                            '<div class="timeline_profile">' +
                                            '<div class="t_prof_photo" onclick="goboard(\'' + resp.list[i].m_id + '\');" style="cursor:pointer;">' + resp.list[i].m_img + '</div>' +
                                            '<div class="t_prof_id" onclick="goboard(\'' + resp.list[i].m_id + '\');" style="cursor:pointer;">' + resp.list[i].m_id + '' +
                                            '</div>' +
                                            '<i class="fas fa-bars fa-bars_title" onclick="pre_report(\'' + resp.list[i].t_id + '\',\'' + resp.list[i].m_id + '\',\'' + resp.list[i].t_type + '\');"></i>' +
                                            '</div>' +
                                            '<div class="timeline_photo timeline_photo' + resp.list[i].t_id + '">' +
                                            '<ul class="photo' + resp.list[i].t_id + ' timephoto" id="photo' + resp.list[i].t_id + '">' +
                                            '</ul>' +
                                            '<input type="hidden" class="hidden_showphoto" onclick="showphoto(\'' + resp.list[i].t_id + '\',\'' + resp.list[i].t_img + '\');">' +
                                            '</div>' +
                                            '<button type="button" class="slidebtn slidebtn' + resp.list[i].t_id + ' slide_btn_prev slide_btn_prev' + resp.list[i].t_id + '" style="display:none;">Prev</button>' +
                                            '<button type="button" class="slidebtn slidebtn' + resp.list[i].t_id + ' slide_btn_next slide_btn_next' + resp.list[i].t_id + '" style="display:none;">Next</button>' +
                                            '<div class="timeline_comment_con">' +
                                            '<div class="inner_comment_con">' +
                                            '<div class="timeline_icon_con">' +
                                            '<div class="icon like_icon likechk' + resp.list[i].t_id + '" onclick="pressLike(\'' + resp.list[i].t_id + '\',\'' + resp.list[i].m_id + '\');"></div>' +
                                            '<div class="icon unlike_icon unlikechk' + resp.list[i].t_id + '" onclick="pressUnlike(\'' + resp.list[i].t_id + '\');"></div>' +
                                            '<div class="icon write_icon"></div>' +
                                            '<div class="icon share_icon" onclick="shareurl(\'' + resp.list[i].m_id + '\',\'' + resp.list[i].t_id + '\')"></div>' +
                                            //'<div class="icon save_icon"></div>' +
                                            '</div>' +
                                            '<div class="timeline_likes_con">좋아요 <input type="button" class="lCount' + resp.list[i].t_id + ' showlCount" value="" readonly>개</div>' +
                                            '<div class="comment_con">' +
                                            '<div class="com_detail post_title">' +
                                            '<div class="post_id" onclick="goboard(\'' + resp.list[i].m_id + '\');" style="cursor:pointer;">' + resp.list[i].m_id + '</div>' +
                                            '<div class="post_content" id="post_content' + resp.list[i].t_id + '">' + resp.list[i].t_content + '' +
                                            '</div>' +
                                            '<div class="translate" onclick="translatec(\'' + resp.list[i].t_content + '\',\'' + resp.list[i].t_id + '\');" style="cursor: pointer;">번역하기</div>' +
                                            '</div>' +
                                            '<ul class="hashtag' + resp.list[i].t_id + '" id="hashtag' + resp.list[i].t_id + '">' +
                                            '</ul>' +
                                            '<input type="hidden" class="hidden_showhashtag" onclick="showhashtag(\'' + resp.list[i].t_id + '\');">' +
                                            '<div class="com_detail comment_more" onclick="showAllCo(\'' + resp.list[i].t_id + '\');">댓글 전체 보기</div>' +
                                            '<div class="com_detail cm1 cm1' + resp.list[i].t_id + '">' +
                                            '<div class="commentRId post_id commentRIdf"></div>' +
                                            '<div class="commentResult post_content commentResultf">' +
                                            '</div>' +
                                            '</div>' +
                                            '<ul class="cm2' + resp.list[i].t_id + '" id="cm2' + resp.list[i].t_id + '">' +
                                            '</ul>' +
                                            '<ul class="cm3' + resp.list[i].t_id + '" id="cm3' + resp.list[i].t_id + '">' +
                                            '</ul>' +
                                            '<input type="hidden" class="hidden_likechk" onclick="likechk(\'' + resp.list[i].t_id + '\');"> <input type="hidden" class="hidden_commentchk" onclick="showAllCoHidden(\'' + resp.list[i].t_id + '\');">' +
                                            '<input type="hidden" name="t_type" class="t_type' + resp.list[i].t_id + '" value="' + resp.list[i].t_type + '">' +
                                            '<input type="hidden" value="' + resp.list[i].t_id + '" class="countLike_trigger" onclick="countLike(\'' + resp.list[i].t_id + '\');">' +
                                            '</div>' +
                                            '<div class="timeline_time">' + resp.list[i].t_time + '</div>' +
                                            '</div>' +
                                            '</div>' +
                                            '<div class="upload_comment">' +
                                            '<div class="inner_comment_con inner_upload">' +
                                            '<input type="text" class="write_space" placeholder="댓글 달기..." name="t_comment">' +
                                            '<button class="comment_upload">게시</button>' +
                                            '<input type="hidden" name="t_id" value="' + resp.list[i].t_id + '"> <input type="hidden" name="t_type" value="' + resp.list[i].t_type + '" class="t_type' + resp.list[i].t_id + '">' +
                                            '<input type="hidden" value="' + resp.list[i].m_id + '">' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>';
                                    }
                                } else {}
                            }
                            if (page == 1) { //페이지가 1이 아닐경우 데이터를 붙힌다.
                                $("#page_con").append("");
                            } else {
                                $("#page_con").append(htmls);
                                // 페이지 로딩 시 처음 두개 댓글 나타내기 trigger 호출
                                $(".hidden_commentchk").trigger('click');

                                // 게시물 좋아요 체크 trigger 호출
                                $(".hidden_likechk").trigger('click');

                                // 게시물 좋아요 수 카운트 trigger 호출
                                $(".countLike_trigger").trigger('click');

                                // 게시물 이미지 보기 trigger 호출
                                $(".hidden_showphoto").trigger('click');

                                // 해쉬태그 보기 trigger 호출
                                $(".hidden_showhashtag").trigger('click');

                                // 댓글 등록 (일반 & 비즈니스 게시판 분리)
                                // 처음 등록된 댓글에는 좋아요 & 변환 불가
                                $(".comment_upload").on('click', function() {
                                    var postid = $(this).next().val();
                                    var comment = $(this).prev().val();
                                    var type = $(this).next().next().val();
                                    var m_id2 = $(this).next().next().next().val();
                                    console.log(postid);
                                    console.log(comment);
                                    console.log(memId);
                                    console.log(type);
                                    console.log(m_id2);
                                    if (comment == "" || comment == null) {
                                        console.log("comment won't be uploaded");
                                        return false;
                                    } else {

                                        // 댓글 append - cm1
                                        $(this).parent().parent().prev().find(".comment_more").css("display", "block");
                                        $(this).parent().parent().prev().find(".cm1").css("display", "block");
                                        $(this).parent().parent().prev().find(".commentRIdf").text(memId);
                                        $(this).parent().parent().prev().find(".commentResultf").text(comment);

                                        // 댓글 등록 - 일반 게시판
                                        if (type == "G") {
                                            console.log("board comment upload!");
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/coInsert.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_comment: comment,
                                                    t_id: postid,
                                                    m_id2: m_id2
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " comment : " +
                                                        comment +
                                                        " postid : " +
                                                        postid);
                                                    $(".write_space").val('');
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

                                            // 댓글 등록 - 비즈니스 게시판
                                        } else if (type == "B") {
                                            console.log("businessboard comment upload!");
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/coInsertB.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_comment: comment,
                                                    t_id: postid
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " comment : " +
                                                        comment +
                                                        " postid : " +
                                                        postid);
                                                    $(".write_space").val('');
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
                                    }
                                });
                            }
                        },
                        error: function(e) {
                            alert("데이터 실패.");
                            if (e.status == 300) {
                                alert("데이터를 가져오는데 실패하였습니다.");
                            };
                        }
                    });
                }


            });

            // 스토리 업로드 페이지로 이동
            $(".my_story_add").on('click', function() {
                var url = "${pageContext.request.contextPath}/writeStory";
                $(location).attr('href', url);
            });
            // 스토리 전체보기 페이지로 이동
            $(".show_all_story").on('click', function() {
                var url = "${pageContext.request.contextPath}/stories";
                $(location).attr('href', url);
            });
            // 스토리 각 페이지로 이동
            function eachstory(id) {
                var url = "${pageContext.request.contextPath}/eachstory?id=" + id;
                $(location).attr('href', url);
            }

            // 계정 상세페이지 이동 
            function goboard(id) {
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + id;
                $(location).attr('href', url);
            }

            // 로그아웃
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

            // 번역하기
            function translatec(source, b_id) {
                /* var hcount = $(".hashtag" + b_id).length;
                console.log(hcount);
                $(".hashtag" + b_id).trigger('click'); */
                var a = document.getElementById("post_content" + b_id);
                console.log(source);
                $.ajax({
                    url: "translate",
                    type: "post",
                    dataType: "json",
                    data: {
                        source: source
                    },
                    success: function(resp) {
                        if (resp.result == "ko") {
                            $.ajax({
                                url: "TranslateProcKo",
                                type: "post",
                                dataType: "json",
                                data: {
                                    source: source
                                },
                                success: function(resp) {
                                    $(a).html(resp.result);
                                }
                            });
                        } else if (resp.result == "en") {
                            $.ajax({
                                url: "TranslateProcEn",
                                type: "post",
                                dataType: "json",
                                data: {
                                    source: source
                                },
                                success: function(resp) {
                                    $(a).html(resp.result);
                                }
                            });
                        } else {
                            alert("번역할 수 없습니다.");
                        }
                    },
                    error: function(err1) {
                        $(a).html("오류가 발생하였습니다.");
                    }
                });
            }

            /* function translateh(source, b_id) {
                var a = document.getElementById("h_tag" + source + b_id);
                console.log(source);
                $.ajax({
                    url: "translate",
                    type: "post",
                    dataType: "json",
                    data: {
                        source: source
                    },
                    success: function(resp) {
                        if (resp.result == "ko") {
                            $.ajax({
                                url: "TranslateProcKo",
                                type: "post",
                                dataType: "json",
                                data: {
                                    source: source
                                },
                                success: function(resp) {
                                    $(a).html("#" + resp.result);
                                }
                            });
                        } else if (resp.result == "en") {
                            $.ajax({
                                url: "TranslateProcEn",
                                type: "post",
                                dataType: "json",
                                data: {
                                    source: source
                                },
                                success: function(resp) {
                                    $(a).html(resp.result);
                                }
                            });
                        } else {
                            alert("번역할 수 없습니다.");
                        }
                    },
                    error: function(err1) {
                        $(a).html("오류가 발생하였습니다.");
                    }
                });
            } */



            // 게시물 이미지 보기 trigger
            function showphoto(t_id, t_img) {
                t_img = t_img.split("|");
                var htmls = "";
                var a = document.getElementById("photo" + t_id);
                for (i = 0; i < t_img.length; i++) {
                    if (t_img[i] != "" && t_img[i] != " ") {
                        htmls += '<img class="show_t_img show_t_img' + t_id + '" src="${pageContext.request.contextPath}/resources/uploadFiles/' + t_img[i] + '"></li>';
                    }
                }
                $(a).html(htmls);


                var photocount = $(".show_t_img" + t_id).length;
                if (photocount > 1) {
                    $(".slidebtn" + t_id).css("display", "block");
                }

                // 게시물 슬라이드
                var slideWrapper = document.querySelector('.timeline_photo' + t_id);
                var slides = document.querySelectorAll('.show_t_img' + t_id);
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('.photo' + t_id);
                slider.style.width = sliderWidth * totalSlides + 'px';

                function showSlides(n) {
                    slideIndex = n;
                    if (slideIndex == -1) {
                        slideIndex = totalSlides - 1;
                    } else if (slideIndex === totalSlides) {
                        slideIndex = 0;
                    }
                    slider.style.left = -(sliderWidth * slideIndex) + 'px';
                }

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }
                var nextBtn = document.querySelector('.slide_btn_next' + t_id);
                var prevBtn = document.querySelector('.slide_btn_prev' + t_id);
                nextBtn.addEventListener('click', function() {
                    plusSlides(1);
                });
                prevBtn.addEventListener('click', function() {
                    plusSlides(-1);
                });
            }

            // 해쉬태그 보기 trigger
            function showhashtag(t_id) {
                var htmls = "";
                var a = document.getElementById("hashtag" + t_id);
                $.ajax({
                    url: "${pageContext.request.contextPath}/showHashTag.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        t_id: t_id
                    },
                    success: function(hashtag) {
                        var count = hashtag;
                        if (count.hashtag == undefined) {} else {
                            for (var i = 0; i < count.hashtag.length; i++) {
                                var hashtag1 = count.hashtag[i].h_tag;

                                // 해쉬태그 append - hashtag
                                // <input type="button" class="hashtag' + t_id + '"onclick="translateh(\'' + hashtag1 + '\',\'' + t_id + '\')">
                                htmls += '<a class="h_tag" id="h_tag' + hashtag1 + t_id + '" href="${pageContext.request.contextPath}/explore?hashtag=' + hashtag1 + '" >#' + hashtag1 + '</a>&nbsp;';
                            }
                        }
                        $(a).html(htmls);
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

            // 댓글 등록 (일반 & 비즈니스 게시판 분리)
            // 처음 등록된 댓글에는 좋아요 & 변환 불가
            $(".comment_upload").on('click', function() {
                var postid = $(this).next().val();
                var comment = $(this).prev().val();
                var type = $(this).next().next().val();
                var m_id2 = $(this).next().next().next().val();
                console.log(postid);
                console.log(comment);
                console.log(memId);
                console.log(type);
                console.log(m_id2);
                if (comment == "" || comment == null) {
                    console.log("comment won't be uploaded");
                    return false;
                } else {

                    // 댓글 append - cm1
                    $(this).parent().parent().prev().find(".comment_more").css("display", "block");
                    $(this).parent().parent().prev().find(".cm1").css("display", "block");
                    $(this).parent().parent().prev().find(".commentRIdf").text(memId);
                    $(this).parent().parent().prev().find(".commentResultf").text(comment);

                    // 댓글 등록 - 일반 게시판
                    if (type == "G") {
                        console.log("board comment upload!");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/coInsert.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_comment: comment,
                                t_id: postid,
                                m_id2: m_id2
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " comment : " +
                                    comment +
                                    " postid : " +
                                    postid);
                                $(".write_space").val('');
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

                        // 댓글 등록 - 비즈니스 게시판
                    } else if (type == "B") {
                        console.log("businessboard comment upload!");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/coInsertB.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_comment: comment,
                                t_id: postid
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " comment : " +
                                    comment +
                                    " postid : " +
                                    postid);
                                $(".write_space").val('');
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
                }
            });


            // 게시글 좋아요 카운트 trigger - countLike_trigger
            function countLike(b_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/countLike.do",
                    method: "POST",
                    data: {
                        t_id: b_id
                    },
                    success: function(data) {
                        var result = data;
                        $(".lCount" + b_id).val(data);
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

            // 게시물 좋아요 체크 trigger - .hidden_likechk
            function likechk(t_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowLike.do",
                    method: "POST",
                    data: {
                        b_id: t_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        if (hLike >= 1) {
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 게시물 좋아요 (일반 & 비즈니스 게시판 분리)
            function pressLike(t_id, m_id2) {
                var type = $(".t_type" + t_id).val();
                var lcount = $(".lCount" + t_id).val();
                console.log(t_id);
                console.log(lcount);
                lcount++;
                console.log(lcount);

                // 게시물 좋아요 - 일반 게시판
                if (type == "G") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressLike.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id,
                            m_id2: m_id2
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                            //$(".lCount" + t_id).val(lcount);

                            // 게시물 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');
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

                    // 게시물 좋아요 - 비즈니스 게시판
                } else if (type = "B") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressLikeB.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id,
                            m_id2: m_id2
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                            //$(".lCount" + t_id).val(lcount);

                            // 게시물 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');
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
            }

            // 게시물 좋아요 취소 (일반 & 비즈니스 게시판 분리)
            function pressUnlike(t_id) {
                var type = $(".t_type" + t_id).val();
                var lcount = $(".lCount" + t_id).val();
                lcount--;

                // 게시물 좋아요 취소 - 일반 게시판
                if (type == "G") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressUnLike.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "block");
                            $(".unlikechk" + t_id).css("display", "none");
                            $(".lCount" + t_id).val(lcount);
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

                    // 게시물 좋아요 취소 - 비즈니스 게시판
                } else if (type = "B") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "block");
                            $(".unlikechk" + t_id).css("display", "none");
                            $(".lCount" + t_id).val(lcount);
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
            }

            function shareurl(m_id, b_id) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#pre_report_choose").css("display", "none");
                $("#share_con").css("display", "block");
                var url = "http://localhost:8090/tain/gnEachPage?b_id=" + b_id;
                $("#url").val(url);
                $("#share_chk").on('click', function() {
                    var curl = document.getElementById("url");
                    curl.select();
                    document.execCommand('copy');
                    curl.setSelectionRange(0, 0);
                    $("#share_con").css("display", "none");
                    $("#share_con_result").css("display", "block");
                });
            }

            function pre_report(b_id, id, type) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#pre_report_choose").css("display", "block");
                $(".toreport").on('click', function() {
                    $("#pre_report_choose").css("display", "none");
                    report(b_id, id, type);
                });
                $("#pre_go").on('click', function() {
                    var url = "${pageContext.request.contextPath}/gnEachPage?&b_id=" + b_id;
                    $(location).attr('href', url);
                });
                $("#pre_unfollow").on('click', function() {
                    $("#pre_report_choose").css("display", "none");
                    if (memId == id) {
                        $("#cantunfollow").css("display", "block");
                        $("#askunfollow").css("display", "none");
                    } else {
                        $("#askunfollow").css("display", "block");
                        $("#yes_unfollow").on('click', function() {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/unfollow.do",
                                method: "POST",
                                data: {
                                    m_id: memId,
                                    id: id
                                },
                                success: function(data) {
                                    console.log("언팔 완료");
                                    $("#askunfollow").css("display", "none");
                                    $("#unfollowchk").css("display", "block");
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
                        });
                    }
                });
            }

            // 댓글 신고 (일반 & 비즈니스 게시판 분리)
            function report(b_id, id, type) {
                console.log(b_id);
                console.log(id);
                console.log(memId);
                console.log(type);
                $.ajax({
                    url: "${pageContext.request.contextPath}/reportchk.do",
                    method: "POST",
                    data: {
                        b_id: b_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        if (hLike == 0) {
                            $("#report_modal").css("display", "block");
                            $("#report_back").css("display", "block");
                            $("#report_choose").css("display", "block");
                            $("#report_result").css("display", "none");
                            $("#report_already").css("display", "none");

                            if (type == "G") {
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReport.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $(".send_report").off('click');
                                            $(".toreport").off('click');

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
                                });
                                $(".send_report_text").on('click', function() {
                                    var report_reason = $("#etx_write_space").val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReport.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#etx_write_space").val('');
                                            $(".send_report_text").off('click');
                                            $(".toreport").off('click');
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
                                });
                            } else if (type == "B") {
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReportB.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $(".send_report").off('click');
                                            $(".toreport").off('click');
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
                                });
                                $(".send_report_text").on('click', function() {
                                    var report_reason = $("#etx_write_space").val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReportB.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $("#etx_write_space").val('');
                                            $(".send_report_text").off('click');
                                            $(".toreport").off('click');
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
                                });
                            }
                        } else if (hLike >= 1) {
                            $("#report_modal").css("display", "block");
                            $("#report_back").css("display", "block");
                            $("#report_already").css("display", "block");
                            $("#report_choose").css("display", "none");
                            $("#pre_report_choose").css("display", "none");


                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

            }

            $(".cancel").on('click', function() {
                $("#report_modal").css("display", "none");
                $("#report_back").css("display", "none");
                $("#report_write").css("display", "none");
                $("#report_result").css("display", "none");
                $("#report_choose").css("display", "none");
                $("#report_already").css("display", "none");
                $("#pre_report_choose").css("display", "none");
                $("#unfollowchk").css("display", "none");
                $("#askunfollow").css("display", "none");
                $("#cantunfollow").css("display", "none");
                $("#share_con").css("display", "none");
                $("#share_con_result").css("display", "none");
            });

            $("#etc").on('click', function() {
                $("#report_choose").css("display", "none");
                $("#report_write").css("display", "block");
            });




            // 전체 댓글보기 눌렀을 때 (일반 & 비즈니스 게시판 분리)
            function showAllCo(t_id) {
                var type = $(".t_type" + t_id).val();
                var mem_id = $(".m_id").val();

                // 전체 댓글보기 - 일반 게시판
                if (type == "G") {
                    var htmls = "";
                    var a = document.getElementById("cm3" + t_id);
                    $.ajax({
                        url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                        method: "POST",
                        data: {
                            t_id: t_id
                        },
                        dataType: "json",
                        success: function(hComment) {
                            var count = hComment;

                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;

                                // 댓글 중복 나타냄 방지 remove - cm1, cm2
                                $(".cm1" + t_id).remove();
                                $(".cm2" + t_id).remove();

                                // 전체 댓글 append - cm3  // 댓글 좋아요 체크 trigger 사용
                                htmls += '<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                    id + '</div><div class="commentResult post_content">' +
                                    b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + ' lbtn"></div>' +
                                    '<div class="comment_unlcon clcon unlikechk' + b_id + ' unlbtn"></div>' +
                                    '<input type="hidden" value="' + b_id + '"><input type="hidden" value="' + id + '"></div></div>';
                                htmls += "<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                    "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>"

                                // 답글 유무 분리 - 답글 유
                                if (countr != 0) {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '" id="cm4' + b_id + '"></ul>';


                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="display:none;">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe" style="display:none;">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<ul class="cm4' + b_id + '" id="cm4' + b_id + '"></ul>';
                                    }

                                    // 답글 유무 분리 - 답글 무
                                } else {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>';

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo"  style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>';
                                    }

                                }
                            }

                            $(a).html(htmls);

                            // 댓글 좋아요 체크 trigger 호출
                            $(".hidden_likechk").trigger('click');

                            // 댓글 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');

                            // 댓글 삭제 - 일반 게시판
                            $(".moreCoDe").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $(this).parent().next().next("ul").remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().remove();
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/deleteComment.do",
                                    method: "POST",
                                    data: {
                                        b_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
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
                            });

                            // 댓글 수정 - 일반 게시판
                            $(".moreCoMo").on('click', function() {
                                $(this).parent().next().next().css("display", "block");
                                $(".rep_comment_modify").on('click', function() {
                                    var comment = $(this).prev().val();
                                    var b_id = $(this).next().val();
                                    console.log(comment);
                                    console.log(b_id);
                                    $(this).parent().prev().prev().prev().prev().prev().find('.commentResult').text(comment);
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/updateComment.do",
                                        method: "POST",
                                        data: {
                                            t_comment: comment,
                                            t_id: b_id
                                        },
                                        success: function(data) {
                                            console.log(" comment : " +
                                                comment +
                                                " b_id : " +
                                                b_id);
                                            $(".replyMo").css("display", "none");
                                            $('.rep_comment_modify').off('click');

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

                                });
                            });

                            // 답글 달기 - 일반 게시판
                            $(".moreCoW").on('click', function() {
                                $(this).parent().next().css("display", "block");
                                $(".rep_comment_upload").on('click', function() {
                                    var b_id = $(this).next().val();
                                    var r_comment = $(this).prev().val();
                                    var r_type = $(this).next().next().val();
                                    var m_id2 = $(this).next().next().next().val();
                                    console.log(memId);
                                    console.log(b_id);
                                    console.log(r_comment);
                                    console.log(r_type);
                                    if (r_comment == "" || r_comment == null) {
                                        console.log("reply comment won't be uploaded");
                                        $(".replyCo").css("display", "none");
                                        $('.rep_comment_upload').off('click');
                                    } else {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/insertReplyComment.do",
                                            method: "POST",
                                            data: {
                                                m_id: memId,
                                                t_comment: r_comment,
                                                t_id: b_id,
                                                m_id2:m_id2
                                            },
                                            success: function(data) {
                                                console.log("memId : " +
                                                    memId +
                                                    " comment : " +
                                                    r_comment +
                                                    " postid : " +
                                                    b_id);
                                                $(".write_space").val('');
                                                $(".replyCo").css("display", "none");
                                                $('.rep_comment_upload').off('click');
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

                            // 답글 보기 - 일반 게시판
                            $(".moreCo_see").on('click', function() {
                                var t_id = $(this).next().next().next().val();
                                var mother_id = $(this).next().next().next().next().val();
                                var b_type = $(this).parent().prev().val();
                                console.log(t_id);
                                console.log(mother_id);
                                console.log(b_type);
                                var htmls = "";
                                var a = document.getElementById("cm4" + t_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                                    method: "POST",
                                    data: {
                                        t_id: t_id
                                    },
                                    dataType: "json",
                                    success: function(hComment) {
                                        var count = hComment;

                                        for (var i = 0; i < count.hComment.length; i++) {
                                            var id = count.hComment[i].m_id;
                                            var b_content = count.hComment[i].b_content;
                                            var b_id = count.hComment[i].b_id;
                                            var countr = count.hComment[i].count;
                                            var b_date = count.hComment[i].b_date;

                                            htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                mother_id + '</div><div class="commentRId post_id" style="margin-left:5px;" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                                id + '</div><div class="commentResult post_content reply_commentResult">' +
                                                b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                                '<input type="hidden" value="' + b_id + '"><input type="hidden" value="' + id + '"></div></div>';
                                            htmls += "<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>";

                                            // 답글 변환 권한 - 권한 있음
                                            if (id == mem_id) {
                                                htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="margin-left:10px;">댓글 수정</div>' +
                                                    '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                                    '<input type="hidden" value="' + b_id + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                                    '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '" style="margin-left:10px;"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>';

                                                // 답글 변환 권한 - 권한 없음
                                            } else {
                                                htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>';
                                            }
                                        }

                                        $(a).html(htmls);

                                        // 답글 좋아요 체크 trigger 호출
                                        $(".hidden_likechk").trigger('click');

                                        // 댓글 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');

                                        // 답글 좋아요 - 일반 게시판
                                        $(".comment_lcon").on('click', function() {
                                            var b_id = $(this).next().next().val();
                                            var m_id2 = $(this).next().next().next().val();
                                            console.log("m_id2" + m_id2);
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressLikeco.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id,
                                                    m_id2: m_id2
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "none");
                                                    $(".unlikechk" + b_id).css("display", "block");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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
                                        });

                                        // 답글 좋아요 취소 - 일반 게시판
                                        $(".comment_unlcon").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressUnLike.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "block");
                                                    $(".unlikechk" + b_id).css("display", "none");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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

                                        });

                                        // 답글 삭제 - 일반 게시판
                                        $(".moreCoDe").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().remove();
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/deleteComment.do",
                                                method: "POST",
                                                data: {
                                                    b_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
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
                                        });

                                        // 답글 수정 - 일반 게시판
                                        $(".moreCoMo").on('click', function() {
                                            $(this).parent().next().css("display", "block");
                                            $(".rep_comment_modify").on('click', function() {
                                                var comment = $(this).prev().val();
                                                var b_id = $(this).next().val();
                                                console.log(comment);
                                                console.log(b_id);
                                                $(this).parent().prev().prev().prev().prev().find('.commentResult').text(comment);
                                                $.ajax({
                                                    url: "${pageContext.request.contextPath}/updateComment.do",
                                                    method: "POST",
                                                    data: {
                                                        t_comment: comment,
                                                        t_id: b_id
                                                    },
                                                    success: function(data) {
                                                        console.log(" comment : " +
                                                            comment +
                                                            " b_id : " +
                                                            b_id);
                                                        $(".replyMo").css("display", "none");
                                                        $('.rep_comment_modify').off('click');
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
                                            });
                                        });
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

                            });

                            // 댓글 좋아요 - 일반 게시판
                            $(".comment_lcon").on('click', function() {
                                var b_id = $(this).next().next().val();
                                var m_id2 = $(this).next().next().next().val();
                                console.log("m_id2" + m_id2);
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressLikeco.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id,
                                        m_id2: m_id2
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "none");
                                        $(".unlikechk" + b_id).css("display", "block");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                            // 댓글 좋아요 취소 - 일반 게시판
                            $(".comment_unlcon").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressUnLike.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "block");
                                        $(".unlikechk" + b_id).css("display", "none");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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

                            });
                        }
                    });

                    // 전체 댓글보기 - 비즈니스 게시판
                } else if (type = "B") {
                    var htmls = "";
                    var a = document.getElementById("cm3" + t_id);
                    $.ajax({
                        url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                        method: "POST",
                        data: {
                            t_id: t_id
                        },
                        dataType: "json",
                        success: function(hComment) {
                            var count = hComment;
                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;

                                // 댓글 중복 나타냄 방지 remove - cm1, cm2
                                $(".cm1" + t_id).remove();
                                $(".cm2" + t_id).remove();

                                // 전체 댓글 append - cm3  // 댓글 좋아요 체크 trigger 사용
                                htmls += '<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                    id + '</div><div class="commentResult post_content">' +
                                    b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                    '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                    '<input type="hidden" value="' + b_id + '"><input type="hidden" value="' + id + '"></div></div>';
                                htmls += "<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                    "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>";

                                // 답글 유무 분리 - 답글 유
                                if (countr != 0) {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '" id="cm4' + b_id + '"></ul>';

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="display:none;">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe" style="display:none;">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<ul class="cm4' + b_id + '" id="cm4' + b_id + '"></ul>';
                                    }

                                    // 답글 유무 분리 - 답글 무
                                } else {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>';

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo"  style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"><input type="hidden" value="'+id+'"></div>';
                                    }

                                }
                            }

                            $(a).html(htmls);

                            // 댓글 좋아요 체크 trigger 호출
                            $(".hidden_likechk").trigger('click');

                            // 댓글 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');

                            // 댓글 삭제 - 비즈니스 게시판
                            $(".moreCoDe").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $(this).parent().next().next("ul").remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().remove();
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/deleteCommentB.do",
                                    method: "POST",
                                    data: {
                                        b_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
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
                            });

                            // 댓글 수정 - 비즈니스 게시판
                            $(".moreCoMo").on('click', function() {
                                $(this).parent().next().next().css("display", "block");
                                $(".rep_comment_modify").on('click', function() {
                                    var comment = $(this).prev().val();
                                    var b_id = $(this).next().val();
                                    console.log(comment);
                                    console.log(b_id);
                                    $(this).parent().prev().prev().prev().prev().prev().find('.commentResult').text(comment);
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/updateCommentB.do",
                                        method: "POST",
                                        data: {
                                            t_comment: comment,
                                            t_id: b_id
                                        },
                                        success: function(data) {
                                            console.log(" comment : " +
                                                comment +
                                                " b_id : " +
                                                b_id);
                                            $(".replyMo").css("display", "none");
                                            $('.rep_comment_modify').off('click');

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

                                });
                            });

                            // 답글 달기 - 비즈니스 게시판
                            $(".moreCoW").on('click', function() {
                                $(this).parent().next().css("display", "block");
                                $(".rep_comment_upload").on('click', function() {
                                    var b_id = $(this).next().val();
                                    var r_comment = $(this).prev().val();
                                    var r_type = $(this).next().next().val();
                                    var m_id2 = $(this).next().next().next().val();
                                    console.log(memId);
                                    console.log(b_id);
                                    console.log(r_comment);
                                    console.log(r_type);
                                    if (r_comment == "" || r_comment == null) {
                                        console.log("reply comment won't be uploaded");
                                        $(".replyCo").css("display", "none");
                                        $('.rep_comment_upload').off('click');
                                    } else {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/insertReplyCommentB.do",
                                            method: "POST",
                                            data: {
                                                m_id: memId,
                                                t_comment: r_comment,
                                                t_id: b_id,
                                                m_id2:m_id2
                                            },
                                            success: function(data) {
                                                console.log("memId : " +
                                                    memId +
                                                    " comment : " +
                                                    r_comment +
                                                    " postid : " +
                                                    b_id);
                                                $(".write_space").val('');
                                                $(".replyCo").css("display", "none");
                                                $('.rep_comment_upload').off('click');
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

                            // 답글 보기 - 비즈니스 게시판
                            $(".moreCo_see").on('click', function() {
                                var t_id = $(this).next().next().next().val();
                                var mother_id = $(this).next().next().next().next().val();
                                var b_type = $(this).parent().prev().val();
                                console.log(t_id);
                                console.log(mother_id);
                                console.log(b_type);
                                var htmls = "";
                                var a = document.getElementById("cm4" + t_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                                    method: "POST",
                                    data: {
                                        t_id: t_id
                                    },
                                    dataType: "json",
                                    success: function(hComment) {
                                        var count = hComment;

                                        for (var i = 0; i < count.hComment.length; i++) {
                                            var id = count.hComment[i].m_id;
                                            var b_content = count.hComment[i].b_content;
                                            var b_id = count.hComment[i].b_id;
                                            var countr = count.hComment[i].count;
                                            var b_date = count.hComment[i].b_date;

                                            htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                mother_id + '</div><div class="commentRId post_id" style="margin-left:5px;" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                                id + '</div><div class="commentResult post_content reply_commentResult">' +
                                                b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                                '<input type="hidden" value="' + b_id + '"><input type="hidden" value="' + id + '"></div></div>';
                                            htmls += "<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>";

                                            // 답글 변환 권한 - 권한 있음
                                            if (id == mem_id) {
                                                htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="margin-left:10px;">댓글 수정</div>' +
                                                    '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                                    '<input type="hidden" value="' + b_id + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                                    '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '" style="margin-left:10px;"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>';

                                                // 답글 변환 권한 - 권한 없음
                                            } else {
                                                htmls += '<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="button" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>';
                                            }
                                        }

                                        $(a).html(htmls);

                                        // 답글 좋아요 체크 trigger 호출
                                        $(".hidden_likechk").trigger('click');

                                        // 댓글 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');

                                        // 답글 좋아요 - 비즈니스 게시판
                                        $(".comment_lcon").on('click', function() {
                                            var b_id = $(this).next().next().val();
                                            var m_id2 = $(this).next().next().next().val();
                                            console.log("m_id2" + m_id2);
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressLikeBco.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id,
                                                    m_id2: m_id2
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "none");
                                                    $(".unlikechk" + b_id).css("display", "block");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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
                                        });

                                        // 답글 좋아요 취소 - 비즈니스 게시판
                                        $(".comment_unlcon").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "block");
                                                    $(".unlikechk" + b_id).css("display", "none");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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

                                        });

                                        // 답글 삭제 - 비즈니스 게시판
                                        $(".moreCoDe").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().remove();
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/deleteCommentB.do",
                                                method: "POST",
                                                data: {
                                                    b_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
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
                                        });

                                        // 답글 수정 - 비즈니스 게시판
                                        $(".moreCoMo").on('click', function() {
                                            $(this).parent().next().css("display", "block");
                                            $(".rep_comment_modify").on('click', function() {
                                                var comment = $(this).prev().val();
                                                var b_id = $(this).next().val();
                                                console.log(comment);
                                                console.log(b_id);
                                                $(this).parent().prev().prev().prev().prev().find('.commentResult').text(comment);
                                                $.ajax({
                                                    url: "${pageContext.request.contextPath}/updateCommentB.do",
                                                    method: "POST",
                                                    data: {
                                                        t_comment: comment,
                                                        t_id: b_id
                                                    },
                                                    success: function(data) {
                                                        console.log(" comment : " +
                                                            comment +
                                                            " b_id : " +
                                                            b_id);
                                                        $(".replyMo").css("display", "none");
                                                        $('.rep_comment_modify').off('click');
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
                                            });
                                        });
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

                            });

                            // 댓글 좋아요 - 비즈니스 게시판
                            $(".comment_lcon").on('click', function() {
                                var b_id = $(this).next().next().val();
                                var m_id2 = $(this).next().next().next().val();
                                console.log("m_id2" + m_id2);
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressLikeBco.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id,
                                        m_id2: m_id2
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " t_id : " +
                                            t_id);
                                        $(".likechk" + b_id).css("display", "none");
                                        $(".unlikechk" + b_id).css("display", "block");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                            // 댓글 좋아요 취소 - 비즈니스 게시판
                            $(".comment_unlcon").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "block");
                                        $(".unlikechk" + b_id).css("display", "none");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                        }
                    });

                }

            }

            // 페이지 로딩 시 처음 두개 댓글 나타내기 trigger - .hidden_commentchk
            // 댓글 좋아요 표시 외 수정 불가
            function showAllCoHidden(t_id) {
                var type = $(".t_type" + t_id).val();
                var htmls = "";
                var a = document.getElementById("cm2" + t_id);
                // 두개 댓글 나타내기
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;
                        for (var i = 0; i < 2; i++) {
                            var id = count.hComment[i].m_id;
                            var b_content = count.hComment[i].b_content;
                            var b_id = count.hComment[i].b_id;
                            var b_type = count.hComment[i].b_type;
                            var countr = count.hComment[i].count;
                            var b_date = count.hComment[i].b_date;

                            // 댓글 append - cm2 // 댓글 좋아요 체크 trigger 사용
                            htmls += '<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                id + '</div><div class="commentResult post_content">' +
                                b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                '<input type="hidden" value="' + b_id + '"><input type="hidden" value="' + id + '"></div></div>';
                            htmls += "<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>";
                        }

                        $(a).html(htmls);

                        // 댓글 좋아요 체크 trigger 호출
                        $(".hidden_likechk").trigger('click');
                    }
                });

                // (일반 & 비즈니스 게시판 분리)
                if (type == "G") {
                    // 댓글 좋아요 - 일반 게시판
                    $(".comment_lcon").on('click', function() {
                        var b_id = $(this).next().next().val();
                        var m_id2 = $(this).next().next().next().val();
                        console.log("m_id2" + m_id2);
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressLikeco.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id,
                                m_id2: m_id2
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "none");
                                $(".unlikechk" + b_id).css("display", "block");
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
                    });

                    // 댓글 좋아요 취소 - 일반 게시판
                    $(".comment_unlcon").on('click', function() {
                        var b_id = $(this).next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressUnLike.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "block");
                                $(".unlikechk" + b_id).css("display", "none");
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

                    });

                    // 두개 댓글 나타내기 - 비즈니스 게시판
                } else if (type = "B") {

                    // 댓글 좋아요 - 비즈니스 게시판
                    $(".comment_lcon").on('click', function() {
                        var b_id = $(this).next().next().val();
                        var m_id2 = $(this).next().next().next().val();
                        console.log("m_id2" + m_id2);
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressLikeBco.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id,
                                m_id2: m_id2
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "none");
                                $(".unlikechk" + b_id).css("display", "block");
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
                    });

                    // 댓글 좋아요 취소 - 비즈니스 게시판
                    $(".comment_unlcon").on('click', function() {
                        var b_id = $(this).next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "block");
                                $(".unlikechk" + b_id).css("display", "none");
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
                    });
                }
            }
        </script>

        </html>