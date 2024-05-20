<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
	
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="container">
	
		<table class="table table-hover">
			<thead>
				<tr>
					<th>제품 사진</th>
					<th>제품 이름</th>
					<th class="cart-price">제품 가격</th>
					<th class="cart-price">적립금</th>
					<th>버튼</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${ not empty itemList }">
						<c:forEach items="${ itemList }" var="item">
							<tr style=>
								<td class="cart-detail">
									<img class="cart-img" src="${ item.imgPath }/${ item.imgName }">
								</td>
								<td class="cart-detail">
									${ item.itemName }
								</td>
								<td class="cart-detail cart-price">
									<fmt:formatNumber value="${ item.price }" type="number" /> 원
								</td>
								<td class="cart-detail cart-price">
									<fmt:formatNumber value="${ item.price * 0.01  }" type="number" /> 원
								</td>
								<td class="cart-detail">
									<a href="" class="btn btn-sm btn-outline-success" >주문하기</a> <br>
									<a class="btn btn-sm btn-outline-danger deleteCart" >
										<input type="hidden" value="${ pageScope.item.itemNo }" />
										<input type="hidden" value="${ sessionScope.loginMember.memberNo }" />
										삭제하기
									</a>
								</td>
							</tr>	
							<c:set var="total" />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<script>
		
		$(() => {
			
			$('.deleteCart').click((e) => {
				//console.log($(e.currentTarget).children()[0].defaultValue);
				location.href = 
					  'delete.cart?itemNo=' 
					+ $(e.currentTarget).children()[0].defaultValue 
					+ '&memberNo=' 
					+ $(e.currentTarget).children()[1].defaultValue
				
			});
			
		})
	
	</script>
</body>
</html>