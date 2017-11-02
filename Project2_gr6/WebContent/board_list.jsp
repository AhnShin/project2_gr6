<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	<c:set var="myContextPath" value="${pageContext.request.contextPath}"></c:set>
	<br>
	<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> ������ �Խ��� <span class="fixed_w3">]</span> </h2>
			</div>
			</div>
<!-- 	<h2 align="center">������ �Խ���</h2> -->
	<hr color="lime">
	<br>
<!-- 	<table border="1"> -->
<!-- 	<table class="table table-bordered table-hover"> -->
		<table class="w3-table-all">
		<tr class="w3-grey">
			<th><p>�۹�ȣ</p></th>
			<th><p>����</p></th>
			<th><p>�ۼ���</p></th>
			<th><p>�ۼ���</p></th>
			<th><p>��ȸ��</p></th>
		</tr>
	<c:choose>
		<c:when test="${empty articlePage.articleList }">
			<tr>
				<td colspan="5">
					�ۼ��� �Խñ��� �������� �ʽ��ϴ�.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="article" items="${articlePage.articleList }" >
				<tr>
					<td><p>${article.articleNum }<p></td>
					<td>
						<a href="${myContextPath }/board?task=read&articleNum=${article.articleNum}">
							<c:if test="${article.bLevel>0 }">
								<c:forEach begin="1" end="${article.bLevel }">
									&nbsp;&nbsp;
								</c:forEach>
								��
							</c:if>
							${article.title }
						</a>
					</td>
					<td><p>${article.writer }</p></td>
					<td>
						<p><fmt:formatDate value="${article.writeTime }" type="both" dateStyle="short" timeStyle="short"/></p>
					</td>
					<td><p>${article.readCount }</p></td>
				</tr>
			</c:forEach>
		</c:otherwise>
			
	</c:choose>
	</table>
	<br>
	<div align="center">
		<c:if test="${articlePage.startPage > 1 }">
			<a href="${myContextPath }/board?p=${articlePage.startPage-1}">[����]</a>
		</c:if>
		<c:forEach begin="${articlePage.startPage }" end="${articlePage.endPage }" var="i">
			<a href="${myContextPath }/board?p=${i}">${i }</a>
		</c:forEach>
		<c:if test="${articlePage.endPage < articlePage.totalPage }">
			<a href="${myContextPath }/board?p=${articlePage.endPage+1}"></a>
		</c:if>
	</div>
	
	<div align="center">
		<c:if test="${not empty sessionScope.loginId }">
			<a href="${myContextPath }/board?task=writeForm">
			<br>
				<button>�۾���</button>
			</a>
		</c:if>
		<c:if test="${empty sessionScope.loginId }">
			<a href="${myContextPath }/member?task=loginForm">
			<br>
				<button>�α���</button>
			</a>
		</c:if>
	</div>
	<pre>
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>