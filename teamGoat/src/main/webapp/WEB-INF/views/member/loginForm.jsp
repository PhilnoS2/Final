<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#login-div{
		width: 1200px;
		height: 600px;
		margin: auto;
		z-index: 1;
	}
	#inner-div {
		width: 55%;
		height: 55%;
		margin: auto;
		margin-top: 150px;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 15px;	
	}
	#login-option{
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	#social-option {
		width: 50%;
		display: flex;
		align-items: center;
		justify-content: flex-start;
		flex-direction: column;
		margin-top: 10px;
	}
	#social-option a {
		width: 100%;
		margin-top: 10px;
	}
	.regExRuleId, .regExRulePwd {
		font-size: 12px;
		color: red;
		display: none;
	}
	.btn-img{
		width:100%;
		height:50px;
	}
	.btn-img:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="login-div">
		<form action="/goty/member/login" method="post">
			<div id="inner-div">
				<div class="form-group">
				  <label for="id">아이디</label>
				  <input type="text" class="form-control" id="id" onkeyup="regExpCheckId();" name="memberId">
				  <span class="regExRuleId">첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="pwd">비밀번호</label>
				  <input type="password" class="form-control" id="pwd" onkeyup="regExpCheckPwd();" name="memberPwd">
				  <span class="regExRulePwd">문자와 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
				</div>
				
				<div id="login-option">
					<div>
						<a class="btn btn-sm btn-secondary" href="/goty/member/findIdForm">아이디찾기</a>
						<a class="btn btn-sm btn-secondary" href="/goty/member/findPwdForm">비밀번호찾기</a>
					</div>
					<div >
						<a class="btn btn-sm btn-info" href="/goty/member/enrollForm">회원가입</a>
						<button class="btn btn-sm btn-primary" id="submitBtn" disabled type="submit">로그인</button>
					</div>
				</div>
				<div id="social-option">
					<a id="kakao-login-btn"><img class="btn-img"  src="/goty/resources/member/images/kakao_btn.png" /></a>
					<a id="naver-login-btn"><img class="btn-img" src="/goty/resources/member/images/naver_btn.png" /></a>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		let regExpId = /^[a-zA-Z0-9]{5,15}$/;
		let regExpPw = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/;
		
		// 아이디와 비밀번호
		const $id = $('#id');
		const $pwd = $('#pwd');
		const $submitBtn = $('#submitBtn');
		
		const $regExRuleId = $('.regExRuleId');
		const $regExRulePwd = $('.regExRulePwd');
		
 		function regExpCheckId(){
 			
 			if(regExpId.test($id.val())){
 				$regExRuleId.css('display', 'none');
 			} else {
 				$regExRuleId.css('display', 'block');
 			}
 			
 			if($id.val() === ''){
 				$regExRuleId.css('display', 'none');
 			}
 			submitCheck();
 		} 
 		
 		function regExpCheckPwd(){
 		
 			if(regExpPw.test($pwd.val())){
 				$regExRulePwd.css('display', 'none');
 			} else {
 				$regExRulePwd.css('display', 'block');
 			}
 			if($pwd.val() === ''){
 				$regExRulePwd.css('display', 'none');
 			}
 			submitCheck();
 		} 
		
 		
 		function submitCheck(){
 			if(regExpPw.test($pwd.val()) && regExpId.test($id.val())){
 				$submitBtn.attr('disabled', false);
 			} else {
 				$submitBtn.attr('disabled', true);
 			}
 		}
 		
 		$('#kakao-login-btn').click(() =>{
			location.href= 'https://kauth.kakao.com/oauth/authorize'
				+'?client_id=${kakao_client_id}'
				+'&redirect_uri=http://localhost:8083/goty/kakaologin'
				+'&response_type=code'
				+'&scope=profile_image,profile_nickname';
		});
 		
 		$('#naver-login-btn').click(() => {
 			location.href = 'https://nid.naver.com/oauth2.0/authorize'
			 			  + '?response_type=code'
			 			  + '&client_id=${naver_client_id}'
			 			  + '&state=${state}'
			 			  + '&redirect_uri=http://localhost:8083/goty/naverlogin';
 		});
	</script>
</body>
</html>