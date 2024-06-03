<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #container{
		margin-top : 20px;
	}

	.container{
		border : 1px solid black;
		height : auto;
	}
	
	.table{
		text-align : center
	}
	
	.container > label {
		margin-top : 10px;
	}
	
	.price{
		text-align : right;
	}
	
	tr > td > img{
		width : 50px;
		height : 50px;
	}

	.basic-border{
		border : 1px solid black;
		margin : 20px; 
		padding : 20px;
	}

	#payment{
		float:right;
	}

</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>

						<c:set var="total" value="0" />
						<c:set var="add" value="0" />

	<form action="item.result" method="post">
	
		
		<div class="container">	

			<div class="basic-border">

				<table class="table">

					<thead>
						<tr>
							<th>이미지</th>
							<th>제품 이름</th>
							<th class="price">제품 가격</th>
							<th class="price">적립금</th>
							<th class="price">합계</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${ orderList }" var="order">

							<c:set var="total" value="${total + order.price}" />
							<c:set var="addPoint" value="${ add + (order.price * 0.01) }" />

							<tr class="orderList">
								<td><img src="${ order.imgPath }/${ order.imgName }" alt=""/></td>
								<td>${ order.itemName }</td>
								<td class="price"><fmt:formatNumber value="${ order.price }" type="number" />원</td>
								<td class="price"><fmt:formatNumber value="${ order.price * 0.01 }" type="number" />원</td>
								<td class="price"><fmt:formatNumber value="${ order.price }" type="number" />원</td>
							</tr>

						</c:forEach>
							
						<tr>
							<td class="price" colspan="5"> 
								Total Point = <fmt:formatNumber value="${ addPoint }" type="number" /> Point <br>
								Total Price = <fmt:formatNumber value="${ total }" type="number" /> 원 
							</td>

						</tr>

					</tbody>

				</table>
				
			</div>
			
			<input type="hidden" name="memberNo" value="${ sessionScope.loginMember.memberNo }"/>
			<input type="hidden" name="usePoint" value="0"/>
			<input type="hidden" name="addPoint" value="${ addPoint }"/>
			<input type="hidden" name="totalPrice" value="${ total }"/>
			
			<c:forEach items="${ orderList }" var="order">
				<input type="hidden" name="orderNo" value="${ order.orderNo }" />
			</c:forEach>
			
			<div id="payment" class="basic-border">
				<button class="btn btn-success">네이버페이</button>
				<button class="btn btn-warning">카카오페이</button>
				<button type="submit" class="btn btn-primary normalPay"> 결제하기  </button>
			</div>

		
    	</div>
    	
	</form>

</body>
</html>