 
 	  const regExpId = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
		  const regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
		  const regEmail =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		  
		  
		  const $id = $('#id');
		  const $name = $('#name');
		  const $email = $('#email');	
		  const $ment = $('#ment');
		  
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
			
			function submitForm(){
				$id.attr('readonly', true);
				$name.attr('readonly', true);
				$email.attr('readonly', true);
				$ment.css('display', 'block');
				$('#pwd-title').css('display', 'none');
				$('#pwd-p').css('display', 'none');
				$('#inner-div').css('border', '1px solid red');
			}