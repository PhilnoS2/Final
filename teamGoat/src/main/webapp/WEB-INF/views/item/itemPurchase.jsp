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
    .basic-border{
		border : 1px solid black;
		margin : 20px; 
		padding : 20px;
	}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>

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
					<tr>
						<td>
							<img src="${ item.imgPath }/${ item.imgName }" />
						</td>
						<td>${ item.itemName }</td>
						<td class="price"><fmt:formatNumber value="${ item.price }" type="number" />원</td>
						<td class="price"><fmt:formatNumber value="${ item.price * 0.01 }" type="number" />원</td>
						<td class="price"><fmt:formatNumber value="${ item.price }" type="number" />원</td>
					</tr>
				
					<tr>
						<td class="price" colspan="5"> Total Price = <fmt:formatNumber value="${ item.price }" type="number" />원 </td>
					</tr>
					
				</tbody>

			</table>

        </div>
        
        <div class="basic-border">

			

        </div>

    </div>
</body>
</html>