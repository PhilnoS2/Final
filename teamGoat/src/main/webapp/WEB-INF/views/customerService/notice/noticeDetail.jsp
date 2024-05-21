<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="../../common/menubar.jsp" />
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
        #notice-wrap {
            width: 1200px;
            height : 900px;
            margin : auto;
            > div {
                width : 100%;
            }
        }
        .notice-title {
            height : 20%;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 100px;
            }
        }
        .notice-content {
            height : auto;
            padding-bottom : 30px;
            > div {
                margin-top : 10px;
                height : 100%;
            }
        }
        .button-area {
            height : 5%;
            >div {
                float : left;
                width: 50%;
                height : 100%;
            }
        }
        .button-area2 {
            height : 5%;
            margin-left : 100px;
        }
        th {
            height: 50px;
            text-align : center;
        }
        td {
            padding-left : 10px;
            line-height : 3;
        }
        p {
            padding-left : 10px;
        }
        .update-area {
            position : absolute;
            left : 1350px;
            top : 400px;
        }
    </style>

</head>
<body>
	

    <div id="notice-wrap">
        <div class="notice-title">
            <div><h3>공지사항</h3></div>
        </div>
        
        <c:if test="${ sessionScope.loginMember != null and sessionScope.loginMember.memLevel == 'A' }">
	        <div class="update-area">
	            <button class="btn btn-sm btn-success" onclick="submit(0);">수정</button> 
	            <button class="btn btn-sm btn-danger" onclick="submit(1);">삭제</button> 
	            
	            <form action="" method="post" id="update-form">
	                <input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
	            </form>
	        </div>
        </c:if>

        <script>
            function submit(num){
                if(num == 0){
                    $('#update-form').attr('action', '/goty/notice/update/forward').submit();
                }
                else {
                	if(confirm('게시글을 삭제하시겠습니까??')){
	                    $('#update-form').attr('action', '/goty/notice/delete').submit();
                	};
                }
            }
        </script>

        <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom : 20px; margin-left : 100px;"></div>

        <div class="notice-content">
            <div align="center">
                <table border="1" style="width: 1000px; height:200px; background-color : rgb(241, 238, 238)" >
                    <thead>
                        <th width="100px;">제목</th>
                        <td colspan="9">${notice.noticeTitle }</td>
                    </thead>
    
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td colspan="3">${ notice.noticeWriter }</td>
                        </tr>
                        
                        <tr>
                            <th>작성일</th>
                            <td>${ notice.createDate }</td>
                            <th style="width : 100px;" padding-left : 15px;>조회수</th>
                            <td style="width: 650px; padding-left : 15px;">${ notice.count }</td>
                        </tr>

                        <tr>
                            <td colspan="10">
                            	<p>
                            		${notice.noticeContent }
                            	</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <br clear="both">

        <div class="button-area">
            <div class="button-area1">
                <button id="back-btn" style="margin-left : 97px; width: 100px;">목록</button>
            </div>
            <div class="button-area2">
                <div>
                    <div style="margin-bottom:10px;">
                        <button id="previous" class="btn btn-sm btn-warning">▲이전글</button> 
                    </div>
                    <div>
                        <button id="next" class="btn btn-sm btn-danger">▼다음글</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(function(){
                $('#previous').click(function(){
                	if(${notice.noticeNo - 1} > 0){
	                    location.href = '/goty/notice?noticeNo='+${notice.noticeNo - 1};
                	}
                });

                $('#next').click(function(){
                	if(${notice.noticeNo + 1} > 0){
	                    location.href = '/goty/notice?noticeNo='+${notice.noticeNo + 1};
                	}
                });
                
                $('#back-btn').click(function(){
                	location.href = '/goty/notices';
                })
            });
        </script>

    </div>


</body>
</html>