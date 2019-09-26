<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String idcheck = request.getParameter("id");
	String saveId = "kang"; //db조회하여 id찾기
	
	if(idcheck.equals(saveId)){
		out.print("<font color=red>아이디가 중복됩니다.</font>");	
	}else{
		out.print("<font color=blue>아이디가 중복되지 않습니다.</font>");	
	}
	
	%>
</body>
</html>