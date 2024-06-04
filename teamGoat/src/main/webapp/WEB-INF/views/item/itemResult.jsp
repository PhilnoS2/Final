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

</style>
</head>

<body>
    
	<div class="container">

		<div class="basic-border">

			${ purchaseNo }

		</div>

		<div class="basic-border">

			${ purchaseNo }

		</div>

	</div>

	<script>


	</script>

</body>
</html>