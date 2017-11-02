<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ȭ��</title>
<style>
body {
	margin-top: 20px;
	margin-left: 30px;
	font-family: ���� ���, ����, ����;
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
	font-size: 8pt font-family:���� ���, ����, ����;
	height: 18px
}

option {
	border: #cccccc solid 1px;
	font-family: ����, ����;
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
							$('font[name=check]').html("��ȣ�� ��ġ�մϴ�");
						} else {
							$('font[name=check]').html("��ȣ�� ��ġ���� �ʽ��ϴ�");
						}

					} else {
						$('font[name=check]').html("4�� �̻�~12�� ���Ϸ� �Է��ϼ���");
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
					alert('���̵� �ߺ��˻� ����');
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
				$('#pwMsg').html('<b>��й�ȣ�� ��ġ�մϴ�.</b>');
				$('#pwMsg').css('color', 'lime');
			} else {
				$('#pwMsg').html('<b>��й�ȣ �Է¿���</b>');
				$('#pwMsg').css('color', 'red');
			}
		})
		
		$('#sub').click(function() {
			if ($('input[name=name]').val().length == 0) {
				alert("�̸��� �Է��ϼ���");
				return false;
			} else if ($('input[name=id]').val().length == 0) {
				alert("���̵� �Է��ϼ���");
				return false;
			} else if ($('input[name=pw]').val().length == 0) {
				alert("�н������� �Է��ϼ���");
				return false;
			} else if ($('input[name=memPwdChk]').val().length == 0) {
				alert("�н����� Ȯ�ζ��� �Է��ϼ���");
				return false;
			} else if ($('input[name=phone]').val().length != 11) {
				alert("11�ڸ� �ڵ�����ȣ�� �Է��ϼ���");
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
	<h2>ȸ������</h2>
	<font color="red">*</font>
	<font> �� �ʼ��Է� �׸��Դϴ�</font>
	<basefont size=8>
	<table width="940">
		<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
		<form class="joinForm" action="${myContextPath}/member" method="post">
			<input type="hidden" name="task" value="join">
			<!---------------------�������------------------>

			<hr color="#9FC93C">
			<!--���̺� ���� -->
			<table width="550" style="padding: 5px 0 5px 0;">
				<tr>
					<th>�̸�<font color="red">*</font></th>
					<td><input type="text" name="name" size="5"></td>
				</tr>

				<tr>
					<th>�ֹε�Ϲ�ȣ</th>
					<td><input type="text" name="jumin_1" size="5"> - <input
						type="password" name="jumin_2" size="5"></td>
				</tr>

				<tr>
					<th>���̵�<font color="red">*</font>
					</th>
					<td><input type="text" name="id" id="id" size="7">
						(����/���� 6�� �̻�) <input type="button" id="checkId" value="�ߺ�üũ">
						<span id="checkIdComplete"></span></td>
				</tr>

				<tr>
					<th>��й�ȣ<font color="red">*</font></th>

					<td><input type="password" name="pw" size="7"> <br>
						<font class="s">��й�ȣ�� 4�ڸ��̻� 12�ڸ����Ϸ� �Է�</font></td>
					<!-- ��й�ȣ ���ڿ� ���� ȥ�ջ�� üũ....? -��-a -->
				</tr>

				<tr>
					<th>��ȣȮ��<font color="red">*</font></th>
					<td><input type="password" name="memPwdChk" size="7">&nbsp;&nbsp;
						<font name="check" size="2" color="red"></font></td>
				</tr>
				<tr>
					<th>�̸���</th>
					<td><input type="text" name="email" size="7"> @ <input
						type="text" name="email_dns" size="7"> <select
						name="emailaddr">
							<option value="">�����Է�</option>
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
					<th>����ó<font color="red">*</font></th>
					<td><input type="text" name="phone" size="10"></td>
				</tr>
				<tr>
					<th>����/SMS ��������</th>
					<td class="s"><input type="radio" name="chk_mail" checked>
						���� <input type="radio" name="chk_mail" value="4"> ���Űź�</td>
				</tr>

				<tr>
					<th>�����帣(�ߺ����ð���)</th>
					<td><input type="checkbox" name="interest[]" value="17">�׼�
						<input type="checkbox" name="interest[]" value="18">������ <input
						type="checkbox" name="interest[]" value="19">���� <input
						type="checkbox" name="interest[]" value="20">�θǽ� <input
						type="checkbox" name="interest[]" value="21">�ڹ̵� <input
						type="checkbox" name="interest[]" value="22">��Ÿ</td>
				</tr>
			</table>
			</center>
			<center>
				<hr color="#9FC93C">

				<!-- 				<input type="submit" value="�ۼ��Ϸ�"> -->
<!-- 				<input type="submit" name="sub" value="�ۼ��Ϸ�"> -->
				<input type="button" value="���" id="sub">
<!-- 				<button name="sub" onClick="memChk()">�ۼ��Ϸ�</button> -->
		</form>
		</center>
	<pre>





</pre>
<%@include file="footer.jsp"%>
</body>
</html>