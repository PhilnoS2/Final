<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/goty/resources/member/css/findId.css">
<title>find Id</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="login-div">
			<form action="/goty/member/findId" method="post">
				<div id="inner-div">
					<h3>아이디 찾기</h3>
					
					<div class="form-group">
					  <label for="name">이름</label>
					  <input type="text" class="form-control" id="name" name="memberName" onkeyup="regExpCheckName();"
					  	maxlength="5" required placeholder="이름을 입력해주세요.">
					  <span class="checkName">최소 2글자 한글로입력해주세요.</span>
					</div>
					
					<div class="form-group">
					  <label for="phone">전화번호</label>
					  <input type="text" class="form-control" id="phone" name="phone" maxlength="11"
					  	onkeyup="reqExpPhone();" required placeholder=" - 제외하고 입력해주세요.">
					  <span class="phone">- 제외한 11자리 숫자로 입력해주세요.</span>
					</div>
					
					<div id="btn-option">
						<a class="btn btn-sm btn-secondary mr-2" href="/goty/member/findPwdForm">비밀번호찾기</a>
						<button class="btn btn-sm btn-primary" id="submitBtn" disabled type="submit">찾기</button>
					</div>
				</div>
			</form>
		</div>
		
		<script src="/goty/resources/member/Js/findId.js" ></script>
</body>
</html>