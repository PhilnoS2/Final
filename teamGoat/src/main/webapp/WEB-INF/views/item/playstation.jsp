<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2023-10/11/full/1697008191-1052.jpg" alt="">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSflhAeT7bya-4E5n-vQY3MOadJ6OTe6jtnm03CJkJfjQ&s" alt="">
	    </div>
	    
		<label>▶ ${  platform } </label>
        <div id="category">
            <a href="playstation.machine?platform=PlayStation" type="button" class="btn btn-light">PlayStation 게임기</a>
            <a href="playstation.game?platform=PlayStation" type="button" class="btn btn-light">PlayStation 타이틀</a>
            <a href="playstation.accessory?platform=PlayStation" type="button" class="btn btn-light">PlayStation 주변기기</a>
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
					<input type="hidden" value="${ item.itemNo }" />
					<img class="card-img-top" src="${ item.imgPath }/${ item.imgName }" alt="Item Image">
						<div class="card-body">
							<h6 class="card-title">${ item.itemName }</h6>
							<p class="card-text"> <fmt:formatNumber value="${ item.price }" type="number" /> 원 </p>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h2>조회된 결과가 없습니다.</h2>
			</c:otherwise>
		</c:choose>
	        
	</div>
	
	<script>
		
		$(() => {
			
			$('.items').click((e) => {
				
				location.href = 'detail.item?platformNo=1&itemNo=' + $(e.currentTarget).children().eq(0)[0].value;
					
			})
			
		});
		
	</script>


</body>
</html>