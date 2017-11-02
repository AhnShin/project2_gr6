<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board01 메인</title>
</head>
<body>
	<h2>우리 커뮤니티에 오신 것을 환영합니다.</h2>
	<a href="${pageContext.request.contextPath }/member?task=joinForm">회원가입</a>
	<a href="${pageContext.request.contextPath }/member?task=loginForm">로그인</a>
	<a href="${pageContext.request.contextPath }/board">게시판 입장</a>

</body>
</html>