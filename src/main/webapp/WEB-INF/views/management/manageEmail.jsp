<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#btn btn-warning {
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
 <div align="center">
<h3>메일 보내기</h3>
</div>
    <form action="mailSending.do" method="post">
      <div align="center">
        <input type="text" name="tomail" size="120"
        style="width: 50%" class="form-control" placeholder="보낼 이메일을 입력해주세요">
      </div>
      <div align="center">
        <!-- 제목 -->
        <input type="text" name="title" size="120"
        style="width: 50%" placeholder="제목을 입력해주세요"
        class="form-control">
      </div>
        <p>
          <div align="center">
          <!-- 내용 -->
            <textarea name="content" cols="120" rows="12"
            style="width: 50%; resize: none" placeholder="내용"
            class="form-control"></textarea>
          </div>
        <p>
      <div align="center">
        <input type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
    </form>
</body>
</html>