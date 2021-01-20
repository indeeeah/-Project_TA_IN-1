<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>TA_IN 검색결과</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/searchList.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js">
	
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
	
	<style>
	body {
	width: 100%;
	height: 100%;
}

#searchList_con {
	display: flex;
	justify-content: center;
	width: 100%;
}

#list_big_con {
	width: 1058px;
}

.eachPost {
	width: 314px;
	height: 314px;
	margin-left: 29px;
	margin-bottom: 29px;
	float: left;
}

.eachPost {
	cursor: pointer;
}
	</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="searchList_con">
		<div id="list_big_con">
			<c:if test="${not empty searchResult }">
				<c:forEach var="vo" items="${searchResult }" varStatus="s">
					<img class="eachPost" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.b_img }" onclick="location.href='${pageContext.request.contextPath}/gnEachPage?b_id=${vo.b_id}'">
				</c:forEach>
			</c:if>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>


                // flex 화면 맞추기
                var postcount = $(".eachPost").length;
                var forflex = postcount % 3;
                if (forflex == 1) {
                    $("#list_big_con").append('<div class="eachPost nocursor"></div>');
                    $("#list_big_con").append('<div class="eachPost nocursor"></div>');
                } else if (forflex == 2) {
                    $("#list_big_con").append('<div class="eachPost nocursor"></div>');
                }

                $(".for_showpost").on('click', function() {
                    var t_id = $(this).next().val();
                    console.log(t_id);
                    showpost(t_id);
                });
                
                $(".eachPost").on('click', function(){
                	var id = $(this).next().val();
                	eachstory(id);
                });

</script>
</html>