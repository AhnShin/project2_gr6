<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 화면</title>
<style>
body {
	margin-top: 20px;
	margin-left: 30px;
	font-family: 맑은 고딕, 돋움, 굴림;
	color: #888888;
	font-size: 8pt;
}

table {
	border-collapse: collapse;
	font-size: 9pt;
	margin-left: 0;
}

img {
	border: none;
}

select {
	font-size: 8pt font-family:맑은 고딕, 돋움, 굴림;
	height: 18px
}

option {
	border: #cccccc solid 1px;
	font-family: 돋움, 굴림;
	color: #888888;
	font-size: 8px;
}

input {
	height: 18px;
}
input[type=button] {
	height: 25px;
}

th, td {
	padding-left: 20px;
	text-align: left;
	background-image: url(images/member/dot.gif);
	background-repeat: no-repeat;
	background-position: left;
	border-bottom: #eeeeee solid 1px;
}
#sub {
	font-size: 15px;
}

#pink_line {
	margin-left: "0";
}

#member_button {
	margin-top: 10px;
	text-align: center;
}

#mbname, #mbid, #mbpw, #mbpw2, #email_dns, #mbpw3 {
	width: 150px;
	height: 18px;
}

#mbjumin_1, #mbjumin_2, #zip_h_1, #zip_h_2 {
	width: 68px;
	height: 18px;
}

#addr_h1 {
	width: 350px;
	height: 18px;
}

#addr_h2 {
	width: 700px;
	height: 18px;
}

#mbpw2 {
	width: 200px;
	height: 18px;
}

#cel1, #tel_h2_1, #tel_h2_2 {
	width: 68px;
}

#tel_h1 {
	width: 55px;
}
C
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$($('input[name=memPwdChk]')).keyup(
				function() {
					if ($('input[name=pw]').val().length >= 4
							&& $('input[name=pw]').val().length <= 12) {

						if ($('input[name=pw]').val() == $(
								'input[name=memPwdChk]').val()) {
							$('font[name=check]').html("암호가 일치합니다");
						} else {
							$('font[name=check]').html("암호가 일치하지 않습니다");
						}

					} else {
						$('font[name=check]').html("4자 이상~12자 이하로 입력하세요");
					}

				})

		$('#checkId').click(function() {
			var keyword = $('#id').val();

			$.ajax({
				type : 'post',
				url : 'member',
				data : 'keyword=' + keyword,
				dataType : 'json',
				success : function(resultData) {

					var idData = resultData

					$('#checkIdComplete').html(idData);
				},
				error : function() {
					alert('아이디 중복검사 실패');
				}

			})

		})

		$('#pw').keyup(function() {
			$('#pwMsg').text('');
		})

		$('#pwConfirm').keyup(function() {
			var pw = $('#pw').val();
			var pwConfirm = $(this).val();

			if (pw == pwConfirm) {
				$('#pwMsg').html('<b>비밀번호가 일치합니다.</b>');
				$('#pwMsg').css('color', 'lime');
			} else {
				$('#pwMsg').html('<b>비밀번호 입력오류</b>');
				$('#pwMsg').css('color', 'red');
			}
		})
		
		$('#sub').click(function() {
			if ($('input[name=name]').val().length == 0) {
				alert("이름를 입력하세요");
				return false;
			} else if ($('input[name=id]').val().length == 0) {
				alert("아이디를 입력하세요");
				return false;
			} else if ($('input[name=pw]').val().length == 0) {
				alert("패스워드을 입력하세요");
				return false;
			} else if ($('input[name=memPwdChk]').val().length == 0) {
				alert("패스워드 확인란을 입력하세요");
				return false;
			} else if ($('input[name=phone]').val().length != 11) {
				alert("11자리 핸드폰번호를 입력하세요");
				return false;
			} else {
				$('.joinForm').submit();
			}
		})
	})
	
	
	
</script>
</head>

<body>
<%@include file="top.jsp"%>
<pre>





</pre>
	<p align="center">
		<img src="sign_up.png">
	</p>
	<center>
	<h2>회원가입</h2>
	<font color="red">*</font>
	<font> 은 필수입력 항목입니다</font>
	<basefont size=8>
	<table width="940">
		<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
		<form class="joinForm" action="${myContextPath}/member" method="post">
			<input type="hidden" name="task" value="join">
			<!---------------------내용시작------------------>

			<hr color="#9FC93C">
			<!--테이블 시작 -->
			<table width="550" style="padding: 5px 0 5px 0;">
				<tr>
					<th>이름<font color="red">*</font></th>
					<td><input type="text" name="name" size="5"></td>
				</tr>

				<tr>
					<th>주민등록번호</th>
					<td><input type="text" name="jumin_1" size="5"> - <input
						type="password" name="jumin_2" size="5"></td>
				</tr>

				<tr>
					<th>아이디<font color="red">*</font>
					</th>
					<td><input type="text" name="id" id="id" size="7">
						(영문/숫자 6자 이상) <input type="button" id="checkId" value="중복체크">
						<span id="checkIdComplete"></span></td>
				</tr>

				<tr>
					<th>비밀번호<font color="red">*</font></th>

					<td><input type="password" name="pw" size="7"> <br>
						<font class="s">비밀번호는 4자리이상 12자리이하로 입력</font></td>
					<!-- 비밀번호 문자와 숫자 혼합사용 체크....? -ㅅ-a -->
				</tr>

				<tr>
					<th>암호확인<font color="red">*</font></th>
					<td><input type="password" name="memPwdChk" size="7">&nbsp;&nbsp;
						<font name="check" size="2" color="red"></font></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" size="7"> @ <input
						type="text" name="email_dns" size="7"> <select
						name="emailaddr">
							<option value="">직접입력</option>
							<option value="daum.net">daum.net</option>
							<option value="empal.com">empal.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="msn.com">msn.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
					</select></td>
				</tr>
				<tr>
					<th>연락처<font color="red">*</font></th>
					<td><input type="text" name="phone" size="10"></td>
				</tr>
				<tr>
					<th>메일/SMS 정보수신</th>
					<td class="s"><input type="radio" name="chk_mail" checked>
						수신 <input type="radio" name="chk_mail" value="4"> 수신거부</td>
				</tr>

				<tr>
					<th>관심장르(중복선택가능)</th>
					<td><input type="checkbox" name="interest[]" value="17">액션
						<input type="checkbox" name="interest[]" value="18">스릴러 <input
						type="checkbox" name="interest[]" value="19">모험 <input
						type="checkbox" name="interest[]" value="20">로맨스 <input
						type="checkbox" name="interest[]" value="21">코미디 <input
						type="checkbox" name="interest[]" value="22">기타</td>
				</tr>
			</table>
			</center>
			<center>
				<hr color="#9FC93C">

				<!-- 				<input type="submit" value="작성완료"> -->
<!-- 				<input type="submit" name="sub" value="작성완료"> -->
				<input type="button" value="등록" id="sub">
<!-- 				<button name="sub" onClick="memChk()">작성완료</button> -->
		</form>
		</center>
	<pre>





</pre>
<%@include file="footer.jsp"%>
</body>
</html>