<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#wrapper-div{
	width: 1200px;
	height: 800px;
	margin: auto;
	border:1px solid red;
}	
#btn-categoty-div {
	width: 50%;
	margin-left: auto;
	height: 80px;
	border: 1px solid red;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}
#freeboard-div{
	width: 100%;
	height: 90%;
	border: 1px solid red;
}
#freeboard-inner-div {
	width: 80%;
	height: 70%;
	border: 1px solid red;
	margin: auto;
	margin-top: 20px;
}

thead th {
	text-align: center;
}
.form-group {
	width:20%;
	margin: auto;
	
}
</style>
<title>selectListAll</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="wrapper-div">
		<div id="btn-categoty-div">
			<button class="btn btn-lg btn-primary" >P.S</button>
			<button class="btn btn-lg btn-primary" >N.S</button>
			<button class="btn btn-lg btn-primary" >X.B</button>
			<button class="btn btn-lg btn-primary" >P.C</button>
		</div>
		
		<div id="freeboard-div">
			<div id="freeboard-inner-div">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목</th>
							<th>제 목</th>
							<th>댓글수</th>
							<th>조회수</th>
							<th>날짜</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="form-group mt-2">
				<div style="width:70%; display:inline-block;">
					<input type="text" class="form-control" id="" name="" placeholder="검색어를 입력하세요." />
				</div>
				<button class="btn btn-sm btn-primary">검색</button>
			</div>
			<div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>