<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nintendo 게임기</title>
<style>
   #item-list {
	border-top : 1px solid black;
	height : 1000px;
   }

   .items{
	width : 250px;
	float : left;
	margin-top : 25px;
	margin-left : 20px;
    height : 250px;
	border : 1px solid black;
	border-radius : 10px;
    
   }

   .items > img{
	width : 245px;
	padding : 10px;
	margin-left : 2px;
   }
   .items > p{
	width : 235px;
	margin : 10px;
   }
   
   .price{
   	border-top : 1px solid black;
   }
</style>
</head>
<body>

	<jsp:include page="../../common/nintendo.jsp"/>

    <div id="item-list" class="container"> 
        <div class="items">
            <img src="https://blog.krafton.com/wp-content/uploads/2020/04/GameOn_healing_01.png" alt=""/>
            <p>상품 이름 / 설명 란</p>
			<p class="price">가격란</p>
        </div>
        
        <div class="items">
            <img src="https://blog.krafton.com/wp-content/uploads/2020/04/GameOn_healing_01.png" alt=""/>
            <p>상품 이름 / 설명 란</p>
			<p class="price">가격란</p>
        </div>
        
    </div>


</body>
</html>