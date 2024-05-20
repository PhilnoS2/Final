<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            height : 65%;
            > div {
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }
        .list-page {
            height : 5%;
            > div {
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }
        .button-area {
            height : 10%;
            > div {
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }
        label {
            width : 100px;
            background-color : rgb(241, 238, 238);
            margin : 0;
            font-size : 20px;
            padding-left : 10px;
        }
        textarea {
            width : 1000px;
            height : 400px;
        }
    </style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

    <div id="notice-wrap">
        <div class="notice-title">
            <div><h3>공지사항</h3></div>
        </div>
        <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom : 20px; margin-left : 100px;"></div>

        <div class="notice-content">
            <div>
                <form action="/goty/notice/update" method="post">
                    <label for="subject" >제목</label>
                 	<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
                    <input type="text" id="subject" name="noticeTitle" value="${ notice.noticeTitle}" style="width : 400px; margin-bottom : 10px;" placeholder="제목을 입력해주세요"  required> <br>
                    <textarea id="content" name="noticeContent" placeholder="내용을 입력해주세요" required>${ notice.noticeContent } </textarea>
                    <div style="width: 1000px; border-bottom : 1px solid black; margin-top : 20px; margin-bottom : 20px;"></div>

                    <div align="right" style="padding-right : 70px;">
                        <input id="submit-btn" type="submit" value="수정" style="width: 70px;">
                        <input class="back-btn" type="button" value="취소" style="width: 70px;" onclick="history.back();">
                    </div>
                </form>
            </div>
        </div>

        <div class="list-page">
            <div>
                <button id="list-btn" class="back-btn">목록</button>
            </div>

        </div>

        <div class="button-area">
            <div></div>
        </div>
    </div>
    <script>
        $(function(){
            $('#submit-btn').click(function(){
                if(!confirm('수정한 게시글을 등록하시겠습니까?')){
					return false;
                }
            });
            
            $('#list-btn').click(function(){
            	location.href = '/goty/notices';
            });
        })
    </script>

</body>
</html>