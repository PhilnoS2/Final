<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../common/menubar.jsp" />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <Style>
        div {
            box-sizing : border-box;
        }
        #cs-wrap {
            width : 1200px;
            height : 1000px;
            margin : auto;
            > div {
             width : 100%;
            }
        }
        #cs-title {
            height : 15%;
            div{
                height : 100%;
                float: left;
            }
        }
        #cs-title-text {
            width : 40%;
            > h1 {
                padding-top : 50px;
                padding-left : 60px;
            }
        }
        #cs-title-sub {
            width: 60%;
        }
        #cs-content {
            height : 60%;
            > div {
                width: 50%;
                height : 50%;
                float : left;
            }
        }
        #notice {
            > div {
            width: 100%;
            }
        }
        #notice-title {
            padding-left : 60px;
            height : 15%;
            padding-top : 10px;
        }
        #notice-content {
            height : 85%;
            line-height : 3;
            > div {
                float : left;
                height : 100%;
            }    
        }
        #notice-content1 {
            width: 10%;
        }
        #notice-content2 {
            padding-top : 5px;
            padding-left : 30px;
            width: 70%;
            background-color : rgb(224, 238, 238);

        }
        #notice-content3 {
            width: 20%;
            background-color : rgb(224, 238, 238);
            > div {
                width: 100%;
            }
        }
        #notice-content3-1 {
            height : 80%;
        }
        #notice-content3-2 {
            height : 20%;
        }
        #cs-center {
            > div {
                width: 100%;
            }
        }
        #cs-center-title {
            padding-left : 60px;
            height : 15%;
            padding-top : 10px;
        }
        #cs-center-content {
            height : 85%;
            line-height : 2;
            font-size : 25px;
            > div {
                float : left;
                height : 100%;
            }  
        }
        #cs-center-content1 {
            width: 10%;
        }
        #cs-center-content2 {
            width: 70%;
            padding-top : 25px;
            padding-left : 40px;
            background-color : rgb(224, 238, 238);
        }
        #cs-center-content3 {
            width: 20%;
            background-color : rgb(224, 238, 238);
        }
        #FAQ {
            > div {
                width: 100%;
            }
        }
        #FAQ-title {
            padding-left : 60px;
            height : 15%;
            padding-top : 10px;
        }
        #FAQ-content {
            height : 85%;
            line-height : 3;
            > div {
                float : left;
                height : 100%;
            }   
        }
        #FAQ-content1 {
            width: 10%;
        }
        #FAQ-content2 {
            width: 70%;
            padding-top : 5px;
            padding-left : 30px;
            background-color : rgb(224, 238, 238);
        }
        #FAQ-content3 {
            width: 20%;
            background-color : rgb(224, 238, 238);
            >div {
                width : 100%;
            }
        }
        #FAQ-content3-1 {
            height : 80%;
        }
        #FAQ-ceontent3-2 {
            height : 20%;
        }
        #question {
            > div {
                width: 100%;
            }
        }
        #question-title {
            padding-left : 60px;
            height : 15%;
            padding-top : 10px;
        }
        #question-content {
            height : 85%;
            line-height : 3;
            > div {
                float : left;
                height : 100%;
            }   
        }
        #question-content1 {
            width: 10%;
        }
        #question-content2 {
            width: 70%;
            padding-top : 5px;
            padding-left : 30px;
            background-color : rgb(224, 238, 238);
            position : relative;
        }
        #question-content2-1 {
            position : absolute;
            left : 40px;
            top : 70px;
            width : 80%;
            height : 40%;
            background-color : white;
        }
        #question-content3 {
            width: 20%;
            background-color : rgb(224, 238, 238);
        }
        #cs-map {
            height : 25%;
        }
        #map-title {
            height : 20%;
            padding-top : 20px;
            padding-left : 60px;
        }
        #map-content {
            background-color : rgb(224, 238, 238);
            width: 95%;
            height : 80%;
            margin-left : 60px;
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
    </Style>


</head>
<body>
    <div id="cs-wrap"> <!--전체를 감싸는 div-->
        <div id="cs-title"> <!-- 고객서비스 타이틀 영역-->
            <div id="cs-title-text">
                <h1><a href="">G.O.T.Y 고객 서비스</a></h1>
            </div>
            <div id="cs-title-sub"></div>
        </div>

        <div id="cs-content"> <!--고객서비스 컨텐트 영역-->
            <div id="notice"> <!--공지사항 영역-->
                <div id="notice-title">
                    <h3><a href="notices">공지사항</a></h3>
                </div>
                <div id="notice-content">
                    <div id="notice-content1">

                    </div>
                    <div id="notice-content2">
                        <li><a>[공지]2025년 설 연휴 배송 안내</a></li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                    </div>
                    <div id="notice-content3">
                        <div id="notice-content3-1">

                        </div>
                        <div id="notice-content3-2" align="right">
                            <button id="notice-list" type="button" class="btn btn-light">+더보기</button>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div id="cs-center"> <!--고객센터 영역-->
                <div id="cs-center-title">
                    <h3>고객센터</h3>
                </div>
                <div id="cs-center-content">

                    <div id="cs-center-content1">

                    </div>
                    <div id="cs-center-content2">
				                        ☎ 070-1234-5678 <br>
			                        평일 : 오전 10:00 ~ 오후 05:00 <br>
			                        점심 : 오전 11:30 ~ 오후 01:00 <br>
			                        휴무 : 토/일/공휴일 <br>
                    </div>
                    <div id="cs-center-content3">

                    </div>
                   
                </div>
            </div>

            <div id="FAQ"> <!--FAQ 영역-->
                <div id="FAQ-title">
                    <h3><a href="faqs">FAQ</a></h3>
                </div>
                <div id="FAQ-content">
                    <div id="FAQ-content1">

                    </div>
                    <div id="FAQ-content2">
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                        <li>[공지]2025년 설 연휴 배송 안내</li>
                    </div>
                    <div id="FAQ-content3">
                        <div id="FAQ-content3-1"></div>
                        <div id="FAQ-content3-2" align="right">
                            <button id="faq-list" type="button" class="btn btn-light">+더보기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="question"> <!-- 1:1문의 영역-->
                <div id="question-title">
                    <h3><a href="questions">1:1 문의</a></h3>
                </div>
                <div id="question-content">
                    <div id="question-content1">

                    </div>
                    <div id="question-content2">
                        <div id="question-content2-1">
                            <h6 style="font-size:15px; margin-top : 40px;"><a href="questions">G.O.T.Y를 이용하며 궁금한 사항들이 있으신가요?</a></h6>
                        </div>
                    </div>
                    <div id="question-content3">

                    </div>
                </div>
            </div>
        </div>

        <div id="cs-map"> <!--고객서비스 맵 영역-->
            <div id="map-title">
                <h3><a>찾아오시는 길</a></h3>                
            </div>
            <div id="map-content">
            
            </div>
        </div>
    </div>
    
    <script>
		$(function(){
			$('#notice-list').click(function(){
				location.href = 'notices';
			});
			
			$('#faq-list').click(function(){
				location.href = 'faqs';
			});
		})
    </script>
</body>
</html>