<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예매 확인</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
		alert("로그인되지 않았습니다.");
		location.href='${pageContext.request.contextPath}/';
	</script>
</c:if>

<c:if test="${not empty sessionScope.loginId }">
<%-- <h2>${sessionScope.loginId }님의 예매내역</h2> --%>

<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span>${sessionScope.loginId }님의 예매내역 <span class="fixed_w3">]</span> </h2>
			<br>
			</div>
			</div>

<table class="w3-table-all">
	<tr class="w3-grey">
		<th><p>ID</p></th>
		<th><p>날짜</p></th>
		<th><p>시간</p></th>
		<th><p>영화</p></th>
		<th><p>좌석</p></th>
	</tr>
	<c:choose>
		<c:when test="${empty seat }">
			<tr>
				<td colspan="5">
					예매내역이 존재하지 않습니다.
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
						<input type="button" value="홈으로"></a>
						<input type="submit" value="예매취소">
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