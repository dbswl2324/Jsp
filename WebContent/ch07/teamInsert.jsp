<!-- teamInsert -->
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
   Vector<String> vlist=mgr.listTeamName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		f=document.frm;
		if(f.name.value==""){
			alert("�̸� �Է��ϼ���.")
			//function �߰� ����
			f.name.focus();
			return;
		}
		if(f.city.value==""){
			alert("��°� �Է��ϼ���.")
			f.city.focus();
			return;
		}
		if(f.age.value==""){
			alert("���� �Է��ϼ���.")
			f.age.focus();
			return;
		}
		if(f.team.value.length==0){
			alert("�� �Է��ϼ���.")
			f.team.focus();
			return;
		}
		
		f.submit();
	}
	
	function check2() {
		document.frm.action="teamInsertProc2.jsp";
		document.frm.submit();
	}
	function selectName(){
		f=document.frm;
		ts=f.teamSelect;
		f.team.value=ts.options[ts.selectedIndex].value;
	}
</script>
</head>
<body>
<div align="center">
<h1>Team Post(JSP)</h1>
<form name="frm" method="post" action="teamInsertProc.jsp">
<table border="1">
<tr>
	<td width="50" align="center">�̸�</td>
	<td width="150"><input name="name" value="ȫ�浿"></td>
</tr>
<tr>
	<td align="center">��°�</td>
	<td><input name="city" value="�λ�"></td>
</tr>
<tr>
	<td align="center">����</td>
	<td ><input name="age" value="27"></td>
</tr>
<tr>
	<td align="center">����</td>
	<td><input name="team" value="����" size="10">
	<select name="teamSelect" onchange="selectName()">
		<option value="">�����Է�</option>
		<%for(int i=0;i<vlist.size();i++){%>
		<option value="<%=vlist.get(i)%>"><%=vlist.get(i)%></option>
		
		<%} %>
	</select>
	</td>
	
</tr>
<tr>
	<td align="center" colspan="2">
		<input type="button" value="SAVE" onclick="check()">
		<input type="button" value="SAVE2" onclick="check2()">
	</td>
</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>
</form>
</div>
</body>
</html>