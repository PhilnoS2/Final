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
        }
        #faq-wrap {
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
        .faq-title {
            height : 10%;
            > div {
                height : 100%;
                float : left;
            }
        }
        .faq-title-title {
            width : 40%;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 95px;
                top : 30px;
            }    
        }
        .faq-title-insert {
            width : 60%;
            position : relative;
            > div {
                display : inline-block;
                position : absolute;
                left : 540px;
                top : 25px;
            }    
        }
        .faq-search {
            height : 5%;
        }
        .faq-content {
            height : 85%;
            padding-left : 95px;
        }
        .faq-q {
            width : 800px;
            height : 60px;
            background-color : rgb(216, 216, 211);
            border : 1px solid grey;
            border-radius : 8px;
            color : black;
            font-size : 20px;
            font-weight : bolder;
            padding : 15px;
            cursor : pointer;
        }
        .faq-a {
            width : 800px;
            height : 60px;
            background-color : rgba(255, 255, 255, 0.788);
            border : 1px solid grey;
            border-radius : 8px;
            color : black;
            font-size : 20px;
            font-weight : bolder;
            padding : 15px;
            margin-bottom : 0;
            display : none;
        }
        .faq-q:hover {
			background-color : yellowgreen;        
        }
    </style>

</head>
<body>

	<jsp:include page="../../common/menubar.jsp" />
	
    <div id="faq-wrap">
        <div class="faq-title">
            <div class="faq-title-title">
                <div>
                    <a><h3>자주묻는질문 FAQ</h3></a>
                </div>
            </div>
            <div class="faq-title-insert">
                <div>
                    <!--추후 로그인한 유저 + 관리자일 경우에만 글 작성 버튼을 누를 수 있게 수정 필요-->
                    <button type="button" id="insert-faq" class="btn btn-secondary">글쓰기</button>
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
            <!--DB에서 조회해온 데이터를 반복문 돌려야 함-->
            <div style="margin-bottom:50px;"></div>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
            <div class="faq-q">Q.질문입니다</div>
            <p class="faq-a">A.답변입니다</p>
        </div>
    </div>

    <script>
        $(function(){
        	$('#insert-faq').click(function(){
        		location.href = 'faq-enroll';
        	})
            
	        $('#select-area').change(function(){
	            //console.log($('option:selected').val());
	            const choice = $('option:selected').val();
	            // choice 값을 비동기통신의 데이터로 넘긴다, 넘긴 데이터를 Controller에서 VO의 카테고리 필드값에 대입한다.
	            console.log(choice);
	        });
           
            $('.faq-content').on('click', ('.faq-q'), function(){
                //console.log($(this));
                const $a = $(this).next();

                if($a.css('display') == 'none'){
                    $a.slideDown(500);
                    $a.siblings('p').slideUp(1000);
                } 
                else {
                    $a.slideUp(500);
                }
            })
        })
    </script>

    
</body>
</html>