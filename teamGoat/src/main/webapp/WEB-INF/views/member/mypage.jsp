<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#wrapper-div{
		width: 1200px;
		height: 600px;
		margin: auto;
		border: 1px solid red;
	}
	#left-side{
		width:30%;
		height: 100%;
		border: 1px solid red;
		display: inline-block;
		float:left;
	}
	#right-side{
		width:70%;
		height: 100%;
		border: 1px solid red;
		display: inline-block;
	}
</style>
<title>myPage</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="left-side">
			<div>
				<h3>개인정보보기</h3>
			</div>
			<div>
				<a href="#" >구매 내역</a>
				<a href="#" >문의 내역</a>
				<a href="#" >장바구니 목록</a>
				<a href="#" >내 정보 수정</a>
			</div>
		</div>
		<div id="right-side"></div>
	</div>
</body>
</html>