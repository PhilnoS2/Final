<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xbox</title>
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
		    <img src="https://assets.xboxservices.com/assets/fc/28/fc283911-f016-42d5-8e51-0dfca7ab5ce1.jpg?n=Shop-Consoles_Content-Placement_Hub_294958693_788x444.jpg" alt="">
		    <img src="https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/Content-Card-Xbox-Game-Pass-Ultimate?wid=834&hei=470&fit=crop" alt="">
	    </div>
    
		<label>▶게임기 본체</label>
		
		<div id="category">
			<button type="button" class="btn btn-light">Nintendo</button>
			<button type="button" class="btn btn-light">PlayStation</button>
			<button type="button" class="btn btn-light">XBOX</button>
		</div>	
		
		<label>▶(수량)ITEMS</label>
		
		<div id="item-list">
			<br><br><br>
		</div>
		
    </div>
    
</body>
</html>