<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X Box</title>
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
		height : 1000px;
  	}

   .items{
	width : 250px;
	float : left;
	margin-top : 25px;
	margin-left : 20px;
	height : 300px;
	border-radius : 10px;
    
   }

   .items > img{
	width : 245px;
	padding : 10px;
	height : 175px;
	margin-left : 2px;
    border-bottom : 1px solid black;
   }

   .items > div{
    border-bottom : 1px solid black;
   }
	
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="container">
	
	 	<div id="main-image">
		    <img src="https://assets.xboxservices.com/assets/fc/28/fc283911-f016-42d5-8e51-0dfca7ab5ce1.jpg?n=Shop-Consoles_Content-Placement_Hub_294958693_788x444.jpg" alt="">
		    <img src="https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/Content-Card-Xbox-Game-Pass-Ultimate?wid=834&hei=470&fit=crop" alt="">
	    </div>
    
		<label>▶ ${  platform } </label>
        <div id="category">
            <a href="xbox.machine?platform=XBox" type="button" class="btn btn-light">XBox 게임기</a>
            <a href="xbox.game?platform=XBox" type="button" class="btn btn-light">XBox 타이틀</a>
            <a href="xbox.accessory?platform=XBox" type="button" class="btn btn-light">XBox 주변기기</a>
        </div>	

        <label>▶[  ${  pageInfo.listCount } ] ITEMS</label>
        <div id="category">

        </div>
        
    </div>
	
	<div id="item-list" class="container"> 
       
		<c:choose>
			<c:when test="${ not empty itemList }">
				<c:forEach items="${ itemList }" var="item">
					<div class="card items">
					<img class="card-img-top" src="${ item.imgPath }/${ item.imgName }" alt="Card image">
						<div class="card-body">
							<h6 class="card-title">${ item.itemName }</h6>
							<p class="card-text">${ item.price }</p>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h2>조회된 결과가 없습니다.</h2>
			</c:otherwise>
		</c:choose>
	        
	</div>
		


</body>
</html>