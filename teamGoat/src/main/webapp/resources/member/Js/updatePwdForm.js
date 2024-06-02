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
					$updatePwdBtn.attr('disabled', false);
	 			} else{
	 				$updatePwdBtn.attr('disabled', true);
				} 		
	 		}