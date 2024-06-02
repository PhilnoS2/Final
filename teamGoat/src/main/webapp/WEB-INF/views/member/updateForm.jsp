<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/goty/resources/member/css/updateForm.css" />
<title>updateForm</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="right-side">
			<h3 class="side-title">개인 정보 수정</h3> 
			<form action="/goty/member/update" method="post">
					<div id="inner-div">
						<div class="form-group">
							<label for="id" >아이디</label>
							<input  class="form-control" id="id" type="text" readonly required
							value="${ requestScope.member.memberId }"/>
							<span class="id-update">아이디 수정은 불가능 합니다.</span>
						</div>
						
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="email" class="form-control"
							 required onkeyup="reqExpEmail();" id="email" name="email"
							 value="${ requestScope.member.email }"/>
							<span class="email">이메일형식으로 입력해주세요.</span>
						</div>
						
						<div class="form-group">
							<label for="phone">전화번호</label>
							<input type="text" class="form-control" id="phone" name="phone" 
							 onkeyup="reqExpPhone();" required value="${ requestScope.member.phone }"/>
							<span class="phone">- 제외한 11자리 숫자로 입력해주세요.</span>
						</div>
						
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="name" name="memberName"
							 required value="${ requestScope.member.memberName }" onkeyup="regExpCheckName();" maxlength="5"/>
							<span class="checkName">최소 2글자 한글로입력해주세요.</span>
						</div>
						
						<div class="form-group">
							<label for="nickname" >닉네임</label>
							<input type="text" class="form-control" id="nickname" name="nickname" onkeyup="reqExpNickname();"
							 required value="${ requestScope.member.nickname }"/>
							<span class="nickname">5글자 이내로 입력해주세요.</span>
						</div>
						
						<div class="form-group">
							<label for="bornDate">생년월일</label>
							<input type="text" class="form-control" id="bornDate" name="bornDate" maxlength="8"
							 required onkeyup="reqExpBornDate();" value="${ requestScope.member.bornDate }"/>
							<span class="bornDate">(yyyyMMdd) 숫자 8자리로 입력해주세요.</span>
						</div>
						
						<div class="address-div">
						  <input type="button" class="btn btn-sm btn-primary mb-2" onclick="execDaumPostcode()" value="주소 찾기"><br>
						  <input type="text" class="form-control d-inline" style="width: 64%;" id="roadAddress"
						         name="address" placeholder="도로명주소" value="${ requestScope.member.address }" readonly required>
						  <input type="text" class="form-control mt-2 d-inline detail" onkeyup="reqDetailAddr();"
						  	     style="width: 34%; display: inline-block;" id="detailAddress" name="addrDetail"
						  	     value="${ requestScope.member.addrDetail }" placeholder="상세주소" required>
						</div>
						<input type="hidden" name="memberNo" value="${ requestScope.member.memberNo }" />
						
						<div class="btn-options">
							<button class="btn btn-sm btn-secondary" type="button" onclick="history.back();" >돌아가기</button>
							<button class="btn btn-sm btn-success" id="submitBtn" type="submit" disabled >수정하기</button>
						</div>	
					</div>
				</form>
		</div>
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
	<script src="/goty/resources/member/Js/updateReg.js"></script>
</body>
</html>