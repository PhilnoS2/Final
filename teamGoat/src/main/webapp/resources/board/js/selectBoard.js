	 const regReply = /^[ㄱ-ㅎ가-힣a-zA-Z0-9?!@#$%^&*()\s]{1,200}$/;
	 const $replyArea = $('#replyArea');
	 
	 const regReport = /^[ㄱ-ㅎ가-힣a-zA-Z0-9?!@#$%^&*()\s\S]{1,30}$/;
	 const $reportInput = $('#reportInput');
	 
	 function regReplyCheck(){
	 
	 	 
		 if(regReply.test($replyArea.val())){
				return true;	
		 }
		 else {
				alert('올바른 입력이 아닙니다.');
				$replyArea.val('');
				return false;
		 }
	 }
	 
	 function regReportCheck(){
	 	 
	   
		 if(regReport.test($reportInput.val())){
				return true;	
		 }
		 else {
				alert('올바른 입력이 아닙니다.');
				$reportInput.val('');
				return false;
		 }
	 }
	 	
	