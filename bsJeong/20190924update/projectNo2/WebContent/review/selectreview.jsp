<%@page import="java.util.ArrayList"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int wnum1 = Integer.parseInt(request.getParameter("wnum"));
	WorkerBoardDTO workerBoardDTO = new WorkerBoardDTO();
	workerBoardDTO.setWnum(wnum1);
	WorkerBoardDAO workerBoardDAO = new WorkerBoardDAO();
	ArrayList<WorkerBoardDTO> list = workerBoardDAO.selectAll(workerBoardDTO);
%>

<table>
	<%
		if (list.size() > 3) {
			for (int i = 0; i < 3; i++) {
				workerBoardDTO = list.get(i);
	%>
	<tr>
		<td width="64" style="word-break: break-all;"><%=workerBoardDTO.getMid()%></td>
		<td style="word-break: break-all;">
			<%
				if (workerBoardDTO.getRating() == 1) {
			%> <img src="../img/one.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 2) {
 %><img src="../img/two.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 3) {
 %><img src="../img/three.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 4) {
 %><img src="../img/four.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 5) {
 %><img src="../img/five.jpg" width=200 height=36.27> <%
 	}
 %>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="344" style="word-break: break-all;"><%=workerBoardDTO.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<%
		}
		} else {
			for (int i = 0; i < list.size(); i++) {
				workerBoardDTO = list.get(i);
	%>
	<tr>
		<td width="64" style="word-break: break-all;"><%=workerBoardDTO.getMid()%></td>
		<td style="word-break: break-all;">
			<%
				if (workerBoardDTO.getRating() == 1) {
			%> <img src="../img/one.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 2) {
 %><img src="../img/two.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 3) {
 %><img src="../img/three.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 4) {
 %><img src="../img/four.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 5) {
 %><img src="../img/five.jpg" width=200 height=36.27> <%
 	}
 %>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="344" style="word-break: break-all;"><%=workerBoardDTO.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<%
		}
		}
	%>
</table>