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
<title>주문서 작성</title>
<style>
a {
	display: block;
}

table {
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-left: 1px solid #D5D5D5;
}

hr {
	margin: 50px 0 50px 0;
}
</style>
</head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
						$(".p").click(function() {
											var td = $(this).parent();
											var tr = td.parent();
											var price = tr.find('input[id=price]').val();
											var amount = td.find('input[type=text]').val();
											amount *= 1;
											price *= 1;

											if ($(this).val() == '+') {
												if (amount >= 0) {
													td.find('input[type=text]').val(amount + 1);
													amount += 1;
													tr.find('input[id=sum]').val((amount * price).toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+ "원");
												}
											} else if ($(this).val() == '-') {
												if (amount > 0) {
													td.find('input[type=text]')
															.val(amount - 1);
													amount -= 1;
													tr
															.find(
																	'input[id=sum]')
															.val(
																	(amount * price)
																			.toString()
																			.replace(
																					/\B(?=(\d{3})+(?!\d))/g,
																					",")
																			+ "원");
												}
											}

										});

						$(".p").click(
								function() {
									var result = 0;
									result *= 1;
									for (var i = 1; i < $("#cartlist").find(
											'tr').length; i++) {
										var plus = $("#cartlist").find(
												$('tr:eq(' + i + ')')).find(
												$("input[id=price]")).val();
										var amount = $("#cartlist").find(
												$('tr:eq(' + i + ')')).find(
												$("input[id=amount]")).val();
										amount *= 1;
										plus *= 1;
										result += plus * amount;
									}
									var finalresult = result;
									$("#presult").html(
											finalresult.toString().replace(
													/\B(?=(\d{3})+(?!\d))/g,
													",")
													+ "원");
									var fr = result + 3000;
									$("#finalresult").html(
											fr.toString().replace(
													/\B(?=(\d{3})+(?!\d))/g,
													",")
													+ "원");
								});

						$("#orderlist")
								.click(
										function() {
											var bb_id = [];
											for (var i = 1; i < $("#cartlist tr").length; i++) {
												if ($("tr").eq(i).find(
														"input[type=checkbox]")
														.is(":checked")) {
													bb_id
															.push($("tr")
																	.eq(i)
																	.find(
																			"input[id=bb_id]")
																	.val());
												}
											}
											location.href = "mBuy.do?bb_id="
													+ bb_id;
										});
						
						$("input[type=radio]").click(function(){
							if($("#same").is(":checked")){
								$("#addrbtn").css("display","none");
								$("#sample6_postcode").val("${profile.m_addr1}");
								$("#sample6_address").val("${profile.m_addr2}");
								$("#sample6_detailAddress").val("${profile.m_addr3}");
							}
							if($("#new").is(":checked")){
								$("#addrbtn").css("display","inline-block");
								$("#sample6_postcode").val("");
								$("#sample6_address").val("");
								$("#sample6_detailAddress").val("");
							}
						});
					});
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").value ="";
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body>
	<div id="mManage">
		<div id="contents" style="width: 100%; padding-top: 30px; border-style:none;">
			<span style="padding-bottom: 100px;">주문서 작성</span>
			<h5 style="background:gray; color:white;">상품정보</h5>
			<table id="cartlist"
				style="width: 100%; font-size: 10pt; margin: 20px 0 50px 0;">
				<tr>
					<td align="center" width="4%">번호</td>
					<td width="14%">이미지</td>
					<td width="30%">상품정보</td>
					<td width="13%">판매가</td>
					<td width="13%">수량</td>
					<td width="13%">합계</td>
					<td width="13%">옵션 선택</td>
				</tr>
				<c:if test="${orderlist.size() == 0}">
					<tr>
						<td colspan="7" style="text-align: center; border-style: none;"><br>
							<br> <br> <br> <br>장바구니가 비어있습니다.<br> <br>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${orderlist.size() != 0}">
					<c:forEach var="cl" items="${orderlist}" varStatus="status">
						<c:set var="price" value="${cl.bb_price}" />
						<c:set var="index" value="${status.index}" />
						<tr>
							<td align="center">${status.count}<input type="text"
								id="bb_id" style="display: none;" value="${cl.bb_id}"></td>
							<td style="border-bottom: 1px solid #D5D5D5;"><a href=""><img
									src="${cl.bb_img1 }"
									style="width: 110px; height: 110px; padding: 0 0 0 0;"></a></td>
							<td style="border-bottom: 1px solid #D5D5D5;">${cl.bb_name}</td>
							<td><input type="text" id="price" style="display: none;"
								value="${cl.bb_price}"><span id="result"> <fmt:formatNumber
										value="${price}" pattern="#,###" /></span></td>
							<td><input type="button" class="p" value="+"
								style="background: white; border: 1px solid #D5D5D5;"> <br>
								<input type="text" name="pop_out"
								value="${amount[status.index]}" id="amount"
								style="text-align: center; width: 50px; border: 1px solid #D5D5D5;" /><br>
								<input type="button" class="p" value="-"
								style="background: white; border: 1px solid #D5D5D5;"></td>
							<td><input type="text" id="sum"
								style="text-align: center; width: 60px; border-style: none;"
								value="<fmt:formatNumber
										value="${price}" pattern="#,###" />원"></td>
							<td><select>
									<option>옵션 선택</option>
									<c:if test="${option.bb_option1 != null}">
										<option value="${option.bb_option1}">${option.bb_option1}</option>
									</c:if>
									<c:if test="${option.bb_option2 != null}">
										<option value="${option.bb_option2}">${option.bb_option2}</option>
									</c:if>
									<c:if test="${option.bb_option3 != null}">
										<option value="${option.bb_option3}">${option.bb_option3}</option>
									</c:if>
									<c:if test="${option.bb_option4 != null}">
										<option value="${option.bb_option4}">${option.bb_option4}</option>
									</c:if>
							</select></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<h5 style="background:gray; color:white;">배송정보</h5>
			<table id="profiletable"
				style="width: 100%; font-size: 10pt; margin: 20px 0 50px 0; text-align:left;">
				<tbody>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">배송지 선택</td>
						<td><input type="radio" id="same" name="addroption" checked><label
							for="same">회원 정보와 동일</label> <input type="radio" id="new"
							name="addroption"><label for="new">새로운 배송지</label></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">받으시는 분</td>
						<td><input type="text" id="m_name" name="m_name" required
							value="${profile.m_name}" style="border: 1px solid #D5D5D5;"></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">휴대전화</td>
						<td><input type="text" id="userphone" name="m_phone"
							value="${profile.m_phone}" required style="border: 1px solid #D5D5D5;"></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">주소</td>
						<td><input type="text" name="m_addr1" id="sample6_postcode"
							placeholder="우편번호" value="${profile.m_addr1}" style="border: 1px solid #D5D5D5;"><input
							type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" id="addrbtn"
							style="background: white; border: 1px solid #D5D5D5; display:none;">
							<br>
							<input type="text" name="m_addr2" id="sample6_address"
							placeholder="주소" value="${profile.m_addr2}" style="border: 1px solid #D5D5D5;"><br> <input
							type="text" name="m_addr3" id="sample6_detailAddress"
							placeholder="상세주소" value="${profile.m_addr3}"
							style="width: 295px; border: 1px solid #D5D5D5;"> <input type="text"
							id="sample6_extraAddress" placeholder="참고항목"
							style="display: none;"></td>
					</tr>
				</tbody>
			</table>
			<h5 style="background:gray; color:white;">결제정보</h5>
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
						style="font-size: 14pt; font-weight: bold;">${presult[0]},${presult[1]}</span></td>
					<td><span style="font-size: 14pt; font-weight: bold;">+
							3,000원</span></td>
					<td><span id="finalresult"
						style="font-size: 14pt; font-weight: bold;">${presult[2]},${presult[3]}</span></td>
				</tr>
			</table>
			<div style="padding: 40px 0 30px 0;">
				<input type="button" id="orderlist" value="주문하기"
					style="background: white; border: 1px solid #D5D5D5;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="back" value="취소"
					onclick="location.href='mCart.do'"
					style="background: white; border: 1px solid #D5D5D5;">
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>