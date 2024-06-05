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
   	<script type="text/javascript" src="/goty/resources/smartEditor/workspace/static/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript">
		let oEditors = [];
	
	    	$(() => {
	           nhn.husky.EZCreator.createInIFrame({
	               oAppRef: oEditors,
	               elPlaceHolder: "content", //textarea에 부여한 아이디와 동일해야한다.
	               sSkinURI: "/goty/resources/smartEditor/workspace/static/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수
	               fCreator: "createSEditor2"
	           })
	       });
	
	    function submitContents() {
	    	 // 에디터의 내용이 textarea에 적용된다.
	    	  oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	    	  //console.log(document.getElementById("content").value);
	    	  const str = document.getElementById("content").value;
	    	  
	    	 // 에디터의 내용에 대한 값 검증은 이곳에서
	    	 //document.getElementById("editorTxt0").value를 이용해서 처리한다.
	    	 
	    	 // <p><br></p> 공백
	    	 // <p>&nbsp;</p> 띄어쓰기만
	    	 if(str.length < 0 || str.includes('<p>&nbsp;</p>')) {
	    		 alert('올바른 입력이 아닙니다.' + str);
	    		 return false;
	    	 }
	    	 else {
	    		 //alert(str);
	    		 return true;
	    	 }
	    }
	</script>
    
    

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
            height : 65%;
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
            height : 400px;
        }
        .margin-area {
        	width: 1000px; 
        	border-bottom : 1px solid black; 
        	margin-bottom : 20px; 
        	margin-left : 100px;
        }
        #category {
        	margin-top : 5px; 
        	height :30px;
        }
        #subject {
        	width : 400px; 
        	margin-bottom : 10px; 
        }
        .file-area {
        	margin-top : 5px; 
        	margin-bottom : 3px; 
        }
        .margin-area2 {
        	 width: 1000px; 
        	 border-bottom : 1px solid black; 
        	 margin-top : 20px; 
        	 margin-bottom : 20px;
        }
        .margin-area3 {
        	padding-right : 70px;
        }
        #submit-btn {
        	width: 70px;
        }
        .back-btn {
        	width: 70px; 
        }

    </style>

</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />

    <div id="question-wrap">
        <div class="question-title">
            <div><h3>1:1문의</h3></div>
        </div>
        <div class="margin-area"></div>

        <div class="question-content">
            <div>
                <form action="insert" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="memberNo" value="${ sessionScope.loginMember.memberNo }">
                    <label for="subject" >제목</label>
                    <select id="category" name="categoryNo">
	                    <option value="1">상품문의</option>
	                    <option value="2">주문/결제문의</option>
	                    <option value="3">배송문의</option>
	                    <option value="4">기타</option>
                    </select>            
                    <input type="text" id="subject" name="questionTitle" placeholder="제목을 입력해주세요"  required> <br>
                    <textarea id="content" name="questionContent" placeholder="내용을 입력해주세요" required></textarea>
                    <input type="file" class="file-area" name="upfile"> <br>
                    <div class="margin-area2"></div>

                    <div align="right" class="margin-area3">
                        <input id="submit-btn" type="submit" value="등록" onclick="return submitContents();">
                        <input class="back-btn" type="button" value="취소" onclick="history.back();">
                    </div>
                </form>
            </div>
        </div>
        <div class="list-page">
            <div>
                <button class="back-btn" onclick="history.back();">목록</button>
            </div>
        </div>
        <div class="button-area">
            <div></div>
        </div>
    </div>
    <script>
        $(function(){
            $('#submit-btn').click(function(){
                if(!confirm('게시글을 등록하시겠습니까?')){
                    return false;
                }
            })

            $('.back-btn').click(function(){
                if(!($('#content').val() == '')){
                    if(confirm('작성중인 글을 저장되지 않습니다 취소하시겠습니까?')){
                        location.href = 'http://naver.com';
                    }
                }
            })
        })
    </script>

    


</body>
</html>