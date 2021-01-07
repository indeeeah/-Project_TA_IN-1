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
<div style="text-align: center; margin-top:70px;"><h2>${MemberManage.m_id}님의 정보</h2></div>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="50%">
		<tr>
			<td width="300">아이디</td>
			<td width="300">${MemberManage.m_id}</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>${MemberManage.m_pw}</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td>${MemberManage.m_name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${MemberManage.m_email}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${MemberManage.m_addr1}</td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>${MemberManage.m_phone}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${MemberManage.m_birth}</td>
		</tr>
		<tr>
			<td>계정 용도<br>[일반계정:G 비지니스:B]</td>
			<td>${MemberManage.m_usage}</td>
		</tr>
		<tr>
			<td>계정상태<br>[미인증:0, 활동:1, 비번찾는중:2]<br>[탈퇴:3, 강제탈퇴:4]</td>
			<td>${MemberManage.m_status}</td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td>${MemberManage.m_joindate}</td>
		</tr>
	
		<tr align="center" valign="middle">
			<td colspan="2"><c:url var="bupview" value="memberManageRenew.do">
					<c:param name="m_id" value="${MemberManage.m_id}" />
					<c:param name="page" value="${currentPage}" />
				</c:url> 
				<a class="btn-action" href="${bupview}">수정 페이지로 이동</a>&nbsp;&nbsp; 
				<c:url var="membermanagelist" value="membermanagelist.do">
					
				</c:url> <a class="btn-action" href="${membermanagelist}">목록</a></td>
		</tr>
	</table>
</body>
</html>