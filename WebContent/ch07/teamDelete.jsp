<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		int num=Integer.parseInt(request.getParameter("num"));
		mgr.deleteTeam(num);
		response.sendRedirect("teamList.jsp");
		
%>