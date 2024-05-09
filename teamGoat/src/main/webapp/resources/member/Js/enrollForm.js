        
        let regExpId = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
		let regExpPw = /^[a-zA-Z0-9!@#]{8,15}$/;
		let regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
		let regExpNickname = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{1,5}$/;
		let regExpBornDate = /^[0-9]{1,8}$/;
		let regEmail =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		let regExpPhone = /^[0-9]{1,11}$/;
		let regDetailAddr = /^[ㄱ-ㅎ가-힣0-9]{1,15}$/;
		
		let flag = false;
		
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
 				
 				// idCheck() / 아이디 중복체크
 				idCheck();
 			} else {
 				$regExRuleId.text('첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.');
 				$regExRuleId.css('display', 'block');
 			}
 			
 			submitCheck();
 			
 			if($id.val() === ''){
 				$regExRuleId.css('display', 'none');
 			}
 		} 
 		
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
			submitCheck();
			
			if($pwd.val() === ''){
				$regExRulePwd.css('display', 'none');
			}
		} 
 		
 		//비밀번호 확인
		function comparePwd(){
			if($pwd.val() === $pwdCheck.val()){
				$checkPwd.css('display', 'none');
			} else {
				$checkPwd.css('display', 'block');
			}
			submitCheck();
			
			if($pwdCheck.val() === ''){
				$checkPwd.css('display', 'none');
			}
		} 
		
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
		
		//닉네임확인
 		function reqExpNickname(){
 			if(regExpNickname.test($nickname.val())){
 				$checkNickname.css('display', 'none');
 			} else{
 				$checkNickname.css('display', 'block');
 			}
 			submitCheck();
 			
 			if($nickname.val() === ''){
 				$checkNickname.css('display', 'none');
 			}
 		}
 		
 		//생년월일확인
 		function reqExpBornDate(){
 			if(regExpBornDate.test($bornDate.val())){
 				$checkBornDate.css('display', 'none');
 			} else{
 				$checkBornDate.css('display', 'block');
 			}
 			submitCheck();
 			
 			if($bornDate.val() === ''){
 				$checkBornDate.css('display', 'none');
 			}
 		}
 		
 		//이메일확인
 		function reqExpEmail(){
 			if(regEmail.test($email.val())){
 				$checkEmail.css('display', 'none');
 			} else{
 				$checkEmail.css('display', 'block');
 			}
 			submitCheck();
 			
 			if($email.val() === ''){
 				$checkEmail.css('display', 'none');
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
		
		//상세주소확인
		function reqDetailAddr(){
			if(regDetailAddr.test($detailAddress.val())){
				$checkDetail.css('borderColor', '#ced4da');
			} else{
				$checkDetail.css('borderColor', 'red');
			}
			submitCheck();
			
			if($detailAddress.val() === ''){
				$checkDetail.css('borderColor', '#ced4da');
			}
		}

 		
 		// 가입버튼 활성화
 		function submitCheck(){
 			
 			if(regExpId.test($id.val())
 			   && regExpPw.test($pwd.val())
 			   && regExpName.test($name.val())
 			   && regExpNickname.test($nickname.val())
 			   && regExpBornDate.test($bornDate.val())
 			   && regExpPhone.test($phone.val())
 			   && regEmail.test($email.val())
 			   && regDetailAddr.test($detailAddress.val())
 			   && !flag
 			) {
 				$submitBtn.attr('disabled', false);
 			} else{
 				$submitBtn.attr('disabled', true);
 				
			} 		
 		}
 		
 		
 		// 아이디중복체크 함수
 		function idCheck(){
	 		$.ajax({
	 			url: 'idCheck.member',
	 			type:'get',
	 			data: { 
	 				checkId: $id.val(),
	 			},
	 			success: (data) => {
	 				if(data == 'YD'){
	 					$regExRuleId.text('중복된 아이디입니다.');
	 					$regExRuleId.css('display', 'block');
	 					flag = true;
	 					submitCheck();
	 				} else {
	 					$regExRuleId.css('display', 'none');
	 					flag = false;
	 					submitCheck();
	 				}
	 			},
	 			error: (err) => {
	 				console.log(err);
	 			}
	 		});
 		}
 		
 		
		