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
	height: auto;
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
	height: auto;
	margin: auto;
	margin-bottom: 20px;
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
 	display: flex;
 	align-items: center;
 	justify-content: space-between;
}

#review-content {
	width: 50%;
	margin: 0px;
	display: inline-block;
}
#review-writer {
	margin: 0px;
	display: inline-block;
	float: right;
	font-weight: bold;
}

#review-area-div {
	width: 80%;
}
#reveiw-btn-div {
	width: 15%;
	margin-top: auto;
}
#reviewArea {
	resize: none;
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
					<div class="form-group w-75 mx-auto d-flex justify-content-between">
						<div id="review-area-div">
							<textarea id="reviewArea" class="form-control mb-1" rows="3"
						  	 placeholder="댓글을 입력해주세요."></textarea>
						  </div>
						  <div id="reveiw-btn-div">
						 	<button class="btn btn-sm btn-dark " onclick="insertReview();">댓글등록</button>
						 </div>
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
						<div class="w-75 p-2 shadow mx-auto mb-2 bg-white border border-warning rounded-lg">
							<div class="d-flex p-1 m-1 justify-content-between">
								<p class="mb-0 w-25 inline">${ reply.createDate }</p>
								<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#myModal">신고</button>
							</div>
							<p id="review-content" class="pl-2">${ reply.reviewContent }</p>
							<h5 id="review-writer">${ reply.reviewWriter }</h5>
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
	
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
         <div>
         	<h3>신고 사유</h3>
			<select class="form-group">
				<option>욕설 및 비방</option>
				<option>그냥</option>
				<option>기타</option>
			</select>
			<input class="" name="" vlaue="" placeholder="신고 사유를 적어주세요." />
         </div>
        </div>


        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	
	
	
	
	
	
	<script>
	
	function insertReview() {
	
		const data = 
			{
				'freeBoardNo': '${ board.freeBoardNo }',
				'memberNo': '${ sessionScope.loginMember.memberNo }',
				'reviewContent': $('#reviewArea').val()
			};
		
		$.ajax({
			url: '/goty/freeboards/review',
			type: 'post',
			data: JSON.stringify(data),
			dataType:'json',
			contentType : 'application/json; charset=utf-8',
			success: (result) => {
				console.log(result);
					if(result != null){
						alert(result.data);
						location.href=window.location.href;
					}
			}
			
		});
	}
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>