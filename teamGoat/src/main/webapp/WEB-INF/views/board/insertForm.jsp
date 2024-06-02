<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>


</style>
<meta charset="UTF-8">
<title>insertForm</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="/goty/resources/smartEditor/workspace/static/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<link rel="stylesheet" href="/goty/resources/board/css/insertForm.css" >
	<script type="text/javascript">
	let oEditors = [];

    	$(() => {
           nhn.husky.EZCreator.createInIFrame({
               oAppRef: oEditors,
               elPlaceHolder: "editorTxt0", //textarea에 부여한 아이디와 동일해야한다.
               sSkinURI: "/goty/resources/smartEditor/workspace/static/SmartEditor2Skin.html", //자신의 프로젝트에 맞게 경로 수
               fCreator: "createSEditor2"
           })
       });

    function submitContents() {
    	 // 에디터의 내용이 textarea에 적용된다.
    	  oEditors.getById["editorTxt0"].exec("UPDATE_CONTENTS_FIELD", []);
    	  console.log(document.getElementById("editorTxt0").value);
    	  const str = document.getElementById("editorTxt0").value;
    	  
    	 // 에디터의 내용에 대한 값 검증은 이곳에서
    	 //document.getElementById("editorTxt0").value를 이용해서 처리한다.
    	 
    	 // <p><br></p> 공백
    	 // <p>&nbsp;</p> 띄어쓰기만
    	 if(str.length < 0 || str.includes('<p>&nbsp;</p>')) {
    		 alert('올바른 입력이 아닙니다.' + str);
    		 return false;
    	 }
    	 else {
    		 alert(str);
    		 return true;
    	 }
    }
	</script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="wrapper-div">
		<form action="/goty/freeboards/inserts" method="post"  id="form-area"
		 class="shadow-lg p-4 mb-4 bg-white" enctype="multipart/form-data" >
			<div class="form-group selects">
				<label for="category" >카테고리</label>
				<select id="category" class="custom-select" name="platformNo">
					<option selected value="1">play station</option>
					<option value="2">nintendo</option>
					<option value="3">xbox</option>
				</select>
			</div>
			
			<div class="form-group titles"> 
				<label class="mr-2" for="boardTitle">제목</label>
				<input class="form-control" type="text" id="boardTitle" name="boardTitle" required />
			</div>
			
			<div class="form-group">
				<label for="boardContent" >본문</label>
				<textarea id="editorTxt0" class="form-control" rows="10"  name="boardContent" ></textarea>
			</div>
			<!-- name="boardContent" id="boardContent" -->
			<div class="form-group">
				<label for="upfile" style="display: block;">파일첨부</label>
				<input type="file" id="upfile" name="upFile" >
			</div>
			<input type="hidden" name="memberNo" value="${ sessionScope.loginMember.memberNo }"/>
			<button class="btn btn-md btn-success" type="submit" onclick="return submitContents();" >작성하기</button>
		</form>	
	</div>
	
</body>
</html>