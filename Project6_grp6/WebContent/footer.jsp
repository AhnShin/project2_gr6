<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<div class="footer">
		<div class="container">
			<div class="w3_agile_footer_grids">
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>GMC</h3>
					<ul class="agile_footer_grid_list">
						<li>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)<br>
<br>통신판매업신고번호 : 2017-서울용산-0662<span>사업자등록번호 : 104-81-45690</span></li>
					</ul>
				</div>
				
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>정보보호</h3>
					<ul class="agile_footer_grid_list">
						<li>
개인정보보호 책임자 : 청주영재 정용세<br>대표이사 : 양유진<br>대표이메일 : <a href="mailto:info@mail.com">cgv@gmail.com</a><br>
							<span>CGV고객센터 : 1544-1122 </span></li>
					</ul>
				</div>
				
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>고객센터</h3>
					<ul class="agileits_w3layouts_footer_grid_list">
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/find?task=movieFind">● 영화파인더</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/ticketing">● 예매하기</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/ticketing?task=completeForm">● 예매내역확인</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/food?task=foodList">● 푸드코너</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/board?task=boardList">● 감상평</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="agileinfo_copyright">
				<p>2017 MultiCampus WebProject by Group 6</p>
			</div>
		</div>
	</div>
</body>
</html>