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
	#btn-option{
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	
	.regExRuleId, .checkName, .email {
		font-size: 12px;
		color: red;
		display: none;
	}
	</style>
<meta charset="UTF-8">
<title>find Pwd</title>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form action="findPwd.member" method="post">
				<div id="inner-div">
					<h3>비밀번호 찾기</h3>
					
					<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" name="memberId" required onkeyup="regExpCheckId();" placeholder="아이디를입력해주세요.">
					  <span class="regExRuleId">첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="name">이름</label>
					  <input type="text" class="form-control" id="name" name="memberName" onkeyup="regExpCheckName();"
					  maxlength="5" required placeholder="이름을 입력해주세요.">
					  <span class="checkName">최소 2글자 한글로입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="email">이메일</label>
					  <input type="email" class="form-control" id="email" name="email" required onkeyup="reqExpEmail();"
					   placeholder="@포함한 이메일을 입력해주세요.">
					  <span class="email">이메일형식으로 입력해주세요.</span>
					</div>
					
					<div id="btn-option">
						<button class="btn btn-sm btn-primary" id="findPwdBtn" disabled type="submit">찾기</button>
					</div>
					
				</div>
			</form>
		</div>
		
		<script>
		  const regExpId = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
		  const regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
		  const regEmail =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		  
		  
		  const $id = $('#id');
		  const $name = $('#name');
		  const $email = $('#email');	
		  
		  
		  const $regExRuleId = $('.regExRuleId');
		  const $checkName= $('.checkName');
		  const $checkEmail = $('.email');
		  
		  // findPwdBtn 비밀번호찾기버튼 /아이디/이름/이메일
		  const $findPwdBtn = $('#findPwdBtn');
		  
			//아이디
	 		function regExpCheckId(){
	 			if(regExpId.test($id.val())){
	 				$regExRuleId.css('display', 'none');
	 			} else {
	 				$regExRuleId.text('첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.');
	 				$regExRuleId.css('display', 'block');
	 			}
	 			
				findPwdBtn();
	 			if($id.val() === ''){
	 				$regExRuleId.css('display', 'none');
	 			}
	 		}
			
	 		//이름확인
			function regExpCheckName(){
				if(regExpName.test($name.val())){
					$checkName.css('display', 'none');
				} else {
					$checkName.css('display', 'block');
				}
	
				findPwdBtn();
				if($name.val() === ''){
					$checkName.css('display', 'none');
				}
			}
	 		
			//이메일확인
	 		function reqExpEmail(){
	 			if(regEmail.test($email.val())){
	 				$checkEmail.css('display', 'none');
	 			} else{
	 				$checkEmail.css('display', 'block');
	 			}
	
	 			findPwdBtn();
	 			if($email.val() === ''){
	 				$checkEmail.css('display', 'none');
	 			}
	 		}
			
			// 비밀번호찾기버튼함수
			function findPwdBtn(){
				if(regExpId.test($id.val())
	 			   && regExpName.test($name.val())
	 			   && regEmail.test($email.val())
	 			) {
					$findPwdBtn.attr('disabled', false);
	 			} else{
					$findPwdBtn.attr('disabled', true);
				} 		
	 		}
		</script>
</body>
</html>