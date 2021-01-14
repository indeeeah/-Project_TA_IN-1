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
<div style="text-align: center; margin-top:70px;"><h2>비지니스 게시물 목록</h2></div>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="60%">
	<tr>
		<td colspan="4" style="border: none;">
			<form method="post" name="listForm" action="bsboardManagelist.do">
			<input type="hidden" name="page" value="${currentPage}"> 
			<input type="text" name="keyword"> <input class="btn-action" type="submit" value="검색">
			</form></td>
		<td align="right" colspan="7" cellspacing="0" style="border: none;"><input class="btn-action" type="button" value="전체목록"
				onclick="window.location='bsboardManagelist.do'"> </td>
	</tr>
	
	<tr>
		<td align="center" width="40">번호</td>
		<td align="center" width="100">게시글 아이디</td>
		<td align="center" width="100">사용자 아이디</td>
		<td align="center" width="100">상품이름</td>
		<td align="center" width="100">상품가격</td>
		<td align="center" width="100">작성시간</td>
		<td align="center" width="100">삭제</td>
	</tr>
	<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="7" align="center"><br> <br> 등록된 게시물이 없습니다.<br> <br></td>
			</tr>
		</c:if>	
		<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td align="center">${status.count}</td>
					<td align="center">${vo.bb_id}</td>
					<td align="center">${vo.m_id}</td>
					<td align="center">${vo.bb_name}</td>
					<td align="center">${vo.bb_price}</td>
					<td align="center">${vo.bb_date}</td>
					<td align="center"><a class="btn-action" 
					onclick="if(confirm('정말 삭제 처리 하시겠습니까?')){href='bsbManageDelete.do?bb_id=${vo.bb_id}'}">강제삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>	
		
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="7"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
					<c:url var="blistST" value="bsboardManagelist.do">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="black" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="bsboardManagelist.do">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach> <c:if test="${currentPage >= maxPage}">
					 [다음]
					 </c:if> <c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="bsboardManagelist.do">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if></td>
		</tr>	
</table>
</body>
</html>