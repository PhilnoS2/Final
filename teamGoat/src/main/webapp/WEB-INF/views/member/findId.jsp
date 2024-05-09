<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find Id</title>
<style>
	#login-div{
		width: 1200px;
		height: 600px;
		margin: auto;
		z-index: 1;
	}
	#inner-div {
		width: 50%;
		height: 50%;
		margin: auto;
		margin-top: 150px;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 10px;	
	}
	#btn-option{
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	
	.regExRuleId, .regExRulePwd {
		font-size: 12px;
		color: red;
		display: none;
	}
	</style>
	
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<div id="login-div">
		<form action="login.member" method="post">
			<div id="inner-div">
				<h3>아이디찾기</h3>
				<div class="form-group">
				  <label for="id">이름</label>
				  <input type="text" class="form-control" id="id" placeholder="이름을 입력하세요."
				   onkeyup="regExpCheckId();" name="memberId">
				  <span class="regExRuleId">첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="pwd">전화번호</label>
				  <input type="text" class="form-control" id="pwd" 
				  onkeyup="" name="phone" placeholder="전화번호를를입력하세요.">
				  <span class=""></span>
				</div>
				
				<div class="form-group">
				  <label for="pwd">비밀번호</label>
				  <input type="password" class="form-control" id="pwd"
				   onkeyup="regExpCheckPwd();" name="memberPwd" placeholder="비밀번호를 입력하세요.">
				  <span class="regExRulePwd">영문과 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
				</div>
				
				
				<div id="btn-option">
					<button class="btn btn-sm btn-primary" id="submitBtn" disabled type="submit">찾기</button>
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
		
	</script>
</body>
</html>