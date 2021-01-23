<%@page import="java.io.Console" %>
    <%@page import="com.project.tain.membermanage.model.service.mMemberServiceImpl" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta charset="UTF-8">
                            <link href="${pageContext.request.contextPath}/resources/css/mManage.css" rel="stylesheet" type="text/css" />
                            <title>계정 관리</title>
                            <style>
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
                                    border-right: 1px solid #C7C7C7;
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
                                    width: 705px;
                                    text-align: center;
                                    margin: 0 auto;
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
                                
                                .submenu {
                                    border: 1px solid #D5D5D5;
                                    height: 35px;
                                }
                                
                                .orderlist:hover {
                                    background: gray;
                                    color: white;
                                    cursor: pointer;
                                }
                                
                                #parentModal {
                                    display: none;
                                    background: black;
                                    opacity: 0.5;
                                    position: fixed;
                                    width: 100%;
                                    height: 100%;
                                    margin: 0;
                                    z-index: 7;
                                }
                                
                                #ADaddModal {
                                    display: none;
                                    width: 400px;
                                    height: 290px;
                                    position: fixed;
                                    left: 50%;
                                    top: 50%;
                                    transform: translate(-50%, -50%);
                                    background: white;
                                    z-index: 7;
                                }
                                
                                td {
                                    vertical-align: middle !important;
                                }
                            </style>
                            <script src="http://code.jquery.com/jquery-latest.js"></script>
                            <script type="text/javascript">
                                $(document).ready(function() {
                                    $("#parentModal").click(function() {
                                        $("#ADaddModal").css("display", "none");
                                        $("#parentModal").css("display", "none");
                                    });

		$(".orderlist").click(function(){
			$("#ADaddModal").css("display", "block");
			$("#parentModal").css("display", "block");
			$("#orderid").val($(this).find('input[class=odid]').val());
			$("#productno").val($(this).find('input[class=odbid]').val());
			$("#orderdate").val($(this).find('td[class=oddate]').html().split("<")[0]);
			$("#customer").val($(this).find('td[class=odmid]').html());
		});
	});
</script>
</head>
<body>
<div id="parentModal"></div>
	<div id="ADaddModal"
		style="border-radius: 0.5em; border-top-left-radius: 0.5em; border-top-right-radius: 0.5em; border-bottom-left-radius: 0.5em; border-bottom-right-radius: 0.5em;">
		<form id="updateOrderStatus" action="bOrderStatus.do" method="get">
			<span id="imgupload"
				style="display: inline-block; width: 70%; padding: 18px 0 10px 0; border-style: none; background: white; font-size: 12pt; font-weight: bold;">
				배송상태 수정</span>
			<hr style="color: #D5D5D5;">
			<b style="font-size:9pt;">주문 번호&nbsp;&nbsp;&nbsp;&nbsp;</b><input id="orderid" type="text" name="od_id" readonly style="border-style:none;"><br>
			<b style="font-size:9pt;">상품 번호&nbsp;&nbsp;&nbsp;&nbsp;</b><input id="productno" type="text" name="bb_id" readonly style="border-style:none;"><br>
			<b style="font-size:9pt;">주문 날짜&nbsp;&nbsp;&nbsp;&nbsp;</b><input id="orderdate" type="text" name="od_date" readonly style="border-style:none;"><br>
			<b style="font-size:9pt;">주 &nbsp;문&nbsp; 자&nbsp;&nbsp;&nbsp;&nbsp;</b><input id="customer" type="text" name="m_id" readonly style="border-style:none;"><br>
			<b style="font-size:9pt;">배송 정보&nbsp;&nbsp;</b>
			<select name="od_status" style="width:177px;">
				<option value="N">배송준비중</option>
				<option value="Y">배송중</option>
				<option value="F">배송완료</option>
			</select>
			<hr style="color: #D5D5D5;">
			<input type="submit" id="submit"
				style="width: 100%; height: 36px; border-style: none; background: white; color: #0095f6; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="저장">
			<hr style="color: #D5D5D5;">
			<input type="button" id="clear"
				style="width: 100%; height: 36px; border-style: none; background: white; color: #FF4848; font-size: 12pt; font-weight: bold; cursor: pointer"
				value="취소" onclick="location.href='bOrder.do'">
		</form>
	</div>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
                                <div id="sc_big_con">
                                    <div id="sc_title">비즈니스계정</div>
                                    <div id="sc_con">
                                        <div id="menu">
                                            <ul id="menulist">
                                                <li onclick="location.href='mManage.do'">프로필 편집</li>
                                                <li onclick="location.href='mChangepw.do'">비밀번호 변경</li>
                                                <li onclick="location.href='mCart.do'">장바구니</li>
                                                <li onclick="location.href='mBuylist.do'">구매목록</li>
                                                <li onclick="location.href='mLikelist.do'">내가 누른 좋아요 조회</li>
                                                <li style="border-left: 2px solid black;"onclick="location.href='mBusiness.do'"><span
															style="font-weight: bold;">비즈니스 계정</span></li>
                                            </ul>
                                        </div>
                                        <div id="contents" style="padding-top: 30px;">
                                            <div id="submenu" style="padding-top: 30px;">
                                                <input type="button" id="all" class="submenu" value="비즈니스 정보" style="background: white; text-align: center; width: 120px;" onclick="location.href='mBusiness.do'"> <input type="button" id="board" class="submenu"
                                                    value="비즈니스 계정" style="background: white; text-align: center; width: 120px;" onclick="location.href='bOut.do'"> <input type="button" id="board" class="submenu" value="주문관리" style="background: white; text-align: center; width: 120px; border: 2px solid black;"
                                                    onclick="location.href='bOrder.do'"> <input type="button" id="bboard" class="submenu" value="카테고리" style="background: white; text-align: center; width: 120px;" onclick="location.href='bCategory.do'">
                                                <input type="button" id="bboard" class="submenu" value="광고 컨텐츠" style="background: white; text-align: center; width: 120px;" onclick="location.href='bAD.do'">
                                            </div>
                                            <div style="padding-top: 50px;">

				<form action="bOrderDateSearch.do" method="get">
					<div id="JWJsearchassistant">
						<b style="font-size: 7pt;font-weight: bold;">* 조회할 기간 설정&nbsp;&nbsp;</b> <input
							type="date" id="startdate" name="startdate" value="${startdate }">&nbsp;&nbsp;~&nbsp;&nbsp;
						<input type="date" id="enddate" name="enddate" value="${enddate }">&nbsp;&nbsp;
						<input type="submit" id="setupbtn" name="setupbtn" value="조회하기"
							style="background: white; border: 1px solid #D5D5D5;">
					</div>
				</form>
				<br>
				<b style="font-size: 7pt;font-weight: bold;"> * 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색 시
					지난 판매내역을 조회하실 수 있습니다.<br>리스트의 상품을 클릭하시면 처리상태를 입력하실 수 있습니다.
				</b>
				<hr style="width: 80%; margin-top: 30px; border: 1px solid #EAEAEA;">
				<table style="font-size: 8pt; width: 100%;padding:50px 0 50px 0;">
					<tr>
						<td>Date</td>
						<td>Product</td>
						<td>Customer</td>
						<td>Size</td>
						<td>Amount</td>
						<td>Options</td>
						<td>Price</td>
						<td>Receiver</td>
						<td>Phone</td>
						<td>Address</td>
						<td>Status</td>
					</tr>
					<tr>
						<td colspan="13"><hr></td>
					</tr>
					<c:if test="${bOrderList.size() == 0}">
					<tr>
						<td colspan="13" style="text-align: center; border-style: none;"><br>
							<br> <br> <br> <br> <br> <br><br><br>주문내역이 비어있습니다.<br> <br>
							<br> <br> <br> <br> <br> 
							<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${bOrderList.size() != 0}">
					<c:forEach var="bol" items="${bOrderList}" varStatus="status">
					<tr class="orderlist">
						<td class="oddate">${bol.od_date }<input type="text" class="odid" value="${bol.od_id}"style="display:none;"><input type="text" class="odbid" value="${bol.bb_id}"style="display:none;"></td>
						<td>${bol.bb_name }</td>
						<td class="odmid">${bol.m_id }</td>
						<td>${bol.od_size }</td>
						<td>${bol.od_amount }</td>
						<td style="width:20%;">${bol.od_options }</td>
						<td><fmt:formatNumber
										value="${bol.od_price }" pattern="#,###" />원</td>
						<td>${bol.od_name }</td>
						<td>${bol.od_phone }</td>
						<td>${bol.od_addr1 }<br>${bol.od_addr2 }<br>${bol.od_addr3 }</td>
						<td><c:if test="${bol.od_status eq 'N' }"><span style="padding:4px;background:#CC3D3D; color:white;">배송준비중</span></c:if>
						<c:if test="${bol.od_status eq 'Y' }"><span style="padding:4px;background:#F29661; color:white;">&nbsp;&nbsp;&nbsp;배송중&nbsp;&nbsp;&nbsp;</span></c:if>
						<c:if test="${bol.od_status eq 'F' }"><span style="padding:4px;background:#6B9900; color:white;">&nbsp;&nbsp;배송완료&nbsp;&nbsp;</span></c:if></td>
					</tr>
					<tr>
						<td colspan="13"><hr></td>
					</tr>
					</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>