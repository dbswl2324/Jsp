<%@ page contentType="text/html; charset=EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
		request.setCharacterEncoding("EUC-KR");
		String teams [] = {"����Ǯ","�ǽ�Ƽ","������","ÿ��","�ƽ���"};
		int wins[] = {10,8,7,7,4};
		int tie[] = {1,1,2,2,5};
		int lose[] = {0,2,2,2,2};
		int point[] = {31,25,23,23,17};
		int l=1;
		int i=0;
%>
<body>
	<table border="1">
		<tr>
			<th>����</th>
			<th>����</th>
			<th>��</th>
			<th>��</th>
			<th>��</th>
			<th>����</th>
		</tr>
			
		<% for(i=0;i<teams.length;i++){%>			
		<tr align="center">
		<td><%=l%></td>
		<td><%=teams[i]%></td>		
		<td><%=wins[i]%></td>
		<td><%=tie[i]%></td>
		<td><%=lose[i]%></td>
		<td><%=point[i]%></td>
		</tr>
		<%} %>
	</table>
</body>