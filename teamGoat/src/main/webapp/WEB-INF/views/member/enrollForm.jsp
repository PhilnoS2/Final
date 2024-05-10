<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<meta charset="UTF-8">
<title>enrollForm</title>
<style>
	#enrollForm-div{
		width: 1200px;
		height: auto;
		margin: auto;
	}
	#inner-div {
		width: 60%;
		height: 80%;
		margin: auto;
		margin-top: 25px;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 10px;
	}
	#address-div{
		width: 60%;
		height: 5%;
		margin: auto;
		margin-top: 15px;
		border: 1px solid grey;
		border-radius: 5px;
		padding: 10px;
	}
	#enroll-option{
		width: 20%;
		height: 5%;
		margin: auto;
		margin-top: 10px;
		padding: 10px;
	}
	.regExRuleId,
	.regExRulePwd,
	.checkPwd,
	.checkName,
	.nickname,
	.bornDate,
	.email,
	.phone {
		margin: 3px;
		font-size: 12px;
		color: red;
		display: none;
	}
	
	.reAddr {
		display: none;
	}
	.form-group, .address-div{
		width: 80%;
		margin: auto;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="enrollForm-div">
		<form action="insert.member" method="post">
			<div id="inner-div">
				<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" name="memberId" required onkeyup="regExpCheckId();" placeholder="아이디를입력해주세요.">
					  <span class="regExRuleId">첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.</span>
				</div>
					
				<div class="form-group">
				  <label for="pwd">비밀번호</label>
				  <input type="password" class="form-control" id="pwd" name="memberPwd" required onkeyup="regExpCheckPwd();" placeholder="비밀번호를입력해주세요.">
				  <span class="regExRulePwd">영문과 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
				</div>
				
				<div class="form-group">
				  <label for="pwdCheck">비밀번호 확인</label>
				  <input type="password" class="form-control" id="pwdCheck" readonly name="pwdCheck" required onkeyup="comparePwd();" placeholder="비밀번호 확인">
				  <span class="checkPwd">입력한 비밀번호가 다릅니다. 다시 확인해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="name">이름</label>
				  <input type="text" class="form-control" id="name" name="memberName" onkeyup="regExpCheckName();"
				  maxlength="5" required placeholder="이름을 입력해주세요.">
				  <span class="checkName">최소 2글자 한글로입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="nickname">닉네임</label>
				  <input type="text" class="form-control" id="nickname" name="nickname" onkeyup="reqExpNickname();" required placeholder="닉네임을 입력해주세요.">
				  <span class="nickname">5글자 이내로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="bornDate">생년월일</label>
				  <input type="text" class="form-control" id="bornDate" name="bornDate" maxlength="8"
				  	onkeyup="reqExpBornDate();" required placeholder="(yyyyMMdd) 생년월일을 입력해주세요.">
				  <span class="bornDate">(yyyyMMdd) 숫자 8자리로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="email">이메일</label>
				  <input type="email" class="form-control" id="email" name="email" required onkeyup="reqExpEmail();"
				   placeholder="@포함한 이메일을 입력해주세요.">
				  <span class="email">이메일형식으로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="phone">전화번호</label>
				  <input type="text" class="form-control" id="phone" name="phone" maxlength="11"
				  	onkeyup="reqExpPhone();" required placeholder=" - 제외하고 입력해주세요.">
				  <span class="phone">- 제외한 11자리 숫자로 입력해주세요.</span>
				</div>
				
				<div class="address-div">
				  <input type="button" class="btn btn-sm btn-primary mb-2" onclick="execDaumPostcode()" value="주소 찾기"><br>
				  <input type="text" class="form-control d-inline" style="width: 60%;" id="roadAddress" name="address" placeholder="도로명주소" readonly required>
				  <input type="text" class="form-control mt-2 d-inline detail" onkeyup="reqDetailAddr();"
				  	style="width: 30%; display: inline-block;" id="detailAddress" name="addrDetail" placeholder="상세주소" required>
				</div>
			</div>	
			
			<div id="enroll-option">
				<button class="btn btn-sm btn-danger" type="button" onclick="history.back();" >돌아가기</button>
				<button class="btn btn-sm btn-info" id="submitBtn" disabled type="submit">회원가입</button>
			</div>
		</form>
	</div>
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: data => {
	              
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                
	                document.getElementById("roadAddress").value = roadAddr;
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';	
	                }
	            }
	        }).open();
	    }
	</script>

	
	<script src="resources/member/Js/regExp.js"></script>
</body>
</html>