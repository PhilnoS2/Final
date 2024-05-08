<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>enrollForm</title>
<style>
	#enrollForm-div{
		width: 1200px;
		height: auto;
		margin: auto;
		border: 1px solid red;
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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="enrollForm-div">
		<form action="insert.member" method="post">
			<div id="inner-div">
				<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" name="memberId" placeholder="아이디를입력해주세요.">
				</div>
					
				<div class="form-group">
				  <label for="pwd">비밀번호</label>
				  <input type="password" class="form-control" id="pwd" name="memberPwd" placeholder="비밀번호를입력해주세요.">
				</div>
				
				<div class="form-group">
				  <label for="pwdCheck">비밀번호 확인</label>
				  <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 확인">
				</div>
				
				<div class="form-group">
				  <label for="name">이름</label>
				  <input type="text" class="form-control" id="name" name="memberName" placeholder="이름을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <label for="nickname">닉네임</label>
				  <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <label for="bornDate">생년월일</label>
				  <input type="text" class="form-control" id="bornDate" name="bornDate" placeholder="생년월일을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <label for="email">이메일</label>
				  <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요.">
				</div>
				
				<div class="form-group">
				  <label for="phone">전화번호</label>
				  <input type="text" class="form-control" id="phone" name="phone" placeholder=" - 제외하고 입력해주세요.">
				</div>
				<!-- 교체 예정 -->
				<div class="form-group">
				  <input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br>
				  <input type="text" id="roadAddress" name="address" placeholder="도로명주소">
				  <input type="text" id="detailAddress" name="addrDetail" placeholder="상세주소">
				  <span id="guide" style="color:#999;display:none"></span>
				</div>
				
			</div>	
			<div id="enroll-option">
				<a class="btn btn-sm btn-danger">돌아가기</a>
				<button class="btn btn-sm btn-info" type="submit">회원가입</button>
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

                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	
</body>
</html>