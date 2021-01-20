<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN</title>
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
                
                #general_con {
                    width: 1000px;
                }
                
                #profile_con_top {
                    width: 100%;
                    height: 150px;
                }
                
                #profile_photo {
                    width: 150px;
                    height: 150px;
                    margin-left: 50px;
                    border-radius: 50%;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_left {
                    margin-left: 80px;
                    width: 720px;
                    float: left;
                }
                
                #profile_left_top_con {
                    height: 40px;
                }
                
                #profile_name {
                    height: 40px;
                    font-size: 28px;
                    line-height: 40px;
                    float: left;
                }
                
                .profile_btn {
                    float: left;
                    margin-left: 20px;
                    margin-top: 5px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid #C7C7C7;
                    font-size: 14px;
                    line-height: 18px;
                    cursor: pointer;
                }
                
                .setting_icon {
                    width: 20px;
                    height: 20px;
                    font-size: 20px;
                    margin-left: 15px;
                    margin-top: 10px;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_middle {
                    height: 18px;
                    width: 100%;
                    margin-top: 20px;
                }
                
                #profile_intro {
                    width: 100%;
                    margin-top: 20px;
                    font-size: 16px;
                }
                
                #highlight_con {
                    margin-top: 44px;
                    margin-bottom: 44px;
                    height: 130px;
                    width: 100%;
                }
                
                .highlight_small_con {
                    width: 87px;
                    height: 100%;
                    float: left;
                    padding: 0px 20px 0px 20px;
                }
                
                .highlight_photo {
                    height: 87px;
                    width: 87px;
                    border-radius: 50%;
                    margin-top: 10px;
                    cursor: pointer;
                    border: 1px solid #C7C7C7;
                    box-sizing: border-box;
                }
                
                .highlight_photo_h {
                    height: 87px;
                    width: 87px;
                    border-radius: 50%;
                    margin-top: 10px;
                    cursor: pointer;
                    border: 1px solid #C7C7C7;
                    box-sizing: border-box;
                    background-color: #fee2f8;
                    background-image: linear-gradient(315deg, #fee2f8 0%, #dcf8ef 74%);
                }
                
                .h_icon {
                    height: 87px;
                    width: 87px;
                    border-radius: 50%;
                    cursor: pointer;
                    background-image: url('${pageContext.request.contextPath}/resources/images/button.svg');
                    background-size: 45px;
                    background-repeat: no-repeat;
                    background-position: center;
                }
                
                .highlight_title {
                    height: 18px;
                    width: 100%;
                    text-align: center;
                    font-size: 14px;
                    margin-top: 15px;
                    cursor: pointer;
                }
                
                #hidden_follow_rec {
                    width: 988px;
                    height: 280px;
                    white-space: nowrap;
                    border: 1px solid #C7C7C7;
                    box-sizing: border-box;
                    padding: 20px 0px 20px 12px;
                    margin-bottom: 28px;
                    overflow-x: auto;
                    overflow-y: hidden;
                }
                
                #rec_title {
                    width: 975px;
                    height: 18px;
                    margin-left: 13px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_con {
                    margin-top: 14px;
                    width: 134px;
                    height: 156px;
                    padding: 20px;
                    border: 1px solid #C7C7C7;
                    margin-right: 24px;
                    text-align: center;
                    display: inline-block;
                }
                
                .each_rec_photo {
                    width: 54px;
                    height: 54px;
                    background-color: burlywood;
                    border-radius: 50%;
                    margin-bottom: 20px;
                    margin-left: 40px;
                }
                
                .each_rec_id {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_name {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 5px;
                }
                
                .each_rec_followbtn {
                    width: 114px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid #C7C7C7;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 12px;
                }
                
                #line {
                    margin: 0px;
                    background: #C7C7C7;
                }
                
                #cate {
                    width: 100%;
                    height: 53px;
                    display: flex;
                    justify-content: center;
                }
                
                .cate_1 {
                    width: 52px;
                    height: 53px;
                    line-height: 53px;
                    font-size: 12px;
                }
                
                .cate_con {
                    float: left;
                    margin-top: 20px;
                }
                
                .category {
                    float: right;
                }
                
                #photo_con {
                    width: 100%;
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-between;
                }
                
                .each_photo {
                    width: 312px;
                    height: 312px;
                    margin-bottom: 32px;
                    cursor: pointer;
                }
                
                .nocursor {
                    cursor: auto;
                }
                
                .small_con {
                    margin-right: 40px;
                    float: left;
                    font-size: 16px;
                    line-height: 18px;
                }
                
                #post_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 5;
                }
                
                #post_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 6;
                }
                
                #post_con {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 1000px;
                    height: 600px;
                    background: #fff;
                    z-index: 7;
                    text-align: center;
                    font-size: 14px;
                    background: #fff;
                    display: inline;
                }
                
                #for_stay_left {
                    width: 600px;
                    height: 600px;
                    float: left;
                }
                
                #slide_photo_con {
                    max-width: 600px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #photo {
                    /* width: 600px;
                    height: 600px;
                    background-color: beige;
                    float: left; */
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .photo_all {
                    width: 600px;
                    height: 600px;
                }
                
                #post_right {
                    width: 400px;
                    height: 600px;
                    float: left;
                }
                
                #post_right_top {
                    width: 368px;
                    height: 40px;
                    background-color: white;
                    padding: 16px;
                }
                
                #post_profile_photo {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    float: left;
                }
                
                #post_profile_id {
                    margin-left: 14px;
                    height: 40px;
                    float: left;
                    font-size: 14px;
                    line-height: 40px;
                }
                
                #followbtn {
                    margin-left: 18px;
                    line-height: 40px;
                    float: left;
                    font-size: 14px;
                    cursor: pointer;
                }
                
                .fa-bars_post {
                    font-size: 16px;
                    float: right;
                    margin-top: 12px;
                }
                
                #post_right_middle {
                    width: 100%;
                    height: 364px;
                    padding-top: 13px;
                    overflow: auto;
                }
                
                .each_reply_con {
                    padding: 12px 13px 16px 16px;
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_com_con {
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_profile_photo {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    float: left;
                }
                
                .reply_right {
                    margin-left: 14px;
                    min-height: 47px;
                    width: 313px;
                    float: right;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .reply_right_com {
                    margin-left: 14px;
                    min-height: 47px;
                    width: 277px;
                    float: left;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .icon_com {
                    width: 12px;
                    height: 12px;
                    float: right;
                    cursor: pointer;
                }
                
                .icon {
                    width: 24px;
                    height: 24px;
                    float: left;
                    cursor: pointer;
                    margin-right: 16px;
                }
                
                .save_icon {
                    margin: 0px;
                    float: right;
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
                    background-size: 12px;
                }
                
                .comment_unlcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                    display: none;
                }
                
                .reply_con {
                    width: 313px;
                }
                
                .reply_date {
                    height: 14px;
                    margin-top: 16px;
                }
                
                .rebot {
                    margin-right: 12px;
                    float: left;
                    cursor: pointer;
                }
                
                .show_re_re {
                    padding: 16px 0px 0px 58px;
                    height: 18px;
                    width: 303px;
                    text-align: left;
                }
                
                #post_right_bottom {
                    width: 100%;
                    height: 151px;
                }
                
                #post_icon_box {
                    width: 368px;
                    height: 32px;
                    padding: 12px 16px 0px 16px;
                }
                
                #post_like {
                    width: 384px;
                    height: 20px;
                    background-color: white;
                    padding: 0px 0px 0px 16px;
                    text-align: left;
                    font-size: 14px;
                    line-height: 20px;
                }
                
                #post_date {
                    width: 384px;
                    height: 19px;
                    margin-top: 4px;
                    background-color: white;
                    font-size: 10px;
                    line-height: 19px;
                    text-align: left;
                    padding: 0px 0px 0px 16px;
                }
                
                #reply_box {
                    width: 368px;
                    height: 37px;
                    margin-top: 8px;
                    background-color: white;
                    padding: 18px 16px 0px 16px
                }
                
                #commentbox {
                    outline: none;
                    border: none;
                    background-color: none;
                    float: left;
                    font-size: 14px;
                    line-height: 18px;
                    width: 343px;
                    padding: 0px;
                }
                
                #sendbtn {
                    float: right;
                    cursor: pointer;
                }
                
                .cancel {
                    position: absolute;
                    right: 0px;
                }
                
                .notcancelAll {
                    position: absolute;
                    right: 0px;
                }
                
                #report_back,
                #follow_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 7;
                }
                
                #report_modal,
                #follow_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 8;
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
                #share_con_result,
                #report_member,
                #modal_more_con_not_me,
                #modal_more_con_me,
                #modal_delete,
                #modal_modifypost,
                #modify_con_result,
                #modal_more_con_not_me_not_follow,
                #report_write_mem,
                #report_comment,
                #report_write_co,
                #more_about_my_co,
                #modal_modifyco,
                #modify_con_co_result,
                #modal_delete_co,
                #modal_delete_co_result,
                #modal_delete_result {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 400px;
                    background: #fff;
                    z-index: 9;
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
                    height: 14px;
                }
                
                .lcount {
                    outline: none;
                    border: none;
                    background-color: transparent;
                    padding: 0px;
                }
                
                #see_follow,
                #see_follower {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    height: 400px;
                    width: 400px;
                    background: #fff;
                    z-index: 9;
                    border-radius: 20px;
                    text-align: center;
                    font-size: 14px;
                    overflow: auto;
                }
                
                .top_con {
                    width: 100%;
                    height: 42px;
                    border-bottom: 1px solid #C7C7C7;
                }
                
                .blank {
                    width: 48px;
                    height: 42px;
                    float: left;
                }
                
                .fo_title {
                    width: 304px;
                    height: 100%;
                    float: left;
                    font-size: 16px;
                    line-height: 42px;
                }
                
                .people_con {
                    width: 363px;
                    height: 38px;
                    padding: 8px 16px 8px 21px;
                }
                
                .people_photo {
                    width: 30px;
                    height: 30px;
                    border-radius: 50%;
                    top-margin: 5px;
                    float: left;
                }
                
                .people_middle {
                    margin-left: 12px;
                    float: left;
                    width: 250px;
                    height: 38px;
                    text-align: left;
                }
                
                .people_id,
                .people_name {
                    width: 100%;
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .people_btn {
                    float: right;
                    font-size: 14px;
                    line-height: 38px;
                    height: 32px;
                    width: 56px;
                    border: 1px solid #C7C7C7;
                }
                
                .cate_mine {
                    color: #C7C7C7;
                    cursor: pointer;
                }
                
                .h_icon {}
            </style>
        </head>

        <body>
            <input type="hidden" class="m_id" value="${my_name }">
            <input type="hidden" class="post_id" value="${id_img_fwr.m_id }">
            <div id="follow_back"></div>
            <div id="follow_modal">
                <div id="see_follower" style="display:none;">
                    <div class="top_con">
                        <div class="blank"></div>
                        <div class="fo_title">팔로워</div>
                        <div class="blank notcancelAll" style="cursor:pointer;"></div>
                    </div>
                    <c:if test="${ not empty selectFollower}">
                        <c:forEach var="vo" items="${selectFollower }" varStatus="s">
                            <input type="hidden" class="fochkWithMe" onclick="fochkWithMe('${vo.followerid }');">
                            <div class="people_con">
                                <div class="people_photo" style="cursor:pointer;" onclick="goEachAcount('${vo.followerid }');">${vo.m_img }</div>
                                <div class="people_middle">
                                    <div class="people_id" style="cursor:pointer;" onclick="goEachAcount('${vo.followerid }');">${vo.followerid }</div>
                                    <div class="people_name" style="cursor:pointer;" onclick="goEachAcount('${vo.followerid }');">${vo.m_name }</div>
                                </div>
                                <div class="people_btn people_follow people_follow${vo.followerid }" style="display:none; cursor:pointer;">팔로우</div>
                                <div class="people_btn people_alfollow people_alfollow${vo.followerid }" style="display:none; cursor:pointer;"><i class="fas fa-user-check"></i></div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <div id="see_follow" style="display:none;">
                    <div class="top_con">
                        <div class="blank"></div>
                        <div class="fo_title">팔로우</div>
                        <div class="blank notcancelAll" style="cursor:pointer;"></div>

                    </div>
                    <c:if test="${ not empty selectFollow}">
                        <c:forEach var="vo" items="${selectFollow }" varStatus="s">
                            <input type="hidden" class="fochkWithMe" onclick="fochkWithMe('${vo.followid }');">
                            <div class="people_con">
                                <div class="people_photo" style="cursor:pointer;" onclick="goEachAcount('${vo.followid }');">${vo.m_img }</div>
                                <div class="people_middle">
                                    <div class="people_id" style="cursor:pointer;" onclick="goEachAcount('${vo.followid }');">${vo.followid }</div>
                                    <div class="people_name" style="cursor:pointer;" onclick="goEachAcount('${vo.followid }');">${vo.m_name }</div>
                                </div>
                                <div class="people_btn people_follow people_follow${vo.followid }" style="display:none; cursor:pointer;">팔로우</div>
                                <div class="people_btn people_alfollow people_alfollow${vo.followid}" style="display:none; cursor:pointer;"><i class="fas fa-user-check"></i></div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div id="report_back"></div>
            <div id="report_modal">
                <div id="share_con" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물 공유하기</div>
                    <div id="url_con" class="modal_in">
                        <textarea id="url" readonly></textarea>
                    </div>
                    <div id="share_chk" class="modal_in">복사하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="share_con_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물의 주소가 복사됐습니다.</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="modal_modifypost" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물 수정하기</div>
                    <div id="modify_con" class="modal_in">
                        <textarea id="modify_text"></textarea>
                    </div>
                    <div id="savemodify" class="modal_in">수정하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="modify_con_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물이 수정되었습니다.</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="askunfollow" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우를 취소하시겠습니까?</div>
                    <div id="yes_unfollow" class="modal_in">팔로우 취소하기</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="unfollowchk" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우가 취소되었습니다.</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="report_member" style="display:none;">
                    <div id="goreportmember" class="modal_in send_report">이 사용자 신고하기</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="report_comment" style="display:none;">
                    <div id="goreportcomment" class="modal_in">신고하기</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="more_about_my_co" style="display:none;">
                    <div id="modify_co" class="modal_in">댓글 수정하기</div>
                    <div id="delete_co" class="modal_in">댓글 삭제하기</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_modifyco" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">댓글 수정하기</div>
                    <div id="modify_co_con" class="modal_in">
                        <textarea id="modify_text_co"></textarea>
                    </div>
                    <div id="savemodify_co" class="modal_in">수정하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="modify_con_co_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">댓글이 수정되었습니다.</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="modal_more_con_not_me_not_follow" style="display:none;">
                    <div class="goreportmember_modal modal_in">게시물 신고</div>
                    <div class="follow_modal modal_in">팔로우</div>
                    <div class="gothispost_modal modal_in">게시물로 이동</div>
                    <div class="sharepost_modal modal_in" onclick="shareurl();">게시물 공유하기</div>
                    <!-- <div class="savepost_modal modal_in">게시물 저장하기</div> -->
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_more_con_not_me" style="display:none;">
                    <div class="goreportmember_modal modal_in">게시물 신고</div>
                    <div class="unfollow_modal modal_in">팔로우 취소</div>
                    <div class="gothispost_modal modal_in">게시물로 이동</div>
                    <div class="sharepost_modal modal_in" onclick="shareurl();">게시물 공유하기</div>
                    <!-- <div class="savepost_modal modal_in">게시물 저장하기</div> -->
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_more_con_me" style="display:none;">
                    <div class="modifypost_modal modal_in" onclick="modifypost('${id_img_fwr.m_id }');">게시물 수정</div>
                    <div class="deletepost_modal modal_in" onclick="deletepost();">게시물 삭제</div>
                    <div class="gothispost_modal modal_in">게시물로 이동</div>
                    <div class="sharepost_modal modal_in" onclick="shareurl();">게시물 공유하기</div>
                    <!-- <div class="savepost_modal modal_in">게시물 저장하기</div> -->
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_delete" style="display:none;">
                    <div id="delete_post" class="modal_in modal_title modal_nocursor">이 게시물을 삭제하시겠습니까?</div>
                    <div class="delete_modal modal_in">삭제하기</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_delete_result" style="display:none;">
                    <div class="modal_in modal_title modal_nocursor">게시물이 삭제되었습니다.</div>
                    <div class="modal_in cancel">돌아가기</div>
                </div>
                <div id="modal_delete_co" style="display:none;">
                    <div class="modal_in modal_title modal_nocursor">이 댓글을 삭제하시겠습니까?</div>
                    <div class="delete_modal_co modal_in">삭제하기</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="modal_delete_co_result" style="display:none;">
                    <div class="modal_in modal_title modal_nocursor">댓글이 삭제되었습니다.</div>
                    <div class="modal_in notcancelAll">돌아가기</div>
                </div>
                <div id="report_choose" style="display: none;">
                    <div id="report" class="modal_in modal_title modal_nocursor">신고하기</div>
                    <div id="fword" class="modal_in send_report">욕설</div><input type="hidden" value="욕설">
                    <div id="pornography" class="modal_in send_report">음란물</div><input type="hidden" value="음란물">
                    <div id="falsecon" class="modal_in send_report">허위내용</div><input type="hidden" value="허위내용">
                    <div id="embezzlement" class="modal_in send_report">도용된 자료 포함</div><input type="hidden" value="도용된 자료 포함">
                    <div id="etc" class="modal_in etc_mem">기타</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="report_write_mem" style="display: none;">
                    <div id="etc_con_mem" class="modal_in modal_title modal_nocursor">이 회원을 신고한는 이유</div>
                    <div id="etc_write_con_mem" class="modal_in">
                        <textarea id="etx_write_space_mem"></textarea>
                    </div>
                    <div id="send_r_mem" class="modal_in send_report_text">신고하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="report_write" style="display: none;">
                    <div id="etc_con" class="modal_in modal_title modal_nocursor">이 게시물을 신고한는 이유</div>
                    <div id="etc_write_con" class="modal_in">
                        <textarea id="etx_write_space"></textarea>
                    </div>
                    <div id="send_r" class="modal_in send_report_text">신고하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="report_write_co" style="display: none;">
                    <div id="etc_con_co" class="modal_in modal_title modal_nocursor">이 댓글을 신고한는 이유</div>
                    <div id="etc_write_con_co" class="modal_in">
                        <textarea id="etx_write_space_co"></textarea>
                    </div>
                    <div id="send_r_co" class="modal_in send_report_text">신고하기</div>
                    <div class="modal_in notcancelAll">취소</div>
                </div>
                <div id="report_result" style="display: none;">
                    <div class="modal_in  modal_title modal_nocursor">신고 완료</div>
                    <div class="modal_in modal_nocursor modal_result">${my_name }님의 신고가 정상적으로 접수되었습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.
                    </div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
                <div id="report_already" style="display: none;">
                    <div class="modal_in modal_nocursor modal_result">이미 신고하셨습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.</div>
                    <div class="modal_in notcancelAll">화면으로 돌아가기</div>
                </div>
            </div>
            <div id="post_back"></div>
            <div id="post_modal">
                <input type="hidden" id="for_fuc">
                <input type="hidden" id="for_modal_con">
                <input type="hidden" id="for_modal_content">
                <input type="button" id="for_modal_fchk">
                <div id="post_con" style="display: none;">
                    <div id="for_stay_left">
                        <button type="button" class="slide_btn_prev" class="buttons" style="display: none;">Prev</button>
                        <div id="slide_photo_con">
                            <div id="photo"></div>
                        </div>
                        <button type="button" class="slide_btn_next" class="buttons" style="display: none;">Next</button>
                    </div>
                    <div id="post_right">
                        <div id="post_right_top">
                            <div id="post_profile_photo" style="cursor: pointer;" onclick="goEachAcount('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                            <div id="post_profile_id" style="cursor: pointer;" onclick="goEachAcount('${id_img_fwr.m_id }');">${id_img_fwr.m_id }</div>
                            <c:if test="${id_img_fwr.m_id eq my_name}">
                                <i class="fas fa-bars fa-bars_post" onclick="toModalMore('${id_img_fwr.m_id }');" style="cursor: pointer;"></i>
                            </c:if>
                            <c:if test="${id_img_fwr.m_id ne my_name}">
                                <c:if test="${followchk.follow eq 0}">
                                    <div id="followbtn" onclick="followinmodal('${id_img_fwr.m_id }');">팔로잉</div>
                                </c:if>
                                <i class="fas fa-bars fa-bars_post" onclick="toModalMore('${id_img_fwr.m_id }');" style="cursor: pointer;"></i>
                            </c:if>
                        </div>
                        <div id="post_right_middle">
                            <div class="each_reply_con">
                                <div class="reply_profile_photo" style="cursor: pointer;" onclick="goEachAcount('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                                <div class="reply_right re_main_con" id="re_main_con">
                                </div>
                                <div class="reply_right" id="hashtag_con">
                                </div>
                            </div>
                            <div id="reply_bcon"></div>
                        </div>
                        <div id="post_right_bottom">
                            <div id="post_icon_box">
                                <div class="icon like_icon likechk" onclick="pressLike('${id_img_fwr.m_id }');"></div>
                                <div class="icon unlike_icon unlikechk" onclick="pressUnLike();"></div>
                                <div class="icon write_icon"></div>
                                <div class="icon share_icon" onclick="shareurl();"></div>
                                <!-- <div class="icon save_icon"></div> -->
                            </div>
                            <div id="post_like"></div>
                            <div id="post_date"></div>
                            <div id="reply_box">
                                <input type="text" id="commentbox" placeholder="댓글 달기..">
                                <div id="sendbtn" class="comment_upload">게시</div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="button" class="cancel">
            </div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="general_con">
                    <div id="profile_con_top">
                        <div id="profile_photo" onclick="goStory('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                        <input type="hidden" id="storychk" value="${storychk.story }">
                        <div id="profile_left">
                            <div id="profile_left_top_con">
                                <div id="profile_name">${id_img_fwr.m_id }</div>
                                <c:if test="${id_img_fwr.m_id eq my_name}">
                                    <div id="setting" class="profile_btn">프로필 편집</div>
                                    <i class="fas fa-cog setting_icon"></i>
                                </c:if>
                                <c:if test="${id_img_fwr.m_id ne my_name}">
                                    <div id="send_message" class="profile_btn">메시지 보내기</div>
                                    <c:if test="${followchk.follow ne 0}">
                                        <div id="followchk" class="profile_btn profile_btn_ok" onclick="main_pre_unfollow('${id_img_fwr.m_id}');">
                                            <i class="fas fa-user-check" id="pre_unfollow"></i>
                                        </div>
                                    </c:if>
                                    <c:if test="${followchk.follow eq 0}">
                                        <div id="followchk" class="profile_btn profile_btn_no" onclick="main_followBtn('${id_img_fwr.m_id}');">
                                            팔로우
                                        </div>
                                    </c:if>
                                    <label for="rf">
                                        <div id="recom_follow" class="profile_btn">
                                            <i class="fas fa-caret-down"></i>
                                        </div>
                                    </label>
                                    <input type="checkbox" id="rf" style="display: none;">
                                    <i class="fas fa-bars setting_icon" id="memberReport" onclick="memberReport('${id_img_fwr.m_id}');"></i>
                                </c:if>
                            </div>
                            <div id="profile_middle">
                                <div class="small_con">게시물 ${gboard.post }</div>
                                <div class="small_con seefollower" style="cursor:pointer;">팔로워 ${id_img_fwr.follower }
                                </div>
                                <div class="small_con seefollow" style="cursor:pointer;">팔로우 ${fw.follow }</div>
                            </div>
                            <div id="profile_intro">${id_img_fwr.m_intro }</div>
                        </div>
                    </div>
                    <div id="highlight_con">
                        <c:if test="${empty highlight }">
                            <div class="highlight_small_con">
                                <div class="highlight_photo_h">
                                    <div class="h_icon"></div>
                                </div>
                                <div class="highlight_title">하이라이트<br>추가</div>
                            </div>
                        </c:if>
                        <c:if test="${not empty highlight }">
                            <div class="highlight_small_con">
                                <div class="highlight_photo_h">
                                    <div class="h_icon"></div>
                                </div>
                                <div class="highlight_title">하이라이트<br>추가</div>
                            </div>
                            <c:forEach var="vo" items="${highlight }" varStatus="s">
                                <div class="highlight_small_con">
                                    <img class="highlight_photo" onclick="highlight('${vo.h_name }');" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.h_img }">
                                    <div class="highlight_title" onclick="highlight('${vo.h_name }');">${vo.h_name }
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="hidden_follow_rec" style="display: none;">
                        <div id="rec_title">
                            <div id="title1">추천계정</div>
                            <c:if test="${not empty recomFow }">
                                <div class="highlight_small_con">
                                    <img class="highlight_photo" onclick="highlight('${vo.h_name }');" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.h_img }">
                                    <div class="highlight_title" onclick="highlight('${vo.h_name }');">${vo.h_name }
                                    </div>
                                </div>
                                <c:forEach var="vo" items="${recomFow }" varStatus="s">
                                    <div class="each_rec_con each_rec_con${vo.r_mid }">
                                        <div class="each_rec_photo" style="cursor:pointer;" onclick="goEachAcount('${vo.r_mid}');">${vo.m_img }</div>
                                        <div class="each_rec_id" style="cursor:pointer;" onclick="goEachAcount('${vo.r_mid}');">${vo.r_mid }</div>
                                        <div class="each_rec_name" style="cursor:pointer;" onclick="goEachAcount('${vo.r_mid}');">${vo.m_name }</div>
                                        <div class="each_rec_followbtn" id="each_rec_followbtn${vo.r_mid }" onclick="followBtn('${vo.r_mid}');">팔로우</div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <hr id="line">
                    <input type="radio" id="ctm1" name="x" checked style="display: none;">
                    <input type="radio" id="ctm2" name="x" style="display: none;">
                    <div id="cate">
                        <%-- <c:if test="${id_img_fwr.m_id ne my_name}"> --%>
                            <div class="cate_1">
                                <i class="fas fa-border-all cate_con"></i>
                                <div class="category">게시물</div>
                            </div>
                            <%-- </c:if> --%>
                                <%-- <c:if test="${id_img_fwr.m_id eq my_name}">
                                    <label for="ctm1">
                                        <div class="cate_1 cate_mine forctm1" style="margin-right: 60px;">
                                            <i class="fas fa-border-all cate_con"></i>
                                            <div class="category">게시물</div>
                                        </div>
                                    </label>
                                    <label for="ctm2">
                                        <div class="cate_1 cate_mine forctm2">
                                            <i class="fas fa-tags cate_con"></i>
                                            <div class="category">저장됨</div>
                                        </div>
                                    </label>
                                    </c:if> --%>
                    </div>
                    <div id="photo_con">
                        <c:if test="${not empty showpost }">
                            <c:forEach var="vo" items="${showpost }" varStatus="s">
                                <div onclick="showpost('${vo.b_id }','${vo.b_type }');"><img class="each_photo" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.b_img }">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="photo_save_con" style="display:none;">
                        저장된 콘텐츠!!
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"></jsp:include>
        </body>
        <script>
            var memId = $(".m_id").val();
            var recCount = $(".each_rec_con").length;
            var fchk = $("#for_modal_fchk").val();
            $(function() {
                console.log(recCount);
                if (recCount == 0) {
                    $("#recom_follow").css("display", "none");
                }

                $(".fochkWithMe").trigger('click');
                $(".forctm1").css("color", "#262626");
                $(".forctm2").css("color", "#C7C7C7");
                $("#ctm1").change(function() {
                    if ($("#ctm1").is(':checked')) {
                        $(".forctm1").css("color", "#262626");
                        $(".forctm2").css("color", "#C7C7C7");
                        $("#photo_con").css("display", "flex");
                        $("#photo_save_con").css("display", "none");
                    }
                });
                $("#ctm2").change(function() {
                    if ($("#ctm2").is(':checked')) {
                        $(".forctm1").css("color", "#C7C7C7");
                        $(".forctm2").css("color", "#262626");
                        $("#photo_con").css("display", "none");
                        $("#photo_save_con").css("display", "block");
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
                    url: 'gnMainScroll.do',
                    method: 'post',
                    data: {
                        "page": page,
                        m_id: memId
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
                                    htmls += '<div class="for_showpost">' +
                                        '<img class="each_photo" src="${pageContext.request.contextPath}/resources/uploadFiles/' + resp.list[i].b_img + '">' +
                                        '</div><input type="hidden" value="' + resp.list[i].b_id + '">';
                                }

                            } else {}
                        }
                        if (page == 1) { //페이지가 1이 아닐경우 데이터를 붙힌다.
                            $("#photo_con").append("");
                        } else {
                            $("#photo_con").append(htmls);

                            // flex 화면 맞추기
                            var postcount = $(".each_photo").length;
                            var forflex = postcount % 3;
                            if (forflex == 1) {
                                $("#photo_con").append('<div class="each_photo nocursor"></div>');
                                $("#photo_con").append('<div class="each_photo nocursor"></div>');
                            } else if (forflex == 2) {
                                $("#photo_con").append('<div class="each_photo nocursor"></div>');
                            }

                            $(".for_showpost").on('click', function() {
                                var t_id = $(this).next().val();
                                console.log(t_id);
                                showpost(t_id);
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


            // 팔로워 조회
            $(".seefollower").on('click', function() {
                $("#follow_back").css("display", "block");
                $("#follow_modal").css("display", "block");
                $("#see_follower").css("display", "block");
            });
            $(".seefollow").on('click', function() {
                $("#follow_back").css("display", "block");
                $("#follow_modal").css("display", "block");
                $("#see_follow").css("display", "block");
            });
            // 팔로우 체크
            function fochkWithMe(fid) {
                if (fid != memId) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/followchkf.do",
                        method: "POST",
                        data: {
                            my_name: memId,
                            m_id: fid
                        },
                        dataType: "json",
                        success: function(hLike) {
                            console.log(hLike.follow);
                            if (hLike.follow == 0) {
                                $(".people_follow" + fid).css("display", "block");
                                $(".people_alfollow" + fid).css("display", "none");
                            } else {
                                $(".people_follow" + fid).css("display", "none");
                                $(".people_alfollow" + fid).css("display", "block");
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
            }
            //해당 계정 페이지 이동
            function goEachAcount(id) {
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + id;
                $(location).attr('href', url);
            }
            // 게시물 페이지 이동
            $(".gothispost_modal").on('click', function() {
                var postid = $(".post_id").val();
                var b_id = $("#for_modal_con").val();
                var url = "${pageContext.request.contextPath}/gnEachPage?b_id=" + b_id;
                $(location).attr('href', url);
            });
            // 하이라이트 페이지 이동
            function highlight(h_name) {
                var postid = $(".post_id").val();
                var url = "${pageContext.request.contextPath}/eachHighlight?m_id=" + postid + "&h_name=" + h_name;
                $(location).attr('href', url);
            }
            
            // 스토리 작성 페이지 이동
            $(".highlight_photo_h").on('click', function(){
            	var url = "${pageContext.request.contextPath}/writeStory";
                $(location).attr('href', url);
            });




            // 멤버 신고
            function memberReport(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/chkReportMember.do",
                    method: "POST",
                    data: {
                        my_name: memId,
                        m_id: id
                    },
                    success: function(data) {
                        $("#report_modal").css("display", "block");
                        $("#report_back").css("display", "block");
                        if (data == 0) {
                            $("#report_member").css("display", "block");
                            $("#goreportmember").on('click', function() {
                                $("#report_member").css("display", "none");
                                $("#report_choose").css("display", "block");
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReportMember.do",
                                        method: "POST",
                                        data: {
                                            m_id: id,
                                            my_name: memId,
                                            rm_reason: report_reason
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
                                $(".etc_mem").on('click', function() {
                                    $("#report_choose").css("display", "none");
                                    $("#report_write_mem").css("display", "block");
                                    $(".send_report_text").on('click', function() {
                                        var report_reason = $("#etx_write_space_mem").val();
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/insertReportMember.do",
                                            method: "POST",
                                            data: {
                                                m_id: id,
                                                my_name: memId,
                                                rm_reason: report_reason
                                            },
                                            success: function(data) {
                                                console.log("신고 완료");
                                                $("#report_choose").css("display", "none");
                                                $("#report_write_mem").css("display", "none");
                                                $("#report_result").css("display", "block");
                                                $("#pre_report_choose").css("display", "none");
                                                $("#etx_write_space_mem").val('');
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
                                });
                            });
                        } else {
                            $("#report_already").css("display", "block");
                        }
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
            // 게시물 모달의 모달
            function toModalMore(m_id) {
                var b_id = $("#for_modal_con").val();
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                console.log(fchk);
                if (m_id == memId) {
                    $("#modal_more_con_me").css("display", "block");
                    // 게시글 삭제
                    $(".deletepost_modal").on('click', function() {
                        $("#report_modal").css("display", "block");
                        $("#report_back").css("display", "block");
                        $("#modal_more_con_me").css("display", "none");
                        $("#modal_delete").css("display", "block");
                        $(".delete_modal").on('click', function() {
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
                                    $("#modal_delete").css("display", "none");
                                    $("#modal_delete_result").css("display", "block");
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
                    // 게시글 수정
                    $(".modifypost_modal").on('click', function() {
                        var b_content = $("#for_modal_content").val();
                        $("#modify_text").val(b_content);
                        $("#modal_more_con_me").css("display", "none");
                        $("#modal_modifypost").css("display", "block");
                        $("#savemodify").on('click', function() {
                            var mo_content = $("#modify_text").val();
                            $.ajax({
                                url: "${pageContext.request.contextPath}/updateComment.do",
                                method: "POST",
                                data: {
                                    t_comment: mo_content,
                                    t_id: b_id
                                },
                                success: function(data) {
                                    console.log(" mo_content : " +
                                        mo_content +
                                        " b_id : " +
                                        b_id);
                                    $("#modal_modifypost").css("display", "none");
                                    $("#modify_con_result").css("display", "block");
                                    $('#savemodify').off('click');
                                    document.getElementById("newcon").innerHTML = mo_content;
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
                } else {
                    if (fchk == 0) {
                        $("#modal_more_con_not_me_not_follow").css("display", "block");
                        // 모달 팔로우
                        $(".follow_modal").on('click', function() {
                            followinmodal(m_id);
                        });
                    } else {
                        $("#modal_more_con_not_me").css("display", "block");
                        // 모달 언팔로우
                        $(".unfollow_modal").on('click', function() {
                            pre_unfollow(m_id);
                        });
                    }
                    // 모달 신고
                    $(".goreportmember_modal").on('click', function() {
                        var b_id = $("#for_modal_con").val();
                        reportpost(b_id);
                    });
                }
                // 게시글 신고
                function reportpost(b_id) {
                    $("#modal_more_con_not_me_not_follow").css("display", "none");
                    $("#modal_more_con_not_me").css("display", "none");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/reportchk.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            b_id: b_id
                        },
                        success: function(data) {
                            if (data == 0) {
                                $("#report_choose").css("display", "block");
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
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
                                $("#etc").on('click', function() {
                                    $("#report_choose").css("display", "none");
                                    $("#report_write").css("display", "block");
                                    $(".send_report_text").on('click', function() {
                                        var report_reason = $("#etx_write_space").val();
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
                                });
                            } else {
                                $("#report_already").css("display", "block");
                            }
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
                // url 공유
                $(".sharepost_modal").on('click', function() {
                    var b_id = $("#for_fuc").val();
                    var postid = $(".post_id").val();
                    $("#modal_more_con_me").css("display", "none");
                    $("#modal_more_con_not_me").css("display", "none");
                    $("#report_modal").css("display", "block");
                    $("#report_back").css("display", "block");
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
                });
            }
            // 모달의 댓글의 모달
            function moreForComment(id, b_id, b_content) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                if (id != memId) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/reportchk.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            b_id: b_id
                        },
                        success: function(data) {
                            console.log(data);
                            if (data == 0) {
                                $("#report_comment").css("display", "block");
                                $("#goreportcomment").on('click', function() {
                                    $("#report_choose").css("display", "block");
                                    $(".send_report").on('click', function() {
                                        var report_reason = $(this).next().val();
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
                                    $("#etc").on('click', function() {
                                        $("#report_choose").css("display", "none");
                                        $("#report_write_co").css("display", "block");
                                        $(".send_report_text").on('click', function() {
                                            var report_reason = $("#etx_write_space_co").val();
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
                                                    $("#report_write_co").css("display", "none");
                                                    $("#report_result").css("display", "block");
                                                    $("#pre_report_choose").css("display", "none");
                                                    $("#etx_write_space_co").val('');
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
                                    });
                                });
                            } else {
                                $("#report_already").css("display", "block");
                            }
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
                } else if (id == memId) {
                    $("#more_about_my_co").css("display", "block");
                    // 댓글 수정
                    $("#modify_co").on('click', function() {
                        $("#more_about_my_co").css("display", "none");
                        $("#modal_modifyco").css("display", "block");
                        $("#modify_text_co").val(b_content);
                        $("#savemodify_co").on('click', function() {
                            var mo_content = $("#modify_text_co").val();
                            $.ajax({
                                url: "${pageContext.request.contextPath}/updateComment.do",
                                method: "POST",
                                data: {
                                    t_comment: mo_content,
                                    t_id: b_id
                                },
                                success: function(data) {
                                    console.log(" mo_content : " +
                                        mo_content +
                                        " b_id : " +
                                        b_id);
                                    $("#modal_modifyco").css("display", "none");
                                    $("#modify_con_co_result").css("display", "block");
                                    $('#savemodify_co').off('click');
                                    document.getElementById("newcon" + b_id).innerHTML = mo_content;
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
                    // 댓글 삭제
                    $("#delete_co").on('click', function() {
                        $("#more_about_my_co").css("display", "none");
                        $("#modal_delete_co").css("display", "block");
                        $(".delete_modal_co").on('click', function() {
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
                                    $("#modal_delete_co").css("display", "none");
                                    $("#modal_delete_co_result").css("display", "block");
                                    $(".each_reply_con" + b_id).css("display", "none");
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
                }
            }
            // 스토리로 이동
            function goStory(m_id) {
                var storychk = $("#storychk").val();
                if (storychk != 0) {
                    var url = "${pageContext.request.contextPath}/eachstory?id=" + m_id;
                    $(location).attr('href', url);
                } else {}
            }
            // 게시글 상세페이지
            function showpost(t_id) {
                $("#post_back").css("display", "block");
                $("#post_modal").css("display", "block");
                $("#post_con").css("display", "block");
                $(".slide_btn_prev").css("display", "none");
                $(".slide_btn_next").css("display", "none");
                $(".likechk").css("display", "block");
                $(".unlikechk").css("display", "none");
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
                            $(".likechk").css("display", "none");
                            $(".unlikechk").css("display", "block");
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
                $.ajax({
                    url: "${pageContext.request.contextPath}/showeachpost.do",
                    method: "POST",
                    data: {
                        b_id: t_id
                    },
                    dataType: "json",
                    success: function(data) {
                        var b_id = data.showeachpost.b_id;
                        var m_id = data.showeachpost.m_id;
                        var b_date = data.showeachpost.b_date;
                        var likecount = data.showeachpost.likecount;
                        var b_content = data.showeachpost.b_content;
                        var b_img = data.showeachpost.b_img.split(",");
                        var htmls = "";
                        var a = document.getElementById("photo");
                        $("#for_modal_con").val(b_id);
                        $("#for_modal_content").val(b_content);
                        $("#for_fuc").val(b_id);
                        for (i = 0; i < b_img.length; i++) {
                            if (b_img[i] != "" && b_img[i] != " ") {
                                console.log(b_img[i]);
                                htmls += '<div><img class="photo_all" src="${pageContext.request.contextPath}/resources/uploadFiles/' + b_img[i] + '"></div>';
                            }
                        }
                        $(a).html(htmls);
                        var photoCount = $(".photo_all").length;
                        if (photoCount > 1) {
                            $(".slide_btn_prev").css("display", "block");
                            $(".slide_btn_next").css("display", "block");
                        }
                        if (b_content == null) {
                            b_content = "";
                            document.getElementById("re_main_con").innerHTML = '<div style="cursor: pointer;" onclick="goEachAcount(\'' + m_id + '\');">' + m_id + "</div>&nbsp;<div id='newcon'>" + b_content + '</div>';
                        } else {
                            document.getElementById("re_main_con").innerHTML = '<div style="cursor: pointer;" onclick="goEachAcount(\'' + m_id + '\');">' + m_id + "</div>&nbsp;<div id='newcon'>" + b_content + '</div><div class="translate" onclick="translatec(\'' + b_content + '\');">번역하기</div>';
                        }
                        document.getElementById("post_like").innerHTML = "<input type='button' id='lCount' value='" + likecount + "'>" + "명이 좋아합니다";
                        document.getElementById("post_date").innerHTML = b_date;
                        // 게시물 슬라이드
                        var slideWrapper = document.querySelector('#slide_photo_con');
                        var slides = document.querySelectorAll('.photo_all');
                        var totalSlides = slides.length;
                        var sliderWidth = slideWrapper.clientWidth;
                        var slideIndex = 0;
                        var slider = document.querySelector('#photo');
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
                        var nextBtn = document.querySelector('.slide_btn_next');
                        var prevBtn = document.querySelector('.slide_btn_prev');
                        nextBtn.addEventListener('click', function() {
                            plusSlides(1);
                        });
                        prevBtn.addEventListener('click', function() {
                            plusSlides(-1);
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
                $.ajax({
                    url: "${pageContext.request.contextPath}/showHashTag.do",
                    method: "POST",
                    dataType: "json",
                    data: {
                        t_id: t_id
                    },
                    success: function(hashtag) {
                        var count = hashtag;
                        var htmls = "";
                        var a = document.getElementById("hashtag_con");
                        if (count.hashtag == undefined) {} else {
                            for (var i = 0; i < count.hashtag.length; i++) {
                                var hashtag1 = count.hashtag[i].h_tag;
                                // 해쉬태그 append - hashtag
                                htmls += '<a href="${pageContext.request.contextPath}/explore?hashtag=' + hashtag1 + '">#' + hashtag1 + '</a>&nbsp;';
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
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;
                        var htmls = "";
                        var a = document.getElementById("reply_bcon");
                        htmls += '<div id="reset_con"></div>';
                        if (count.hComment.length == undefined) {} else {
                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;
                                var m_img = count.hComment[i].m_img;
                                console.log("답글 개수" + countr);
                                htmls += '<div class="each_reply_con each_reply_con' + b_id + '">' +
                                    '<input type="hidden" class="chkCoLike" onclick="chkCoLike(\'' + b_id + '\');">' +
                                    '<input type="hidden" class="countLike_trigger" onclick="countLike(\'' + b_id + '\');">' +
                                    '<div class="reply_com_con">' +
                                    '<div class="reply_profile_photo">' + m_img + '</div>' +
                                    '<div class="reply_right_com">' +
                                    '<div class="reply_con">' + '<div style="cursor: pointer;" onclick="goEachAcount(\'' + id + '\');">' + id + "</div>&nbsp;<div id='newcon" + b_id + "'>" + b_content + '</div><div class="translate" onclick="translater(\'' + b_content + '\',\'' + b_id + '\');">번역하기</div></div>' +
                                    '<div class="reply_date">' +
                                    '<div class=" rebot">' + b_date + '</div>' +
                                    '<div class="rebot">좋아요 ' + '<input type="button" class="lcount" id="lcount' + b_id + '"value="">' + '개</div>' +
                                    '<div class="rebot moreCoW" onclick="writeMoreCo(\'' + b_id + '\');">답글 달기</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '<i class="fas fa-bars fa-bars_reply_title" style="cursor:pointer;" onclick="moreForComment(\'' + id + '\',\'' + b_id + '\',\'' + b_content + '\');"></i>' +
                                    '<div class="icon_com like_icon comment_lcon likechk' + b_id + '" onclick="pressLike_co(\'' + b_id + '\',\'' + id + '\');"></div>' +
                                    '<div class="icon_com unlike_icon comment_unlcon unlikechk' + b_id + '" onclick="pressUnLike_co(\'' + b_id + '\');"></div>' +
                                    '</div>' +
                                    '<div class="show_re_re show_re_re' + b_id + '" onclick ="show_re_re(\'' + b_id + '\');">답글 보기 (' + countr + ')개</div>' +
                                    '</div><div class="re_con re_con' + b_id + '" id="re_con' + b_id + '"></div>' +
                                    '<div class="com_detail replyCo replyCo' + b_id + '" id="replyCo' + b_id + '" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                    id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="'+id + '"></div>';
                                if (countr == 0) {
                                    $(".show_re_re" + b_id).css("display", "none");
                                }
                            }
                        }
                        $(a).html(htmls);
                        $(".chkCoLike").trigger('click');
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
            // 번역하기
            function translatec(source) {
                /* var hcount = $(".hashtag" + b_id).length;
                console.log(hcount);
                $(".hashtag" + b_id).trigger('click'); */
                var a = document.getElementById("newcon");
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
            // 번역하기
            function translater(source, b_id) {
                /* var hcount = $(".hashtag" + b_id).length;
                console.log(hcount);
                $(".hashtag" + b_id).trigger('click'); */
                var a = document.getElementById("newcon" + b_id);
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
            // 좋아요 체크
            function chkCoLike(b_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowLike.do",
                    method: "POST",
                    data: {
                        b_id: b_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        if (hLike >= 1) {
                            $(".likechk" + b_id).css("display", "none");
                            $(".unlikechk" + b_id).css("display", "block");
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
            // 답글 좋아요
            function pressLike_co(b_id, m_id2) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/pressLikeco.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id,
                        m_id2:m_id2
                    },
                    async: false,
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
            }
            // 답글 좋아요 취소
            function pressUnLike_co(b_id) {
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
            }
            // 답글 보기
            function show_re_re(t_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;
                        var htmls = "";
                        var a = document.getElementById("re_con" + t_id);
                        for (var i = 0; i < count.hComment.length; i++) {
                            var id = count.hComment[i].m_id;
                            var b_content = count.hComment[i].b_content;
                            var b_id = count.hComment[i].b_id;
                            var b_date = count.hComment[i].b_date;
                            var m_img = count.hComment[i].m_img;
                            htmls += '<div class="each_reply_con each_reply_con' + b_id + '">' +
                                '<input type="hidden" class="chkCoLike" onclick="chkCoLike(\'' + b_id + '\');">' +
                                '<input type="hidden" class="countLike_trigger" onclick="countLike(\'' + b_id + '\');">' +
                                '<div class="reply_com_con">' +
                                '<div class="reply_profile_photo">' + m_img + '</div>' +
                                '<div class="reply_right_com">' +
                                '<div class="reply_con">' + '<div style="cursor: pointer;" onclick="goEachAcount(\'' + id + '\');">' + id + "</div>&nbsp;<div id='newcon" + b_id + "'>" + b_content + '</div><div class="translate" onclick="translater(\'' + b_content + '\',\'' + b_id + '\');">번역하기</div></div>' +
                                '<div class="reply_date">' +
                                '<div class=" rebot">' + b_date + '</div>' +
                                '<div class="rebot">좋아요 ' + '<input type="button" class="lcount lcount' + b_id + '" id="lcount' + b_id + '" value="">' + '개</div>' +
                                '</div>' +
                                '</div>' +
                                '<i class="fas fa-bars fa-bars_reply_title" style="cursor:pointer;" onclick="moreForComment(\'' + id + '\',\'' + b_id + '\',\'' + b_content + '\');"></i>' +
                                '<div class="icon_com like_icon comment_lcon likechk' + b_id + '" onclick="pressLike_co(\'' + b_id + '\',\'' + id + '\');"></div>' +
                                '<div class="icon_com unlike_icon comment_unlcon unlikechk' + b_id + '" onclick="pressUnLike_co(\'' + b_id + '\');"></div>' +
                                '</div>' +
                                '</div>';
                        }
                        $(a).html(htmls);
                        $(".chkCoLike").trigger('click');
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
            // 답글 달기 
            function writeMoreCo(b_id) {
                $(".replyCo" + b_id).css("display", "block");
                $(".rep_comment_upload").on('click', function() {
                    var r_comment = $(this).prev().val();
                    var m_id2 = $(this).next().val();
                    console.log(m_id2);
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
                                $('.show_re_re').off('click');
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
            }
            // 게시물 좋아요
            function pressLike(m_id2) {
                var lcount = $("#lCount").val();
                var b_id = $("#for_fuc").val();
                lcount++;
                $.ajax({
                    url: "${pageContext.request.contextPath}/pressLike.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id,
                        m_id2:m_id2
                    },
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " b_id : " +
                            b_id);
                        $(".likechk").css("display", "none");
                        $(".unlikechk").css("display", "block");
                        $("#lCount").val(lcount);
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
            // 게시물 좋아요 취소
            function pressUnLike() {
                var lcount = $("#lCount").val();
                var b_id = $("#for_fuc").val();
                lcount--;
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
                        $(".likechk").css("display", "block");
                        $(".unlikechk").css("display", "none");
                        $("#lCount").val(lcount);
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
            // url 공유
            function shareurl() {
                var b_id = $("#for_fuc").val();
                var postid = $(".post_id").val();
                console.log(postid);
                console.log(b_id);
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#modal_more_con_not_me_not_follow").css("display", "none");
                $("#modal_more_con_me").css("display", "none");
                $("#modal_more_con_not_me").css("display", "none");
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
                        console.log("좋아요 수는 : " + data);
                        document.getElementById("lcount" + b_id).value = data;
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
            // 메인 팔로우
            function main_followBtn(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/insertFollow.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        r_mid: id,
                        m_id2:id
                    },
                    success: function(data) {
                        $("#for_modal_fchk").val("1");
                        console.log("memId : " +
                            memId +
                            " id : " +
                            id);
                        $(".profile_btn_ok").css("display", "block");
                        $("#pre_unfollow").css("display", "block");
                        $(".profile_btn_no").css("display", "none");
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
            // 메인 언팔로우
            function main_pre_unfollow(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/unfollow.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        id: id
                    },
                    success: function(data) {
                        console.log("언팔 완료");
                        $("#for_modal_fchk").val("0");
                        $(".profile_btn_ok").css("display", "none");
                        $("#pre_unfollow").css("display", "none");
                        $(".profile_btn_no").css("display", "block");
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
            // 추천 계정 팔로우
            function followBtn(id) {
                console.log(recCount);
                $.ajax({
                    url: "${pageContext.request.contextPath}/insertFollow.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        r_mid: id,
                        m_id2:id
                    },
                    success: function(data) {
                        $("#for_modal_fchk").val("1");
                        console.log("memId : " +
                            memId +
                            " id : " +
                            id);
                        var post_id = $(".post_id").val();
                        if (post_id == id) {
                            var url = "${pageContext.request.contextPath}/gnMain?m_id=" + post_id;
                            $(location).attr('href', url);
                        } else {
                            recCount--;
                            console.log("follow Result : " + recCount);
                            if (recCount == 0) {
                                $("#recom_follow").css("display", "none");
                                $("#hidden_follow_rec").css("display", "none");
                            }
                            $(".each_rec_con" + id).css("display", "none");
                        }
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
            // 모달 팔로우
            function followinmodal(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/insertFollow.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        r_mid: id,
                        m_id2:id
                    },
                    success: function(data) {
                        $("#for_modal_fchk").val("1");
                        $(".profile_btn_ok").css("display", "block");
                        $(".profile_btn_no").css("display", "none");
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
            // 언팔로우
            function pre_unfollow(id) {
                $("#modal_more_con_not_me").css("display", "none");
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
                            $("#for_modal_fchk").val("0");
                            $(".profile_btn_ok").css("display", "none");
                            $(".profile_btn_no").css("display", "block");
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
            // 모달 닫기
            //모달 초기화 수정 필요
            $(".cancel").on('click', function() {
                var post_id = $(".post_id").val();
                $("#post_back").css("display", "none");
                $("#post_modal").css("display", "none");
                $("#post_con").css("display", "none");
                //$("#report_modal").css("display", "none");
                //$("#report_back").css("display", "none");
                //$("#share_con").css("display", "none");
                //$("#share_con_result").css("display", "none");
                //$(".each_photo").off('click');
                //$("#unfollowchk").css("display", "none");
                //var url = "${pageContext.request.contextPath}/gnMain?m_id=" + post_id;
                //$(location).attr('href', url);
            });
            // 모달 안닫히는 cencel
            $(".notcancelAll").on('click', function() {
                $("#report_modal").css("display", "none");
                $("#report_back").css("display", "none");
                $("#share_con_result").css("display", "none");
                $("#share_con").css("display", "none");
                $("#modal_more_con_me").css("display", "none");
                $("#modal_more_con_not_me").css("display", "none");
                $("#modal_delete").css("display", "none");
                $("#modal_modifypost").css("display", "none");
                $("#modify_con_result").css("display", "none");
                $("#report_already").css("display", "none");
                $("#report_result").css("display", "none");
                $("#report_write").css("display", "none");
                $("#report_choose").css("display", "none");
                $("#report_comment").css("display", "none");
                $("#report_write_co").css("display", "none");
                $("#more_about_my_co").css("display", "none");
                $("#modal_modifyco").css("display", "none");
                $("#modify_con_co_result").css("display", "none");
                $("#follow_back").css("display", "none");
                $("#follow_modal").css("display", "none");
                $("#see_follower").css("display", "none");
                $("#see_follow").css("display", "none");
                $("#modal_delete_co").css("display", "none");
                $("#modal_delete_co_result").css("display", "none");
            });
            // 계정 추천
            $("#rf").change(function() {
                if ($("#rf").is(":checked")) {
                    $("#hidden_follow_rec").css("display", "block");
                } else {
                    $("#hidden_follow_rec").css("display", "none");
                }
            });
            // 댓글 작성
            //모달 초기화 수정 필요
            $(".comment_upload").on('click', function() {
                var b_id = $("#for_fuc").val();
                var comment = $(this).prev().val();
                var post_id = $(".post_id").val();
                if (comment == "" || comment == null) {
                    console.log("comment won't be uploaded");
                    return false;
                } else {
                    console.log("board comment upload!");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/coInsert.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_comment: comment,
                            t_id: b_id,
                            m_id2:post_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " b_id : " +
                                b_id +
                                " comment : " +
                                comment);
                            var url = "${pageContext.request.contextPath}/gnMain?m_id=" + post_id;
                            $(location).attr('href', url);
                            showpost(b_id);
                            //$("#commentbox").val('');
                            //$("#post_back").css("display", "none");
                            //$("#post_modal").css("display", "none");
                            //$("#post_con").css("display", "none");
                            //$(".each_photo").off('click');
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
            //$('#post_modal').on('shown.bs.modal', function (e) {
            //	   $('#post_modal').owlCarousel('refresh');
            //	 });
            //$('#post_modal').on('hidden.bs.modal', function () {
            //	$(this).removeData();
            //	$("#post_right_middle").removeData();
            //	});
        </script>

        </html>