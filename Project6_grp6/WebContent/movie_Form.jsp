<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>영화 스마트 파인더</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$('button[name=btnSearch]').click(function() {
			var allData = {
				"task":$('#task').val(),
				"keyword" : $('#keyword').val() ,
				"year_start" : $('#year_start').val(),
				"year_end" : $('#year_end').val(),
				"genre_check" : $('input[name=genre]:checked').val(),
				"national_check" : $('input[name=national]:checked').val()
			};

			$.ajax({
				type : 'post', // 요청 보내면 doPost가 실행됨
				url : 'find', // 우리가 작성한 java 서블릿에게
				data : allData,
				dataType : 'json', // 응답데이터 형식
				success : function(resultData) {
					alert("영화 검색 완료");
					var count = 0;
					var movieData = "<table align='center' width='100%'>";
					$.each(resultData['items'], function(index, item) {
						if (count % 5 == 0) {
							movieData += "<tr align ='center'>"
						}
						movieData += "<td align ='center'><center><table align='center' width ='25%' heigh='10%' class='w3-table-all'>";
						movieData += "<tr class='w3-red'><td align ='center'><p>" + (count + 1) + "&nbsp;</p></td></tr>";
						movieData += "<tr align ='right'><td align ='right'><p>" + item['pubDate'] + "&nbsp;</p></td></tr>";
						movieData += "<tr><td align ='center'><p>" + "<img ' src='" + item['image'] + "'>" + "&nbsp;</p></td></tr>";
						movieData += "<tr><td align ='center'><p>" + item['title'] + "&nbsp;</p></td></tr>";
						movieData += "<tr><td align ='center'><p>" + item['director'] + "&nbsp;</p></td></tr>";
						movieData += "</table></center></td>";
						count++;
						if (count % 5 == 0) {
							movieData += "</tr>"
						}
					})
					movieData += "</table>";
					$('#searchResult').html(movieData);
				},
				error : function() {
					alert("영화 실패");
				}
			})
		})
	})
</script>
<style>
#ul {
	height: 100px;
	width: 1000;
	position: relative;
	list-style: none;
}

#li {
	position: relative;
	height: 30;
	width: 150;
	float: left;
}

p{
	text-align : center;
	
}

img {
	margin-top: 30px;
	width: 150px;
	height: 300px;
	background-color: #EEE; /* 오렌지 F63 */
}

table.table-style-three {
		font-family: verdana, arial, sans-serif;
		font-size: 11px;
		color: #333333;
		border-width: 1px;
		border-color: #3A3A3A;
		border-collapse: collapse;
	}
	table.table-style-three th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #FFA6A6;
		background-color: #D56A6A;
		color: #ffffff;
	}
	table.table-style-three tr:hover td {
		cursor: pointer;
	}
	table.table-style-three tr:nth-child(even) td{
		background-color: #F7CFCF;
	}
	table.table-style-three td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #FFA6A6;
		background-color: #ffffff;

.form-control {
	width: auto;
}
</style>
</head>
<%@include file="top.jsp"%>

<body>
	<div class="banner-bottom">
		<div class="container">
	<h2> <span class="fixed_w3">[</span> 영화 스마트파인더 <span class="fixed_w3">]</span> </h2>
	</div>
	</div>
	
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>

<input type="hidden" id="task" value="postFindMovie">
	<table class="table table-striped table-bordered table-hover">
		<!--/////////////////////////테이블의 머리 부분/////////////////////////-->
		<thead align="center">
			<tr bgcolor='#FFF29E'>
				<td colspan="2"><h2>
						<small>&nbsp;</small>
					</h2></td>
			</tr>
		</thead>
		<!--/////////////////////////테이블의 몸통부분/////////////////////////-->
		<tbody>
			<tr>
				<th class="searchtype">영화제목검색</th>
				<td><input type="text" class="form-control" id="keyword" name="keyword"
					style="width: 410px;" placeholder="영화 제목을 입력해 주세요" /></td>
			</tr>

			<tr>
				<th class="genretype">장르</th>
				<td>
					<ul id="ul">
						<li id="li"><input type="radio" id="all_genre" name="genre" value="0"
							checked="checked" /> <label for="all_genre">전체</label></li>

						<li id="li"><input type="radio" id="genre1" name="genre" value="1" /><label
							for="genre1">드라마</label></li>

						<li id="li"><input type="radio" id="genre2" name="genre" value="2" /><label
							for="genre2">판타지</label></li>

						<li id="li"><input type="radio" id="genre3" name="genre" value="3" /><label
							for="genre3">서부</label></li>

						<li id="li"><input type="radio" id="genre4" name="genre" value="4" /><label
							for="genre4">공포</label></li>

						<li id="li"><input type="radio" id="genre5" name="genre" value="5" /><label
							for="genre5">멜로/로맨스</label></li>

						<li id="li"><input type="radio" id="genre6" name="genre" value="6" /><label
							for="genre6">모험</label></li>

						<li id="li"><input type="radio" id="genre7" name="genre" value="7" /><label
							for="genre7">스릴러 </label></li>

						<li id="li"><input type="radio" id="genre8" name="genre" value="8" /><label
							for="genre8">느와르</label></li>

						<li id="li"><input type="radio" id="genre9" name="genre" value="9" /><label
							for="genre9">컬트</label></li>

						<li id="li"><input type="radio" id="genre10" name="genre" value="10" /><label
							for="genre10">다큐멘터리</label></li>

						<li id="li"><input type="radio" id="genre11" name="genre" value="11" /><label
							for="genre11">코미디</label></li>

						<li id="li"><input type="radio" id="genre12" name="genre" value="12" /><label
							for="genre12">가족</label></li>

						<li id="li"><input type="radio" id="genre13" name="genre" value="13" /><label
							for="genre13">미스터리</label></li>

						<li id="li"><input type="radio" id="genre14" name="genre" value="14" /><label
							for="genre14">전쟁</label></li>

						<li id="li"><input type="radio" id="genre15" name="genre" value="15" /><label
							for="genre15">애니메이션</label></li>

						<li id="li"><input type="radio" id="genre16" name="genre" value="16" /><label
							for="genre16">범죄</label></li>

						<li id="li"><input type="radio" id="genre17" name="genre" value="17" /><label
							for="genre17">뮤지컬</label></li>

						<li id="li"><input type="radio" id="genre18" name="genre" value="18" /><label
							for="genre18">SF</label></li>

						<li id="li"><input type="radio" id="genre19" name="genre" value="19" /><label
							for="genre19">액션</label></li>

						<li id="li"><input type="radio" id="genre20" name="genre" value="20" /><label
							for="genre20">무협</label></li>

						<li id="li"><input type="radio" id="genre21" name="genre" value="21" /><label
							for="genre21">에로</label></li>

						<li id="li"><input type="radio" id="genre22" name="genre" value="22" /><label
							for="genre22">서스펜스</label></li>

						<li id="li"><input type="radio" id="genre23" name="genre" value="23" /><label
							for="genre23">서사 </label></li>

						<li id="li"><input type="radio" id="genre24" name="genre" value="24" /><label
							for="genre24">블랙코미디</label></li>

						<li id="li"><input type="radio" id="genre25" name="genre" value="25" /><label
							for="genre25">실험</label></li>

						<li id="li"><input type="radio" id="genre26" name="genre" value="26" /><label
							for="genre26">영화카툰</label></li>

						<li id="li"><input type="radio" id="genre27" name="genre" value="27" /><label
							for="genre27">영화음악</label></li>

						<li id="li"><input type="radio" id="genre28" name="genre" value="28" /><label
							for="genre28">영화패러디</label></li>
					</ul>
				</td>
			</tr>

			<tr>
				<th class="maketype">제작국가</th>
				<td>
					<ul id="ul">
						<li id="li"><input type="radio" name="national"
							id="all_national_code" value="NU" checked="checked" /><label
							for="all_national_code">전체</label></li>

						<li id="li"><input type="radio" id="national_code_164"
							name="national" value="KR" /><label for="national_code_164">한국</label></li>

						<li id="li"><input type="radio" id="national_code_102"
							name="national" value="JP" /><label for="national_code_102">일본</label></li>

						<li id="li"><input type="radio" id="national_code_141"
							name="national" value="US" /><label for="national_code_141">미국</label></li>

						<li id="li"><input type="radio" id="national_code_143"
							name="national" value="HK" /><label for="national_code_143">홍콩</label></li>

						<li id="li"><input type="radio" id="national_code_167"
							name="national" value="GB" /><label for="national_code_167">영국</label></li>

						<li id="li"><input type="radio" id="national_code_161"
							name="national" value="FR" /><label for="national_code_161">프랑스</label></li>

						<li id="li"><input type="radio" id="national_code_128"
							name="national" value="ETC" /><label for="national_code_128">기타</label></li>
					</ul>
				</td>
			</tr>

			<tr>
				<th class="yeartype"><label>제작년도</label></th>
				<td><label>시작년도</label> <input type="number" min="1000"
					class="form-control" id="year_start" value="1960" maxlength="4">
					<label>끝년도</label> <input type="number" max="2020"
					class="form-control" id="year_end" value="2020" maxlength="4"></td>
			</tr>
		</tbody>
		<thead align="center">
			<tr bgcolor='#FFF29E'>
				<td colspan="2"><h2>
						<small>&nbsp;</small>
					</h2></td>
			</tr>
		</thead>
	</table>
	<br>
	<div align="center">
			<button name="btnSearch" class="text-center" class="btn btn-default">검색</button>
	</div>
	
	<hr>
	<div class="banner-bottom">
		<div class="container">
	<h2> <span class="fixed_w3">[</span> 영화 목록 <span class="fixed_w3">]</span> </h2>
	</div>
	</div>
	<center>
	<div id="searchResult" class="w3-container"></div>
	<pre>
	
	
	
	</pre>
	</center>
</body>
<%@include file="footer.jsp"%>
</html>