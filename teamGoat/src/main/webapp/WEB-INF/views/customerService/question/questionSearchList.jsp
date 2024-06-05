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


    <Style>
        div{
            box-sizing : border-box;
        }

        #question-wrap{
            width: 1200px;
            height : 900px;
            margin : auto;
            > div{
                width : 100%;
            }
        }
        .question-title{
            height : 10%;
            position : relative;
            > div{
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 30px;
            }
        }

        .guide{
            height : 40%;
            > div{
                width : 100%;
                height : 100%;
            }
        }

        .question-find{
            height : 5%;
            > div{
                height : 100%;
            }
        }

        .question-list{
            height : 25%;
        }
        .question-insert{
            height : 5%;
        }
        .question-search{
            height : 15%;
        }
		
		tr:hover {
            background-color : rgb(241, 238, 238);
            cursor : pointer;
             >td {
             	font-weight : bolder;
             }
        }
        #category {
        	margin-left : 48px; 
        	margin-top : 5px; 
        	height :30px;
        }
		.question-table {
			width : 1100px; 
			height : 20px;
		}
		.question-table-thead {
			height : 40px; 
			background-color : lightgrey;
		}
		.td1 {
			height : 100px;
		}
        .questionList {
        	height : 40px; 
        }
        .margin-area {
        	margin-top : 20px;
        }
        .search-form {
        	padding-left : 50px; 
        	padding-top:50px;
        }
        .form-select {
        	height : 35px;
        }
        .input-keyword {
        	width : 300px; 
        	height : 35px; 
        }
    </style>        


</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />


    <div id="question-wrap">
        <div class="question-title" style="border-bottom : 1px solid black;">
            <div>
                <h3><a>1:1 문의</a></h3>
            </div>
        </div>
        <div class="guide" style="border-bottom : 1px solid black;"> 
            <div>
                <img src="/goty/resources/img/info.png">
            </div>
        </div>
        <div class="question-find" >
            <div>
                <select id="category" name="category">
                    <option value="1">주문/결제</option>
                    <option value="2">기타문의</option>
                    <option value="3">서비스</option>
                    <option value="4">배송관련</option>
                </select>
            </div>
        </div>
        <div class="question-list">   
            <div>
                <table border="1" align="center" class="question-table">
                    <thead align="center" class="question-table-thead">
                        <th>번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>답변상태</th>
                    </thead>

                    <tbody align="center">
                        
                        <!--사용자가 문의한 내역이 존재하지 않을 경우-->
                        
                        <c:choose>
                        	<c:when test="${ empty searchList }">
		                        <tr>
		                            <td colspan="6" align="center" class="td1"><b>검색된 게시물이 존재하지 않습니다</b></td>
		                        </tr>
                        	</c:when>
                        	<c:otherwise>
								<c:forEach items="${ searchList }" var="question">
									<tr class="questionList">
			                            <td>${ question.questionNo }</td>
			                            <td>${ question.categoryName }</td>
			                            <td>${ question.questionTitle }</td>
			                            <td>${ question.questionWriter }</td>
			                            <td>${ question.createDate }</td>
			                            <td>${ question.answerYn }</td>
		                       		</tr>
								</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div align="center" class="margin-area">
                    <c:choose>
                    	<c:when test="${pageInfo.currentPage eq  1}">
	                    	<button type="button" class="btn btn-warning disabled"> < </button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" class="btn btn-warning"> < </button>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:choose>
                    	<c:when test="${ empty searchList }">
							<a class="btn btn-light disabled">0</a>                    	
                    	</c:when>
                    	<c:otherwise>
		                   	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage }" var="p">
		                   		<a id="number${ p }" class="btn btn-light" href="/goty/questions?find?date=${ date }&condition=${ condition }&keyword=${ keyword }&page=${ p }">${ p }</a>
		                   	</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                   	
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
        <div class="question-insert">
            <div align="right">
                <button id="btn1" type="button" class="btn btn-secondary"> 글쓰기 </button>
            </div>
        </div>
        <div class="question-search">
            <form action="/goty/questions/find" class="search-form">
                <select name="date" class="form-select">
                    <option value="all">전체</option>
                    <option value="week">일주일</option>
                    <option value="moth">한달</option>
                    <option value="threeMonth">세달</option>
                </select>
    
                <select name="condition" class="form-select">
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">글쓴이</option>
                </select>
                <input class="input-keyword" type="text" name="keyword" placeholder="내용을 입력해주세요"/>
                <input type="submit" class="btn btn-success" value="찾기"/>
            </form>
        </div>
    </div>
    
    <script>
    	$(function(){
    		$('#btn1').click(function(){
    			if(${sessionScope.loginMember eq null}){
    				alert('로그인 후 이용 가능한 서비스입니다');
    			} 
    			else {
	    			location.href = '/goty/question/enroll';
    			}
    			
    		});
    	});
    	
    	$(function(){
    		$('.questionList').click(function(){
    			location.href = '/goty/question?questionNo=' + $(this).children().eq(0).html();
    			consol.log((this).children().eq(0).html());
    		});
    	});
    </script>
    
</body>
</html>