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
		width: 55%;
		height: 55%;
		margin: auto;
		margin-top: 150px;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 15px;	
	}
	#btn-option{
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	
	.checkName, .phone, .regExRulePwd {
		font-size: 12px;
		color: red;
		display: none;
	}
	</style>
	
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form action="findId.member" method="post">
				<div id="inner-div">
					<h3>아이디 찾기</h3>
					
					<div class="form-group">
					  <label for="name">이름</label>
					  <input type="text" class="form-control" id="name" name="memberName" onkeyup="regExpCheckName();"
					  	maxlength="5" required placeholder="이름을 입력해주세요.">
					  <span class="checkName">최소 2글자 한글로입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="phone">전화번호</label>
					  <input type="text" class="form-control" id="phone" name="phone" maxlength="11"
					  	onkeyup="reqExpPhone();" required placeholder=" - 제외하고 입력해주세요.">
					  <span class="phone">- 제외한 11자리 숫자로 입력해주세요.</span>
					</div>
					
					<div id="btn-option">
						<a class="btn btn-sm btn-secondary mr-2" href="findPwdForm.member">비밀번호찾기</a>
						<button class="btn btn-sm btn-primary" id="submitBtn" disabled type="submit">찾기</button>
					</div>
					
				</div>
			</form>
		</div>
	
		<script>
			const regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
			const regExpPhone = /^[0-9]{1,11}$/;			
			
			const $name = $('#name');
			const $phone =$('#phone');
			const $submitBtn = $('#submitBtn');
			
			const $checkName = $('.checkName');
			const $checkPhone = $('.phone');
			
			//이름확인
			function regExpCheckName(){
				if(regExpName.test($name.val())){
					$checkName.css('display', 'none');
				} else {
					$checkName.css('display', 'block');
				}
				
				submitCheck();
				if($name.val() === ''){
					$checkName.css('display', 'none');
				}
			}
	 		
			//전화번호확인
			function reqExpPhone(){
				if(regExpPhone.test($phone.val())){
					$checkPhone.css('display', 'none');
				} else {
					$checkPhone.css('display', 'block');
				}
				submitCheck();
				if($phone.val() === ''){
					$checkPhone.css('display', 'none');
				}
			}
			
	 		function submitCheck(){
	 			if(regExpName.test($name.val())
	 			   && regExpPhone.test($phone.val())) {
	 				$submitBtn.attr('disabled', false);
	 			} else {
	 				$submitBtn.attr('disabled', true);
	 			}
	 		}
			
		</script>
</body>
</html>