<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>menubar</title>

<style>
	div{
		box-sizing: border-box;
	}
	li{
		list-style: none;
	}
	#header {
		width: 1200px;
		height: 200px;
		margin: auto;
	}
	#logoOpt{
		width:60%;
		display:flex;
		align-items:center;
		justify-content:center;
		margin-left:auto;
	}
	#header h1 {
		width:85px;
		display:inline-block;
	}
	#logins {
		width:140px;
		display:inline-block;
		margin-left: auto;
		margin-right: 10px;
	}
	#nav {
		width: 1200px;
		height: 75px;
		margin: auto;
		border-top: 1px solid grey;
		border-bottom: 1px solid grey;
	}
	#nav-ul {
		width:100%;
		height:100%;
		list-style: none;
		font-weight: bold;
		padding: 0px;
		margin: 0px;
	}
	#nav-ul > li {
      float: left;
      font-size: 28px;
      height: 100%;
      width: 200px;
      text-align: center;
      line-height: 73px;
   }
   #nav-ul a {
	text-decoration: none;
	color: black;
	width: 100%;
    height: 100%;
    display: block;
   }
   #nav-ul li:hover > a{
     color: #007bff;
   }
   #option-ul{
 	 width:100%;
 	 text-align:center;
  	 padding: 0;
  	 display: none;
  	 font-size: 18px;
  	 z-index: 1000;
  	 background-color: white;
  	 position: relative;
   }
   #nav-ul > li > a:hover + #option-ul {
    display: block;
    z-index: 1000;
   }
   #nav-ul > li > ul:hover{
   	display: block;
   }
   #nav-ul > li > ul a:hover{
   	font-size: 24px; 
   	color: #17a2b8;
   }
</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<c:if test="${ not empty findId }">
		<script>
			alert('찾으신 아이디는 : ${findId} 입니다.');
		</script>
		<c:remove var="findId" scope="session" />
	</c:if>
	
	<div id="header">
		<div id="logoOpt">
			<img width="200px" height="200px" src="resources\img\logo2.png">
			<div id="logins">
				
				<c:choose>
					<c:when test="${ sessionScope.loginMember != null }">
						<a class="btn btn-sm btn-primary" href="logout.member">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-sm btn-info" href="enrollForm.member">회원가입</a>
						<a class="btn btn-sm btn-primary" href="loginForm.member">로그인</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<nav id="nav">
		<ul id="nav-ul">
			<li>
		     	<a>Nintendo</a>
		      	<ul id="option-ul">
		      		<li><a href="#">게임 본체</a></li>
		      		<li><a href="#">게임 타이틀</a></li>
		      		<li><a href="#">게임주변기기</a></li>
		      	</ul> 
		    </li>
		    <li>
		     	<a>PlayStation</a>
		      	<ul id="option-ul">
		      		<li><a href="#">게임 본체</a></li>
		      		<li><a href="#">게임 타이틀</a></li>
		      		<li><a href="#">게임주변기기</a></li>
		      	</ul> 
		    </li>
		    <li>
		     	<a>X Box</a>
		      	<ul id="option-ul">
		      		<li><a href="#">게임 본체</a></li>
		      		<li><a href="#">게임 타이틀</a></li>
		      		<li><a href="#">게임주변기기</a></li>
		      	</ul> 
		    </li>
		    <li>
		      <a href="#">Metacritic</a>
		    </li>
		    <li>
		      <a href="#">자유게시판</a>
		    </li>
		    <li>
		      <a href="#">고객센터</a>
		      <ul id="option-ul">
		      		<li><a href="#">공지사항</a></li>
		      		<li><a href="#">FAQ</a></li>
		      		<li><a href="#">1:1 문의</a></li>
		      	</ul> 
		    </li>
		</ul>	
	</nav>
</body>
</html>