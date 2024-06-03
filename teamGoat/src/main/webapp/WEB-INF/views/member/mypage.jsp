<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/goty/resources/member/css/myPage.css" />
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="left-side">
			<div>
				<h3 class="side-title">사용자 옵션</h3>
			</div>
				<ul id="ul-userOpt">
					<li class="li-option">
						<a class="btn btn-lg btn-info" href="#" >구매 내역</a>
					</li>
					<li class="li-option">
						<a class="btn btn-lg btn-info" href="#" >문의 내역</a>
					</li>
					<li class="li-option">
						<a class="btn btn-md btn-info" href="/goty/cart?memberNo=${ sessionScope.loginMember.memberNo }" style="white-space: nowrap;" >장바구니 목록</a>
					</li>
					<c:if test="${ sessionScope.loginMember.status == 'GT' }">
						<li class="li-option">
							<a class="btn btn-lg btn-info" href="/goty/member/updateForm/${ sessionScope.loginMember.memberNo }" >정보 수정</a>
						</li>
					</c:if>
				</ul>
		</div>
		<div id="right-side">
		
			<h3 class="side-title">개인 정보</h3>
			<c:choose>
				<c:when test="${ sessionScope.loginMember != null }">
						
					<c:choose>
						<c:when test="${ sessionScope.loginMember.status == 'GT' }">
							<div id="userInfo">
								<div class="userInfo-div">
									<label>아이디 : </label>
									<h6>${ sessionScope.loginMember.memberId }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>이름 : </label>
									<h6>${ sessionScope.loginMember.memberName }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>닉네임 : </label>
									<h6>${ sessionScope.loginMember.nickname }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>이메일 : </label>
									<h6>${ sessionScope.loginMember.email }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>생년월일 : </label>
									<h6>${ sessionScope.loginMember.bornDate }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>전화번호 : </label>
									<h6>${ sessionScope.loginMember.phone }</h6>
								</div>
								
								<div class="userInfo-div">
									<label>주소</label>
									<br/>
									<h6>${ sessionScope.loginMember.address }</h6>
									<h6>${ sessionScope.loginMember.addrDetail }</h6>
								</div>
							</div>	
						</c:when>
						
						<c:when test="${ sessionScope.loginMember.status == 'KM' }">
							<div class="userInfo-div">
								<h6 style="color: #ffc107;">카카오 로그인 회원입니다.</h6>
							</div>
							<div class="userInfo-div">
								<label>카카오 발급 아이디 : </label>
								<h6>${ sessionScope.loginMember.memberId }</h6>
							</div>
							<div class="userInfo-div">
								<label>닉네임 : </label>
								<h6>${ sessionScope.loginMember.nickname }</h6>
							</div>
							<div class="userInfo-div">
								<label>프로필 사진</label>
								<br/>
								<img src="${ sessionScope.loginMember.thumbnailImage }" width="200px" height="200px"/>
							</div>
							<div class="userInfo-div">
								<label>회원 등급 : </label>
								<h6>${ sessionScope.loginMember.memLevel }</h6>
							</div>
						</c:when>
						
						<c:when test="${ sessionScope.loginMember.status == 'NM' }">
						    <div class="userInfo-div">
								<h6 style="color: green;">네이버 로그인 회원입니다.</h6>
							</div>
						    <div class="userInfo-div">
								<label>네이버 발급 아이디 : </label>
								<h6>${ sessionScope.loginMember.memberId }</h6>
							</div>
							<div class="userInfo-div">
								<label>이름 : </label>
								<h6>${ sessionScope.loginMember.memberName }</h6>
							</div>
							<div class="userInfo-div">
								<label>닉네임 : </label>
								<h6>${ sessionScope.loginMember.nickname }</h6>
							</div>
							<div class="userInfo-div">
								<label>전화번호 : </label>
								<h6>${ sessionScope.loginMember.phone }</h6>
							</div>
							<div class="userInfo-div">
								<label>출생년도 : </label>
								<h6>${ sessionScope.loginMember.bornDate }</h6>
								<div class="userInfo-div">
									<label>회원 등급 : </label>
									<h6>${ sessionScope.loginMember.memLevel }</h6>
								</div>
							</div>
						</c:when>
						
					</c:choose>					
				</c:when>
				
				<c:otherwise>
					<div class="userInfo-div">
						<h6>표시할 정보가 없습니다.</h6>
					</div>
				</c:otherwise>
				
			</c:choose>
			<div class="Clearfix">
				<button class="btn btn-sm btn-danger float-right" type="button" data-toggle="modal" data-target="#myModal">탈퇴하기</button>
			</div>
		</div>
	</div>
	
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h4 class="modal-title">탈퇴 여부를 확인해주세요.</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <div class="modal-body">
	        <p class="d-inline ">정말 <p class="d-inline text-danger font-italic">탈퇴</p> 하시겠습니까?</p>
	        
        	<c:if test="${ sessionScope.loginMember.status == 'KM' 
        	              or sessionScope.loginMember.status == 'NM'}">
        	    <button type="button" id="signoutSocialMember" class="btn btn-danger" >탈퇴</button>          
        	</c:if>
        	<c:if test="${ sessionScope.loginMember.status == 'GT' }">
        		<button type="button" id="signoutMemberBtn" class="btn btn-danger" >탈퇴</button>
        	</c:if>
	        
	      </div>
	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>

	</div>

	
	<script>
		$('#signoutMemberBtn').click(() => {
			console.log('${sessionScope.loginMember.memberNo }');
			
			$.ajax({
				url: '/goty/member/${sessionScope.loginMember.memberNo }',
				type: 'patch',
				success: (result) => {
					if(result.responseCode == '299'){
						alert(result.message);
						location.href = "/goty/member/logout";
					}
				},
				
			});
		});
		
		$('#signoutSocialMember').click(() => {
			console.log('${sessionScope.loginMember.memberNo }');
			
			$.ajax({
				url: '/goty/member/${sessionScope.loginMember.memberNo }',
				type: 'delete',
				success: (result) => {
					if(result.responseCode == '299'){
						alert(result.message);
						location.href = "/goty/member/logout";
					}
				},
				
			});
		});
		
		
		
	</script>
	
	
	
	
</body>
</html>