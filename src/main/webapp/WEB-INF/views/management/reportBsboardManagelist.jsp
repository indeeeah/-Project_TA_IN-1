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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=rbblistForm]').on(
				'submit',
				function(e) {
					if ($('input[name=keyword]').val() == null
							|| $('input[name=keyword]').val() == "") {
						alert("검색어를 입력해 주세요");
						e.preventDefault();
					} else {
						return true;
					}
				});
	});
</script>
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
						<h2 class="tit">비지니스 게시글 신고 목록</h2>
						<br> <br>
					</div>
					<div id="tb_box">
						<table id="mM_table">
							<tr id="table_top">
								<td colspan="3" align="left">
									<form method="get" name="rbblistForm"
										action="reportBsboardManagelist.do">
										<input type="hidden" name="page" value="${currentPage}">
										<input type="text" name="keyword" placeholder="ID Search"> <input
											class="btn-action" type="submit" value="검색">
									</form>
								</td>
								<td align="right" colspan="5" cellspacing="0"><input
									class="btn-action" type="button" value="전체목록"
									onclick="window.location='reportBsboardManagelist.do'"></td>
							</tr>
							<tr class="table_header">
								<td align="center" width="60">No.</td>
								<td width="150">신고 게시글</td>
								<td width="100">신고자</td>
								<td width="300">신고사유</td>
								<td align="center" width="100">신고날짜</td>
							</tr>
							<!-- 글이 없을 경우 -->
							<c:if test="${rbblistCount eq 0}">
								<tr class="table_body">
									<td colspan="5" align="center"><br> <br> 신고된
										게시글이 없습니다.<br> <br></td>
								</tr>
							</c:if>
							<c:if test="${rbblistCount ne 0}">
								<c:forEach var="rbb" items="${rbblist}" varStatus="rbbstatus">
									<tr class="table_body">
										<td align="center">${rbbstatus.count}</td>
										<td><a class="moveid"
											href="bsboardManagelist.do?bb_id=${rbb.bb_id}&page=${currentPage}">
												&nbsp;${rbb.bb_id} </a></td>
										<td>${rbb.m_id}</td>
										<td>${rbb.rbb_reason}</td>
										<td align="center">${rbb.rbb_date}</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 앞 페이지 번호 처리 -->
							<tr class="table_bottom">
								<td colspan="5"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
										<c:url var="rblistST" value="reportBsboardManagelist.do">
											<c:param name="page" value="${currentPage-1}" />
										</c:url>
										<a href="${rblistST}">[이전]</a>
									</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
									<c:forEach var="rb" begin="${startPage+1}" end="${endPage}">
										<c:if test="${rb eq currentPage}">
											<font color="black" size="4"><b>[${rb}]</b></font>
										</c:if>
										<c:if test="${rb ne currentPage}">
											<c:url var="rbblistchk" value="reportBsboardManagelist.do">
												<c:param name="page" value="${rb}" />
											</c:url>
											<a href="${rbblistchk}">${rb}</a>
										</c:if>
									</c:forEach> <c:if test="${currentPage >= maxPage}">
					 [다음]
					 </c:if> <c:if test="${currentPage < maxPage}">
										<c:url var="rbblistEND" value="reportBsboardManagelist.do">
											<c:param name="page" value="${currentPage+1}" />
										</c:url>
										<a href="${rbblistEND}">[다음]</a>
									</c:if></td>
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