        
        let regExpId = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
		let regExpPw = /^[a-zA-Z0-9!@#]{8,15}$/;
		let regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
		let regExpNickname = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{1,5}$/;
		let regExpBornDate = /^[0-9]{1,8}$/;
		let regEmail =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		let regExpPhone = /^[0-9]{1,11}$/;
		let regDetailAddr = /^[ㄱ-ㅎ가-힣0-9]{1,15}$/;
		
		
	    //입력양식접근
		const $id = $('#id');
		const $pwd = $('#pwd');
		const $pwdCheck = $('#pwdCheck');
		const $name = $('#name');
		const $nickname = $('#nickname');
		const $bornDate = $('#bornDate');
		const $email = $('#email');	
		const $phone = $('#phone');
		const $detailAddress = $('#detailAddress');
		const $submitBtn = $('#submitBtn');
	
		//표시문구
		const $regExRuleId = $('.regExRuleId');
		const $regExRulePwd = $('.regExRulePwd');
		const $checkPwd = $('.checkPwd');
		const $checkName= $('.checkName');
		const $checkNickname = $('.nickname');
		const $checkBornDate = $('.bornDate');
		const $checkEmail = $('.email');
		const $checkPhone = $('.phone');
		const $checkDetail = $('.detail')
		
		//아이디
 		function regExpCheckId(){
 			if(regExpId.test($id.val())){
 				$regExRuleId.css('display', 'none');
 			} else {
 				$regExRuleId.css('display', 'block');
 			}
 			submitCheck();
 		} 
 		
 		//비밀번호
		 function regExpCheckPwd(){
			if(regExpPw.test($pwd.val())){
				$regExRulePwd.css('display', 'none');
				$pwdCheck.attr('readonly', false);
			} else {
				$regExRulePwd.css('display', 'block');
				$pwdCheck.attr('readonly', true);
			}
			submitCheck();
		} 
 		
 		//비밀번호 확인
		function comparePwd(){
			if($pwd.val() === $pwdCheck.val()){
				$checkPwd.css('display', 'none');
			} else {
				$checkPwd.css('display', 'block');
			}
			submitCheck();
		} 
		
		//이름확인
		function regExpCheckName(){
			if(regExpName.test($name.val())){
				$checkName.css('display', 'none');
			} else {
				$checkName.css('display', 'block');
			}
			submitCheck();
		}
		
		//닉네임확인
 		function reqExpNickname(){
 			if(regExpNickname.test($nickname.val())){
 				$checkNickname.css('display', 'none');
 			} else{
 				$checkNickname.css('display', 'block');
 			}
 			submitCheck();
 		}
 		
 		//생년월일확인
 		function reqExpBornDate(){
 			if(regExpBornDate.test($bornDate.val())){
 				$checkBornDate.css('display', 'none');
 			} else{
 				$checkBornDate.css('display', 'block');
 			}
 			submitCheck();
 		}
 		
 		//이메일확인
 		function reqExpEmail(){
 			if(regEmail.test($email.val())){
 				$checkEmail.css('display', 'none');
 			} else{
 				$checkEmail.css('display', 'block');
 			}
 			submitCheck();
 		}
 		
 		//전화번호확인
		function reqExpPhone(){
			if(regExpPhone.test($phone.val())){
				$checkPhone.css('display', 'none');
			} else {
				$checkPhone.css('display', 'block');
			}
			submitCheck();
		}
		
		//상세주소확인
		function reqDetailAddr(){
			if(regDetailAddr.test($detailAddress.val())){
				$checkDetail.css('borderColor', '#ced4da');
			} else{
				$checkDetail.css('borderColor', 'red');
			}
			submitCheck()
		}

 		
 		// 가입버튼 활성화
 		function submitCheck(){
 			if(regExpPw.test($pwd.val())
 			   && regExpId.test($id.val())
 			   && regExpName.test($name.val())
 			   && regExpNickname.test($nickname.val())
 			   && regExpBornDate.test($bornDate.val())
 			   && regExpPhone.test($phone.val())
 			   && regEmail.test($email.val())
 			   && regDetailAddr.test($detailAddress.val())
 			   ) {
 				$submitBtn.attr('disabled', false);
 			} else {
 				$submitBtn.attr('disabled', true);
 			}
 		}
		