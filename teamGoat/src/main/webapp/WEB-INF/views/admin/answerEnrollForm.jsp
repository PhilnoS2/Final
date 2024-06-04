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
        div{
            box-sizing : border-box;
        }

        a {
            text-decoration : none;
            color : black;
        }

        a:hover{
            text-decoration : none;
            color : black;
            font-weight : bolder;
            cursor : pointer;
        }

        li{
            list-style : none;
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
            height : 20%;
            position : relative;
            > div{
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 100px;
            }
        }

        .question-content{
            height : auto;
            padding-bottom : 30px;
            > div {
                margin-top : 10px;
                height : 100%;
            }
        }

        .answer-area{
            margin-top : 50px;
            height : auto;
            > div{
                margin-left : 97px;
                display : inline-block;
            }
        }

        .button-area{
            height : 10%;
            >div{
                float : left;
                width: 50%;
                height : 100%;
            }
        }

        .button-area2{
            position : relative;
            >div{
                position : absolute;
                right : 97px;
            }
        }


    </style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

    <div id="question-wrap">
        <div class="question-title">
            <div><h3>1:1문의</h3></div>
        </div>
        <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom : 20px; margin-left : 100px;"></div>

        <div class="question-content">
            <div align="center">
                <table border="1" style="width: 1000px; height:200px; background-color : rgb(241, 238, 238)" >
                    <thead>
                        <th width="100px;">제목</th>
                        <td colspan="9">${ question.questionTitle }</td>
                    </thead>
    
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td colspan="3">${ question.questionWriter }</td>
                            <th width="100px;">답변상태</th>
                            <td colspan="5" width="200px;" style="padding-left : 30px;">${ question.answerYn }</td>
                        </tr>
                        
                        <tr>
                            <th>문의일시</th>
                            <td colspan="9">${ question.createDate }</td>
                        </tr>

                        <tr>
                            <th colspan="10"><p>${question.questionContent }</p></th>
                        </tr>
                        <tr>
                        	<c:choose>
                        		<c:when test="${ attach eq null }">
                        			<th colspan="10">첨부파일 : 없음</th>
                        		</c:when>
                        		<c:otherwise>
		                       		<th colspan="10">첨부파일 : ${attach.fileOriginName }</th>
                        		</c:otherwise>
                        	</c:choose>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="answer-area">
            <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom: 10px; margin-left : 100px;"></div>
            <div>
				<form id="insert-form" action="/goty/admin/answer/insert" method="post">
					<input type="hidden" name="questionNo" value="${ question.questionNo }">
                	<input type="hidden" name="memberNo" value="${ sessionScope.loginMember.memberNo }">
                    <textarea id="content" name="answerComment" style="width: 1000px; height: 200px;" placeholder="내용을 입력해주세요" required></textarea>
                </form>
            </div>
            <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom: 10px; margin-left : 100px;"></div>
        </div>

        <br clear="both">

        <div class="button-area">
            <div class="button-area1">
                <button id="backbtn" style="margin-left : 97px; width: 100px;">목록</button>
            </div>
            <div class="button-area2">
                <div>
                    <!--참조게시글이 없는 경우에만 버튼 활성화 시켜야 함-->
                    <button id="insert" class="btn btn-sm btn-warning">등록</button>
                    <button class="btn btn-sm btn-danger">취소</button>
                </div>
            </div>
        </div>

    </div>

    <script>
    	$(function(){
    		$('#insert').click(function(){
                $('#insert-form').submit();
    		});
    		
    		$('#backbtn').click(function(){
    			location.href = '/goty/management/boards';
    		})
    	})
    </script>


</body>
</html>