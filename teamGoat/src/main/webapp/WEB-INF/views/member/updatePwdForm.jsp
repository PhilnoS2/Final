<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>update Pwd Form</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form action="/goty/member/changePwd" method="post">
				<div id="inner-div">
					<h3>비밀번호 변경하기</h3>
					<p class="inner-div-p">회원님은 현재 <b style="font-size: 15px;">임시 인증</b> 상태입니다.</p>
					<p class="inner-div-p">비밀번호를 변경해주세요. <b style="color:red; font-size: 11px;">(변경 전 까지 서비스 이용이 불가)</b></p>
					
					<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" readonly name="memberId" value="${loginMember.memberId}">
					</div>
				
					<div class="form-group">
					  <label for="pwd">새로운 비밀번호 입력</label>
					  <input type="password" class="form-control" id="pwd" onkeyup="regExpCheckPwd();" name="memberPwd">
					  <span class="regExRulePwd">문자와 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
					</div>
				
					<div class="form-group">
					  <label for="pwdCheck">새로운 비밀번호 확인</label>
					  <input type="password" class="form-control" id="pwdCheck" readonly name="pwdCheck" required onkeyup="comparePwd();" placeholder="비밀번호 확인">
					  <span class="checkPwd">입력한 비밀번호가 다릅니다. 다시 확인해주세요.</span>
					</div>
					
					<div id="btn-option">
						<button class="btn btn-sm btn-primary" id="updatePwdBtn" disabled type="submit">비밀번호 변경</button>
					</div>
					
				</div>
			</form>
		</div>
		
		<script src="/goty/resources/member/Js/updatePwdForm.js" ></script>
</body>
</html>