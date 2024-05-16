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
       

        #question-wrap {
            width: 1200px;
            height : 900px;
            margin : auto;
            > div{
                width : 100%;
            }
        }

        .question-title {
            height : 20%;
            position : relative;
            > div{
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 100px;
            }
        }
        .question-content {
            height : auto;
            > div{
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }

        .list-page{
            height : 5%;
            > div{
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }

        .button-area{
            height : 10%;

            > div{
                width: 90%;
                height : 100%;
                margin-left : 90px;
            }
        }
        label{
            width : 100px;
            background-color : rgb(241, 238, 238);
            margin : 0;
            font-size : 20px;
            padding-left : 10px;
        }

        textarea{
            width : 1000px;
            height : 100px;
        }

    </style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

    <div id="question-wrap">
        <div class="question-title">
            <div><h3>FAQ</h3></div>
        </div>
        <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom : 20px; margin-left : 100px;"></div>

        <div class="question-content">
            <div>
                <form action="insert" method="post">
                    <label for="subject" >제목</label>
                    <select id="select-area" name="select" style="width : 100px; height : 30px;">
                        <option value="c">주문/결제</option>
                        <option value="e">기타문의</option>
                        <option value="s">서비스</option>
                        <option value="d">배송관련</option>
                    </select>
                    <input type="text" id="subject" name="subject" style="width : 400px; margin-bottom : 10px;" placeholder="제목을 입력해주세요"  required> <br>
                    <textarea id="faq-q" name="content" placeholder="질문 내용을 입력해주세요" required></textarea>
                    <div style="width: 1000px; border-bottom : 1px solid black; margin-top : 20px; margin-bottom : 20px;"></div>

                    <textarea id="faq-a" name="answer" placeholder="답변 내용을 입력해주세요" required></textarea>


                    <div align="right" style="padding-right : 70px; margin-top : 50px;">
                        <input id="submit-btn" type="submit" value="등록" style="width: 70px;">
                        <input class="back-btn" type="button" value="취소" style="width: 70px;" onclick="history.back();">
                    </div>
                </form>
            </div>
        </div>

        <div class="list-page">
            <div>
                <button id="list-btn" class="back-btn" onclick="history.back();">목록</button>
            </div>

        </div>

        <div class="button-area">
            <div></div>
        </div>
    </div>
    
    <script>
        $(function(){
            $('#list-btn').click(function(){
                // 1:1문의 메인페이지로 이동
                location.href = '';
            })
        })

        $(function(){
            $('#submit-btn').click(function(){
                if(!confirm('게시글을 등록하시겠습니까?')){
                    return false;
                }
            })

            $('.back-btn').click(function(){
                if(!(($('#faq-q').val() == '') && ($('#faq-a').val() == ''))){
                    confirm('작성중인 글을 저장되지 않습니다 취소하시겠습니까?')
                }
            })
        })
    </script>

</body>
</html>