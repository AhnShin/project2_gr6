<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>Movie Reservation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
</head>
<style>
b{
	text-align : center;
}
p{
	text-align : center;
}
</style>
<%@include file="top.jsp"%>
<body>
<!-- banner -->
	<div class="banner-silder">
		<div id="JiSlider" class="jislider">
			<ul>
				<li>
						<div class="w3layouts-banner-top w3layouts-banner-top1">
						<div class="container">
								<div class="agileits-banner-info">
									<h3>Best Movie Theatre</h3>
									 <p>With GangNam Movie Center</p>
										<div class="more">
									</div>
								</div>	
							</div>
						</div>
				</li>
			</ul>
		</div>
      </div>
<!-- //banner -->
<br>
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<h6>GangNam Movie Center</h6>
			<h2> <span class="fixed_w3">[</span> 상영 영화 <span class="fixed_w3">]</span> </h2>
			<br>
			<c:choose>
			<c:when test="${empty movieVOList}">
			<tr>
				<td colspan="4">
				<br>
				<center><h1 color="red"> 상영중인 영화가 없습니다. </h1></center>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${movieVOList}" var="f">
			<div class="agileits_banner_bottom_grids">
			<c:if test="${f.movie_num%4==1}">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<a href="${pageContext.request.contextPath}/ticketing">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<table class="w3-table-all">
						<tr align ="center" class="w3-blue">
						<td align ="center"><b>${f.movie_num}</b></td>
						</tr>
						<tr align ="center">
						<td align ="center"><b>감독 : ${f.director}</b></td>
						</tr>
						</table>
							<img src="images/${f.movie_img}" width="640" height="420" alt=" " class="img-responsive" />
						<div class="overlay">
						<br>
						   <p>${f.title}</p>
						</div>
					</div>
					</a>
				</div>
				
				</c:if>
				
				<c:if test="${f.movie_num%4==2}">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<a href="${pageContext.request.contextPath}/ticketing">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<table class="w3-table-all">
						<tr align ="center" class="w3-blue">
						<td align ="center"><b>${f.movie_num}</b></td>
						</tr>
						<tr align ="center">
						<td align ="center"><b>감독 : ${f.director}</b></td>
						</tr>
						
						</table>
						
						<img src="images/${f.movie_img}" width="640" height="420" alt=" " class="img-responsive" />
						<div class="overlay">
						<br>
						     <p>${f.title}</p>
						</div>
					</div>
					</a>
				</div>
				</c:if>
				
				<c:if test="${f.movie_num%4==3}">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<a href="${pageContext.request.contextPath}/ticketing">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<table class="w3-table-all">
						<tr align ="center" class="w3-blue">
						<td align ="center"><b>${f.movie_num}</b></td>
						</tr>
						<tr align ="center">
						<td align ="center"><b>감독 : ${f.director}</b></td>
						</tr>
						
						</table>
						
						<img src="images/${f.movie_img}" width="640" height="420" alt=" " class="img-responsive" />
						<div class="overlay">
						<br>
						<br>
						    <p>${f.title}</p>
						</div>
					</div>
					</a>
				</div>
				</c:if>
				
				<c:if test="${f.movie_num%4==0}">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<a href="${pageContext.request.contextPath}/ticketing">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<table class="w3-table-all">
						<tr align ="center" class="w3-blue">
						<td align ="center"><b>${f.movie_num}</b></td>
						</tr>
						<tr align ="center">
						<td align ="center"><b>감독 : ${f.director}</b></td>
						</tr>
						
						</table>
						
						<img src="images/${f.movie_img}" width="640" height="420" alt=" " class="img-responsive" />
						<div class="overlay">
						<br>
						    <p>${f.title}</p>
						</div>
					</div>
					</a>
				</div>
				<div class="clearfix"> </div>
				</c:if>
			</div>
			
			
<!-- 			<div class="agileits_banner_bottom_grids two"> -->
<%-- 			<c:if test="${f.movie_num%4==1}"> --%>
<!-- 				<div class="col-md-3 agileits_banner_bottom_grid"> -->
<!-- 					<div class="hovereffect w3ls_banner_bottom_grid"> -->
<!-- 						<img src="images/5.jpg" width="640" height="420" alt=" " class="img-responsive" /> -->
<!-- 						<div class="overlay"> -->
<!-- 						   <p>Project</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:if> --%>
				
<%-- 				<c:if test="${f.movie_num%4==2}"> --%>
<!-- 				<div class="col-md-3 agileits_banner_bottom_grid"> -->
<!-- 					<div class="hovereffect w3ls_banner_bottom_grid"> -->
<!-- 						<img src="images/6.jpg" width="640" height="420" alt=" " class="img-responsive" /> -->
<!-- 						<div class="overlay"> -->
<!-- 						     <p>Project</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:if> --%>
				
<%-- 				<c:if test="${f.movie_num%4==3}"> --%>
<!-- 				<div class="col-md-3 agileits_banner_bottom_grid"> -->
<!-- 					<div class="hovereffect w3ls_banner_bottom_grid"> -->
<!-- 						<img src="images/7.jpg" width="640" height="420" alt=" " class="img-responsive" /> -->
<!-- 						<div class="overlay"> -->
<!-- 						    <p>Project</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:if> --%>
				
<%-- 				<c:if test="${f.movie_num%4==0}"> --%>
<!-- 				<div class="col-md-3 agileits_banner_bottom_grid"> -->
<!-- 					<div class="hovereffect w3ls_banner_bottom_grid"> -->
<!-- 						<img src="images/8.jpg" width="640" height="420" alt=" " class="img-responsive" /> -->
<!-- 						<div class="overlay"> -->
<!-- 						    <p>Project</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:if> --%>
				
<!-- 				<div class="clearfix"> </div> -->
				
<!-- 			</div> -->
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</div>
		
		<!-- /blog -->
	<div class="events">
		<ul id="flexiselDemo1">	
			<li>
				<div class="w3layouts_event_grid">
					<div class="w3_agile_event_grid1">
						<img src="images/1.jpg" alt=" " class="img-responsive" />
						<div class="w3_agile_event_grid1_pos">
							<p>23 March 2017</p>
						</div>
						<div class="agile_event_grid1_pos">
							<ul>
								<li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>18</a></li>
								<li><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>21</a></li>
								<li><a href="#"><i class="fa fa-share" aria-hidden="true"></i>13</a></li>
							</ul>
						</div>
					</div>
					<div class="agileits_w3layouts_event_grid1">
						<h5><a href="#" data-toggle="modal" data-target="#myModal">Learn Basics</a></h5>
						<p>viverra ipsum ac, convallis mauris. Sed quis congue turpis, cursus rhoncus nibh.</p>
					</div>
				</div>
			</li>
			<li>
				<div class="w3layouts_event_grid">
					<div class="w3_agile_event_grid1">
						<img src="images/8.jpg" alt=" " class="img-responsive" />
						<div class="w3_agile_event_grid1_pos">
							<p>25 March 2017</p>
						</div>
						<div class="agile_event_grid1_pos">
							<ul>
								<li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>18</a></li>
								<li><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>21</a></li>
								<li><a href="#"><i class="fa fa-share" aria-hidden="true"></i>13</a></li>
							</ul>
						</div>
					</div>
					<div class="agileits_w3layouts_event_grid1">
						<h5><a href="#" data-toggle="modal" data-target="#myModal">business law</a></h5>
						<p>viverra ipsum ac, convallis mauris. Sed quis congue turpis, cursus rhoncus nibh.</p>
					</div>
				</div>
			</li>
			<li>
				<div class="w3layouts_event_grid">
					<div class="w3_agile_event_grid1">
						<img src="images/7.jpg" alt=" " class="img-responsive" />
						<div class="w3_agile_event_grid1_pos">
							<p>28 March 2017</p>
						</div>
						<div class="agile_event_grid1_pos">
							<ul>
								<li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>18</a></li>
								<li><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>21</a></li>
								<li><a href="#"><i class="fa fa-share" aria-hidden="true"></i>13</a></li>
							</ul>
						</div>
					</div>
					<div class="agileits_w3layouts_event_grid1">
						<h5><a href="#" data-toggle="modal" data-target="#myModal">PHP Programming</a></h5>
						<p>viverra ipsum ac, convallis mauris. Sed quis congue turpis, cursus rhoncus nibh.</p>
					</div>
				</div>
			</li>
			<li>
				<div class="w3layouts_event_grid">
					<div class="w3_agile_event_grid1">
						<img src="images/2.jpg" alt=" " class="img-responsive" />
						<div class="w3_agile_event_grid1_pos">
							<p>30 March 2017</p>
						</div>
						<div class="agile_event_grid1_pos">
							<ul>
								<li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>18</a></li>
								<li><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>21</a></li>
								<li><a href="#"><i class="fa fa-share" aria-hidden="true"></i>13</a></li>
							</ul>
						</div>
					</div>
					<div class="agileits_w3layouts_event_grid1">
						<h5><a href="#" data-toggle="modal" data-target="#myModal">Earn Profit</a></h5>
						<p>viverra ipsum ac, convallis mauris. Sed quis congue turpis, cursus rhoncus nibh.</p>
					</div>
				</div>
			</li>
			<li>
				<div class="w3layouts_event_grid">
					<div class="w3_agile_event_grid1">
						<img src="images/6.jpg" alt=" " class="img-responsive" />
						<div class="w3_agile_event_grid1_pos">
							<p>2 April 2017</p>
						</div>
						<div class="agile_event_grid1_pos">
							<ul>
								<li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>18</a></li>
								<li><a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>21</a></li>
								<li><a href="#"><i class="fa fa-share" aria-hidden="true"></i>13</a></li>
							</ul>
						</div>
					</div>
					<div class="agileits_w3layouts_event_grid1">
						<h5><a href="#" data-toggle="modal" data-target="#myModal">Strategy</a></h5>
						<p>viverra ipsum ac, convallis mauris. Sed quis congue turpis, cursus rhoncus nibh.</p>
					</div>
				</div>
			</li>
		</ul>
	</div>
<!-- //blog -->
	</div>
<!-- //banner-bottom -->

<!-- //banner-bottom -->
<%@include file="footer.jsp"%>
</body>
</html>