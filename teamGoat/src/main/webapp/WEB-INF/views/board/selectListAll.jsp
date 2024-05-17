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
	height: 800px;
	margin: auto;
	border:1px solid red;
}	
#btn-categoty-div {
	width: 50%;
	margin-left: auto;
	height: 80px;
	border: 1px solid red;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}
#freeboard-div{
	width: 100%;
	height: 90%;
	border: 1px solid red;
}
#freeboard-inner-div {
	width: 80%;
	height: 70%;
	border: 1px solid red;
	margin: auto;
	margin-top: 20px;
}

thead th {
	text-align: center;
}
.form-group {
	width: 30%;
	margin: auto;
}
#search-area{
 width:70%;
 display:inline-block;
}
  #pagingArea {width:fit-content; margin:auto;}
</style>
<title>selectListAll</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="btn-categoty-div">
			<button class="btn btn-lg btn-primary" >P.S</button>
			<button class="btn btn-lg btn-primary" >N.S</button>
			<button class="btn btn-lg btn-primary" >X.B</button>
			<button class="btn btn-lg btn-primary" >P.C</button>
		</div>
		
		<div id="freeboard-div">
			<div id="freeboard-inner-div">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목(댓글수)</th>
							<th>조회수</th>
							<th>날짜</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:choose>
							<c:when test="${ listAll ne null }">
								<c:forEach items="${ listAll }" var="board">
									<tr>
										<td>${ board.freeBoardNo }</td>
										<td>${ board.boardTitle }()</td>
										<td>${ board.count }</td>
										<td>${ board.createDate }</td>
										<td>${ board.memberName }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5">
										게시글이 존재하지 않습니다.
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="form-group mt-3">
				<div id="search-area">
					<input type="text" class="form-control" id="" name="" placeholder="검색어를 입력하세요." />
				</div>
				<button class="btn btn-sm btn-primary">검색</button>
			</div>
			
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">뒤로</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
                    			<c:choose>
                    				<c:when test="${ condition ne null }">
                    					<a class="page-link" href="search.board?page=${ pageInfo.currentPage - 1}&condition=${condition}&keyword=${keyword}">
	                    					뒤로
	                    				</a>
                    				</c:when>
                    				<c:otherwise>
	                    				<a class="page-link" href="list.board?page=${ pageInfo.currentPage - 1}">
	                    					뒤로
	                    				</a>
                    				</c:otherwise>
                    			</c:choose>
                    		</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
                    		<c:when test="${ condition ne null }">
	                    		<li class="page-item"><a class="page-link" href="search.board?page=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.board?page=${ p }">${ p }</a></li>
	                    	</c:otherwise>
	                    </c:choose>
					
					</c:forEach>
					<c:choose>
                   		<c:when test="${  pi.currentPage eq  pi.endPage}">
                    		<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<c:choose>
                    			<c:when test="${ condition ne null }">
                    				<li class="page-item">
		                    			<a class="page-link" href="search.board?page=${ pageInfo.currentPage + 1 }&condition=${condition}&keyword=${keyword}">
		                    			다음
		                    			</a>
		                    		</li>
                    			</c:when>
                    			<c:otherwise>
		                    		<li class="page-item">
		                    			<a class="page-link" href="list.board?page=${ pageInfo.currentPage + 1 }">
		                    			다음
		                    			</a>
		                    		</li>
                    		</c:otherwise>
                    		</c:choose>
                    	</c:otherwise>
	                </c:choose>
				</ul>
			</div>
			
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>