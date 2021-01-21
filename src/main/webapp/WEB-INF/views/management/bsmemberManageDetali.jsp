<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
* {
	margin: 0;
}

#mManage {
	width: 1000px;
	margin: 0 auto;
	padding: 0;
}

#menu {
	float: left;
	width: 20%;
}

#menulist {
	list-style: none;
	padding-left: 0;
}

#menulist>li {
	text-align: left;
	padding: 20px 0px 20px 0px;
}

#menulist>li>a {
	color: black;
	text-decoration: none;
}

#menulist>li:hover {
	background-color: #F6F6F6;
	border-left: 2px solid #df871b;
}

#contentmanage {
	display: inline-block;
	float: right;
	width: 78%;
	height: 100%;
	text-align: center;
}

.tit {
	font-size: 25px;
}

#table_top {
	line-height: 45px;
	vertical-align: middle;
	border-bottom: 1px solid gray;
}

#table_top td {
	padding: 0 20px;
	vertical-align: middle;
}

.table_body {
	line-height: 45px;
	text-align: center;
	border-bottom: 1px solid gray;
	vertical-align: middle;
}

.table_body_td td {
	line-height: 30px;
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px solid gray;
}

.table_bottom {
	line-height: 50px;
	text-align: center;
}

a {
	text-decoration: none;
	color: #000;
}

a:hover {
	cursor: pointer;
}

a.btn-action {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="membermanagelist.do">일반회원</a></li>
				<li><a href="bsmemberManagelist.do">비지니스회원</a></li>
				<li><a href="boardManagelist.do">일반게시글</a></li>
				<li><a href="bsboardManagelist.do">비지니스게시글</a></li>
				<li><a href="reportmemberManagelist.do">신고회원</a></li>
				<li><a href="reportBoardManagelist.do">신고(일반게시글)</a></li>
				<li><a href="reportBsboardManagelist.do">신고(비지니스게시글)</a></li>
				<li><a href="memberOutlist.do">탈퇴 회원</a></li>
				<li><a onclick="logout();">로그아웃</a></li>
			</ul>
		</div>
		<div id="contentmanage">
			<div id="head_aticle">
				<h2 class="tit">${BsMemberManage.m_id}님의정보</h2>
				<br> <br>
			</div>
			<table align="center" cellpadding="10" cellspacing="0" width="95%">
				<tr class="table_body">
					<td width="200">아이디</td>
					<td width="200">${BsMemberManage.m_id}</td>
				</tr>
				<tr class="table_body">
					<td>계정분류</td>
					<td>${BsMemberManage.bsm_cate}</td>
				</tr>
				<tr class="table_body">
					<td>회사이름</td>
					<td>${BsMemberManage.bm_name}</td>
				</tr>
				<tr class="table_body">
					<td>회사주소</td>
					<td>${BsMemberManage.bm_addr}</td>
				</tr>
				<tr class="table_body">
					<td>회사홈페이지</td>
					<td>${BsMemberManage.bm_url}</td>
				</tr>
				<tr class="table_body">
					<td>계좌번호</td>
					<td>${BsMemberManage.bm_account}</td>
				</tr>
				<tr class="table_body">
					<td>회사전화</td>
					<td>${BsMemberManage.bm_phone}</td>
				</tr>
				<tr class="table_body_td">
					<td>승인여부<br>[미승인:N, 승인:Y]
					</td>
					<td>${BsMemberManage.bm_approval}</td>
				</tr>

				<tr class="table_bottom" align="center" valign="middle">
					<td colspan="2"><c:url var="bupview"
							value="bsmemberManageRenew.do">
							<c:param name="m_id" value="${BsMemberManage.m_id}" />
							<c:param name="page" value="${currentPage}" />
						</c:url> <a class="btn-action" href="${bupview}">수정 페이지로</a>&nbsp;&nbsp;
						<c:url var="manageEmail" value="manageEmail.do">
						</c:url> <a class="btn-action" href="${manageEmail}">메일보내기</a>&nbsp;&nbsp;
						<c:url var="bsmemberManagelist" value="bsmemberManagelist.do">
						</c:url> <a class="btn-action" href="${bsmemberManagelist}">목록</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
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