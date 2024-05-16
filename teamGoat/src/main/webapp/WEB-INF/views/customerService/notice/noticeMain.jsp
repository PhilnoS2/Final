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
            height : 60%;
        }
        .notice-page {
            height : 10%;
            width:fit-content; margin:auto;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 450px;
                top : 20px;
            }
        }
        .notice-search {
            height : 20%;
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
                    <!--추후 로그인한 유저만 글 작성 버튼을 누를 수 있게 수정 필요-->
                    <a id="insert-notice" class="btn btn-secondary" href="notice-enroll">글쓰기</a>
                </div>
            </div>
        </div>
        
        <script>
        	$('#insert-notice').click(function(){
        		location.href = '';
        	})
        
        </script>
        
        <div class="notice-content">
            <table border="1" align="center" style="width : 1000px; height: 54px;">
                <thead align="center" style="background-color : lightgrey; height : 40px;">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </thead>
                    
                <tbody align="center" style="height : auto;">
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                    <tr style="height : 50px;">
                        <td><a>공지</a></td>
                        <td><a>goat를 이용하는 고객분들을 위한 안내</a></td>
                        <td><a>관리자</a></td>
                        <td><a>2024-05-10</a></td>
                        <td><a>1</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="notice-page" >
            <div>
                <button  class="btn btn-warning"><</button>
                <button  class="btn btn-light">1</button>
                <button  class="btn btn-light">2</button>
                <button  class="btn btn-light">3</button>
                <button  class="btn btn-light">4</button>
                <button  class="btn btn-light">5</button>
                <button  class="btn btn-info">></button>
            </div>

        </div>

        <div class="notice-search">
            <form action="notice-find" style="padding-left : 100px; padding-top : 50px;">
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