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
	.table-striped{
	  	width : 1100px;
	  	text-align: center;
	}
	
	th{
		height: 100px;
	}
	
	td{
		height : 100px;
	}
	
	.cart-img{
		width : 140px;
		height : 95px;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="container">
	
		<table class="table-striped">
			<thead>
				<tr>
					<th>제품 사진</th>
					<th>제품 이름</th>
					<th>제품 가격</th>
					<th>적립금</th>
					<th>버튼</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${ not empty itemList }">
						<c:forEach items="${ itemList }" var="item">
							<tr>
								<td><img class="cart-img" src="${ item.imgPath }/${ item.imgName }" alt="Item Image"></td>
								<td>${ item.itemName }</td>
								<td><fmt:formatNumber value="${ item.price }" type="number" /> 원</td>
								<td><fmt:formatNumber value="${ item.price * 0.01  }" type="number" />원</td>
								<td>
									<a href="" class="btn btn-sm btn-outline-success" >주문하기</a>
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
						<h2>장바구니에 담긴 상품이 없습니다.</h2>
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