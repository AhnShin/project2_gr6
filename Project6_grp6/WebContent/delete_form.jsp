<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� Ȯ�� ������</title>
</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<div align="center">
		<form action="${pageContext.request.contextPath }/board" method="post">
			���� �����Ͻðڽ��ϱ�? 
			<br>
		 	<input type="submit" value="Ȯ��">
		 	<input type="hidden" name="task" value="delete">
		 	<input type="hidden" name="articleNum" value="${articleNum }">
		</form>
	</div>
<pre>
	
	
	
	
	
	
</pre>
<%@include file="footer.jsp"%>
</body>
</html>