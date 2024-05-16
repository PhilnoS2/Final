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

	<jsp:include page="../../common/menubar.jsp" />

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
                        <td colspan="9">제목입니다</td>
                    </thead>
    
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td colspan="3">김진영</td>
                            <th width="100px;">답변여부</th>
                            <td colspan="5" width="200px;" style="padding-left : 30px;">X</td>
                        </tr>
                        
                        <tr>
                            <th>문의일시</th>
                            <td colspan="9">2024-05-10</td>
                        </tr>

                        <tr>
                            <th colspan="10"><p>(서울=연합뉴스) 곽민서 기자 = 윤석열 대통령은 14일 기득권 세력의 정치적 반대 때문에 개혁 과제 추진이 어렵다는 인식을 밝히면서 노동·의료 등 4대 개혁에 대한 의지를 거듭 확인했다.

                                윤 대통령은 이날 서울고용복지플러스센터에서 열린 스물다섯번째 '국민과 함께하는 민생토론회'에서 "우리 정부는 추상적인 어떤 무슨 경제 슬로건이 아니고 교육 개혁, 노동 개혁, 연금 개혁, 의료 개혁이라는 이 4가지 개혁을 추진하고 있다"고 말했다.
                                
                                윤 대통령은 "이 개혁이라고 하는 것은 지금 같은 세상에서는 적을 많이 만드는 일"이라며 "왜냐하면 개혁을 하게 되면 결국 많은 국민들에게 이롭지만, 또 누군가는 어떤 기득권을 뺏긴다"고 짚었다.
                                
                                이어 "이로움을 누리게 되는 사람들은 거기에 대해서 별로 인식을 못 하고, 조금씩 나아지는 걸 잘 못 느끼지만 뭔가를 빼앗기는 쪽에서는 정말 정권 퇴진 운동을 하게 되는 것"이라며 "그래서 정말 어떤 개혁을 해 나간다는 것이 대단히 어렵다"고 말했다.(서울=연합뉴스) 곽민서 기자 = 윤석열 대통령은 14일 기득권 세력의 정치적 반대 때문에 개혁 과제 추진이 어렵다는 인식을 밝히면서 노동·의료 등 4대 개혁에 대한 의지를 거듭 확인했다.

                                잘 못 느끼지만 뭔가를 빼앗기는 쪽에서는 정말 정권 퇴진 운동을 하게 되는 것"이라며 "그래서 정말 어떤 개혁을 해 나간다는 것이 대단히 어렵다"고 말했다.</p></th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="answer-area">
            <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom: 10px; margin-left : 100px;"></div>
            <div>

                <!-- 조건문을 통해 답변이 있는 경우에는 답글을, 없는 경우에는 p 태그를 보여줘야 함-->
                <!-- <p style="width: 1000px; height : 100px; border : 1px solid black; padding-top : 5px; padding-left : 5px;">
                    빠른 시간 내에 답변을 드리겠습니다. 잠시만 기다려 주세요!
                </p> -->

                <table border="1" style="width: 1000px; height:200px; background-color : rgb(241, 238, 238)" >
                    <thead>
                        <th width="100px;">답변자</th>
                        <td colspan="9">고티</td>
                    </thead>
    
                    <tbody>
                        <tr>
                            <th>답변일시</th>
                            <td colspan="9">2024-05-10</td>
                        </tr>

                        <tr>
                            <th colspan="10"><p>소프라노가 작성한 답변입니다</p></th>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div style="width: 1000px; border-bottom : 1px solid black; margin-bottom: 10px; margin-left : 100px;"></div>
        </div>

        <br clear="both">

        <div class="button-area">
            <div class="button-area1">
                <button style="margin-left : 97px; width: 100px;">목록</button>
            </div>
            <div class="button-area2">
                <div>
                    <!--참조게시글이 없는 경우에만 버튼 활성화 시켜야 함-->
                    <button class="btn btn-sm btn-warning" onclick="submit(0);">수정</button>
                    <button class="btn btn-sm btn-danger" onclick="submit(1);">삭제</button>
                </div>

                <form action="" method="post" id="update-form">
                    <input type="hidden" name="noticeNo" value="">
                </form>
            </div>
        </div>

    </div>

    <script>
        function submit(num){
            if(num == 0){
                $('#update-form').attr('action', 'update').submit();
            }
            else {
                $('#update-form').attr('action', 'delete').submit();
            }
        }

    </script>




</body>
</html>