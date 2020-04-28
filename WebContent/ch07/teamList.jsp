<!-- teamList.jsp -->
<%@page import="ch07.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<TeamBean> vlist = mgr.listTeam();
		//out.print(vlist.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center"><p/>
<h1>Team List</h1>
<table border='1'>
<%
	for(int i=0;i<vlist.size();i++){
		TeamBean bean=vlist.get(i);
		int num = bean.getNum();
%>
<tr>
		<td><a href="teamRead.jsp?num=<%=num%>"><%=i+1%></a></td>
		<td><%=bean.getName() %></td>
		<td><%=bean.getCity() %></td>
		<td><%=bean.getAge() %></td>
		<td><%=bean.getTeam() %></td>
</tr>

<%}%>

</table>
</div>
</body>