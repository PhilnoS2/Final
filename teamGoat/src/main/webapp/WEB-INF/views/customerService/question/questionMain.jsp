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
                <img src="../안내사항.png">
            </div>
        </div>
        <div class="question-find" >
            <div>
                <select id="category" name="category" style="margin-left : 48px; margin-top : 5px; height :30px;">
                    <option value="i">상품문의</option>
                    <option value="p">주문/결제문의</option>
                    <option value="t">배송문의</option>
                    <option value="e">기타</option>
                </select>
            </div>
        </div>
        <div class="question-list">   
            <div>
                <table border="1" align="center" style="width : 1100px; height : 20px;">
                    <thead align="center" style="height : 40px; background-color : lightgrey;">
                        <th>번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </thead>

                    <tbody align="center">
                        
                        <!--사용자가 문의한 내역이 존재하지 않을 경우-->
                        <tr>
                            <td colspan="6" align="center" style="height : 100px;"><b>문의한 내역이 존재하지 않습니다.</b></td>
                        </tr>

                        <!--사용자가 문의한 내역이 존재할 경우 for문을 통해 리스트 출력-->
                        <!-- <tr style="height : 40px;">
                            <td>1</td>
                            <td>상품문의</td>
                            <td>상품 재입고 문의드려요</td>
                            <td>최진영</td>
                            <td>2024-05-10</td>
                            <td>1</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td>1</td>
                            <td>상품문의</td>
                            <td>상품 재입고 문의드려요</td>
                            <td>최진영</td>
                            <td>2024-05-10</td>
                            <td>1</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td>1</td>
                            <td>상품문의</td>
                            <td>상품 재입고 문의드려요</td>
                            <td>최진영</td>
                            <td>2024-05-10</td>
                            <td>1</td>
                        </tr> -->
                    </tbody>
                </table>
                <div align="center" style="margin-top : 20px;">
                    <button type="button" class="btn btn-warning"> < </button>
                    <button type="button" class="btn btn-light"> 1 </button>
                    <button type="button" class="btn btn-light"> 2 </button>
                    <button type="button" class="btn btn-info"> > </button>
                </div>
            </div>
        </div>
        <div class="question-insert">
            <div align="right">
                <!--추후 로그인한 유저만 글 작성 버튼을 누를 수 있게 수정 필요-->
                <button type="button" class="btn btn-secondary"> 글쓰기 </button>
            </div>
        </div>
        <div class="question-search">
            <form action="question-find" style="padding-left : 50px; padding-top:50px;">
                <select name="date" style="height : 35px;">
                    <option value="all">전체</option>
                    <option value="week">일주일</option>
                    <option value="moth">한달</option>
                    <option value="threeMonth">세달</option>
                </select>
    
                <select name="condition" style="height : 35px;">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">글쓴이</option>
                </select>
                <input style="width : 300px; height : 35px;" type="text" name="keyword" placeholder="내용을 입력해주세요"/>
                <input type="submit" class="btn btn-success" value="찾기"/>
            </form>
        </div>
    </div>
    
    
</body>
</html>