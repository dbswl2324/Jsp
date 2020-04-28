
<%@page import="ch07.SimpleBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		SimpleBean bean =new SimpleBean();
		String msg =request.getParameter("msg");
		int cnt =Integer.parseInt(request.getParameter("cnt"));
		bean.setMsg(msg);
		bean.setCnt(cnt);
%>
msg:<%=bean.getMsg() %><br>
cnt:<%=bean.getCnt() %><br>
