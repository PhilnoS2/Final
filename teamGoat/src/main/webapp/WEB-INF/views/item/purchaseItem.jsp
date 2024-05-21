<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<style>

	.container{
		border : 1px solid black;
		height : 1000px;
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
	
	
	
	
</style>
</head>
<body>
		
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="container">
	
		<label> ▶ 주문서 작성 페이지 </label><br>
		
		
		<label> ▶  회원 정보 </label>
		
		<div class="information"> - ${ sessionScope.loginMember.nickname }의 등급은 ${ sessionScope.loginMember.memLevel } </div>
		<div class="information"> - 보유 포인트는 ${ sessionScope.loginMember.memberPoint }</div>
		
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
				<tr>
					<td>1</td>
					<td>2</td>
					<td class="price">3</td>
					<td class="price">4</td>
					<td class="price">5</td>
				</tr>
				
				<tr>
					<td class="price" colspan="5"> Total Price = 100,000원 </td>
				</tr>
			</tbody>


		</table>


	</div>
		
</body>
</html>