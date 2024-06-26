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
        #notice-wrap {
            margin : auto;
            width: 1200px;
            height : 900px;
            > div {
                width : 100%;
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
        .notice-title {
            height : 10%;

            > div {
                height : 100%;
                float : left;
            }
        }
        .notice-title-title {
            width : 40%;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 30px;
            }    
        }
        .notice-title-insert {
            width : 60%;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 540px;
                top : 25px;
            }    
        }
        .notice-content {
            height : auto;
            .notice-table {
            	border : 1px solid black;
            	width : 1000px;
            	height : 54px;
            	
            	>thead {
            		background-color : lightgrey;
            		height : 40px;
            	}
            	
            	>tbody {
            		height: auto;
            	}
            	
            	>tr, td {
            		height : 50px;	
            	}
            }
            
        }
        .notice-page {
            height : 10%;
            width:fit-content; margin:auto;
            position : relative;
            > div {
                display : inline-block;
	            margin : auto;
                position : absolute;
                left : 450px;
                top : 20px;
            }
        }
        .notice-search {
            height : 20%;
        }
        tr:hover {
            background-color : rgb(241, 238, 238);
            cursor : pointer;
             >td {
             	font-weight : bolder;
             }
        }
        .search-form {
        	padding-left : 100px; 
        	padding-top : 50px;
        	
        	.selectbox {
        		height : 35px;
        	}
        }
        .btn-find {
        	width : 300px; 
        	height : 35px;
        }
        .btn-search {
        	height: 35px;
        }
        
        
    </style>

</head>
<body>
	
	<jsp:include page="../../common/menubar.jsp" />
	
    <div id="notice-wrap">
        <div class="notice-title">
            <div class="notice-title-title">
                <div>
                    <a><h3>공지사항</h3></a>
                </div>
            </div>
            <div class="notice-title-insert">
                <div>
					<c:if test="${ sessionScope.loginMember != null and sessionScope.loginMember.memLevel == 'A' }">
	                    <button id="insert-notice" type="button" class="btn btn-light">글쓰기</button>
					</c:if>
                </div>
            </div>
        </div>
        
        <script>
        	$(function(){
        		$('#insert-notice').click(function(){
        			location.href = '/goty/notice/enroll';
        		})
        	})
        </script>
        
        <div class="notice-content">
            <table class="notice-table" border="1" align="center">
                <thead align="center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </thead>
                    
                <tbody align="center">
                    <c:choose>
                    	<c:when test="${ empty searchList }">
                    		<tr>
	                       		<td colspan="5">
	                       			검색된 게시물이 존재하지 않습니다
	                       		</td>
                   		    </tr>
                    	</c:when>
                    	<c:otherwise>
		                    <c:forEach items="${searchList}" var="notice">
		                    	<tr class="noticeList">
			                        <td>${ notice.noticeNo }</td>
			                        <td>${ notice.noticeTitle }</td>
			                        <td>${ notice.noticeWriter }</td>
			                        <td>${ notice.createDate }</td>
			                        <td>${ notice.count }</td>
		                   		</tr>
		                    </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <div class="notice-page" >
            <div>
            	<c:choose>
            		<c:when test="${ pageInfo.currentPage eq 1 }">
	                	<a  class="btn btn-warning disabled"><</a>
            		</c:when>
            		<c:otherwise>
            			<a  class="btn btn-warning" href="/goty/notices/find?date=${ date }&condition=${ condition }&keyword=${ keyword }&page=${ pageInfo.currentPage - 1 }"><</a>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            		<c:when test="${empty searchList }">
						<a class="btn btn-light disabled" >0</a>	            			
            		</c:when>
            		<c:otherwise>
		                <c:forEach begin="${ pageInfo.startPage}" end="${ pageInfo.endPage }" var="p">
		                	<a id="number${ p }" class="btn btn-light" href="/goty/notices/find?date=${ date }&condition=${ condition }&keyword=${ keyword }&page=${ p }">${ p }</a>
		                </c:forEach>
            		</c:otherwise>
            	</c:choose>
            	
                <c:choose>
                	<c:when test="${ pageInfo.currentPage eq pageInfo.endPage }">
                		<a  class="btn btn-warning disabled">></a>
                	</c:when>
					<c:otherwise>
           				<a  class="btn btn-warning" href="/goty/notices/find?date=${ date }&condition=${ condition }&keyword=${ keyword }&page=${ pageInfo.currentPage + 1 }">></a>
					</c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <script>
        	$(function(){
        		$('.noticeList').click(function(){
        			
        			location.href = '/goty/notice?noticeNo='+$(this).children().eq(0).html();
					/*location.href = '/goty/notice?noticeNo='+$(this).children().eq(0).val();*/
        		})
        	})
        </script>

        <div class="notice-search">
            <form class="search-form" action="/goty/notices/find">
                <select class="selectbox" name="date">
                    <option value="all">전체</option>
                    <option value="week">일주일</option>
                    <option value="moth">한달</option>
                    <option value="threeMonth">세달</option>
                </select>
    
                <select class="selectbox" name="condition">
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">글쓴이</option>
                </select>
                <input class="btn-find"  type="text" name="keyword" placeholder="내용을 입력해주세요"/>
                <input class="btn-search" type="submit" class="btn btn-success" value="찾기"/>
            </form>
        </div>
    </div>

</body>
</html>