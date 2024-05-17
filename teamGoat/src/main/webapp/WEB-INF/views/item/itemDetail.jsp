<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<style>

	.container > div{
		width : 45%;
		display : inline-block;
		margin-top : 30px;
	}
	.detail-img > img{
		width : 495px;
	}
	.detail-img{
		float : left;
		margin-left : 30px;
	}
	.detail{
		float : right;
		margin-right : 30px;
	}
	.detail-purchase{
		text-align: center;

	}
	
	.detail-item > p{
		margin : 30px;
	}



	
		
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="container">
	
		<div class="detail-img card">
			<img class="card-img-top" src="${ item.imgPath }/${ item.imgName }" alt=""/>
		</div>
		
		<div class="detail card">

			<div class="detail-item">

				<p class="item name">${ item.itemName }</p>

				<p class="item price">가격 : <fmt:formatNumber value="${item.price}" type="number" />원</p>

				<p class="item price">적립금 : <fmt:formatNumber value="${ item.price * 0.01  }" type="number" />원</p>

				<p class="item developer">제조사 : ${ item.developer }</p>

				<p class="item publisher">배포사 : ${ item.publisher }</p>

				<p class="item platformName">플랫폼 : ${ item.platformName }</p>

			</div>

			<div class="detail-purchase">
				<a href="" class="btn btn-dark btn-lg">구매하기</a> 
				<a href="" class="btn btn-light btn-lg">장바구니</a>
			</div>

		</div>
		
		
	</div>
	
</body>
</html>