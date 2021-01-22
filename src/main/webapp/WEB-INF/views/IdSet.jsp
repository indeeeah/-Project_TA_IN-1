<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	
	$("#socket").click(function(){
			var id = $("#id").val();
			$("#frm").attr("action", "WebSocketTest.do");
			$("#frm").submit();
	});

	$("#tain").click(function(){
			var id = $("#id").val();
			$("#frm").attr("action", "MemberIdSet.do?m_id="+id);
			$("#frm").submit();
	});
	
	$("#message").click(function(){
		var id = $("#id").val();
		$("#frm").attr("action", "MessageIdSet.do?m_id="+id);
		$("#frm").submit();
});
	
});
</script>
<body>
<form id="frm" action="WebSocketTest.do" method="post">
내 아이디 : <input type="text" id="id" name="ID" value="" required>&nbsp;&nbsp;&nbsp;
<input id="socket" type="button" value="소켓 테스트">
<input id="tain" type="button" value="타인 테스트">
<input id="message" type="button" value="메세지 테스트">
</form>
</body>
</html>