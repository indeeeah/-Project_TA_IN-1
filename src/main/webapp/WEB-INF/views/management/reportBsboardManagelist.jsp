<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	text-decoration: none;
}
a.moveid {
	color: rgb(207, 3, 3);
}
a:hover { 
	cursor:pointer; 
}
.btn-action{
	text-align: center;
	padding: 3px 10px;
	border:1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}
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
<div style="text-align: center; margin-top:70px;"><h2>비지니스 게시글 신고 목록</h2></div>
<div>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="60%">
	<tr>
		<td colspan="4" style="border: none;">
			<form method="get" name="rbblistForm" action="reportBsboardManagelist.do">
			<input type="hidden" name="page" value="${currentPage}"> 
			<input type="text" name="keyword"> <input class="btn-action" type="submit" value="검색">
			</form></td>
		<td align="right" colspan="6" cellspacing="0" style="border: none;"><input class="btn-action" type="button" value="전체목록"
				onclick="window.location='reportBsboardManagelist.do'"> </td>
	</tr>

	<tr>
		<td align="center" width="60">번호</td>
		<td align="center" width="150">신고 게시글</td>
		<td align="center" width="100">신고자</td>
		<td align="center" width="300">신고사유</td>
		<td align="center" width="100">신고날짜</td>
	</tr>
	<!-- 글이 없을 경우 -->
		<c:if test="${rbblistCount eq 0}">
			<tr>
				<td colspan="5" align="center"><br> <br> 신고된 게시글이 
					없습니다.<br> <br></td>
			</tr>
		</c:if>	
		<c:if test="${rbblistCount ne 0}">
			<c:forEach var="rbb" items="${rbblist}" varStatus="rbbstatus">
				<tr>
					<td align="center">${rbbstatus.count}</td>
					<td align="left"><a class="moveid"
						href="bsboardManagelist.do?bb_id=${rbb.bb_id}&page=${currentPage}">
							&nbsp;${rbb.bb_id} </a></td>
					<td align="left">${rbb.m_id}</td>
					<td align="center">${rbb.rbb_reason}</td>
					<td align="center">${rbb.rbb_date}</td>
				</tr>
			</c:forEach>
		</c:if>	
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
					<c:url var="rblistST" value="reportBsboardManagelist.do">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${rblistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="rb" begin="${startPage+1}" end="${endPage}">
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
</body>
</html>