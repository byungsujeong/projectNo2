<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
            <script src="js/jquery-3.4.1.js"></script>
                <script src="js/main.js"></script>
    
               
</head>
<body>
  <div class="btn-group btn-group-md" role="group" style="float:right">

        <button class="btn btn-primary my-2 my-sm-0" type="button">
					사업자
				</button>
        <button class="btn btn-primary my-2 my-sm-0" type="button">
					인력
				</button>

		<% 
		
		if(session.getAttribute("id")==null){
		
		%>
		

        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "login()">
					로그인
				</button>
				
		<% }else{ %>
		
        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "logout()">
					로그아웃
				</button>
				
		<%} %>
		
		<%
		if(session.getAttribute("id")==null){
		%>
				
        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "join()">
					회원가입
				</button>
		<%}else{ %>
		<button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "change()">
					회원정보수정
		<%} %>
		</button>
		
    </div>

</body>
</html>