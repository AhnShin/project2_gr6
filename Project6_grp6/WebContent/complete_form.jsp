<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� Ȯ��</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
<style>
p{
	text-align : center;
}
</style>
</head>
<body>
<%@include file="top.jsp"%>
<c:if test="${empty sessionScope.loginId }">
	<script type="text/javascript">
		alert("�α��ε��� �ʾҽ��ϴ�.");
		location.href='${pageContext.request.contextPath}/';
	</script>
</c:if>

<c:if test="${not empty sessionScope.loginId }">
<%-- <h2>${sessionScope.loginId }���� ���ų���</h2> --%>

<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span>${sessionScope.loginId }���� ���ų��� <span class="fixed_w3">]</span> </h2>
			<br>
			</div>
			</div>

<table class="w3-table-all">
	<tr class="w3-grey">
		<th><p>ID</p></th>
		<th><p>��¥</p></th>
		<th><p>�ð�</p></th>
		<th><p>��ȭ</p></th>
		<th><p>�¼�</p></th>
	</tr>
	<c:choose>
		<c:when test="${empty seat }">
			<tr>
				<td colspan="5">
					���ų����� �������� �ʽ��ϴ�.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td><p>${sessionScope.loginId }</p></td>
				<td><p>${movie.movieDate }</p></td>
				<td><p>${movie.movieTime }</p></td>
				<td><p>${movie.title }</p></td>
				<td>
					<p>${seat } </p>
				</td>
			</tr> 
			<tr>
				<td colspan="5">
				<center>
					<form action="${pageContext.request.contextPath}/ticketing" method="post">
						<input type="hidden" name="task" value="completeForm">
						<input type="hidden" name="ticketing" value="cancel">
						<a href="${pageContext.request.contextPath}/">
						<input type="button" value="Ȩ����"></a>
						<input type="submit" value="�������">
					</form>
				</center>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
</c:if>
<pre>









</pre>
<%@include file="footer.jsp"%>
</body>
</html>