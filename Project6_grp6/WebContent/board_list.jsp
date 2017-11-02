<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>감상평</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

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
			<h2> <span class="fixed_w3">[</span> 감상평 게시판 <span class="fixed_w3">]</span> </h2>
			</div>
			</div>
<!-- 	<h2 align="center">감상평 게시판</h2> -->
	<hr color="lime">
	<br>
<!-- 	<table border="1"> -->
<!-- 	<table class="table table-bordered table-hover"> -->
		<table class="w3-table-all">
		<tr class="w3-grey">
			<th><p>글번호</p></th>
			<th><p>제목</p></th>
			<th><p>작성자</p></th>
			<th><p>작성일</p></th>
			<th><p>조회수</p></th>
		</tr>
	<c:choose>
		<c:when test="${empty articlePage.articleList }">
			<tr>
				<td colspan="5">
					작성된 게시글이 존재하지 않습니다.
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
								ㄴ
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
			<a href="${myContextPath }/board?p=${articlePage.startPage-1}">[이전]</a>
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
				<button>글쓰기</button>
			</a>
		</c:if>
		<c:if test="${empty sessionScope.loginId }">
			<a href="${myContextPath }/member?task=loginForm">
			<br>
				<button>로그인</button>
			</a>
		</c:if>
	</div>
	<pre>
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>