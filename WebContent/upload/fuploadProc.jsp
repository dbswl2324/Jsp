<%@ page contentType="text/html; charset=EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
	String flag=request.getParameter("flag");
	System.out.print(flag);
	mgr.uploadFile(request);
	response.sendRedirect("flist.jsp");
%>