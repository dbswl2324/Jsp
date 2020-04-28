<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function send() {
		f = document.frm;
		f.sdate.value = f.sdateY.value+"-"
		+ f.sdateM.value+"-"+f.sdateD.value;
		f.edate.value = f.edateY.value+"-"
		+ f.edateM.value+"-"+f.edateD.value;
		f.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<h2>��ǥ���α׷�</h2>
		<hr width="600" />
		<b>�����ۼ�</b>
		<hr width="600" />
		<form name="frm" method="post" action="pollinsertProc.jsp">
			<table border="1" width="500">
				<tr>
					<td><b>����</b></td>
					<td colspan="2"><input name="question" size="30"></td>
				</tr>
				<tr>
					<td rowspan="10"><b>�׸�</b></td>
					<%
						for (int i = 1; i <= 4; i++) {
							out.println("<td>" + (i * 2 - 1)
									+ ": <input name='item'></td>");
							out.println("<td>" + (i * 2)
									+ ": <input name='item'></td>");
							out.println("</tr>");
							if (i == 9) {
								out.println("");
							} else {
								out.println("<tr>");
							}
						}//for end
					%>
				<tr>
					<td>������</td>
					<td colspan="2"><select name="sdateY">
							<option value="2020">2020
							<option value="2021">2021
					</select>�� <select name="sdateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="sdateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan=2><select name="edateY">
							<option value="2020">2020
							<option value="2021">2021
					</select>�� <select name="edateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="edateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������ǥ</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<input type="button" value="�ۼ��ϱ�" onclick="send()"> 
						<input type="reset" value="�ٽþ���"> 
						<input type="button" value="����Ʈ" onClick="javascript:location.href='pollList.jsp'">
					</td>
				</tr>
			</table>
			<input type="hidden" name="sdate">
			<input type="hidden" name="edate">
		</form>
	</div>
</body>
</html>