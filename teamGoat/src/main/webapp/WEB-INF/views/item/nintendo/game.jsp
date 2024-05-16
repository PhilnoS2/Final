<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nintendo 타이틀</title>
</head>
<body>

	<jsp:include page="../../common/nintendo.jsp"/>

    <jsp:include page="../../common/nintendo.jsp"/>

    
    <div id="item-list" class="container"> 
        
    	<c:choose>
    		<c:when test="${ not empty itemList }">
	    		<c:forEach items="${ itemList }" var="item">
                    <div class="card items">
                        <img class="card-img-top" src="${ item.imgPath }/${ item.imgName }" alt="Card image">
                        <div class="card-body">
                            <h5 class="card-title">${ item.itemName }</h5>
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