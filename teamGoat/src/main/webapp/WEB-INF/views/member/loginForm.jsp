<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/goty/resources/member/css/loginForm.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="login-div">
		<form action="/goty/member/login" method="post">
			<div id="inner-div">
				<div class="form-group">
				  <label for="id">아이디</label>
				  <input type="text" class="form-control" id="id" onkeyup="regExpCheckId();" name="memberId">
				  <span class="regExRuleId">첫글자는 영문, 영문과 숫자 5~15 자리로 입력해주세요.</span>
				</div>
				
				<div class="form-group">
				  <label for="pwd">비밀번호</label>
				  <input type="password" class="form-control" id="pwd" onkeyup="regExpCheckPwd();" name="memberPwd">
				  <span class="regExRulePwd">문자와 숫자 8~15 자리로 입력해주세요. 특수문자(!@#)만 가능</span>
				</div>
				
				<div id="login-option">
					<div>
						<a class="btn btn-sm btn-secondary" href="/goty/member/findIdForm">아이디찾기</a>
						<a class="btn btn-sm btn-secondary" href="/goty/member/findPwdForm">비밀번호찾기</a>
					</div>
					<div >
						<a class="btn btn-sm btn-info" href="/goty/member/enrollForm">회원가입</a>
						<button class="btn btn-sm btn-primary" id="submitBtn" disabled type="submit">로그인</button>
					</div>
				</div>
				<div id="social-option">
					<a id="kakao-login-btn"><img class="btn-img"  src="/goty/resources/member/images/kakao_btn.png" /></a>
					<a id="naver-login-btn"><img class="btn-img" src="/goty/resources/member/images/naver_btn.png" /></a>
				</div>
			</div>
		</form>
	</div>
	
	<script src="/goty/resources/member/Js/loginForm.js" ></script>
</body>
</html>