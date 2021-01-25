<%@page import="java.text.DecimalFormat"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>장바구니</title>
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
	width: 730px;
	text-align: center;
	margin: 0 auto;
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
	width:100%;
}

th, td {
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-left: 1px solid #D5D5D5;
	vertical-align: middle !important;
	text-align: center;
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
<script>
	$(document).ready(
			function() {
				$(".p").click(function() {
							var td = $(this).parent();
							var tr = td.parent();
							var price = tr.find('input[id=price]').val();
							var amount = td.find('input[type=text]').val();
							amount *=1;
							price *= 1;
							
							if($(this).val() == '+'){
								if(amount >= 0){
								td.find('input[type=text]').val(amount+1);
								amount += 1;
								tr.find('input[id=sum]').val(
									(amount * price).toString().replace(
											/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
								}
							}else if($(this).val() == '-'){
								if(amount > 0){
								td.find('input[type=text]').val(amount-1);
								amount -= 1;
								tr.find('input[id=sum]').val(
									(amount * price).toString().replace(
											/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
								}
							}
						});
				
				$(".p").click(function(){
					var result = 0;	
					result *= 1;
					for(var i = 1; i < $("#cartlist").find('tr').length; i++){
						var plus = $("#cartlist").find($('tr:eq('+i+')')).find($("input[id=price]")).val();
						var amount = $("#cartlist").find($('tr:eq('+i+')')).find($("input[id=amount]")).val();
						amount *=1;
						plus *= 1;
						result += plus*amount;
					}
					var finalresult = result;
					$("#presult").html(finalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
					var fr = result + 3000;
					$("#finalresult").html(fr.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
				});
				
				$("#orderlist").click(function(){
					if(${cartlist.size() eq 0}){
						alert("장바구니가 비어있습니다.");
						return false;
					}
					var bb_id =[];
					var od_amount =[];
					var presult =[];
					for(var i = 1; i < $("#cartlist tr").length; i++){
						if($("tr").eq(i).find("input[type=checkbox]").is(":checked")){
							bb_id.push($("tr").eq(i).find("input[id=bb_id]").val());
							od_amount.push($("tr").eq(i).find("input[id=amount]").val());
						}
					}
							presult.push($("#presult").html());
							presult.push($("#finalresult").html());
					location.href="mBuy.do?bb_id="+bb_id+"&od_amount="+od_amount+"&presult="+presult;
				});
				$("#order").click(function(){
					var bb_id =;
					var od_amount =;
					var presult =;
				});
				
				$("#deletelist").click(function(){
					if(${cartlist.size() eq 0}){
						alert("장바구니가 비어있습니다.");
						return false;
					}
					if(confirm("체크하신 상품들을 전부 삭제하시겠습니까?")==true){
						var bb_id = "";
						for(var i = 1; i < $("#cartlist tr").length; i++){
							if($("#cartlist tr").eq(i).find("input[type=checkbox]").is(":checked")){
								bb_id += $("#cartlist tr").eq(i).find("input[id=bb_id]").val()+"/";			
							}
						}
								location.href="mDeleteCartList.do?bb_id="+bb_id;
					}else{
						return false;
					}
				});
				
				$("#checkall").click(function(){
					if($("#checkall").is(":checked") == true){
						$("input[type=checkbox]").prop("checked", true);
					}else{
						$("input[type=checkbox]").prop("checked", false);
					}
				});
				
				$("input[type=checkbox]").click(function(){
					if($("input[name=chk]:checked").length < $("input[name=chk]").length){
						$("#checkall").prop("checked", false);
					}else{
						$("#checkall").prop("checked", true);
					}
				});
			});
</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="sc_big_con">
			<div id="sc_title">장바구니</div>
			<div id="sc_con">
				<div id="menu">
					<ul id="menulist">
						<li onclick="location.href='mManage.do'">프로필 편집</li>
						<li onclick="location.href='mChangepw.do'">비밀번호 변경</li>
						<li style="border-left: 2px solid black;" onclick="location.href='mCart.do'"><span
							style="font-weight: bold;">장바구니</span></li>
						<li onclick="location.href='mBuylist.do'">구매목록</li>
						<li onclick="location.href='mLikelist.do'">내가 누른 좋아요 조회</li>
						<li onclick="location.href='mBusiness.do'">비즈니스 계정</li>
					</ul>
				</div>
				<div id="contents" style="padding-top: 30px;">
					<table id="cartlist"
						style="font-size: 10pt; margin: 40px 0 60px 0;">
						<tr>
							<td align="center" width="3%"><input type="checkbox" checked
								id="checkall"></td>
							<td width="15%">이미지</td>
							<td width="30%">상품정보</td>
							<td width="13%">판매가</td>
							<td width="13%">수량</td>
							<td width="13%">합계</td>
							<td width="13%">선택</td>
						</tr>
						<c:if test="${cartlist.size() == 0}">
							<tr>
								<td colspan="7" style="text-align: center; border-style: none;"><br>
									<br> <br> <br> <br>장바구니가 비어있습니다.<br> <br>
									<br> <br> <br> <br> <br> <br> <br>
									<br> <br></td>
							</tr>
						</c:if>
						<c:if test="${cartlist.size() != 0}">
							<c:forEach var="cl" items="${cartlist}" varStatus="status">
								<c:set var="price" value="${cl.bb_price}" />
								<tr>
									<td align="center"><input type="checkbox" checked
										name="chk"><input type="text" id="bb_id"
										style="display: none;" value="${cl.bb_id}"></td>
									<td
										style="vertical-align: bottom; border-style: none; border-bottom: 1px solid #D5D5D5;"><a
										href=""><img src="${cl.bb_img1 }"
											style="width: 110px; height: 110px; padding: 0 0 0 0;"></a></td>
									<td
										style="border-style: none; border-bottom: 1px solid #D5D5D5;">${cl.bb_name}</td>
									<td><input type="text" id="price" style="display: none;"
										value="${cl.bb_price}"><span id="result"> <fmt:formatNumber
												value="${price}" pattern="#,###" /></span></td>
									<td><input type="button" class="p" value="+"
										style="background: white; border: 1px solid #D5D5D5;">
										<br> <input type="text" name="pop_out" value="1"
										id="amount" class="amount"
										style="text-align: center; width: 50px; border: 1px solid #D5D5D5;" /><br>
										<input type="button" class="p" value="-"
										style="background: white; border: 1px solid #D5D5D5;">
									</td>
									<td><input type="text" id="sum"
										style="text-align: center; width: 60px; border-style: none;"
										value="<fmt:formatNumber
										value="${price}" pattern="#,###" />원"></td>
									<td><input type="button" id="order" value="주문하기"
										style="background: white; border: 1px solid #D5D5D5; margin: 0px;"
										class="btn2"
										onclick="location.href='mBuy.do?bb_id=${cl.bb_id}'"> <br>
									<br>
									<input type="button" id="delete" value="삭제"
										style="background: white; border: 1px solid #D5D5D5; margin: 0px;"
										class="btn2"
										onclick="location.href='mDeleteCart.do?bb_id=${cl.bb_id}'">
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<table
						style="width: 100%; font-size: 10pt; border-top: 2px solid gray; border-bottom: 2px solid gray;">
						<tr>
							<td>총 상품금액</td>
							<td>총 배송비</td>
							<td>결제예정 금액<span style="font-size: 7pt;"><br>(*옵션
									선택에 따라 변동될 수 있습니다.)</span></td>
						</tr>
						<tr height="60px">
							<td><span id="presult"
								style="font-size: 14pt; font-weight: bold;"><fmt:formatNumber
										value="${productprice}" pattern="#,###" />원</span></td>
							<td><span style="font-size: 14pt; font-weight: bold;">+
									3,000원</span></td>
							<td><span id="finalresult"
								style="font-size: 14pt; font-weight: bold;"><fmt:formatNumber
										value="${allprice}" pattern="#,###" />원</span></td>
						</tr>
					</table>
					<div style="padding: 40px 0 30px 0;">
						<input type="button" id="orderlist" class="btn2"
							style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
							value="주문하기"
							style="background: white; border: 1px solid #D5D5D5;"> <input
							type="button" id="deletelist" class="btn2"
							style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;"
							value="삭제하기"
							style="background: white; border: 1px solid #D5D5D5;">
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>