<%@page import="java.util.Date"%>
<!-- scriptlet.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<%
	float f=2.3f;
	int i =Math.round(f);
	Date d =new Date();
%>
�Ǽ� f�� �ݿø� : <%=i%><br/>
��¥�� �ð�:<%=d.toString()%><br>
��¥�� �ð�:<%=d.toLocaleString()%><br>
