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
실수 f의 반올림 : <%=i%><br/>
날짜와 시간:<%=d.toString()%><br>
날짜와 시간:<%=d.toLocaleString()%><br>
