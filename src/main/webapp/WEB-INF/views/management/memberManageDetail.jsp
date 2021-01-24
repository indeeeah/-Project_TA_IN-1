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
<link
	href="${pageContext.request.contextPath}/resources/css/management.css"
	rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="mManage_box">
			<div id="mM_title">
				<h1>Manager</h1>
			</div>
			<div id="mM_con">
				<div id="menu">
					<ul id="menulist">
						<li onclick="location.href='membermanagelist.do'">일반회원</li>
						<li onclick="location.href='bsmemberManagelist.do'">비지니스회원</li>
						<li onclick="location.href='boardManagelist.do'">일반게시글</li>
						<li onclick="location.href='bsboardManagelist.do'">비지니스게시글</li>
						<li onclick="location.href='reportmemberManagelist.do'">신고회원</li>
						<li onclick="location.href='reportBoardManagelist.do'">신고(일반게시글)</li>
						<li onclick="location.href='reportBsboardManagelist.do'">신고(비지니스게시글)</li>
						<li onclick="location.href='memberOutlist.do'">탈퇴 회원</li>
						<li onclick="location.href='chartTest.do'">통계</li>
						<li onclick="location.href=logout();">로그아웃</li>
					</ul>
				</div>
				<div id="contentmanage">
					<div id="head_aticle">
						<h2 class="tit">${MemberManage.m_id}님의정보</h2>
						<br> <br>
					</div>
					<div id="tb_box">
						<table align="center" cellpadding="10" cellspacing="0" width="95%">
							<tr class="table_body">
								<td width="200">아이디</td>
								<td width="200">${MemberManage.m_id}</td>
							</tr>
							<tr class="table_body">
								<td>패스워드</td>
								<td>${MemberManage.m_pw}</td>
							</tr>
							<tr class="table_body">
								<td>이 름</td>
								<td>${MemberManage.m_name}</td>
							</tr>
							<tr class="table_body">
								<td>이메일</td>
								<td>${MemberManage.m_email}</td>
							</tr>
							<tr class="table_body">
								<td>주소</td>
								<td>${MemberManage.m_addr2}</td>
							</tr>
							<tr class="table_body">
								<td>핸드폰번호</td>
								<td>${MemberManage.m_phone}</td>
							</tr>
							<tr class="table_body">
								<td>생년월일</td>
								<td>${MemberManage.m_birth}</td>
							</tr>
							<tr class="table_body_td">
								<td>계정 용도<br>[일반계정:G 비지니스:B]
								</td>
								<td>${MemberManage.m_usage}</td>
							</tr>
							<tr class="table_body_td">
								<td>계정상태<br>[미인증:0, 활동:1, 비번찾는중:2]
								</td>
								<td>${MemberManage.m_status}</td>
							</tr>
							<tr class="table_body">
								<td>가입일자</td>
								<td>${MemberManage.m_joindate}</td>
							</tr>
							<tr class="table_bottom" align="center" valign="middle">
								<td colspan="3"><c:url var="bupview"
										value="memberManageRenew.do">
										<c:param name="m_id" value="${MemberManage.m_id}" />
										<c:param name="page" value="${currentPage}" />
									</c:url> <a class="btn-action" href="${bupview}">수정 페이지로</a>&nbsp;&nbsp;
									<c:url var="manageEmail" value="manageEmail.do">
									</c:url> <a class="btn-action" href="${manageEmail}">메일보내기</a>&nbsp;&nbsp;
									<c:url var="membermanagelist" value="membermanagelist.do">
									</c:url> <a class="btn-action" href="${membermanagelist}">목록</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function logout(id) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/member/logout.do",
					method : "POST",
					data : {
						m_id : id
					},
					success : function(data) {
						console.log("success");
						alert(data);
						var url = "${pageContext.request.contextPath}/member/loginPage";
						$(location).attr('href', url);
					},
					error : function(request, status, error) {
						console.log("error");
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
	}
</script>
</html>