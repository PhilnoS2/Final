 
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