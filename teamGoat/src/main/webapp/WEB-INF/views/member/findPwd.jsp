<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/goty/resources/member/css/findPwd.css" />
<title>find Pwd</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form onsubmit="submitForm();" action="/goty/member/findPwd" method="post">
				<div id="inner-div">
					<h3 id="pwd-title">비밀번호 찾기</h3>
					<p id="pwd-p">회원가입시 기입했던 정보와 <b>똑같이</b> 입력해주세요.</p>
					<h2 id="ment">잠시만 기다려주세요.</h2>
					<div class="form-group">
					  <label for="id">아이디</label>
					  <input type="text" class="form-control" id="id" name="memberId" required onkeyup="regExpCheckId();" placeholder="아이디를입력해주세요.">
					  <span class="regExRuleId">첫 글자는 문자, 문자와 숫자 5~15 자리로 입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="name">이름</label>
					  <input type="text" class="form-control" id="name" name="memberName" onkeyup="regExpCheckName();"
					  maxlength="5" required placeholder="이름을 입력해주세요.">
					  <span class="checkName">최소 2글자 한글로입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="email">이메일</label>
					  <input type="email" class="form-control" id="email" name="email" required onkeyup="reqExpEmail();"
					   placeholder="@포함한 이메일을 입력해주세요.">
					  <span class="email">이메일형식으로 입력해주세요.</span>
					</div>
					
					<div id="btn-option">
						<button class="btn btn-sm btn-primary" id="findPwdBtn" disabled type="submit">찾기</button>
					</div>
				</div>
			</form>
		</div>
		
		<script src="/goty/resources/member/Js/findPwd.js"></script>
</body>
</html>