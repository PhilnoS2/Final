<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	#login-option{
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	#social-option {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		margin-top: 10px;
	}
	#social-option a {
		width: 80%;
		margin-top: 10px;
	}
	#btn-option {
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	.regExRulePwd, .checkPwd{
		font-size: 12px;
		color: red;
		display: none;
		margin-top: 3px;
	}
	.inner-div-p{
		font-size: 14px;
	}
</style>
<meta charset="UTF-8">
<title>update Pwd Form</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form action="updatePwd.member" method="post">
				<div id="inner-div">
					<h3>비밀번호 변경하기</h3>
					<p class="inner-div-p">회원님은 현재 <b style="font-size: 15px;">임시 인증</b> 상태입니다.</p>
					<p class="inner-div-p">비밀번호를 변경해주세요. <b style="color:red; font-size: 11px;">(변경 전 까지 서비스 이용이 불가)</b></p>
					
					<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" readonly name="memberId" value="${memberId}">
					</div>
				
					<div class="form-group">
					  <label for="pwd">새로운 비밀번호 입력</label>
					  <input type="password" class="form-control" id="pwd" onkeyup="regExpCheckPwd();" name="memberPwd">
					  <span class="regExRulePwd">문자와 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
					</div>
				
					<div class="form-group">
					  <label for="pwdCheck">새로운 비밀번호 확인</label>
					  <input type="password" class="form-control" id="pwdCheck" readonly name="pwdCheck" required onkeyup="comparePwd();" placeholder="비밀번호 확인">
					  <span class="checkPwd">입력한 비밀번호가 다릅니다. 다시 확인해주세요.</span>
					</div>
					
					<div id="btn-option">
						<button class="btn btn-sm btn-primary" id="updatePwdBtn" disabled type="submit">비밀번호 변경</button>
					</div>
					
				</div>
			</form>
		</div>
		
		<script>
		  const regExpPw = /^[a-zA-Z0-9!@#]{8,15}$/;
		  let flag = false;
		  
		  // input요소
		  const $id = $('#id');
		  const $pwd = $('#pwd');
		  const $pwdCheck = $('#pwdCheck');
		  
		  // 문구표시태그
		  const $regExRulePwd = $('.regExRulePwd');
		  const $checkPwd = $('.checkPwd');
		  
		  // 비밀번호변경버튼 /아이디/비밀번호/비밀번호확인
		  const $updatePwdBtn = $('#updatePwdBtn');
			
		  
		//비밀번호
			 function regExpCheckPwd(){
				if(regExpPw.test($pwd.val())){
					$regExRulePwd.css('display', 'none');
					$pwdCheck.attr('readonly', false);
				} else {
					$regExRulePwd.css('display', 'block');
					$pwdCheck.attr('readonly', true);
					$pwdCheck.val('');
				}

				updatePwdBtn();
				if($pwd.val() === ''){
					$regExRulePwd.css('display', 'none');
				}
			} 
	 		
	 		//비밀번호 확인
			function comparePwd(){
				if($pwd.val() === $pwdCheck.val()){
					$checkPwd.css('display', 'none');
					flag = true;
				} else {
					$checkPwd.css('display', 'block');
					flag = false;
				}
				updatePwdBtn();
				if($pwdCheck.val() === ''){
					$checkPwd.css('display', 'none');
					flag = false;
				}
				
			} 

			// 비밀번호변경버튼함수
			function updatePwdBtn(){				
				if($id.val() != ''
				   && regExpPw.test($pwd.val()) && flag) {
					console.log('test');
					$updatePwdBtn.attr('disabled', false);
	 			} else{
	 				$updatePwdBtn.attr('disabled', true);
				} 		
	 		}
			
			
		</script>
</body>
</html>