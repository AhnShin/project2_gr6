<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>푸드몰</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
img {
	border: none;
}
#h1 {
	font-size: 24px;
	color:#006;
	margin-top: 50px;
}
#goods {
	margin-top: 30px;
	width: 67%;
	height: 700px;
	background-color: #EEE; /* 오렌지 F63 */
}
  .good {
	  width:200px;
	  background-color:#EEE; /* 파랑이 69F */
	  padding-top: 10px;
	  margin-top: 10px;
	  margin-left: 10px;
	  float:left;
	  text-align: center;
  }
	.good_img {
		width: 150px;
		height: 150px;
		 margin-top: 10px;
		background-color:#EEE; /* 핑크 F6C */
		margin: 0 auto;
		padding: 1px;
	}
	.add_cart {
		width: 170px;
		height: 30px;
		overflow: hidden;
		 margin-top: 10px;
		 margin-left: 10px;
	}
	.add_cart button {
		margin-left: 10px;
		text-align: center;
		width: 110px;
		height: 22px;
		
	}
	
#cart {
  width: 1000px;
  background-color:#F96;
}
table.basic { 
  width:100%; 
  line-height:21px; 
  border-top: 1px solid #cccccc; 
  border-left: 1px solid #cccccc; 
  border-collapse: collapse; 
} 
table.basic th, table.basic td { 
  color:#678197; 
  text-align:center; 
  border-right: 1px solid #cccccc; 
  border-bottom: 1px solid #cccccc; 
  padding: 3px 0; 
  text-align:center; 
} 
table.basic th { 
  background-color: #eeeeee; 
} 
table.basic tr {
  background-color:#FFF;
}
table.basic tr:nth-child(odd) {
  background-color:#EEFAFD;
}
</style>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
  var total = 0;
  $('.add_cart > button').click(function(e) {
	var btnName =  $(this).get(0).className;
	var $tagGood;
	
	switch (btnName) {
		case "btn_add1":
			alert("버튼1");
			$tagGood = $('<tr align="center" class="good1"></tr>')
// 			.append('<td>$('#priceSpan').${f.name}</td>')
			.append('<td>왜안돼여???</td>')
			.append('<td>3</td>')
			.append('<td>35000</td>')
			.append('<td><button type="button" title="삭제" class="btn_del">삭제</button></td>');
			
			total = total + $('#priceSpan').val();
		break;
		case "btn_add2":
			$tagGood = $('<tr align="center" class="good2"></tr>');
			$tagGood.append('<td><a href="#"><img  src="./images/1.png" width="75" height="75" alt="보라 천사" /></a></td>');
			$tagGood.append('<td>1</td>');
			$tagGood.append('<td>25000원</td>');
			$tagGood.append('<td><button type="button" title="삭제" class="btn_del">삭제</button></td>');
			
			total = total + 25000;
		break;
		case "btn_add3":
			$tagGood = $('<tr align="center" class="good3"></tr>');
			$tagGood.append('<td><a href="#"><img  src="./images/1.png" width="75" height="75" alt="왕창 믹서" /></a></td>');
			$tagGood.append('<td>1</td>');
			$tagGood.append('<td>55000원</td>');
			$tagGood.append('<td><button type="button" title="삭제" class="btn_del">삭제</button></td>');
			
			total = total + 55000;
		break;
		case "btn_add4":
			$tagGood = $('<tr align="center" class="good4"></tr>');
			$tagGood.append('<td><a href="#"><img  src="./images/1.png" width="75" height="75" alt="이티 자전거" /></a></td>');
			$tagGood.append('<td>1</td>');
			$tagGood.append('<td>95000원</td>');
			$tagGood.append('<td><button type="button" title="삭제" class="btn_del">삭제</button></td>');
			
			total = total + 95000;
		break;
	}
	
	$('#cart .basic').append( $tagGood );
	$('#show_total').empty().append( total + "원" );
	
  });
  
  $('.basic').click(function(e) {
	  if (e.target.className == 'btn_del') {
		  var good = $(e.target).parents('tr');
		  switch (good.get(0).className) {
			  case "good1":
				  total = total - $('#priceSpan').html();
			  break;
			  case "good2":
				  total = total - 25000;
			  break;
			  case "good3":
				  total = total - 55000;
			  break;
			  case "good4":
				  total = total - 95000;
			  break;
		  }
		  good.remove();
		  
		  
		  $('#show_total').empty().append( total + "원" );
	  }
  });

  $('#btn_buy').click(function(e) {
	  var sale;
	  if ((100000 <= total) && (total < 200000)) {
		  // 10만원에서 20만원 사이면, 10% 세일
		  sale = total  * 0.9;
		  alert("총금액 10만~20만 사이 10%세일 당첨!");
	  } else if ((200000 <= total) && (total < 300000)) {
		  // 20만원에서 30만원 사이면, 15% 세일
		  sale = total * 0.85;
		  alert("총금액 20만~30만 사이 15%세일 당첨!");
	  } else if (300000 <= total) {
		  // 30만원이상 이면, 30% 세일
		  sale = total * 0.7;
		  alert("총금액 30만 이상 30%세일 당첨!");
	  } else {
		  sale = total;
		  alert("총금액 10만 미만이라 세일이 없어요 ㅠㅠ");
	  }
	  // 세일 금액을 반올림
	  sale = Math.round( sale );
	  
	  alert("총금액 : " + total + "원, 할인된 금액 : " + sale + "원");
  });
});
</script>
</head>
<%@include file="top.jsp"%>
<body>
<!-- 상품 진열대 -->
<!-- banner-->
	<div class="banner-silder">
		<div id="JiSlider" class="jislider">
			<ul>
				<li>
						<div class="w3layouts-banner-top w3layouts-banner-top2">

							<div class="container">
								<div class="agileits-banner-info">
<!-- 									<h3>Best Movie Theater</h3> -->
<!-- 									 <p>With GangNam Movie Center</p> -->
								</div>	
							</div>
						</div>
				</li>
			</ul>
		</div>
      </div>

<center>
			<div class="banner-bottom">
			<div class="container">
			<h2> <span class="fixed_w3"> [</span> GMC FOOD <span class="fixed_w3">]</span> </h2>
			</div>
			</div>

<c:choose>
			<c:when test="${empty fileVOList}">
			<tr>
				<td colspan="4">
					<h1> 저장된 푸드가 없습니다ㅠㅠ </h1> 
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<div id="goods">
				<c:forEach items="${fileVOList}" var="f">
				
			
				<c:if test="${f.food_num%4==1}">
  				  <div class="good" id="goodId+${f.food_num}">
   				     <div class="good_img"><a href="#"><img  src="img/${f.filename}" width="150" height="150" alt="${f.food_num}" /></a></div>
   				     <p><div class="good_name"><br><font size="4"></>${f.name}<br><span id="priceSpan">${f.price}</span></font></div></p>
<%--    				     <div class="add_cart"><button style="height: 30px; width: 120px" type="button" title="장바구니담기" class="btn_add+${f.food_num}">장바구니담기</button></div> --%>
  				  </div>
				</c:if>
<%-- 				<span id="priceId+${f.food_num}"> --%>
				<c:if test="${f.food_num%4==2}">
				<div class="good">
       			 <div class="good_img"><a href="#"><img  src="img/${f.filename}" width="150" height="150" alt="${f.food_num}" /></a></div>
   			    <p><div class="good_name"><br><font size="4"></>${f.name}<br><span id="priceId+${f.food_num}">${f.price}</span></font></div></p>
<!--     		    <div class="add_cart"><button style="height: 30px; width: 120px" type="button" title="장바구니담기" class="btn_add2">장바구니담기</button></div> -->
 			   </div>
				</c:if>
				
				<c:if test="${f.food_num%4==3}">
				 <div class="good">
       			 <div class="good_img"><a href="#"><img  src="img/${f.filename}" width="150" height="150" alt="${f.food_num}" /></a></div>
    		     <p><div class="good_name"><br><font size="4"></>${f.name}<br>${f.price}</font></div></p>
<!--     		    <div class="add_cart"><button style="height: 30px; width: 120px" type="button" title="장바구니담기" class="btn_add3">장바구니담기</button></div> -->
 			   </div>
				</c:if>
				
				<c:if test="${f.food_num%4==0}">
				 <div class="good">
       			 <div class="good_img"><a href="#"><img  src="img/${f.filename}" width="150" height="150" alt="${f.food_num}" /></a></div>
    		   <p><div class="good_name"><br><font size="4"></>${f.name}<br>${f.price}</font></div></p>
<!--     		    <div class="add_cart"><button style="height: 30px; width: 120px" type="button" title="장바구니담기" class="btn_add4" size="20">장바구니담기</button></div> -->
 			   </div>
				</c:if>


				</c:forEach>
				  </div>
			</c:otherwise>
		</c:choose>
	<br>
	</br>
	</div>
	</div>
<!-- ============================================================================== -->

<!-- <h1 id="h1">결제 리스트</h1> -->
<!-- <br> -->
<!-- <div id="cart"> -->
<!--   <table class="basic" border="0" cellspacing="0" cellpadding="0"> -->
<!--     <tr bgcolor="#C8E3FF"> -->
<!--       <th scope="col">상품명</th> -->
<!--       <th scope="col">수량</th> -->
<!--       <th scope="col">합계</th> -->
<!--       <th scope="col">삭제</th> -->
<!--     </tr> -->
   
<!--   </table> -->
<!-- </div> -->

<!-- <!-- 총금액 -->
<!-- <h1 id="h1">총금액</h1> -->
<!-- <br> -->

<!-- <div id="show_total"> -->
<!-- 0원 -->
<!-- </div> -->
<!-- <br> -->
<!-- <div id="buy"> -->
<!-- <p> -->
<!--   <button type="button" title="구매하기" id="btn_buy" class="btn btn-default">구매하기</button></p> -->
<!-- </div> -->
</center>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
<%@include file="footer.jsp"%>
</html>
    