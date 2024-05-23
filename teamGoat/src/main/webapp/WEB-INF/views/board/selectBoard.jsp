<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#wrapper-div{
	width: 1200px;
	height: 1000px;
	margin: auto;
}
.wrapper-div-title {
	width: 60%;
	height: 100px;
	margin: auto;
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid grey;
	box-sizing: border-box;
}
.wrapper-div-title div{
	display:inline-block;
	width:30%;
}
#title-div-2 {
	display:flex;
	align-items:center; 
	justify-content: space-evenly;
}
.wrapper-div-title2 {
	width: 60%;
	margin: auto;
	margin-top: 10px;
}
#content-div {
	width: 100%;
	height: 400px;
	padding : 10px;
	border : 1px solid grey;
	border-radius: 10px;
}
#content-div-boardcontent {
	width:100%;
	height: 150px;
	margin-top: 20px;
	padding: 10px;
}
#review-area {
	width: 720px;
	height: 400px;
	margin: auto;
	padding : 10px;
	border : 1px solid grey;
	border-radius: 10px;
}
#btn-div a {
	margin: 3px;
}

.review-div {
	width: 70%;
	margin: auto;
 	margin-bottom: 10px;
}


</style>
<title>selectBoard</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		
		<div class="wrapper-div-title"> 
			<div>	
				<label class="mr-2" for="boardTitle">제목</label>
				<h4>${ board.boardTitle }</h4>
			</div>
			<div id="title-div-2">
				<div>
					<label>카테고리</label>
					<h6>${ board.platformName }</h6>
				</div>
				<div>
					<label >글쓴이</label>
					<h6>${ board.nickname }</h6>
				</div>
				<c:if test="${ sessionScope.loginMember.memberNo == board.memberNo }">
					<div id="btn-div">
						<a class="btn btn-sm btn-warning" href="/goty/freeboards/update/${ boardNo }">수정</a>
						<a class="btn btn-sm btn-danger" href="#">삭제</a>
					</div>
				</c:if>
			</div>
		</div>
		
		<div class="wrapper-div-title2">
			<div>
				<div style="border-bottom: 1px solid grey; width: 50%;">
					<label for="boardContent" >본문</label>
				</div>
				<br/>
				<div id="content-div" class="shadow p-4 mb-4 bg-white">
					<c:choose>
						<c:when test="${ board.imagePath eq null }">
							<div>
								<img src="/goty/resources/img/logo2.png" width="300px" height="200px;" />
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img src="/goty/${ board.imagePath }" width="300px" height="200px;" />
							</div>
						</c:otherwise>
					
					</c:choose>
					<div id="content-div-boardcontent">
						<p>${ board.boardContent }</p>
					</div>
				</div>
			</div>
		</div>
		
		<div id="review-area">
			<p class="m-3">리뷰</p>
			<c:choose>
				<c:when test="${ sessionScope.loginMember ne null  }">
					<div class="review-div" class="form-group">
						<textarea class="form-control" rows="3" placeholder="리뷰를 입력해주세요."></textarea>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="review-div" class="form-group">
						<textarea class="form-control" rows="3" placeholder="리뷰를 입력하려면 로그인해야 합니다." readonly></textarea>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${ not empty board.replies }">
					<c:forEach items="${ board.replies }" var="reply">
						<div class="shadow p-4 mb-4 bg-white border border-warning rounded-lg">
							<p>${ reply.reviewContent }</p>
							작성자<h5 style="display: inline-block;">${ reply.reviewWriter }</h5>
						</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div class="mx-auto" style="width:50%;">
						<h3>리뷰가 존재하지 않습니다.</h3>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>