<%@page import="bean.ReservationListDTO"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//세션id
//세션예약번호
//update 예약번호 id로 state -1로
String id = "yang";
String reserveNum = "5";
int state = -1; //예약거절

ReservationListDTO rdto = new ReservationListDTO();
ReservationListDAO rdao = new ReservationListDAO();

rdao.refuseupdate(id,reserveNum,state);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
예약거절
버튼-예약확인으로
<input type="button" onclick="location.href='Format3_Ver6_R2.jsp'" value="예약확인 창으로">
</body>
</html>