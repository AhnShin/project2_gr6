<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>



<html>
<head>
<title>영화 스마트 파인더</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('button[name=btnSearch]').click(function() {
			// 사용자가 입력한 검색단어
			var keyword = $('#keyword').val();

			$.ajax({
				type : 'post', // 요청 보내면 doPost가 실행됨
				url : 'movie', // 우리가 작성한 java 서블릿에게
				data : 'keyword=' + keyword, // 검색어 데이터
				dataType : 'json', // 응답데이터 형식
				success : function(resultData) {
					alert("영화 검색 완료");
					var movieData = " <table class='table table-bordered table-hover' >";
// 					var movieData = "";
					$.each(resultData['items'], function(index, item) {
						movieData += "<tr><td>";
						movieData += "<img src='" + item['image'] + "'>";
						movieData += "</td></tr>";
						movieData += "<tr><td>" + item['title'] + "</td></tr>";
						movieData += "<tr><td>" + item['director'] + "</td></tr>";
						movieData += "<tr><td>" + item['pubDate'] + "</td></tr>";
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
ul {
	height: 100px;
	width: 1000;
	position: relative;
	list-style: none;
}

li { 
	position: relative; 
	height: 30; 
	width: 150; 
	float: left; 
} 

.form-control {
	width: auto;
}
</style>
</head>
<body>
	<h1>영화 스마트파인더</h1>

	<h2>무비파인더 - 좋아하는 영화, 찾고싶은 영화를 내가 찾아준다!!</h2>
	<table class="table table-striped table-bordered table-hover">
		<!--/////////////////////////테이블의 머리 부분/////////////////////////-->
		<thead align="center">
			<tr bgcolor='#CEF279'>
				<td colspan="2"><h2>
						<small>영화 조건 검색</small>
					</h2></td>
			</tr>
		</thead>

		<!--/////////////////////////테이블의 몸통부분/////////////////////////-->
		<tbody>
			<tr>
				<th class="searchtype">영화제목검색</th>
				<td><input type="text" class="form-control" id="keyword"
					style="width: 410px;" placeholder="영화 제목을 입력해 주세요" /></td>
			</tr>

			<tr>
				<th class="genretype">장르</th>
				<td>
					<ul>
						<li><input type="checkbox" checked="checked" id="all_genre"
							name="all-genre" value="all" /> <label for="all_genre">전체</label></li>
						<li class="collage"><input type="checkbox" name="indi_genre"
							id="is_indi" value="1" /><label for="is_indi">아트하우스</label></li>
						<li><input type="checkbox" id="genre226" name="genre"
							value="226" /><label for="genre226">가족</label></li>

						<li><input type="checkbox" id="genre217" name="genre"
							value="217" /><label for="genre217">공포/호러</label></li>

						<li><input type="checkbox" id="genre723" name="genre"
							value="723" /><label for="genre723">드라마</label></li>

						<li><input type="checkbox" id="genre721" name="genre"
							value="721" /><label for="genre721">SF</label></li>

						<li><input type="checkbox" id="genre1228" name="genre"
							value="1228" /><label for="genre1228">멜로/로맨스</label></li>

						<li><input type="checkbox" id="genre732" name="genre"
							value="732" /><label for="genre732">코미디</label></li>

						<li><input type="checkbox" id="genre727" name="genre"
							value="727" /><label for="genre727">애니메이션</label></li>

						<li><input type="checkbox" id="genre228" name="genre"
							value="228" /><label for="genre228">느와르</label></li>

						<li><input type="checkbox" id="genre223" name="genre"
							value="223" /><label for="genre223">단편</label></li>

						<li><input type="checkbox" id="genre722" name="genre"
							value="722" /><label for="genre722">다큐멘터리</label></li>

						<li><input type="checkbox" id="genre1883" name="genre"
							value="1883" /><label for="genre1883">로드무비</label></li>

						<li><input type="checkbox" id="genre724" name="genre"
							value="724" /><label for="genre724">무협</label></li>

						<li><input type="checkbox" id="genre218" name="genre"
							value="218" /><label for="genre218">뮤지컬</label></li>

						<li><input type="checkbox" id="genre1884" name="genre"
							value="1884" /><label for="genre1884">뮤직</label></li>

						<li><input type="checkbox" id="genre219" name="genre"
							value="219" /><label for="genre219">미스터리</label></li>

						<li><input type="checkbox" id="genre222" name="genre"
							value="222" /><label for="genre222">범죄</label></li>

						<li><input type="checkbox" id="genre1885" name="genre"
							value="1885" /><label for="genre1885">옴니버스</label></li>

						<li><input type="checkbox" id="genre1886" name="genre"
							value="1886" /><label for="genre1886">서부</label></li>

						<li><input type="checkbox" id="genre725" name="genre"
							value="725" /><label for="genre725">스릴러</label></li>

						<li><input type="checkbox" id="genre1887" name="genre"
							value="1887" /><label for="genre1887">스포츠</label></li>

						<li><input type="checkbox" id="genre726" name="genre"
							value="726" /><label for="genre726">시대극/사극</label></li>

						<li><input type="checkbox" id="genre225" name="genre"
							value="225" /><label for="genre225">아동</label></li>

						<li><input type="checkbox" id="genre224" name="genre"
							value="224" /><label for="genre224">액션</label></li>

						<li><input type="checkbox" id="genre728" name="genre"
							value="728" /><label for="genre728">어드벤처</label></li>

						<li><input type="checkbox" id="genre1888" name="genre"
							value="1888" /><label for="genre1888">역사</label></li>

						<li><input type="checkbox" id="genre1889" name="genre"
							value="1889" /><label for="genre1889">전기</label></li>

						<li><input type="checkbox" id="genre731" name="genre"
							value="731" /><label for="genre731">전쟁</label></li>

						<li><input type="checkbox" id="genre1890" name="genre"
							value="1890" /><label for="genre1890">종교</label></li>

						<li><input type="checkbox" id="genre1891" name="genre"
							value="1891" /><label for="genre1891">재난</label></li>

						<li><input type="checkbox" id="genre1892" name="genre"
							value="1892" /><label for="genre1892">청춘영화</label></li>

						<li><input type="checkbox" id="genre1893" name="genre"
							value="1893" /><label for="genre1893">퀴어</label></li>

						<li><input type="checkbox" id="genre227" name="genre"
							value="227" /><label for="genre227">환타지</label></li>

						<li><input type="checkbox" id="genre1894" name="genre"
							value="1894" /><label for="genre1894">학원물</label></li>

						<li><input type="checkbox" id="genre729" name="genre"
							value="729" /><label for="genre729">에로</label></li>

						<li><input type="checkbox" id="genre1895" name="genre"
							value="1895" /><label for="genre1895">없음</label></li>
					</ul>
				</td>
			</tr>

			<tr>
				<th class="maketype">제작국가</th>
				<td>
					<ul>
						<li><input type="checkbox" name="all-national-code"
							id="all_national_code" /><label for="all_national_code">전체</label></li>

						<li><input type="checkbox" id="national_code_164"
							name="national-code" value="164" /><label
							for="national_code_164">한국</label></li>

						<li><input type="checkbox" id="national_code_102"
							name="national-code" value="102" /><label
							for="national_code_102">미국</label></li>

						<li><input type="checkbox" id="national_code_141"
							name="national-code" value="141" /><label
							for="national_code_141">일본</label></li>

						<li><input type="checkbox" id="national_code_143"
							name="national-code" value="143" /><label
							for="national_code_143">중국</label></li>

						<li><input type="checkbox" id="national_code_167"
							name="national-code" value="167" /><label
							for="national_code_167">홍콩</label></li>

						<li><input type="checkbox" id="national_code_161"
							name="national-code" value="161" /><label
							for="national_code_161">프랑스</label></li>

						<li><input type="checkbox" id="national_code_128"
							name="national-code" value="128" /><label
							for="national_code_128">영국</label></li>

						<li><input type="checkbox" id="national_code_93"
							name="national-code" value="93" /><label for="national_code_93">독일</label></li>

						<li><input type="checkbox" id="national_code_139"
							name="national-code" value="139" /><label
							for="national_code_139">인도</label></li>

						<li><input type="checkbox" id="national_code_1000"
							name="national-code" value="1000" /><label
							for="national_code_1000">기타</label></li>
					</ul>
				</td>
			</tr>

			<tr>
				<th class="yeartype"><label for="amount1">제작년도</label></th>
				<td><label for="yearStarLb">시작년도</label> <input type="text"
					class="form-control" id="year_start" value="1960" maxlength="4"
					placeholder="시작 년도 입력해주세요."> <label for="yearEndLb">끝
						년도</label> <input type="text" class="form-control" id="year_start"
					value="2020" maxlength="4" placeholder="끝 년도 입력해주세요.">
			</tr>
		</tbody>
	</table>

	<div align="center">
		<button name="btnSearch" class="text-center" class="btn btn-default">검색</button>

		<button type="reset" class="text-center" class="btn btn-default"
			id="btn_reset">
			<span>초기화</span>
		</button>
	</div>

	<hr>
	<h2>영화 목록 보는곳</h2>
	<!-- 	<table class="table table-striped table-bordered table-hover"> -->
	<div id="searchResult"></div>
	<!-- 	</table> -->


</body>
</html>