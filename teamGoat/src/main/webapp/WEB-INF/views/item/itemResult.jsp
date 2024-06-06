<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
    .table-hover{
	  	width : 1150px;
	  	text-align: center;
	  	vertical-align : middle;
	}
	
	.table > tr > th{
		height: 50px;
	}
	
	.cart-img{
		width : 70px;
		height : 50px;
	}
	
	.cart-price{
		text-align : right;
	}

	.basic-border{
		border : 1px solid black;
		margin : 20px; 
		padding : 20px;
	}
	
	#result{
		border-bottom : 1px solid;
		padding-bottom : 20px;
	}
	
	.container > div {
		text-align : center;
	}

</style>
</head>

<body>
	
	<jsp:include page="../common/menubar.jsp" />
    
	<div class="container">

		<div class="basic-border">

			<h2 id="result">결제가 완료되었습니다.</h2>
			
			<div class="basic-border">
			
				<p> 구매자 정보 </p>
			
				<p>구매 번호 - ${ purchase.purchaseNo }</p>
				<p>구매자 이름 - ${ purchase.memberName }</p>
				<p>구매 일자 - ${ purchase.purchaseDate }</p>
				<p>구매 가격 - <fmt:formatNumber value="${ purchase.totalPrice }" type="number" />원</p>
				
			</div>
			
			<button id="toCart" class="btn btn-primary">장바구니</button>
			<button id="home" class="btn btn-secondary">홈으로</button>

		</div>

	</div>


	<script>

		$(()=> {

			$('#home').click(() => {
				location.href="/goty";
			})

		});
		
		$(()=> {

			$('#toCart').click(() => {
				location.href="cart?memberNo=${sessionScope.loginMember.memberNo}";
			})

		});

	</script>

</body>
</html>