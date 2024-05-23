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
</style>
</head>
<body>
		
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="container">
	
		
		<div style="text-align : center;
					padding : 20px;
					margin : 20px;"> 
			<h2>주문서 작성 페이지</h2>
		</div>
		
		
		<div class="basic-border">

			<label> ▶  회원 정보 </label>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Level</span>
				</div>
				<input type="text" class="form-control" value="${ sessionScope.loginMember.memLevel } 등급 회원입니다." readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">Point</span>
				</div>
				<input type="text" class="form-control" value="보유 포인트는 ${ sessionScope.loginMember.memberPoint } 입니다." readonly>
			</div>
			
		</div>

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
		
		<div class="delivery-form basic-border">
			
			<label>▶ 배송지 정보</label>

			<form>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">받으시는 분</span>
					</div>
					<input type="text" class="form-control" placeholder="성함을 입력해주세요." required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">휴대폰</span>
					</div>
					<input type="text" class="form-control" placeholder="휴대폰 번호를 - 없이 입력해주세요." required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">이메일</span>
					</div>
					<input type="text" class="form-control" placeholder="이메일을 입력해주세요." required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">배송 메세지</span>
					</div>
					<input type="text" class="form-control" placeholder="배송시 전달 사항을 입력해주세요.">
				</div>
				<div class="address-div">
				
					<label>▶ 배송지 주소</label>
	
					<br>

					<input type="button" 
						   class="btn btn-primary mb-2" 
						   onclick="execDaumPostcode()" 
						   value="주소 찾기">

					<input type="text" 
						   class="form-control d-inline" 
						   style="width: 100%;" 
						   id="roadAddress" 
						   name="address" 
						   placeholder="도로명주소" readonly required>
						   
					<input type="text" 
						   class="form-control mt-2 d-inline detail" 
						   onkeyup="reqDetailAddr();"
						   style="width: 100%; display: inline-block;" 
						   id="detailAddress" 
						   name="addrDetail" 
						   placeholder="상세주소" required>
						   
				</div>
	
			</form>
			</div>
			
			<div class="total-price basic-border">
				
				<div>포인트 사용 여부</div>
				
				<table class="table">
					<thead>
						<tr>
							<th>제품 금액</th>
							<th>부가 결제 금액</th>
							<th>총 결제 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><fmt:formatNumber value="${ item.price }" type="number" />원</td>
							<td>0 원</td>
							<td><fmt:formatNumber value="${ item.price }" type="number" />원</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			
			<div class="total-price basic-border">
				<button type="button" class="btn btn-primary">
					결제하기
				</button>
			</div>	
		</div>
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/goty/resources/member/Js/regExp.js"></script>

	<script>

	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: data => {
	              
	                var roadAddr = data.roadAddress; 
	                var extraRoadAddr = ''; 

	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                
	                document.getElementById("roadAddress").value = roadAddr;
	
	                var guideTextBox = document.getElementById("guide");
	                
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';	
	                }
	            }
	        }).open();
	    }

	</script>
</body>
</html>