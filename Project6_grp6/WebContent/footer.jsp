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
						<li>(04377)����Ư���� ��걸 �Ѱ���� 23�� 55, ������ũ�� 6��(�Ѱ��ε�)<br>
<br>����Ǹž��Ű��ȣ : 2017-������-0662<span>����ڵ�Ϲ�ȣ : 104-81-45690</span></li>
					</ul>
				</div>
				
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>������ȣ</h3>
					<ul class="agile_footer_grid_list">
						<li>
����������ȣ å���� : û�ֿ��� ���뼼<br>��ǥ�̻� : ������<br>��ǥ�̸��� : <a href="mailto:info@mail.com">cgv@gmail.com</a><br>
							<span>CGV������ : 1544-1122 </span></li>
					</ul>
				</div>
				
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>������</h3>
					<ul class="agileits_w3layouts_footer_grid_list">
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/find?task=movieFind">�� ��ȭ���δ�</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/ticketing">�� �����ϱ�</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/ticketing?task=completeForm">�� ���ų���Ȯ��</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/food?task=foodList">�� Ǫ���ڳ�</a></li>
						<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i><a href="${myContextPath}/board?task=boardList">�� ������</a></li>
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