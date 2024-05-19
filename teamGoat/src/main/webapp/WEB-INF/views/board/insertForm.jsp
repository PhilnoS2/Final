<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#wrapper-div{
	width: 1200px;
	height: 800px;
	margin: auto;
	border: 1px solid red;
}	
#form-area {
	width:70%;
	height: 80%;
	margin: auto;
	margin-top: 82px;
	border: 1px solid red;
}

.titls {
	width:50%;
}


</style>
<meta charset="UTF-8">
<title>insertForm</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<form action="/goty/freeboards/inserts" method="post"  id="form-area"
		 class="shadow-lg p-4 mb-4 bg-white" enctype="multipart/form-data" >
			<div class="form-group">
				<label for="category" >카테고리</label>
				<select id="category" class="custom-select" name="platformNo">
					<option selected value="1">play station</option>
					<option value="2">nintendo</option>
					<option value="3">xbox</option>
				</select>
			</div>
			
			<div class="form-group titls"> 
				<label class="mr-2" for="boardTitle">제목</label>
				<input class="form-control" type="text" id="boardTitle" name="boardTitle" required />
			</div>
			
			<div class="form-group">
				<label for="boardContent" >본문</label>
				<textarea class="form-control" rows="10" id="boardContent" name="boardContent" required ></textarea>
			</div>
			
			<div class="form-group">
				<label for="upfile" style="display: block;">파일첨부</label>
				<input type="file" id="upfile" name="upFile" >
			</div>
			<input type="hidden" name="memberNo" value="${ sessionScope.loginMember.memberNo }"/>
			<button class="btn btn-md btn-success" type="submit">작성하기</button>
		</form>
	
	</div>
	
</body>
</html>