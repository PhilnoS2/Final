<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/goty/resources/board/css/updateForm.css" />
<meta charset="UTF-8">
<title>updateForm</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="/goty/resources/smartEditor/workspace/static/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
    	  const str = document.getElementById("editorTxt0").value;
    	  
    	 // 에디터의 내용에 대한 값 검증은 이곳에서
    	 //document.getElementById("editorTxt0").value를 이용해서 처리한다.
    	 
    	 // <p><br></p> 공백
    	 // <p>&nbsp;</p> 띄어쓰기만
    	 if(str.length < 0 || str.includes('<p>&nbsp;</p>') || str.includes('<p><br></p>')) {
    		 alert('올바른 입력이 아닙니다.' + str + str.length);
    		 return false;
    	 }
    	 else {
    		 alert(str);
    		 return true;
    	 }
    }
	</script>
	
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<form action="/goty/freeboards/update" method="post"  id="form-area"
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
				<input class="form-control" type="text" id="boardTitle" name="boardTitle" value="${ board.boardTitle }"required />
			</div>
			
			<div class="form-group">
				<label for="boardContent" >본문</label>
				<textarea class="form-control" rows="10" id="editorTxt0" name="boardContent" >${ board.boardContent }</textarea>
			</div>
			<!-- boardContent -->
			<div class="form-group clearfix">
				<label for="upfile" style="display: block;">파일첨부</label>
				<input type="file" id="upfile" name="upFile">
				<c:if test="${ board.imagePath ne null}">
					<img width="100px;" height="100px;" src="/goty/${ board.imagePath }">
				</c:if>
				<button class="btn btn-md btn-success float-right" type="submit" onclick="return submitContents();">수정하기</button>
			</div>
			
			<input type="hidden" name="freeBoardNo" value="${ board.freeBoardNo }"/>
			
		</form>
		
	</div>
	
	<script>
	$('select[name=platformNo]').children().each((idx,ele) => {
		if($(ele).val() == '${ board.platformNo }'){
			$(ele).attr('selected', true);
		}
	});
	</script>
	
</body>
</html>