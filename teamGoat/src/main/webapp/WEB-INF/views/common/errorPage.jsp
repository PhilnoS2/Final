<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
	<jsp:include page="menubar.jsp" />

    <br>
    <div align="center">
        <br><br>
        <h1 style="font-weight:bold;">${ errorMsg }</h1>
    </div>
    <br>
</body>
</html>