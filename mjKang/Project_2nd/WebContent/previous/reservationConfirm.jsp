<%@page import="bean.ReservationListDAO"%>
<%@page import="bean.ReservationListDTO"%>
<%@page import="bean.CalendarListDAO"%>
<%@page import="bean.CalendarListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//String id = session.getAttribute("id");
//세션id
//세션예약번호?
//세션예약날짜
//update 예약번호, id로 state 1로
//insert로 캘린더리스트 테이블에 예약날짜 및 id 내용은 예약으로 고정,, 예약번호는 고심
String id = "yang";
String reserveNum = "8";
String checkdate = "19/09/30";
int state = 1; //예약성공

ReservationListDTO rdto = new ReservationListDTO();
ReservationListDAO rdao = new ReservationListDAO();

CalendarListDTO cdto = new CalendarListDTO();
CalendarListDAO cdao = new CalendarListDAO();

//
rdao.acceptupdate(id,reserveNum,state);
cdao.reservinsert(id,checkdate);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
예약확정완료
버튼-예약확인으로
<input type="button" onclick="location.href='Format3_Ver6_R2.jsp'" value="예약확인 창으로">
</body>
</html>