<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mManage.css"
	rel="stylesheet" type="text/css" />
<title>계정 관리</title>
<style>
a {
	display: block;
}
</style>
</head>
<body>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="mManage.do">프로필 편집</a></li>
				<li><a href="mChangepw.do">비밀번호 변경</a></li>
				<li><a href="mCart.do">장바구니</a></li>
				<li style="border-left: 2px solid black;"><a href="mBuylist.do"><span
						style="font-weight: bold;">구매목록</span></a></li>
				<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
				<li><a href="mBusiness.do">비즈니스 계정</a></li>
			</ul>
		</div>
		<div id="contents" style="padding-top: 30px;">
			<span style="color:white; background:gray;">구매목록 조회</span>
			<hr style="width:80%; margin-top:30px; border:1px solid #EAEAEA;">
			<c:if test="${orderimg.size() == 0}">
					<tr>
						<td colspan="7" style="text-align: center; border-style: none;"><br>
							<br> <br> <br> <br>구매목록이 비어있습니다.<br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br></td>
					</tr>
				</c:if>
			<div style="padding-top: 30px;">
			<div style="clear:both;height:40px;"></div>
				<c:if test="${orderimg.size() != 0}">
					<c:forEach var="ol" items="${orderlist}" varStatus="status">
						<div style="float:left;width:40%;">
							<img src="${orderimg }" width="150px" height="150px" >
						</div>
						<div style="display:inline-block;width:60%;text-align:left;">
						<span style="font-size:10pt;">주문일자 : ${ol.od_date }, 상품번호 : ${ol.bb_id }<br><br>받으실 분 : ${ol.od_name }, 주소 : ${ol.od_addr1 } ${ol.od_addr2 } ${ol.od_addr3 }<br><br>수량 : ${ol.od_amount }, 사이즈 : ${ol.od_size }, 옵션 : ${ol.od_options }
						<br><br>결제가격 : <b style="font-weight:bold;"><fmt:formatNumber value="${ol.od_price }" pattern="#,###" />원</b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송상태 : <c:if test="${ol.od_status eq 'N' }"><span style="padding:4px;background:#CC3D3D; color:white;">배송준비중</span></c:if>
						<c:if test="${ol.od_status eq 'Y' }"><span style="padding:4px;background:#F29661; color:white;">&nbsp;&nbsp;&nbsp;배송중&nbsp;&nbsp;&nbsp;</span></c:if>
						<c:if test="${ol.od_status eq 'F' }"><span style="padding:4px;background:#6B9900; color:white;">&nbsp;&nbsp;배송완료&nbsp;&nbsp;</span></c:if><br><br></span>
						</div>
						<div style="clear:both;height:40px;"></div>
						<hr style="width:80%; border:1px solid #EAEAEA;">
						<div style="clear:both;height:40px;"></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>