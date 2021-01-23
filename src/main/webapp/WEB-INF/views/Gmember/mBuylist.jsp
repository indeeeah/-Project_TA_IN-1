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
/* a {
	padding: 15px 85px 15px 0 !important;
} */

body {
	text-align: center;
	margin: 0;
	color: #262626;
	background-color: #FAFAFA;
}

#mManage {
	display: flex;
	justify-content: center;
	width: 100%;
}

#sc_big_con {
	width: 1000px;
	background-color: white;
}

#sc_con {
	width: 998px;
	height: 798px;
	border: 1px solid #C7C7C7;
	border-top: none;
}

#menu {
	float: left;
	width: 260px;
	margin: 0 auto;
}

#menulist {
	list-style: none;
	margin: 0 auto;
	padding-left: 0;
	width: 260px;
	height: 798px;
}

#menulist>li {
	width: 228px;
	height: 21px;
	padding: 16px 16px 16px 16px;
	font-size: 14px;
	line-height: 21px;
	cursor: pointer;
	text-align: left;
}

#menulist>li>a {
	color: black;
	text-decoration: none;
}

#menulist>li:hover {
	background-color: #F6F6F6;
	border-left: 2px solid #D5D5D5;
}

#contents {
	display: inline-block;
	width: 706px;
	text-align: center;
	margin: 0 auto;
	padding-left: 25px;
	border-left: 1px solid #C7C7C7;
	overflow: auto;
	height:768px;
}

td {
	vertical-align: middle !important;
	text-align: left;
	font-size: 14px;
}

#imgmanageModal {
	width: 400px;
	height: 222px;
	display: none;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: white;
}

#parentModal {
	background: black;
	opacity: 0.5;
	position: fixed;
	width: 100%;
	height: 100%;
	display: none;
	margin: 0;
	z-index: 7;
}

#imgmanageModal {
	z-index: 7;
}

button:focus {
	border: none;
	outline: none;
}

#sc_title {
	padding: 20px 16px 20px 16px;
	width: 966px;
	height: 20px;
	color: #999999;
	font-size: 16px;
	line-height: 20px;
	border: 1px solid #C7C7C7;
	text-align: left;
}

.btn2 {
	height: 30px;
	border: none;
	margin-top: 15px;
	margin-bottom: 10px;
	cursor: pointer;
	outline: none;
	font-size: 13px;
	border-radius: 5px;
}

.wcon {
	outline: none;
	border: 1px solid #C7C7C7;
	height: 30px;
	padding: 0px 2px 0px 2px;
	box-sizing: border-box;
}

table {
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-left: 1px solid #D5D5D5;
	vertical-align: middle !important;
	text-align: center;
}

td {
	vertical-align: middle !important;
}

::-webkit-scrollbar {
	width: 6px;
	height: 6px;
}

::-webkit-scrollbar-track {
	background: transparent;
}

::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background: rgba(0, 0, 0, 0.35);
}

::-webkit-scrollbar-corner {
	background: #0c0c0c;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="sc_big_con">
			<div id="sc_title" style="display:fixed;">구매목록 조회</div>
			<div id="sc_con">
				<div id="menu">
					<ul id="menulist">
						<li><a href="mManage.do">프로필 편집</a></li>
						<li><a href="mChangepw.do">비밀번호 변경</a></li>
						<li><a href="mCart.do">장바구니</a></li>
						<li style="border-left: 2px solid black;"><a
							href="mBuylist.do"><span style="font-weight: bold;">구매목록</span></a></li>
						<li><a href="mLikelist.do">내가 누른 좋아요 조회</a></li>
						<li><a href="mBusiness.do">비즈니스 계정</a></li>
					</ul>
				</div>
				<div id="contents" style="padding-top: 30px;">
					<c:if test="${orderimg.size() == 0}">
						<tr>
							<td colspan="7"
								style="text-align: center; border-style: none; font-size: 14px;"><br>
								<br> <br> <br> <br>구매목록이 비어있습니다.<br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br></td>
						</tr>
					</c:if>
					<div style="padding-top: 30px;">
						<div style="clear: both; height: 40px;"></div>
						<c:if test="${orderimg.size() != 0}">
							<c:forEach var="ol" items="${orderlist}" varStatus="status">
								<div style="float: left; width: 40%;">
									<img src="${orderimg }" width="150px" height="150px">
								</div>
								<div
									style="display: inline-block; width: 60%; text-align: left;">
									<span style="font-size: 10pt;">주문일자 : ${ol.od_date },
										상품번호 : ${ol.bb_id }<br>
									<br>받으실 분 : ${ol.od_name }, 주소 : ${ol.od_addr1 }
										${ol.od_addr2 } ${ol.od_addr3 }<br>
									<br>수량 : ${ol.od_amount }, 사이즈 : ${ol.od_size }, 옵션 :
										${ol.od_options } <br>
									<br>결제가격 : <b style="font-weight: bold;"><fmt:formatNumber
												value="${ol.od_price }" pattern="#,###" />원</b>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송상태 : <c:if
											test="${ol.od_status eq 'N' }">
											<span
												style="padding: 4px; background: #CC3D3D; color: white;">배송준비중</span>
										</c:if> <c:if test="${ol.od_status eq 'Y' }">
											<span
												style="padding: 4px; background: #F29661; color: white;">&nbsp;&nbsp;&nbsp;배송중&nbsp;&nbsp;&nbsp;</span>
										</c:if> <c:if test="${ol.od_status eq 'F' }">
											<span
												style="padding: 4px; background: #6B9900; color: white;">&nbsp;&nbsp;배송완료&nbsp;&nbsp;</span>
										</c:if><br>
									<br>
									</span>
								</div>
								<div style="clear: both; height: 40px;"></div>
								<hr style="width: 80%; border: 1px solid #EAEAEA;">
								<div style="clear: both; height: 40px;"></div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>