<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 읽기 화면</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<!-- <script type="text/javascript"> -->
<!-- 	function cmtSubmit(){ -->
<!-- 		var writer = $('#inputWriter').val(); -->
<!-- 		alert('test:'+writer); -->
<!-- 		return; -->
<!-- 	} -->
	
<!-- 	$(function(){ -->
<!-- 		// btnReComment : 대댓글 버튼 -->
<!-- 		$('.btnReComment').click(function(){ -->
<!-- 			var formCmt= '<textarea cols="20" rows="3"></textarea>'; -->
<!-- 			formCmt +='<button id="btnCmtSubmit">작성완료</button>' -->
<!-- 			// reComment : div 공간 -->
<!-- 			$(this).siblings('.reComment').html(formCmt); -->
			
<!-- 			$('#btnCmtSubmit').on('click',cmtSubmit) -->
<!-- 		}) -->
<!-- 	}) -->
	
<!-- </script> -->
<style>
p{
	text-align : center;
}
</style>
</head>
<body>
<%@include file="top.jsp"%>
<br>
<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> 감상평 VIEW <span class="fixed_w3">]</span> </h2>
			</div>
			</div>
	<c:set var="myContextPath" value="${pageContext.request.contextPath }"></c:set>
	
	<table class="w3-table-all" width="400px">
		<tr>
<!-- 			<td width="200px"></td> -->
			<td class="w3-grey"><p><b>글번호</b></p></td>
			<td>${article.articleNum }</td>		
		</tr>
		<tr>
<!-- 			<td width="200px"></td> -->
			<td class="w3-grey"><p><b>제목</b></p></td>
			<td>${article.title }</td>
		</tr>
		<tr>
<!-- 			<td width="200px"></td> -->
			<td class="w3-grey" width="200px"><p><b>작성자</b></p></td>
			<td>${article.writer }</td>
		</tr>
		<tr>
<!-- 			<td width="200px"></td> -->
			<td class="w3-grey"><p><b>작성일</b></p></td>
			<td>${article.writeTime }</td>
		</tr>
		<tr>
<!-- 			<td width="200px"></td> -->
			<td class="w3-grey"><p><b>조회수</b></p></td>
			<td>${article.readCount }</td>
		</tr>
		<tr>
<!-- 			<td width="200px"></td> -->
<!-- 			<td class="w3-grey"><p><b>내용</b></p></td> -->
			<td colspan="2">${article.contents }</td>
		</tr>
	</table>
	<br>
	<center>
	<c:if test="${sessionScope.loginId==article.writer }">
		<a href="${myContextPath }/board?task=updateForm&articleNum=${article.articleNum}">
			<button>수정하기</button>&nbsp;
		</a>
		<a href="${myContextPath }/board?task=deleteForm&articleNum=${article.articleNum}">
			<button>삭제하기</button>&nbsp;
		</a>
	</c:if>
	<c:if test="${not empty sessionScope.loginId }">
		<a href="${myContextPath }/board?task=replyForm&articleNum=${article.articleNum}">
			<button>답글달기</button>&nbsp;
		</a>
	</c:if>
	<a href="${myContextPath }/board?task=boardList">
		<button>게시판 목록으로</button>
	</a>	
	</center>
	<hr>
	
<!--	댓글 목록 -->
	<c:choose>
		<c:when test="${empty commentList }">
			댓글이 작성되지 않았습니다.
		</c:when>
		<c:otherwise>
			<table class="table table-bordered" class="table table-hover">
				<c:forEach var="comment" items="${commentList }">
					<tr>
						<td>
							${comment.writer } ${comment.writeTime }
<!-- 							<button class="btnReComment">대댓글</button> -->
<%-- 							<c:if test="${not empty sessionScope.loginId }"> --%>
<%-- 								<form action="${myContextPath }/comment" method="post" > --%>
<!-- 									<input type="submit" value="대댓글"> -->
									<input type="hidden" id="inputWriter" name="writer" value="${sessionScope.loginId }">
									<input type="hidden" name="articleNum" value="${article.articleNum }">
									<input type="hidden" name="level" value="${comment.cLevel }">
									<input type="hidden" name="ridx" value="${comment.cRidx }">
<!-- 								</form> -->
<%-- 							</c:if> --%>
							<font color="black"><span>&nbsp;&nbsp;${comment.contents }</span></font>
							
							<c:if test="${comment.writer == sessionScope.loginId}">
								<form action="" id="commentDelete">
									<input type="button" value="삭제">
									<input type="hidden" value="${article.articleNum }">
								</form>
							</c:if>
							
							<div class="reComment"></div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>

	<hr>
<!-- 	댓글 새로 등록 -->

	<c:if test="${not empty sessionScope.loginId }">
		<form action="${myContextPath }/comment" method="post">
		<center>
			<input type="hidden" name="task" value="write">
			<input type="hidden" name="writer" value="${sessionScope.loginId }">
			<input type="hidden" name="articleNum" value="${article.articleNum }">
			<table>
				<tr>
					<td>
						<b>현재 사용자 ID : ${sessionScope.loginId }</b>
						<br>
						&nbsp;
						<br>
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="5" cols="100" name="comment" placeholder="여기에 댓글을 입력하세요."></textarea>
					</td>
				</tr>
				<tr align="right">
					<td>
					<br>
						<input type="submit" id="enroll" value="댓글등록">
					</td>
				</tr>
			</table>
			</center>
		</form>
	</c:if>
	<br>
<%@include file="footer.jsp"%>
</body>
</html>