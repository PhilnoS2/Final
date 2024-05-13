<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            border : 1px solid black;
        }

        #faq-wrap{
            margin : auto;
            width: 1200px;
            height : 900px;
            > div{
                width : 100%;
            }
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

        .faq-title{
            height : 10%;

            > div{
                height : 100%;
                float : left;
            }
        }

        .faq-title-title{
            width : 40%;
            position : relative;
            > div{
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 30px;
            }    
        }

        .faq-title-insert{
            width : 60%;
            position : relative;
            > div{
                display : inline-block;
                position : absolute;
                left : 540px;
                top : 25px;
            }    
        }

        .faq-search{
            height : 5%;
        }

        .faq-content{
            height : 85%;
        }

        .faq-answer{
            display : none;
        }

    </style>

</head>
<body>
    <div id="faq-wrap">
        <div class="faq-title">
            <div class="faq-title-title">
                <div>
                    <a><h3>자주묻는질문 FAQ</h3></a>
                </div>
            </div>
            <div class="faq-title-insert">
                <div>
                    <!--추후 로그인한 유저만 글 작성 버튼을 누를 수 있게 수정 필요-->
                    <button type="button" class="btn btn-light">글쓰기</button>
                </div>
            </div>
        </div>
        <div class="faq-search">
            <div>
                <select id="select-area" name="select" style="width : 100px; height : 40px; margin-left: 90px;">
                    <option value="all">전체</option>
                    <option value="c">주문/결제</option>
                    <option value="e">기타문의</option>
                    <option value="s">서비스</option>
                    <option value="d">배송관련</option>
                </select>
            </div>
        </div>

        <div class="faq-content">
            <table border="1" align="center" style="width : 800px; height : 20px;">
                <thead align="center" style="height : 40px; background-color : lightgrey;">
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>읽기</th>
                </thead>

                <tbody id="search-area" align="center">
                    
                    <!--사용자가 문의한 내역이 존재하지 않을 경우-->
                    <!-- <tr>
                        <td colspan="6" align="center" style="height : 100px;"><b>문의한 내역이 존재하지 않습니다.</b></td>
                    </tr> -->

                    <!--사용자가 문의한 내역이 존재할 경우 for문을 통해 리스트 출력-->
                    <tr class="faq-list" style="height : 60px;">
                        <td>15</td>
                        <td>주문결제</td>
                        <td>무통장 입금에 대해서</td>
                        <td style="border-right : none;">2024-05-20</td>
                        <input type="hidden" value="13">
                        <td>▼</td>
                    </tr>

                    <tr class="faq-answer" id="15">
                        <td colspan="5" style="height : 60px; background-color : rgb(224, 224, 224);">
                            무통장 입금은 이렇습니다~~~~~~~~~~~~~~~~~~~~~~~~~
                        </td>
                    </tr>

                    <tr class="faq-list" style="height : 60px;">
                        <td>13</td>
                        <td>주문결제</td>
                        <td>무통장 입금에 대해서</td>
                        <td style="border-right : none;">2024-05-20</td>
                        <td><button>▼</button></td>
                    </tr>

                    <tr class="faq-answer" id="13">
                        <td colspan="5" style="height : 60px; background-color : rgb(224, 224, 224);">
                            무통장 입금은 이렇습니다~~~~~~~~~~~~~~~~~~~~~~~~~
                        </td>
                    </tr>
            </table>
        </div>
    </div>

    <script>
        $(function(){
            $('#search-area tr').on('click', function(){
                console.log($(this).next().children().val());
            })
        })
    </script>

    
</body>
</html>