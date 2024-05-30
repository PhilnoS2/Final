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
                    <c:if test="${ sessionScope.loginMember ne null and sessionScope.loginMember.memLevel == 'A' }">
                    	<button type="button" id="insert-faq" class="btn btn-light">글쓰기</button>
                    </c:if>
                </div>
            </div>
        </div>
        
        <script>
        	$(function(){
        		$('#insert-faq').click(function(){
        			location.href = '/goty/faq/enroll';
        		})
        	})
        
        </script>
        <div class="faq-search">
            <div>
                <select id="select-area" name="select" style="width : 100px; height : 40px; margin-left: 90px;">
                    <option value="0">전체</option>
                    <option value="1">상품문의</option>
                    <option value="2">주문/결제문의</option>
                    <option value="3">배송문의</option>
                    <option value="4">기타</option>
                </select>
            </div>
        </div>


        <div class="faq-content">
            
            <div style="margin-bottom:50px;"></div>
            
            <c:forEach items="${ faqList }" var="faq">
            	
	            <div class="faq-q">Q.${ faq.faqQuestion }</div>
	            <p class="faq-a">A.${ faq.faqAnswer }</p>
            </c:forEach>
        </div>
    </div>

    <script>
        $(function(){

            $(function(){
                $('#select-area').change(function(){
                    //console.log($('option:selected').val());
                    const category = $('option:selected').val();
                    // choice 값을 비동기통신의 데이터로 넘긴다, 넘긴 데이터를 Controller에서 VO의 카테고리 필드값에 대입한다.
                    $.ajax({
                    	url : 'faq/category',
                    	type : 'get',
                    	data : {category : category
                    	},
                    	success : function(result){
                    		console.log(result[0]);
                    		let text = '<div style="margin-bottom:50px;"></div>';
                    		for(let i in result){
								const faq = result[i];
								
								text += '<div class="faq-q">Q. '
									 + faq.faqQuestion
								     + '</div>'
								     + '<p class="faq-a"> A. '
								     + faq.faqAnswer
								     +'</p>'
                    		};
                    		$('.faq-content').html(text);
                    	}
                    });
                });
            });
             $(function(){
	        	$('.faq-content').on('click', ('.faq-q'), function(){
	                //console.log($(this));
	                const $a = $(this).next();
	
	                if($a.css('display') == 'none'){
	                	$(this).css('background-color', 'yellowgreen');
	                	$(this).siblings('div').css('background-color', 'rgb(216, 216, 211)');
	                    $a.slideDown(500);
	                    $a.siblings('p').slideUp(1000);
	                } 
	                else {
	                	
	                	$a.slideUp(500);
	                }
	            });
	        })
            
        })
        
       
    </script>

    
</body>
</html>