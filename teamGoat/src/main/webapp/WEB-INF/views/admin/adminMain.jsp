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
        #admin-wrap {
            margin : auto;
            width: 1200px;
            height : 1000px;
            > div {
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
            > div {
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
            > div {
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
        .admin-contents {
            height : auto;
        }
        .admin-button {
            margin-top : 30px;
            height : 10%;
        }
		
		#search-area {
			width : 100px; 
			height: 40px;
		}
		.input-keyword {
			width : 350px; 
			height: 40px;" 
		}
		.input-submit {
			height : 40px;"
		}
		#select-all{
			margin-top : 20px; 
		}
		.table {
			width : 800px; 
			height : 20px;
			margin-left : 30px;
		}
		.thead {
			height : 40px; 
			background-color : lightgrey;
		}
		#delete-btn {
			margin-right : 15px;
		}
		.margin-area {
			border-bottom:1px solid black; 
			padding-bottom:30px;
		}
		.table-td {
			height : 100px;
		}
		
		.table-tr {
			height : 40px;
		}
		.management-member {
			color : rgb(231, 76, 60);
		}

    </style>


</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


    <div id="admin-wrap">
        
        <!--관리자 사용탭-->
        <div class="admin-function" align="center">
            <div>
                <h3><a href="/goty/admin" class="management-member">회원 관리</a></h3>
            </div>
            <div>
                <h3><a href="/goty/management/boards">게시판 관리</a></h3>
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
                    <form action="/goty/admin/member/find">
                        <select name="condition" id="search-area">
                            <option value="name">이름</option>
                            <option value="id">아이디</option>
                            <option value="nickname">닉네임</option>
                        </select>
                        <input class="input-keyword" type="text" name="keyword" placeholder="조회할 내용을 입력해주세요">
                        <input class="input-submit" type="submit" value="검색">
                    </form>
                    <input id="select-all" type="button" value="전체 선택">

                </div>
            </div>

            <!-- 조회된 컨텐트 영역-->
            <div class="admin-contents">
                <table class="table" border="1" align="center">
                    <thead align="center" class="thead">
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
                        <c:choose>
                        	<c:when test="${ empty memberList }">
	                            <td class="table-td" colspan="9" align="center"><b>등록된 회원이 존재하지 않습니다.</b></td>
                        	</c:when>
                        	<c:otherwise>
	                        	<form id="update" action="" method="post">
                            		<input class="add-point" type="hidden" name="point" value="">
		                       	 	<c:forEach items="${ memberList }" var="member">
			                        	<tr class="table-tr">
			                            	<td><input class="check-option" type="checkbox" name="memberNo" value="${ member.memberNo }">
			                            	</td>
				                            <td>${ member.memberNo }</td>
				                            <td>${ member.enrollDate }</td>
				                            <td>${ member.memberName }</td>
				                            <td>${ member.memberId }</td>
				                            <td>${ member.memLevel }</td>
				                            <td>${ member.totalPrice }</td>
				                            <td>${ member.memberPoint }</td>
				                        </tr>
		                        	</c:forEach>
                        		</form>
                        	</c:otherwise>
                        </c:choose>
                </table>
            </div>
		
            <!-- 관리자 기능 버튼 + 페이징 버튼 영역-->
            <div class="admin-button">
                <div style="margin-left : 20px;">
                    <button id="delete-btn" class="btn btn-sm btn-danger">선택 탈퇴</button><button id="point-btn" class= "btn btn-sm btn-success">선택 적립금 지급</button>
                </div>
                <div align="center" class="margin-area">
                     <c:choose>
                    	<c:when test="${pageInfo.currentPage eq  1}">
	                    	<button type="button" class="btn btn-warning disabled"> < </button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" class="btn btn-warning"> < </button>
                    	</c:otherwise>
                    </c:choose>
                    
                   	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage }" var="p">
                   		<a id="number${ p }" class="btn btn-light" href="/goty/admin?page=${ p }">${ p }</a>
                   	</c:forEach>
                   	
                    <c:choose>
                    	<c:when test="${pageInfo.currentPage eq pageInfo.endPage }">
                    		<button type="button" class="btn btn-warning disabled"> > </button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" class="btn btn-warning"> > </button>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            $('#select-all').on('click', function(){
              	$('.check-option').prop('checked', true);
            });
        });
        
    	$(function(){
			$('#delete-btn').click(function(){
				if($('input:checkbox[class="check-option"]').is(":checked") == true){
					if(confirm('선택한 회원을 정말 탈퇴시키겠습니까?')){
						$('#update').attr('action', '/goty/admin/member/delete');
						$('#update').submit();
					}
				}
				else {
					alert('선택된 회원이 없습니다');
				}
			});
			$('#point-btn').click(function(){
				if($('input:checkbox[class="check-option"]').is(":checked") == true){
					let point;
					do {
						point = prompt("부여할 적립금을 입력해주세요(숫자만 입력 가능)");
					}
					while(isNaN(point));
					if(point != null){
						$('.add-point').val(point);
						$('#update').attr('action', '/goty/admin/member/update/point');
						$('#update').submit();
					}
				}
				else{
					alert('선택된 회원이 없습니다');
				}
			});
		});
    </script>

</body>
</html>