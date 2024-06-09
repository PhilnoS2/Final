<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/goty/resources/board/css/selectBoard.css" />
<title>selectBoard</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		
		<div class="wrapper-div-title"> 
			<div>	
				<label class="mr-2" for="boardTitle">제목</label>
				<h4>${ board.boardTitle }</h4>
			</div>
			<div id="title-div-2">
				<div>
					<label>카테고리</label>
					<h6>${ board.platformName }</h6>
				</div>
				<div>
					<label >글쓴이</label>
					<h6>${ board.nickname }</h6>
				</div>
				<c:if test="${ sessionScope.loginMember ne null and sessionScope.loginMember.memberNo == board.memberNo
				            or sessionScope.loginMember.memLevel == 'A' }">
					<div id="btn-div">
						<a class="btn btn-sm btn-warning" href="/goty/freeboards/update/${ boardNo }">수정</a>
						<button class="btn btn-sm btn-danger m-1" data-toggle="modal" data-target="#delModal">삭제</button>
					</div>
				</c:if>
			</div>
		</div>
		
		<div class="wrapper-div-title2">
			<div>
				<div style="border-bottom: 1px solid grey; width: 50%;">
					<label for="boardContent" >본문</label>
				</div>
				<br/>
				<div id="content-div" class="shadow p-4 mb-4 bg-white">
					<c:choose>
						<c:when test="${ board.imagePath eq null }">
							<div>
								<img src="/goty/resources/img/logo2.png" width="300px" height="200px;" />
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img src="/goty/${ board.imagePath }" width="300px" height="200px;" />
							</div>
						</c:otherwise>
					
					</c:choose>
					<div id="content-div-boardcontent">
						<p>${ board.boardContent }</p>
					</div>
				</div>
			</div>
		</div>
		
		<div id="review-area">
			<p class="m-3">리뷰</p>
			<c:choose>
				<c:when test="${ sessionScope.loginMember ne null  }">
					<div class="form-group w-75 mx-auto d-flex justify-content-between">
						<div id="review-area-div">
							<textarea id="replyArea" class="form-control mb-1" rows="3"
						  	 placeholder="댓글을 입력해주세요."></textarea>
						</div>
						<div id="reveiw-btn-div">
							<button class="btn btn-sm btn-dark " onclick="insertReply();">댓글등록</button>
						</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="review-div" class="form-group">
						<textarea class="form-control" rows="3" placeholder="리뷰를 입력하려면 로그인해야 합니다." readonly></textarea>
					</div>
				</c:otherwise>
				
			</c:choose>
			<div id="replyList-area">
			</div>
			
			<div class="container w-50 mx-auto d-flex justify-content-center">
				<ul id="pg" class="pagination"></ul>
			</div>
			
		</div>
				
	</div>
	
	
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
         <div class="border border-danger p-2 rounded w-100 ">
         	<h3>신고 사유</h3>
			<select id="report-reason" class="form-group">
				<option>욕설 및 비방</option>
				<option>광고 및 홍보물</option>
				<option>불법적인것</option>
				<option>기타</option>
			</select>
			<div class="form-group ">
				<div id="report-input" class="form-group invisible">
					<input class="form-control w-100 d-inline" id="reportInput" name="report"
					 placeholder="사유를 적어주세요." />
				</div>
				<button class="btn btn-sm btn-danger" onclick="reportReply();" data-dismiss="modal" >신고</button>
			</div>
         </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>

 <div class="modal fade" id="deleteReplyModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">댓글삭제하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
         <div class="border border-danger p-2 rounded w-100 ">
         	<h3>댓글 삭제</h3>

			<div class="modal-body">
		         <div class="p-2 rounded w-100 ">
					<p>정말 삭제 하시겠습니까?</p>
					<button class="btn btn-sm btn-danger" onclick="deleteRepley();" data-dismiss="modal" >삭제</button>
		         </div>
	        </div>
         </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>	

  <div class="modal fade" id="delModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">게시글 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
         <div class="border border-danger p-2 rounded w-100 ">
         	<h3>게시글 삭제</h3>
			<p>정말 삭제 하시겠습니까?</p>
			<button class="btn btn-sm btn-danger" onclick="deleteBoard();" data-dismiss="modal" >삭제</button>
         </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>	
	
	<script src="/goty/resources/board/js/selectBoard.js"></script>
	<script>
	 let seletReplyNo;

	$(() => {
		replyList(1);
	});
	
	function insertReply() {
		if(!regReplyCheck()){
			return;
		}
		
		const data = 
			{
				'freeBoardNo': '${ board.freeBoardNo }',
				'memberNo': '${ sessionScope.loginMember.memberNo }',
				'reviewContent': $('#replyArea').val()
			};
		
		$.ajax({
			url: '/goty/freeboards/reply',
			type: 'post',
			data: JSON.stringify(data),
			dataType:'json',
			contentType : 'application/json; charset=utf-8',
			success: (result) => {
					alert(result.message);
					$('#replyArea').val('');
					replyList(1);
			},
			
		});
	}
	
	
	function replyList(value) {
		const flag = '${ sessionScope.loginMember ne null}';
		const loginUserNo = '${ sessionScope.loginMember.memberNo}';	 
		$.ajax({
			url: '/goty/freeboards/replyList',
			data: {
				boardNo : '${ board.freeBoardNo }',
				page : value,
			},
			type: 'get',
			success: (result) => {
				if(result.data != null){
					$('#replyList-area').empty();
					$('#pg').empty();
					let content = '';
					
					pi = result.data.pi;
					replies = result.data.replies;
					console.log(replies);
					if(replies != null){
						replies.forEach((item) => {
							
							if(item.reviewWriter == null){
								item.reviewWriter = '(카카오)'+item.nickname;
							}
							
							if(item.status == 'NM'){
								item.reviewWriter = '(네이버)'+item.nickname;
							}
							
							if(item.deleteYn == "Y") {
								item.reviewContent = '삭제된 댓글입니다.';
							}
							
							$('#replyList-area').append('<div class="w-75 p-2 shadow mx-auto mb-2 bg-white border border-warning rounded-lg">'
														 +'<div class="d-flex p-1 m-1 justify-content-between">'
															+'<p class="mb-0 w-25 inline">'+item.createDate+'</p>'
															+'<div id='+item.reviewNo+'_div class="d-flex justify-content-between"><p class="mb-0 mr-1 inline">신고('+item.reportUsers.length+')</p>'
																+'<button id='+item.reviewNo+' class="btn btn-sm btn-danger m-1" '
																+'data-toggle="modal" data-target="#myModal" onclick="getReplyNo('+item.reviewNo+')">신고</button>'
																+'<button id='+item.reviewNo+'_del class="btn btn-sm btn-danger m-1" '
																+'data-toggle="modal" data-target="#deleteReplyModal" onclick="getReplyNo('+item.reviewNo+')">댓글 삭제</button>'
												            +'</div>'
											             +'</div>'
											             +'<p id="review-content" class="pl-2">'+item.reviewContent+'</p>'
											             +'<h5 id="review-writer">'+item.reviewWriter+'</h5>'
														 +'<div>'
														);
							// 로그인 하지 않았을경우
							if(flag == 'false') {
								$('#'+item.reviewNo+'_div').addClass('invisible');
							}
							
							//신고버튼
							if(flag == 'true' && loginUserNo != item.memberNo && item.deleteYn == "N"){
								$('#'+item.reviewNo).attr('disabled', false);
							}
							else {
								$('#'+item.reviewNo).attr('disabled', true);
							}
							
							for(report of item.reportUsers) {
								if(loginUserNo == report) {
									$('#'+item.reviewNo).attr('disabled', true);
								}
							}
							
							// 댓글삭제 버튼
							if(flag == 'true' && loginUserNo == item.memberNo && item.deleteYn == "N"){
								$('#'+item.reviewNo+"_del").attr('disabled', false);
							}
							else {
								$('#'+item.reviewNo+"_del").attr('disabled', true);
							}
							
						});
						
					}
					
					if(pi != null){
						if(pi.currentPage > 1){
							$('#pg').append('<li class="page-item"><button class="page-link" onclick="replyList('+(pi.currentPage-1)+')" >이전</button/></li>');	
						}
						
						for(let i = pi.startPage; i <= pi.endPage; i++){
							if(pi.currentPage != i){
								$('#pg').append('<li class="page-item"><button class="page-link" onclick="replyList('+i+')">'+ i +'</button></li')
							}else {
								$('#pg').append('<li class="page-item active"><button class="page-link" onclick="replyList('+i+')">'+ i +'</button></li')
							}						
						}
						
						if((pi.currentPage != pi.maxPage) && pi.currentPage != 1){
							$('#pg').append('<li class="page-item"><button class="page-link" onclick="replyList('+(pi.currentPage+1)+')" >다음</button/></li>')
						}
					}
		
				} else {
					console.log(result);
					$('#replyList-area').append('<p class="mx-auto font-italic font-weight-bold" style="width:250px">'+result.message+'</p>');
				}
			},
		});
	}
	
	
	
	$('#report-reason').change((e) => {
		if($('select option:selected').text() === '기타'){
			$('#report-input').removeClass('invisible');
		} else {
			$('#report-input').addClass('invisible');
		}
	});
	
	function getReplyNo(reviewNo){
		seletReplyNo = reviewNo; 
	}
	
	function reportReply(){
		const classNameCheck = $('#report-input').attr('class');
	
		if(!classNameCheck.includes('invisible') && !regReportCheck()) {
			return;
		}	

		const data = 
		{	'reviewNo' : seletReplyNo,
			'reportUser': '${ sessionScope.loginMember.memberNo }',
			'reportReason': $('select option:selected').text(),
			'etc': $('#reportInput').val()
		};
		
		$.ajax({
			url:'/goty/freeboards/report',
			type:'post',
			dataType:'json',
			contentType : 'application/json; charset=utf-8',
			data: JSON.stringify(data),
			success: (result) => {
				alert(result.message);
				getReplyNo(0);
				replyList(1);
			},
		
		});
	}
	
	function deleteBoard() {
		$.ajax({
			url:'/goty/freeboards/delete/'+'${ boardNo }',
			type: 'put',
			success: (result)=> {
				alert(result.message);
				getReplyNo(0);
				location.href="/goty/freeboards/all";
			},
			
		});
	}
	
	function deleteRepley() {
		$.ajax({
			url:'/goty/freeboards/deleteReply/'+ seletReplyNo,
			type: 'put',
			success: (result)=> {
				alert(result.message);
				getReplyNo(0);
				replyList(1);
			},
			
		});
	}
	</script>
	
</body>
</html>