<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<title>로그인 화면</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<p align="center">
		<img src="signIn.png">
	</p>
<center>
	<h2 font color="gray">Log In</h2>

	<hr color="#9FC93C">	
<c:set var="myContextPath" 
			value="${pageContext.request.contextPath}"/>
	
	<c:if test="${empty sessionScope.loginId}">		
	<form action="${myContextPath}/member" method="post">
		<b>I D : <input type="text" name="id" size="14"><br>
		PW : <input type="password" name="pw" size="14"><br></b>
			<hr color="#9FC93C">	
		<input type="submit" value="로그인">
		<input type="hidden" name="task" value="login">
	</form>
	</c:if>
	<c:if test="${not empty sessionScope.loginId}">
		<script type="text/javascript">
			alert("이미 로그인 된 사용자 입니다");
			location.href='${pageContext.request.contextPath}/';
		</script>
	</c:if>
<pre>





</pre>
	</center>
	<%@include file="footer.jsp"%>
</body>
</html>