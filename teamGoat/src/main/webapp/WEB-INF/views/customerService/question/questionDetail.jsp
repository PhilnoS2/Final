<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
		.margin-area {
			width: 1000px; 
			border-bottom : 1px solid black; 
			margin-bottom : 20px; 
			margin-left : 100px;
		}
		.question-table {
			width: 1000px; 
			height:200px; 
			background-color : rgb(241, 238, 238); 
		}
		.th1 {
			width : 100px;
		}
		.th3 {
			width : 100px;
		}
		.td3 {
			width : 200px;" 
			padding-left : 30px;
		}
		.margin-area2 {
			width: 1000px; 
			border-bottom : 1px solid black; 
			margin-bottom: 10px; 
			margin-left : 100px;
		}
		.answer-area-p {
			background-color : rgb(241, 238, 238); 
			width: 1000px; 
			height : 100px; 
			border : 1px solid black; 
			padding-top : 5px; 
			padding-left : 5px;
		}
		.answer-table {
			border : 1px solid black;
			width: 1000px; 
			height:200px; 
			background-color : rgb(241, 238, 238); 
		}
		.answer-th1 {
		 	width : 100px;
		}
		.margin-area3 {
			width: 1000px; 
			border-bottom : 1px solid black; 
			margin-bottom: 10px; 
			margin-left : 100px;
		}
		#back-btn {
			margin-left : 97px; 
			width: 100px;
		}
    </style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

    <div id="question-wrap">
        <div class="question-title">
            <div><h3>1:1문의</h3></div>
        </div>
        <div class="margin-area"></div>

        <div class="question-content">
            <div align="center">
                <table border="1" class="question-table">
                    <thead>
                        <th class="th1">제목</th>
                        <td colspan="9">${ question.questionTitle }</td>
                    </thead>
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td colspan="3">${ question.questionWriter }</td>
                            <th class="th3">답변상태</th>
                            <td colspan="5" class="td3">${ question.answerYn }</td>
                        </tr>
                        
                        <tr>
                            <th>문의일시</th>
                            <td colspan="9">${ question.createDate }</td>
                        </tr>

                        <tr>
                            <th colspan="10"><p>${question.questionContent }</p></th>
                        </tr>
                        <c:choose>
                      		<c:when test="${ attach eq null }">
                       			<th colspan="10">첨부파일 : 없음</th>
                       		</c:when>
                       		<c:otherwise>
	                       		<th colspan="10">첨부파일 : ${attach.fileOriginName }</th>
                       		</c:otherwise>
                       	</c:choose>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="answer-area">
            <div class="margin-area2"></div>
            <div>
				<c:choose>
					<c:when test="${empty answer }">
		                <p class="answer-area-p">
		                 	 빠른 시간 내에 답변을 드리겠습니다. 잠시만 기다려 주세요!
		                </p> 
					</c:when>
					<c:otherwise>
		                <table class="answer-table">
		                    <thead>
		                        <th class="answer-th1">답변자</th>
		                        <td colspan="9">${ answer.answerWriter }</td>
		                    </thead>
		    
		                    <tbody>
		                        <tr>
		                            <th>답변일시</th>
		                            <td colspan="9">${ answer.createDate }</td>
		                        </tr>
		                        <tr>
		                            <th colspan="10"><p>${ answer.answerComment }</p></th>
		                        </tr>
		                    </tbody>
		                </table>
					</c:otherwise>
				</c:choose>	
            </div>
            <div class="margin-area3"></div>
        </div>

        <br clear="both">
        <div class="button-area">
            <div class="button-area1">
                <button id="backbtn">목록</button>
            </div>
            <div class="button-area2">
                <div>
                    <button class="btn btn-sm btn-warning" onclick="submit(0);">수정</button>
                    <button class="btn btn-sm btn-danger" onclick="submit(1);">삭제</button>
                </div>
                <form action="" method="post" id="update-form">
                    <input type="hidden" name="questionNo" value="${ question.questionNo }">
                    <input type="hidden" name="questionAttachPath" value="${ attach.fileChangeName }">
                </form>
            </div>
        </div>
    </div>

    <script>
        function submit(num){
            if(num == 0){
                $('#update-form').attr('action', '/goty/question/updateForm').submit();
            }
            else {
            	if(confirm('게시글을 삭제하시겠습니까??')){
                	$('#update-form').attr('action', '/goty/question/delete').submit();
            	};
            }
        };
        
        $(function(){
        	$('#backbtn').click(function(){
            	location.href = '/goty/questions';
        	})
        })
    </script>

</body>
</html>