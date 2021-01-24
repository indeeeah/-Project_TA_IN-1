<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	max-width: 1000px;
	margin: auto;
}

img {
	max-width: 100%;
}

.inbox_people {
	background: #f8f8f8 none repeat scroll 0 0;
	float: left;
	overflow: hidden;
	width: 40%;
	border-right: 1px solid #c4c4c4;
}

.inbox_msg {
	border: 1px solid #c4c4c4;
	clear: both;
	overflow: hidden;
}

.top_spac {
	margin: 20px 0 0;
}

.recent_heading {
	float: left;
	width: 40%;
}

.srch_bar {
	display: inline-block;
	text-align: right;
	width: 60%;
	padding: 20px;
}

.headind_srch {
	padding: 10px 29px 10px 20px;
	overflow: hidden;
	border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
	color: #6782B4;
	font-size: 21px;
	margin: auto;
}

.srch_bar input {
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 2px 0 4px 6px;
	background: none;
}

.srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #6782B4;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto
}

.chat_img {
	float: left;
	width: 11%;
}

.chat_ib {
	float: left;
	padding: 0 0 0 15px;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
	cursor:pointer;
}

.chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
}

.inbox_chat {
	height: 550px;
	overflow-y: auto;
}


.incoming_msg_img {
	display: inline-block;
	width: 40%;
}

.received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
}

.received_withd_msg p {
	background: #ebebeb;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	line-height:150%;
	margin: 0;
	padding: 10px 10px 10px 12px;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.received_withd_msg {
	margin:5px 0 5px 0;
}

.mesgs {
	float: left;
	padding: 30px 15px 0 60px;
	width: 50%;
}

.sent_msg p {
	background: #6782B4;
	border-radius: 3px;
	font-size: 14px;
	margin: 0;
	line-height:150%;
	color: #fff;
	padding: 10px 10px 10px 12px;
}

.outgoing_msg {
	overflow: hidden;
	margin: 25px 0 25px;
}

.sent_msg {
	float: right;
}
.chat_list{
	background:white;
}
.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}

.type_msg {
	border-top: 1px solid #c4c4c4;
	position: relative;
}

.msg_send_btn {
	background: #6782B4 none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}

.messaging {
	padding: 0 0 50px 0;
}

.msg_history {
	height: 516px;
	overflow-y: auto;
	overflow-x:hidden;
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
  background: rgba(0,0,0,0.35);
}
::-webkit-scrollbar-corner {
  background: #0c0c0c;
}

#circle1 {
background-color:#ED4956;
width:5px;
height:5px;
border-radius:75px;
text-align:center;
margin:0 auto;
font-size:12px;
vertical-align:middle;
line-height:150px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		
		setTimeout(function(){
			$(".msg_history").scrollTop($(document).height()+10000);
		}, 10);
		
		$(".chat_people").click(function(){
			var m_id2 = $(this).find('input[type=text]').val();
			location.href="showchat.do?m_id2="+m_id2;
		});
		
		//소켓
		var socket = null;
		function connect() {
			var ws = new WebSocket(
					"ws://localhost:8090/tain/replyEcho?ID=${my_name}");
			socket = ws;

			//접속 처리
			ws.onopen = function() {
				console.log('Info: connection opened.');
			};

			//메시지 처리
			ws.onmessage = function(event) {
				console.log("ReceiveMessage : ", event.data + '\n');
				var arr=[];
				arr = event.data.split(",");
				var id = arr[0];
				var msg = arr[1];
				var date = new Date;
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				var hours = date.getHours();
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
				var msghistory = $(".msg_history").html();
				$("input[value="+id+"]").parent().css("display","block");
				$(".msg_history").html(msghistory + "<div class='received_msg'><div class='received_withd_msg'><div class='incoming_msg_img'><img width='44px' src='${pageContext.request.contextPath}/resources/uploadFiles/${chatImg}'><b style='font-size: 9pt;'>"+id+"</b></div><p>"+msg+"</p><span class='time_date'>"+year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds+"</span></div></div><br>");
				setTimeout(function(){
					var scrollTop = $(".msg_history").scrollTop();
					$(".msg_history").scrollTop($(document).height()+100000);
				}, 10);
			};
			
			//접속 끊겼을때
			ws.onclose = function(event) {
				console.log('Info: connection closed.');
				//setTimeout(function(){connect();}, 1000);   // retry connection!!
			};
			ws.onerror = function(err) {
				console.log('Err:', err);
			};

		}

		connect();

		$('#btnSend').on('click', function(evt) {
			evt.preventDefault();
			if (socket.readyState !== 1)
				return;
			var id = "${my_name}";
			var msg = $('input#msg').val();
			var toid = "${m_id2}";
			var date = new Date;
			var year = date.getFullYear();
			var month = date.getMonth();
			var day = date.getDate();
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var seconds = date.getSeconds();
			socket.send(id+","+toid+","+msg+","+year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds);
			var msghistory = $(".msg_history").html();
			$(".msg_history").html(msghistory + "<div class='outgoing_msg'><div class='sent_msg'><p>"+msg+"</p><span class='time_date'>"+year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds+"</span></div></div>");
			setTimeout(function(){
				$(".msg_history").scrollTop($(document).height()+100000);
			}, 10);
			$("#msg").val("");
		});
		
		$("#msg").click(function(){
			var a = [];
			a = document.location.href.split("=");
			$("input[class=alarmbtn][value="+a[1]+"]").parent().css("display","none");
		});
		
		$("#searchf").on("change keyup paste",function(){
			var m_id2 = $("#searchf").val();
			$.ajax({
	            url: "findFollowing.do",
	            type: "post",
	            data: { 'm_id2' : m_id2 },
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            dataType: "json",
	            async: true,
	            success: function(result) {
	            	var rs = "";
	            	if($("#searchf").val() != ""){
	            		$("#resultdiv").css("display","none");
	            		$("#resultdiv").html("");
		            	for(var i = 0; i<result.userId.length; i++){
		            		$("#resultdiv").css("display","block");
		            		rs = result.userId[i];
		            		$("#resultdiv").append("<button style='width:100%; text-align:left; font-size:10pt; background:none; border-style:none; cursor:pointer; padding:5px 0 5px 0;' onclick=\"location.href='showchat.do?m_id2="+rs+"'\">"+rs+"</button><br>");
		            	}
	            	}else{
	            		$("#resultdiv").css("display","none");
	            		$("#resultdiv").html("");
	            	}
	            },
	            error: function(request, status, error) {
	                alert("code:" + request.status + "\n" + "message:" +
	                    request.responseText + "\n" + "error:" + error);
	            }
	        });
		});
	});
</script>
</head>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>${my_name }</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" id="searchf" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button" id="btnSearch">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
								<div id="resultdiv"
								style="display:none;position:fixed;margin-left:40px;background:white;text-align:center;border: 1px solid #cdcdcd;border-width: 0 0 1px 0;width: 168px;text-align:left;	padding: 2px 0 4px 6px;">
								</div>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
					<c:forEach var="ml" items="${MessageList}" varStatus="status">
						<div class="chat_list active_chat"<c:if test="${m_id2 eq ml.chat }">style="background:#6782B4;"</c:if>>
							<div class="chat_people">
								<div class="chat_img" style="width: 30px; height: 30px; border-radius: 70%; overflow: hidden;">
									<img src="${pageContext.request.contextPath}/resources/uploadFiles/${userImg[status.index] }" style="width: 100%; height:100%; object-fit: cover;">
								</div>
									<div id="circle1" class="circle1" style="margin:0 0 20px 40px;
										<c:if test="${readcheck[status.index].m_check eq 'N'}">display:block;</c:if>
								<c:if test="${readcheck[status.index].m_check ne 'N'}">display:none;</c:if>"><input type="text" class="alarmbtn" value="${ml.chat}" style="display:none;"></div>
								<div class="chat_ib">
									<h5>
										${ml.chat}<input type="text" value="${ml.chat}" style="display:none;"> <span class="chat_date">${ml.lastdate }</span>
									</h5>
									<p></p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="mesgs">
					<div class="msg_history">
						<c:if test="${MessageList eq null}">
						<h1>메세지를 보내보세요!</h1>
						</c:if>
						<c:if test="${MessageList ne null}">
							<c:forEach var="msg" items="${Message }" varStatus="status">
								<c:if test="${msg.m_id eq my_name }">
									<div class="outgoing_msg">
										<div class="sent_msg">
											<p>${msg.m_message }</p>
											<span class="time_date"> ${msg.m_date }</span>
										</div>
									</div>
								</c:if>
								<c:if test="${msg.m_id ne my_name }">
									<div class="received_msg">
										<div class="received_withd_msg" style="display:block; word-break:normal;">
											<div class="incoming_msg_img" style="width: 30px; height: 30px; border-radius: 70%; overflow: hidden;">
												<img width="44px"  src="${pageContext.request.contextPath}/resources/uploadFiles/${chatImg}" style="width: 100%; height:100%; object-fit: cover;"><b style="font-size: 9pt;">${msg.m_id }</b>
											</div>
											<div style="display:block; word-break:normal;">
											<p>${msg.m_message }</p>
											<span class="time_date"> ${msg.m_date }</span>
											</div>
										</div>
									</div><br>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" id="msg" class="write_msg" placeholder="Type a message"/>
							<button id="btnSend"class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>