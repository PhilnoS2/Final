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

        #admin-wrap {
            margin : auto;
            width: 1200px;
            height : 1000px;
            > div{
               height : 85%;
               float : left;
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

        .admin-function {
            margin-left : 10%;
            width : 20%;
            background-color : rgb(241, 196, 15);
            > div{
                padding-top : 50px;
                padding-bottom : 15px;
            }
        }

        .admin-content {
            width : 70%;

            >div {
                width: 100%;
            }
        }

        .admin-title {
            height : 10%;
            position : relative;
            > div{
                position : absolute;
                top : 40px;
                left : 30px;
            }
        }

        .admin-search{
            height : 20%;
            position : relative;
            >div {
                position : absolute;
                top : 60px;
                left : 30px;
            }
        }

        .admin-contents{
            height : auto;
        }

        .admin-button{
            margin-top : 30px;
            height : 10%;
        }

    </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

    <div id="admin-wrap">
        
        <!--관리자 사용탭-->
        <div class="admin-function" align="center">
            <div>
                <h3><a href="#" style="color : rgb(231, 76, 60)">회원 관리</a></h3>
            </div>
            <div>
                <h3><a href="#">게시판 관리</a></h3>
            </div>
            <div>
                <h3><a href="#">주문/배송 관리</a></h3>
            </div>

        </div>


        <!-- 컨텐트 영역-->
        <div class="admin-content">
            <!-- 타이틀 영역 -->
            <div class="admin-title" style="border-bottom : 1px solid black">
                <div><H3>회원 관리</H3></div>
            </div>

            <!-- 검색 영역-->
            <div class="admin-search">
                <div>
                    <form action="#">
                        <select name="선택지" id="search-area" style="width : 130px; height: 40px;">
                            <option value="name">이름</option>
                            <option value="id">아이디</option>
                            <option value="nickname">닉네임</option>
                        </select>
                        <input type="text" style="width : 350px; height: 40px;" placeholder="내용을 입력해주세요">
                        <input type="submit" value="검색" style="height : 40px;">
                    </form>
                    <input id="select-all" style="margin-top : 20px;" type="button" value="전체 선택">

                </div>
            </div>

            <!-- 조회된 컨텐트 영역-->
            <div class="admin-contents">
                <table border="1" align="center" style="width : 800px; height : 20px;">
                    <thead align="center" style="height : 40px; background-color : lightgrey;">
                        <th>선택</th>
                        <th>회원 번호</th>
                        <th>가입일</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>회원등급</th>
                        <th>구매금액</th>
                        <th>적립금</th>
                    </thead>

                    <tbody id="search-area" align="center">
                        
                        <!--사용자가 문의한 내역이 존재하지 않을 경우-->
                        <!-- <tr>
                            <td colspan="9" align="center" style="height : 100px;"><b>문의한 내역이 존재하지 않습니다.</b></td>
                        </tr> -->

                        <!--사용자가 문의한 내역이 존재할 경우 for문을 통해 리스트 출력-->
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>GOLD</td>
                            <td>100,100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                        <tr style="height : 40px;">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2024-03-10</td>
                            <td>최진영</td>
                            <td>cjy1234</td>
                            <td>gold</td>
                            <td>100,000</td>
                            <td>100</td>
                        </tr>
                       
                </table>
                

            </div>

            <!-- 관리자 기능 버튼 + 페이징 버튼 영역-->
            <div class="admin-button">
                <div style="margin-left : 20px;">
                    <button class="btn btn-sm btn-danger" style="margin-right : 15px;">선택 탈퇴</button><button class="btn btn-sm btn-success">선택 적립금 지급</button>

                </div>
                <div align="center" style="border-bottom:1px solid black; padding-bottom:30px;">
                    <button type="button" class="btn btn-warning"> < </button>
                    <button type="button" class="btn btn-light"> 1 </button>
                    <button type="button" class="btn btn-light"> 2 </button>
                    <button type="button" class="btn btn-info"> > </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('#select-all').on('click', function(){
                $('#search-area input').attr('checked', true);
            })
        });
    </script>



</body>
</html>