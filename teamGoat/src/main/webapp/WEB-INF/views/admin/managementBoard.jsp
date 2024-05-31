<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
         div {
            box-sizing : border-box;
        }
        #management-board-wrap {
            margin : auto;
            width: 1200px;
            height : 1000px;
            > div {
               height : 85%;
               float : left;
            }
        }
        a {
            text-decoration : none;
            color : black;
        }
        a:hover {
            text-decoration : none;
            color : black;
            font-weight : bolder;
            cursor : pointer;
        }
        li {
            list-style : none;
        }
        .board-function {
            margin-left : 10%;
            width : 20%;
            background-color : rgb(241, 196, 15);
            > div {
                padding-top : 50px;
                padding-bottom : 15px;
            }
        }
        .board-content {
            width : 70%;
            >div {
                width: 100%;
            }
        }
        .board-title {
            height : 10%;
            position : relative;
            > div {
                position : absolute;
                top : 40px;
                left : 30px;
            }
        }
        .board-contents {
            margin-top : 50px;
            height : auto;
        }
        .board-button {
            margin-top : 30px;
            height : 10%;
        }
        tr:hover {
            cursor : pointer;
            background-color : lightgrey;
            font-weight : bold;
            resize : none;
        }
    </style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


    <div id="management-board-wrap">
        <div class="board-function" align="center">
            <div>
                <h3><a href="/goty/admin">회원 관리</a></h3>
            </div>
            <div>
                <h3><a href="/goty/management/boards" style="color : rgb(231, 76, 60)">게시판 관리</a></h3>
            </div>
            <div>
                <h3><a href="#">주문/배송 관리</a></h3>
            </div>

            <!--메뉴 추가하려면 아래 div 복사해서 내용만 넣어서 사용하면 됨-->
            <!--
                 <div>
                     <h3><a href="매핑값">메뉴명</a></h3>
                 </div>
            -->

        </div>
        <div class="board-content">
            <div class="board-title" style="border-bottom : 1px solid black">
                <div><H3>게시판 관리</H3></div>
            </div>

            <div class="board-contents">
                
                <table border="1" align="center" style="width : 800px; height : 20px;">
                    <thead align="center" style="height : 40px; background-color : lightgrey;">
                        <th>처리 상태</th>
                        <th>글번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </thead>

                    <tbody id="search-area" align="center">
                        <c:choose>
                        	<c:when test="${ empty questionList }">
                        		<td colspan="6" align="center" style="height : 100px;"><b>답변 대기중인 게시물이 존재하지 않습니다.</b></td>
                        	</c:when>
                        	<c:otherwise>
		                        <c:forEach items="${ questionList }" var="question">
		                        	<tr id="question-list" class="board-list" style="height : 40px;">
			                            <td style="color : rgb(46, 204, 113);">대기중</td>
			                            <td>${question.questionNo }</td>
			                            <td>${question.categoryName }</td>
			                            <td>${question.questionTitle }</td>
			                            <td>${question.questionContent }</td>
			                            <td>${question.createDate }</td>
		                        	</tr>
		                        </c:forEach>
                        	</c:otherwise>
                        </c:choose>
                        
                        
                </table>
            </div>

             <div class="board-button">
                <div align="center" style="border-bottom:1px solid black; padding-bottom:30px;">
                    <c:choose>
                    	<c:when test="${pageInfo.currentPage eq  1}">
	                    	<button type="button" class="btn btn-warning disabled"> < </button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" class="btn btn-warning"> < </button>
                    	</c:otherwise>
                    </c:choose>
                    
                   	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage }" var="p">
                   		<a id="number${ p }" class="btn btn-light" href="/goty/management/board?page=${ p }">${ p }</a>
                   	</c:forEach>
                   	
                    <c:choose>
                    	<c:when test="${pageInfo.currentPage eq pageInfo.endPage }">
                    		<button type="button" class="btn btn-warning disabled"> > </button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" class="btn btn-warning"> > </button>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>    
        </div>
    </div>

    <script>
        $(function(){
            $('#question-list').on('click', function(){
                console.log($(this))
                location.href = 'board?boardNo='+$(this).children().eq(1).html();
            });
        })
    </script>

    
</body>
</html>