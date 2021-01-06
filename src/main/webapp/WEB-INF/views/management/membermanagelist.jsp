<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=listForm]').on(
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
<form method="post" name="listForm" action="membermanagelist.do">
		<input type="hidden" name="page" value="${currentPage}"> 
		<input type="text" name="keyword"> <input type="submit" value="검색">
</form><br>

<table border="1">
	<tr>
		<td align="right" colspan="8" style="border: none;"><input type="button" value="전체목록"
				onclick="window.location='membermanagelist.do'"> </td>
	</tr>
	
	<tr>
		<td align="center" width="60">번호</td>
		<td align="center" width="100">아이디</td>
		<td align="center" width="100">이름</td>
		<td align="center" width="100">이메일</td>
		<td align="center" width="100">전화번호</td>
		<td align="center" width="100">가입일자</td>
		<td align="center" width="100">계정용도</td>
		<td align="center" width="100">계정상태</td>
	</tr>
	<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="8" align="center"><br> <br> 가입된 회원이 
					없습니다.<br> <br></td>
			</tr>
		</c:if>	
		<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td align="center">${status.count}</td>
					<td align="left"><a
						href="memberDetail.do?m_id=${vo.m_id}&page=${currentPage}">
							&nbsp;${vo.m_id} </a></td>
					<td align="center">${vo.m_name}</td>
					<td align="center">${vo.m_email}</td>
					<td align="center">${vo.m_phone}</td>
					<td align="center">${vo.m_joindate}</td>
					<td align="center">${vo.m_usage}</td>
					<td align="center">${vo.m_status}</td>
				</tr>
			</c:forEach>
		</c:if>	
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="8"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
					<c:url var="blistST" value="membermanagelist.do">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="black" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="membermanagelist.do">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach> <c:if test="${currentPage >= maxPage}">
					 [다음]
					 </c:if> <c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="membermanagelist.do">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if></td>
		</tr>
		
		
		
		
		
</table>
</body>
</html>