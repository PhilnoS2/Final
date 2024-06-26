        
		const regExpName = /^[ㄱ-ㅎ가-힣]{2,}$/;
		const regExpNickname = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{1,5}$/;
		const regExpBornDate = /^[0-9]{1,8}$/;
		const regEmail =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		const regExpPhone = /^[0-9]{1,11}$/;
		const regDetailAddr = /^[ㄱ-ㅎ가-힣0-9]{1,15}$/;
		
		let emailFlag = false;
		let phoneFlag = false;
		
		const $name = $('#name');
		const $nickname = $('#nickname');
		const $bornDate = $('#bornDate');
		const $email = $('#email');	
		const $phone = $('#phone');
		const $detailAddress = $('#detailAddress');

		//회원가입버튼
		const $submitBtn = $('#submitBtn');

		//에러표시태그접근
		const $checkName= $('.checkName');
		const $checkNickname = $('.nickname');
		const $checkBornDate = $('.bornDate');
		const $checkEmail = $('.email');
		const $checkPhone = $('.phone');
		const $checkDetail = $('.detail')
		
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
 			
 				//이메일중복확인
 				if($email.val().substring($email.val().lastIndexOf('.')).length >= 2){
 					emailCheck();
 				}
 			} else{
 				$checkEmail.text('이메일형식으로 입력해주세요.');
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
				if($phone.val().length >=11){
					phoneCheck();
				}
			} else {
				$checkPhone.text('- 제외한 11자리 숫자로 입력해주세요.');
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

 		
 		// 회원가입버튼 활성화
 		function submitCheck(){
 			if(regExpName.test($name.val())
 			   && regExpNickname.test($nickname.val())
 			   && regExpBornDate.test($bornDate.val())
 			   && regExpPhone.test($phone.val())
 			   && regEmail.test($email.val())
 			   && regDetailAddr.test($detailAddress.val())
 			   && !emailFlag 
 			   && !phoneFlag
 			) {
 				$submitBtn.attr('disabled', false);
 			} else{
 				$submitBtn.attr('disabled', true);
 				
			} 		
 		}
	
 		// 이메일중복체크요청함수
 		function emailCheck(){
	 		$.ajax({
	 			url: '/goty/member/emailCheck',
	 			type:'get',
	 			data: { 
	 				checkEmail: $email.val(),
	 			},
	 			success: (data) => {
	 				
	 				if(data == 'YD'){
	 					$checkEmail.text('중복된 이메일이 존재합니다.');
	 					$checkEmail.css('display', 'block');
	 					emailFlag = true;
	 					submitCheck();
	 				} else {
	 					$checkEmail.css('display', 'none');
	 					emailFlag = false;
	 					submitCheck();
	 				}
	 			},
	 			error: (err) => {
	 				console.log(err);
	 			}
	 		});
 		}
 		
 		// 전화번호중복체크요청함수
 		function phoneCheck(){
	 		$.ajax({
	 			url: '/goty/member/phoneCheck',
	 			type:'get',
	 			data: { 
	 				checkPhone: $phone.val(),
	 			},
	 			success: (data) => {
	 				if(data == 'YD'){
	 					$checkPhone.text('중복된 전화번호가 존재합니다.');
	 					$checkPhone.css('display', 'block');
	 					phoneFlag = true;
	 					submitCheck();
	 				} else {
	 					$checkPhone.css('display', 'none');
	 					phoneFlag = false;
	 					submitCheck();
	 				}
	 			},
	 			error: (err) => {
	 				console.log(err);
	 			}
	 		});
 		}
		
		
		
		