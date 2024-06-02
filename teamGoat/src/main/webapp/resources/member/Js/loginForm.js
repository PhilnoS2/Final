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
 		
 		$('#kakao-login-btn').click(() =>{
			location.href= 'https://kauth.kakao.com/oauth/authorize'
				+'?client_id=${kakao_client_id}'
				+'&redirect_uri=http://localhost:8083/goty/kakaologin'
				+'&response_type=code'
				+'&scope=profile_image,profile_nickname';
		});
 		
 		$('#naver-login-btn').click(() => {
 			location.href = 'https://nid.naver.com/oauth2.0/authorize'
			 			  + '?response_type=code'
			 			  + '&client_id=${naver_client_id}'
			 			  + '&state=${state}'
			 			  + '&redirect_uri=http://localhost:8083/goty/naverlogin';
 		});