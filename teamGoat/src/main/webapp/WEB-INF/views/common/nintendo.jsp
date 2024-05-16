<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nintendo</title>
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
            <img src="https://cdn.tgdaily.co.kr/news/photo/202402/330877_105556_5424.png" alt="">
            <img src="https://cdn.gameple.co.kr/news/photo/202309/207054_217125_517.jpg" alt="">
        </div>

		<label>▶게임기 본체</label>
		
		<div id="category">
			<a href="nintendoMachine" type="button" class="btn btn-light">Nintendo 게임기</a>
			<a href="nintendoGame" type="button" class="btn btn-light">Nintendo 타이틀</a>
			<a href="nintendoAccessory" type="button" class="btn btn-light">Nintendo 주변기기</a>
		</div>	
    </div>
    
</body>
</html>