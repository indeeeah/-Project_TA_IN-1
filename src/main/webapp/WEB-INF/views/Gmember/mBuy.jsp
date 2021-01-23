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

/* a{
                	padding:15px 85px 15px 0 !important; 
                } */

table {
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-left: 1px solid #D5D5D5;
	vertical-align:middle !important;
	text-align:center;
}

hr {
	margin: 50px 0 50px 0;
}
</style>
</head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	$(document)
			.ready(
					function() {
						$(".p")
								.click(
										function() {
											var td = $(this).parent();
											var tr = td.parent();
											var price = tr.find(
													'input[id=price]').val();
											var amount = td.find(
													'input[type=text]').val();
											var options = $(this)
													.parent()
													.parent()
													.find(
															"input[id=optionprice]")
													.val();
											options *= 1;
											amount *= 1;
											price *= 1;

											if ($(this).val() == '+') {
												if (amount >= 0) {
													td.find('input[type=text]')
															.val(amount + 1);
													amount += 1;
													var a = price * amount
															+ options;
													tr
															.find(
																	'input[id=od_price]')
															.val(a);
													tr
															.find(
																	'input[id=sum]')
															.val(
																	(a)
																			.toString()
																			.replace(
																					/\B(?=(\d{3})+(?!\d))/g,
																					",")
																			+ "원");
												}
											} else if ($(this).val() == '-') {
												if (amount > 0) {
													td.find('input[type=text]')
															.val(amount - 1);
													amount -= 1;
													var a = price * amount
															+ options;
													tr
															.find(
																	'input[id=od_price]')
															.val(a);
													tr
															.find(
																	'input[id=sum]')
															.val(
																	(a)
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
									var a = 0;

									var b = 0;

									var c = 0;
									c *= 1;
									for (var i = 1; i < $("#cartlist").find(
											'tr').length; i++) {
										b = $("#cartlist").find('tr').eq(i)
												.find('input[id=od_price]')
												.val();
										a *= 1;
										b *= 1;
										a += b;
									}
									c = a + 3000;
									$("#aprice").val(a);
									$("#fprice").val(c);
									$("#presult").html(
											(a).toString().replace(
													/\B(?=(\d{3})+(?!\d))/g,
													",")
													+ "원");
									$("#finalresult").html(
											(c).toString().replace(
													/\B(?=(\d{3})+(?!\d))/g,
													",")
													+ "원");
								});

						$("#orderlist")
								.click(
										function() {
											var info = [];
											var param = "";
											var op = "";
											for (var i = 1; i < $("#cartlist")
													.find('tr').length; i++) {
												var tr = $("#cartlist").find(
														'tr').eq(i);
												if (tr.find("select").val() == "사이즈 선택") {
													alert("사이즈를 선택해주세요.");
													return false;
												}
												if ($("#od_name").val() == null) {
													alert("사이즈를 선택해주세요.");
													return false;
												}
												if ($("#od_name").val() == "") {
													alert("받으시는 분을 입력해주세요.");
													$("#od_name").focus();
													return false;
												}
												if ($("#od_phone").val() == "") {
													alert("휴대전화번호를 입력해주세요.");
													$("#od_phone").focus();
													return false;
												}
												if ($("#sample6_postcode")
														.val() == "") {
													alert("주소를 입력해주세요.");
													$("#sample6_postcode")
															.focus();
													return false;
												}
												if ($("#sample6_address").val() == "") {
													alert("주소를 입력해주세요.");
													$("#sample6_address")
															.focus();
													return false;
												}
												if ($("#sample6_detailAddress")
														.val() == "") {
													alert("상세주소를 입력해주세요.");
													$("#sample6_detailAddress")
															.focus();
													return false;
												}
												if (tr.find(
														'input[id=od_options]')
														.val().replace(/\+/g,
																"%2B") == "") {
													op = "옵션없음~";
												} else {
													op = tr
															.find(
																	'input[id=od_options]')
															.val().replace(
																	/\+/g,
																	"%2B");
												}
												info
														.push(tr
																.find(
																		'input[id=bb_id]')
																.val()
																+ ","
																+ tr
																		.find(
																				"select")
																		.val()
																+ ","
																+ tr
																		.find(
																				'input[id=amount]')
																		.val()
																+ ","
																+ op
																+ ","
																+ tr
																		.find(
																				'input[id=od_price]')
																		.val()
																+ ","
																+ $(
																		'input[id=od_name]')
																		.val()
																+ ","
																+ $(
																		'input[id=od_phone]')
																		.val()
																+ ","
																+ $(
																		'input[id=sample6_postcode]')
																		.val()
																+ ","
																+ $(
																		'input[id=sample6_address]')
																		.val()
																+ ","
																+ $(
																		'input[id=sample6_detailAddress]')
																		.val());
											}
											for (var i = 1; i < $("#cartlist")
													.find('tr').length; i++) {
												param += info[i - 1] + "/";
											}
											console.log($("#cartlist").find(
													'tr').length);
											console.log(param);
											//location.href = "mOrder.do?param="+ param;
											
											
											var IMP = window.IMP; // 생략가능
			                                 IMP.init('imp22315690');
			                                 // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			                                 // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			                                 IMP
			                                       .request_pay(
			                                             {
			                                                pg : 'inicis', // version 1.1.0부터 지원.
			                                                /*
			                                                 'kakao':카카오페이,
			                                                 html5_inicis':이니시스(웹표준결제)
			                                                 'nice':나이스페이
			                                                 'jtnet':제이티넷
			                                                 'uplus':LG유플러스
			                                                 'danal':다날
			                                                 'payco':페이코
			                                                 'syrup':시럽페이
			                                                 'paypal':페이팔
			                                                 */

			                                                pay_method : 'card',
			                                                /*
			                                                 'samsung':삼성페이,
			                                                 'card':신용카드,
			                                                 'trans':실시간계좌이체,
			                                                 'vbank':가상계좌,
			                                                 'phone':휴대폰소액결제
			                                                 */
			                                                merchant_uid : 'merchant_'
			                                                      + new Date()
			                                                            .getTime(),
			                                                /*
			                                                 merchant_uid에 경우
			                                                 https://docs.iamport.kr/implementation/payment
			                                                    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			                                                    참고하세요.
			                                                    나중에 포스팅 해볼게요.
			                                                 */
			                                                name : '타인 상품 결제',
			                                                //결제창에서 보여질 이름
			                                                amount : $(
			                                                      "#fprice")
			                                                      .val()
			                                                      .toString(),
			                                                //가격
			                                                buyer_email : 'null',
			                                                buyer_name : $(
			                                                      "#od_name")
			                                                      .val()
			                                                      .toString(),
			                                                buyer_tel : $(
			                                                      "#od_phone")
			                                                      .val()
			                                                      .toString(),

			                                                buyer_addr : $(
			                                                      "#sample6_address")
			                                                      .val()
			                                                      .toString()
			                                                      + " "
			                                                      + $(
			                                                            "#sample6_detailAddress")
			                                                            .val()
			                                                            .toString(),
			                                                buyer_postcode : $(
			                                                      "#sample6_postcode")
			                                                      .val()
			                                                      .toString(),
			                                                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			                                             /*
			                                                 모바일 결제시,
			                                                 결제가 끝나고 랜딩되는 URL을 지정
			                                              (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			                                              */
			                                             },
			                                             function(rsp) {
			                                                console
			                                                      .log(rsp);
			                                                if (rsp.success) {
			                                                   var msg = '결제가 완료되었습니다.';
			                                                   location.href = "mOrder.do?param="
			                                                         + param;
			                                                } else {
			                                                   var msg = '결제에 실패하였습니다.';
			                                                   msg += ' ('
			                                                         + rsp.error_msg
			                                                         + '.)';
			                                                }
			                                                alert(msg);
			                                             });
										});

						$("input[type=radio]").click(
								function() {
									if ($("#same").is(":checked")) {
										$("#addrbtn").css("display", "none");
										$("#sample6_postcode").val(
												"${profile.m_addr1}");
										$("#sample6_address").val(
												"${profile.m_addr2}");
										$("#sample6_detailAddress").val(
												"${profile.m_addr3}");
									}
									if ($("#new").is(":checked")) {
										$("#addrbtn").css("display",
												"inline-block");
										$("#sample6_postcode").val("");
										$("#sample6_address").val("");
										$("#sample6_detailAddress").val("");
									}
								});

						$(".selectoption")
								.on(
										"change",
										function() {
											if ($(this).val() != "옵션 선택") {
												$(this).parent().append(
														"<br>" + $(this).val());
												$(this).parent().find("span")
														.append(
																$(this).val()
																		+ "~");
												var options = $(this).parent()
														.find("span").html();
												$(this).parent().find(
														"input[name=options]")
														.val(options);

												var arr = [];
												arr = options.split(/[\+\~]/);
												var optionprice = 0;
												optionprice *= 1;
												for (var i = 1; i < arr.length; i += 2) {
													arr[i] *= 1;
													optionprice += arr[i];
												}
												$(this)
														.parent()
														.find(
																"input[id=optionprice]")
														.val(optionprice);
												var price = $(this)
														.parent()
														.parent()
														.find(
																$("input[id=price]"))
														.val();
												price *= 1;
												var amount = $(this)
														.parent()
														.parent()
														.find(
																$("input[id=amount]"))
														.val();
												amount *= 1;
												var a = amount * price
														+ optionprice;
												$(this).parent().parent().find(
														'input[id=od_price]')
														.val(a);
												$(this)
														.parent()
														.parent()
														.find('input[id=sum]')
														.val(
																(a)
																		.toString()
																		.replace(
																				/\B(?=(\d{3})+(?!\d))/g,
																				",")
																		+ "원");
											}
											var a = 0;
											var b = 0;
											var c = 0;
											c *= 1;
											for (var i = 1; i < $("#cartlist")
													.find('tr').length; i++) {
												b = $("#cartlist")
														.find('tr')
														.eq(i)
														.find(
																'input[id=od_price]')
														.val();
												a *= 1;
												b *= 1;
												a += b;
											}
											c = a + 3000;
											$("#aprice").val(a);
											$("#fprice").val(c)
											$("#presult")
													.html(
															(a)
																	.toString()
																	.replace(
																			/\B(?=(\d{3})+(?!\d))/g,
																			",")
																	+ "원");
											$("#finalresult")
													.html(
															(c)
																	.toString()
																	.replace(
																			/\B(?=(\d{3})+(?!\d))/g,
																			",")
																	+ "원");
										});
					});
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
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
						document.getElementById("sample6_detailAddress").value = "";
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
	<div id="sc_big_con">
                                    <div id="sc_title">주문서 작성</div>
                                    <div id="sc_con">
		<div id="contents"
			style="width: 100%; padding-top: 30px; border-style: none;">
			<h5 style="background: gray; color: white;">상품정보</h5>
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
					<c:forEach var="ol" items="${orderlist}" varStatus="status">
						<c:set var="price" value="${ol.bb_price}" />
						<c:set var="index" value="${status.index}" />
						<tr>
							<td align="center">${status.count}<input type="text"
								class="wcon" id="bb_id" style="display: none;" value="${ol.bb_id}"></td>
							<td style="border-bottom: 1px solid #D5D5D5;"><a href=""><img
									src="${ol.bb_img1 }"
									style="width: 110px; height: 110px; padding: 0 0 0 0;"></a></td>
							<td style="border-bottom: 1px solid #D5D5D5;">${ol.bb_name}</td>
							<td><input type="text" id="price" style="display: none;"
								class="wcon" value="${ol.bb_price}"><span id="result"> <fmt:formatNumber
										value="${price}" pattern="#,###" /></span></td>
							<td><input type="button" class="p" value="+"
								style="background: white; border: 1px solid #D5D5D5;"> <br>
								<input type="text" name="pop_out"
								 value="${amount[status.index]}" id="amount"
								style="text-align: center; width: 50px; border: 1px solid #D5D5D5;" /><br>
								<input type="button" class="p" value="-"
								style="background: white; border: 1px solid #D5D5D5;"></td>
							<td><input type="text" id="od_price"
								 value="${price*amount[status.index]}" style="display: none;">
								<input type="text" id="sum"
								 style="text-align: center; width: 60px; border-style: none;"
								value="<fmt:formatNumber
										value="${price*amount[status.index]}" pattern="#,###" />원"></td>
							<td><select class="wcon" class="size" id="od_size">
									<option>사이즈 선택</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
									<option value="XL">XL</option>
									<option value="F">Free</option>
							</select><br> <select class="wcon" class="selectoption">
									<option>옵션 선택</option>
									<c:if test="${ol.bb_option1 ne null}">
										<option value="${ol.bb_option1}">${ol.bb_option1}</option>
									</c:if>
									<c:if test="${ol.bb_option2 != null}">
										<option value="${ol.bb_option2}">${ol.bb_option2}</option>
									</c:if>
									<c:if test="${ol.bb_option3 != null}">
										<option value="${ol.bb_option3}">${ol.bb_option3}</option>
									</c:if>
									<c:if test="${ol.bb_option4 != null}">
										<option value="${ol.bb_option4}">${ol.bb_option4}</option>
									</c:if>
							</select><span id="options" style="display: none;"></span><input
								class="wcon" type="text" id="od_options" value="" name="options"style="display: none;"><br>
								<input class="wcon" type="text" id="optionprice" style="display: none;"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<h5 style="background: gray; color: white;">배송정보</h5>
			<table id="profiletable"
				style="width: 100%; font-size: 10pt; margin: 20px 0 50px 0; text-align: left;">
				<tbody>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">배송지 선택</td>
						<td style="text-align:left;"><input type="radio" id="same" name="addroption" checked><label
							for="same">회원 정보와 동일</label> <input type="radio" id="new"
							name="addroption"><label for="new">새로운 배송지</label></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">받으시는 분</td>
						<td style="text-align:left;"><input type="text" class="wcon" id="od_name" name="m_name" required
							value="${profile.m_name}" style="border: 1px solid #D5D5D5;"></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">휴대전화</td>
						<td style="text-align:left;"><input type="text" class="wcon" id="od_phone" name="m_phone"
							value="${profile.m_phone}" required
							style="border: 1px solid #D5D5D5;"></td>
					</tr>
					<tr class="register" height="30">
						<td width="20%" style="text-align: center;">주소</td>
						<td style="text-align:left;"><input type="text" class="wcon" name="m_addr1" id="sample6_postcode"
							placeholder="우편번호" value="${profile.m_addr1}" readonly
							style="border: 1px solid #D5D5D5;"><input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="addrbtn"
							class="btn2"
											style="background: white; border: 1px solid #D5D5D5; margin:0px; display: none;">
							<br> <input type="text" class="wcon" name="m_addr2" id="sample6_address"
							placeholder="주소" value="${profile.m_addr2}" readonly
							style="border: 1px solid #D5D5D5;"><br> <input
							type="text" class="wcon" name="m_addr3" id="sample6_detailAddress"
							placeholder="상세주소" value="${profile.m_addr3}"
							style="width: 295px; border: 1px solid #D5D5D5;"> <input
							type="text" class="wcon" id="sample6_extraAddress" placeholder="참고항목"
							style="display: none;"></td>
					</tr>
				</tbody>
			</table>
			<h5 style="background: gray; color: white;">결제정보</h5>
			<table
				style="width: 100%; font-size: 10pt; border-top: 2px solid gray; border-bottom: 2px solid gray;">
				<tr>
					<td>총 상품금액</td>
					<td>총 배송비</td>
					<td>결제할 금액<span style="font-size: 7pt;"></span></td>
				</tr>
				<tr height="60px">
					<td><span id="presult"
						style="font-size: 14pt; font-weight: bold;">${presult[0]},${presult[1]}</span><input
						id="aprice" type="text" value="${realval[0]}${realval[1]}"
						style="display: none;"></td>
					<td><span style="font-size: 14pt; font-weight: bold;">+
							3,000원</span></td>
					<td><span id="finalresult"
						style="font-size: 14pt; font-weight: bold;">${presult[2]},${presult[3]}</span><input
						id="fprice" type="text" value="${realval[3]}${realval[4]}"
						style="display: none;"></td>
				</tr>
			</table>
			<div style="padding: 40px 0 30px 0;">
				<input type="button" id="orderlist" value="주문하기"
					class="btn2"
							style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="back" value="취소"
					onclick="location.href='mCart.do'"
					class="btn2"
							style="background: #6782B4; padding: 5px 20px 5px 20px; color: white;">
			</div>
		</div>
		</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>