<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>

<title>ȸ������ �Ϸ�</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<hr color="#6B9900">
<c:set var="myContextPath" 
			value="${pageContext.request.contextPath}"/>
<center>
	<p align="center"><img src = "handShake.png"></p>
</center>
<center>
		<font size ="5" color="gray"><b>ȸ�������� �����մϴ�</b></font>
		<br>
		<b>�α����� �õ��ϼ���</b>
	</center>
	<hr color="#6B9900">
</center>
<center>
	<a href="${myContextPath}/member?task=loginForm">
		<input type="submit" value="�α����Ϸ� ����">
	</a>
</center>
<pre>
	
	
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>