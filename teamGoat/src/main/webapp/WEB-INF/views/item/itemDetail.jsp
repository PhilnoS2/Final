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
		padding-top : 60px;
		padding-bottom : 30px;
	}
	.detail{
		float : right;
		margin-right : 30px;
	}
	.detail-purchase{
		text-align: center;
		padding : 40px;
	}
	
	.detail-item > p{
		padding-top: 40px;
		padding-left: 40px;
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
				<c:choose>
					<c:when test="${ not empty sessionScope.loginMember }">
						<a href="purchase" class="btn btn-dark btn-lg">구매하기</a>
						<a href="insert.cart?itemNo=${ requestScope.item.itemNo }&memberNo=${ sessionScope.loginMember.memberNo }" class="btn btn-light btn-lg">장바구니</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-info btn-md" href="/goty/member/login?reqUri=detail.item?itemNo=${item.itemNo}">구매를 위해서는 로그인해주세요.</a>
					</c:otherwise>
				</c:choose>
			</div>
					
		</div>
		
		
	</div>
	
</body>
</html>