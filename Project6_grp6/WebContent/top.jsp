<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<!-- banner -->
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<div class="main_section_agile">
		<div class="agileits_w3layouts_banner_nav">
		   
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					
				<h1><a class="navbar-brand" href="${myContextPath}/index?task=home"><i class="fa fa-diamond" aria-hidden="true"></i> Movie Reservation</a></h1>

				</div>
				 <ul class="agile_forms">
				<li><a class="active" href="${myContextPath}/member?task=loginForm" data-toggle="modal" data-target="#myModal2"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</a> </li>
					<li><a href="${myContextPath}/member?task=joinForm" data-toggle="modal" data-target="#myModal3"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up</a> </li>
					<c:if test="${not empty sessionScope.loginId }">
						<li><a href="${myContextPath}/logout.jsp" data-toggle="modal" data-target="#myModal3"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Log Out</a> </li>
					</c:if>		
				</ul>
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
<%-- 							<li class="active"><a href="${myContextPath}/index?task=home" class="effect-3">Home</a></li> --%>
							<li><a href="${myContextPath}/find?task=movieFind" class="effect-3">영화 파인더</a></li>
							<li><a href="${myContextPath}/ticketing" class="effect-3">예매하기</a></li>
							<li><a href="${myContextPath}/ticketing?task=completeForm" class="effect-3">예매내역확인</a></li>
							<li><a href="${myContextPath}/food?task=foodList" class="effect-3">푸드코너</a></li>
							<li><a href="${myContextPath}/board?task=boardList" class="effect-3">감상평</a></li>
						</ul>
					</nav>
				</div>
			</nav>	
<div class="clearfix"> </div> 
		</div>
</div>
</body>
</html>