<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->

<title>��ȭ ���� ������</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
p{
	text-align : center;
	image-align : center;
	margin: auto;
	text-align : middle;
	text-height : 200px;

}
#td{

	vertical-align : middle;
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
<!-- <h2 align="center">������ ��ȭ�� Ŭ���ϼ���.</h2> -->
	<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> ������ ��ȭ�� Ŭ���ϼ��� <span class="fixed_w3">]</span> </h2>
			<br>
		</div>
	</div>
<table class="w3-table-all">
	<tr class="w3-grey">
		<th width="150px"><p>��ȣ</p></th>
		<th width="250px"><p>��ȭ</p></th>
		<th width="250px"><p>����</p></th>
		<th width="200px"><p>��¥</p></th>
		<th width="200px"><p>�ð�</p></th>
		<th width="200px"><p>����</p></th>
		<th width="200px"><p>�ֿ�</p></th>
	</tr>
	<c:forEach var="movie" items="${movieList }">
		<tr>
			<td id="td" height="300px"><p>${movie.movieNum }</p></td>
			<td id="td">
			
					<div class="agileits_banner_bottom_grid hovereffect w3ls_banner_bottom_grid">
						<a href="${pageContext.request.contextPath }/seat?task=seatForm&movieNum=${movie.movieNum }">
						<img src="images/${movie.movieNum}.jpg" width="500" height="480" alt=" " class="img-responsive" />
						<div class="overlay">
						   <p>
								${movie.title }
							</p>
						</div>
					</div>
				
			</td>
			<td id="td"><p><b>${movie.title }</b></p></td>
			<td id="td"><p><b>${movie.movieDate }</b></p></td>
			<td id="td"><p><b>${movie.movieTime }</b></p></td>
			<td id="td"><p><b>${movie.director }</b></p></td>
			<td id="td"><p><b>${movie.actor }</b></p></td>
		</tr>
	</c:forEach>
</table>
<br>

<%@include file="footer.jsp"%>
</body>
</html>