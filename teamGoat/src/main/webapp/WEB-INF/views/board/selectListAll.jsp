<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/goty/resources/board/css/selectListAll.css" />
<title>selectListAll</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="btn-categoty-div">
			<a class="btn btn-lg btn-outline-primary" href="/goty/freeboards/category?categoryNo=1" >P.S</a>
			<a class="btn btn-lg btn-outline-warning" href="/goty/freeboards/category?categoryNo=2" >N.S</a>
			<a class="btn btn-lg btn-outline-danger" href="/goty/freeboards/category?categoryNo=3" >X.B</a>
		</div>
		
		<div id="freeboard-div">
			<div id="freeboard-inner-div">
				<c:if test="${ sessionScope.loginMember ne null }">
					<div id="btn-list-option">
						<a class="btn btn-md btn-dark" href="/goty/freeboards/insertsForm">글쓰기</a>
					</div>
				</c:if>
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
							<c:when test="${ not empty listAll }">
								<c:forEach items="${ listAll }" var="board">
									<tr class="lists" id="${ board.freeBoardNo }">
										<td>${ board.freeBoardNo }</td>
										<td>${ board.boardTitle } ( ${board.reviewCount} )</td>
										<td>${ board.count }</td>
										<td>${ board.createDate }</td>
										<td>${ board.nickname }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5">
										<h3>게시글이 존재하지 않습니다.</h3>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<form class="form-group mt-3" action="/goty/freeboards/search">
			   <div id="select-area">
	              <select class="custom-select" name="condition">
	                  <option selected value="nickname">작성자</option>
	                  <option value="boardTitle">제목</option>
	              </select>
               </div>
               
		      <div id="search-area">
				<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요." value="${ keyword }" />
			  </div>
			  <button type="submit" class="btn btn-sm btn-primary">검색</button>
			</form>		

			<c:if test="${ not empty listAll and pi.startPage != pi.endPage }">
				<c:choose>
					<c:when test="${ categoryNo eq null }">
						<ul class="pagination pagination-md  justify-content-center">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">뒤로</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
			                   			<c:choose>
			                   				<c:when test="${ condition ne null }">
			                   					<a class="page-link" href="/goty/freeboards/search?page=${ pi.currentPage - 1}&condition=${condition}&keyword=${keyword}">
			                    					뒤로
			                    				</a>
			                   				</c:when>
			                   				<c:otherwise>
			                    				<a class="page-link" href="/goty/freeboards/all?page=${ pi.currentPage - 1}">
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
			                    		<li class="page-item"><a class="page-link" href="/goty/freeboards/search?page=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="/goty/freeboards/all?page=${ p }">${ p }</a></li>
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
				                    			<a class="page-link" href="/goty/freeboards/search?page=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}">
				                    			다음
				                    			</a>
				                    		</li>
			                   			</c:when>
			                   			
			                   			<c:otherwise>
				                    		<li class="page-item">
				                    			<a class="page-link" href="/goty/freeboards/all?page=${ pi.currentPage + 1 }">
				                    			다음
				                    			</a>
				                    		</li>
			                   			</c:otherwise>
			                   		</c:choose>
			                   	</c:otherwise>
			                </c:choose>
						</ul>
					</c:when>
					
					<c:otherwise>
						<ul class="pagination pagination-md  justify-content-center">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">뒤로</a></li>
								</c:when>
								
								<c:otherwise>
									<li class="page-item">
			                   			<c:choose>
			                   				<c:when test="${ condition ne null }">
			                   					<a class="page-link" href="/goty/freeboards/search?page=${ pi.currentPage - 1}&condition=${condition}&keyword=${keyword}">
			                    					뒤로
			                    				</a>
			                   				</c:when>
			                   				<c:otherwise>
			                    				<a class="page-link" href="/goty/freeboards/category?page=${ pi.currentPage - 1}&categoryNo=${categoryNo}">
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
			                    		<li class="page-item"><a class="page-link" href="/goty/freeboards/search?page=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="/goty/freeboards/category?page=${ p }&categoryNo=${categoryNo}">${ p }</a></li>
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
				                    			<a class="page-link" href="/goty/freeboards/search?page=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}">
				                    			다음
				                    			</a>
				                    		</li>
			                   			</c:when>
			                   			
			                   			<c:otherwise>
				                    		<li class="page-item">
				                    			<a class="page-link" href="/goty/freeboards/category?page=${ pi.currentPage + 1 }&categoryNo=${categoryNo}">
				                    			다음
				                    			</a>
				                    		</li>
			                   			</c:otherwise>
			                   		</c:choose>
			                   	</c:otherwise>
			                </c:choose>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:if>

		</div>

	</div>
	
	<script>
		$('tbody > .lists').click((event) => {
			location.href="/goty/freeboards/select/" + $(event.currentTarget)[0].id;
		});

		
		$(() => {
			$('select[name=condition]').children().each((idx, item) => {
				if($(item).val() == '${condition}'){
					$(item).attr('selected', true);
				}
			});	
		});

	</script>
	
</body>
</html>