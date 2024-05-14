<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayStation</title>
<style>

	#main-image{
		width : 1140px;
		height : 350px;
		align-content : center;
		margin-left : 5%;
	}
	
	#main-image > img {
		width : 43%;
		height : 90%;
	}
	
	#category {
		display: flex; 
		justify-content: center;
		border-top : 1px solid black;
		padding : 10px;
	}
	
	#category > button {
		width : 150px;
	}
	  
	#item-list {
		border-top : 1px solid black;
	}
	
</style>
</head>
<body>

	<jsp:include page="menubar.jsp"/>
	
	<div class="container">
		<div id="main-image">
            <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2023-10/11/full/1697008191-1052.jpg" alt="">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSflhAeT7bya-4E5n-vQY3MOadJ6OTe6jtnm03CJkJfjQ&s" alt="">
	    </div>
	</div>
	
</body>
</html>