<%@ page contentType="text/html; charset=EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<table border:"ridge":2 align="center" bordercolor="lightgray" >
	<tr bgcolor=#eeffcc>
	<%for(int i=2;i<10;i++){ %>
	<th width ="70"><%=i %>´Ü</th>
	<%} %>
	</tr>
	<tr bgcolor=#CEFFC7>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 1 = <%=j*1 %></td>
	<%}%>
	</tr>
	<tr bgcolor=#BCFFB5>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 2 = <%=j*2 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#AAFFA3>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 3 = <%=j*3 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#98F791>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 4 = <%=j*4 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#86E57F>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 5 = <%=j*5 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#74D36D>  
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 6 = <%=j*6 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#62C15B>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 7 = <%=j*7 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#50AF49>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 8 = <%=j*8 %></td>
	<%}%>
	</tr>
		<tr bgcolor=#3E9D37>
	<% for(int j=2;j<10;j++){%>
	<td width ="70"><%=j%> X 9 = <%=j*9 %></td>
	<%}%>
	</tr>
</table>