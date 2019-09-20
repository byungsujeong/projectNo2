<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int score = Integer.parseInt(request.getParameter("score"));
	String id = request.getParameter("id");
	String re = request.getParameter("re");
	//db처리
%>

<div id="redata"><table>
	<tr>
		<td colspan="2" style="word-break: break-all;"><%
		if(score==1){
			%><img src="img/one.jpg" width=200 height=36.27><%
		}else if(score==2){
			%><img src="img/two.jpg" width=200 height=36.27><%
		}else if(score==3){
			%><img src="img/three.jpg" width=200 height=36.27><%
		}else if(score==4){
			%><img src="img/four.jpg" width=200 height=36.27><%
		}else if(score==5){
			%><img src="img/five.jpg" width=200 height=36.27><%
		}
		%></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>댓글</td>
	</tr>
	<tr>
		<td width="64" style="word-break: break-all;"><%=id%></td>
		<td width="280" style="word-break: break-all;"><%=re%></td>
	</tr>
</table></div>

<hr>