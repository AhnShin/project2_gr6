<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>좌석 선택창</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	var selectedCnt=0;
	var checkedCnt =0;
	var uncheckedCnt =0;
	var ResearvedCnt=0;
	$(function(){
		
		$('select').change(function(){
			selectedCnt = $(this).val();
			checkedCnt = $('input[type=checkbox]:checked').length;
			ResearvedCnt = parseInt(selectedCnt) + parseInt(checkedCnt);
			if(ResearvedCnt>20){
				alert('인원이 초과되었습니다.');
				return false;
			}
		})
		
		$('input[type=checkbox]').click(function(){
			if(selectedCnt==0){
				alert('인원을 선택하세요.');
				return false;
			}
			checkedCnt = $('input[type=checkbox]:checked').length;
			if(ResearvedCnt==checkedCnt){
				$("input:checkbox:not(:checked)").attr('disabled','disabled');
			} else {
				$('input[type=checkbox]').not('.reserved').removeAttr('disabled');
			}
		})
	})
</script>

<style>
.front {
	width: 550px;
	margin: 5px 32px 45px 0px;
	background-color: #b4b4b4;
	color: white;
	text-align: center;
	padding: 3px;
	border-radius: 5px;
}

#ul {
	height: 120px;
	width: 500;
	position: relative;
	list-style: none;
}

#li {
	position: relative;
	height: 30;
	width: 100;
	float: left;
}

input[name="seat"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: #54BD54;
	color: white;
	text-align: center;
	border-radius: 2px;
	cursor: pointer;
}

input[name="seat"]:checked+label {
	background-color: #FF8200;
	color: white;
	text-align: center;
}
input[name="seat2"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: #8c8c8c;
	color: white;
	text-align: center;
	border-radius: 2px;
}

input[name="seat"] {
	display: none;
}

.empty {
	width: 100px;
	margin: 20px 10px 20px 35px;
	background-color: #54BD54;
	color: white;
	text-align: center;
	padding: 3px;
	border-radius: 5px;
}
.book {
	width: 100px;
	margin: 20px 20px 20px 5px;
	background-color: #FF8200;
	color: white;
	text-align: center;
	padding: 3px;
	border-radius: 5px;
}
.full {
	width: 100px;
	margin: 20px 20px 20px 5px;
	background-color: #8c8c8c;
	color: white;
	text-align: center;
	padding: 3px;
	border-radius: 5px;
}
</style>

</head>
<body>
<%@include file="top.jsp"%>
<pre>





</pre>
<center>
<c:if test="${not empty exist }">
	<script type="text/javascript">
		alert("예매는 1인당 1번만 가능합니다.");
		location.href='${pageContext.request.contextPath}/';
	</script>
</c:if>

	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	<form action="${myContextPath}/seat" method="post">
		<input type="hidden" name="task" value="seatOk">
		<input type="hidden" name="movieNum" value="${testVO.movieNum }">
			<div class="front">SCREEN</div>
		<table>
			<tr bgcolor="#C3C3C3">
				<td align="center"><b>예매 인원 : </b><select name="count">
						<option value="0" selected="selected">------인원선택------</option>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
				</select>
				</td>
			</tr>

			<tr>
				<td align="center">
				<br>
					<ul id="ul">
						<c:forEach var="i" begin="0" end="19">
							<c:choose>
								<c:when test="${testVO.seats[i] != '0'}">
									<li id="li"><input type="checkbox" class="reserved" id="seat_${i+1}" name="seat"
										value="${i+1}" checked="checked" disabled="disabled">
										<input name="seat2" type="hidden"  value="${i+1}"/>
										<label
										for="seat_${i+1}">${i+1}</label></li>
								</c:when>
								<c:otherwise>
									<li id="li"><input type="checkbox" id="seat_${i+1}" name="seat"
										value="${i+1}"><label for="seat_${i+1}">${i+1}</label>
									</li id="li">
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</ul>
					<div align="center">
						<label class = "empty">선택가능</label>
						<label class = "book">선택완료</label>
						<label class = "full">선택불가</label>
					</div>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="checked" value="예약">
					<a href='javascript:history.go(-1)'><input type="button" value="뒤로"></a>
				</td>
			</tr>

		</table>
	</form>
	</center>
	<pre>
	
	
	
	
	</pre>
	<%@include file="footer.jsp"%>
</body>
</html>