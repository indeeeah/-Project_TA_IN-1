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
	color: #000;
}
a:hover { 
	cursor:pointer; 
}

a.btn-action{
	text-align: center;
	padding: 3px 10px;
	border:1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}

</style>
</head>

<body>
<div style="text-align: center; margin-top:70px;"><h2>${BsMemberManage.m_id}님의 정보</h2></div>
	<form name="renewForm" action="bsmemberManageUpdate.do" method="post">
		<input type="hidden" name="m_id" value="${BsMemberManage.m_id}">
		<table align="center" cellpadding="10" cellspacing="0" border="1" width="50%">
			<tr>
			<td width="300">아이디</td>
			<td width="300">${BsMemberManage.m_id}</td>
		</tr>
		<tr>
			<td>계정분류</td>
			<td>${BsMemberManage.bsm_cate}</td>
		</tr>
		<tr>
			<td>회사이름</td>
			<td>${BsMemberManage.bm_name}</td>
		</tr>
		<tr>
			<td>회사주소</td>
			<td>${BsMemberManage.bm_addr}</td>
		</tr>
		<tr>
			<td>회사홈페이지</td>
			<td>${BsMemberManage.bm_url}</td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>${BsMemberManage.bm_account}</td>
		</tr>
		<tr>
			<td>카카오 큐알</td>
			<td>${BsMemberManage.bm_qr}</td>
		</tr>
		<tr>
			<td>회사전화</td>
			<td>${BsMemberManage.bm_phone}</td>
		</tr>
		<tr>
			<td>승인여부<br>[미승인:N, 승인:Y]</td>
			<td><input type=text name="bm_approval"
					value="${BsMemberManage.bm_approval}"></td>
		</tr>
			<tr>
				<td colspan="2" align="center">
				<a class="btn-action" onclick="document.forms['renewForm'].submit();">수정하기</a>
				 &nbsp;<c:url var="bsmemberManagelist" value="bsmemberManagelist.do">
						<c:param name="page" value="1" />
					</c:url><a class="btn-action" href="${bsmemberManagelist}">목록</a></td>
			</tr>
		</table>
	</form>
</body>
</html>