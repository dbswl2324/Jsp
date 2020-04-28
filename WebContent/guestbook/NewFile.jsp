<!-- showGuestBook.jsp -->
<%@page import="guestbook.GuestBookBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){
			StringBuffer url = request.getRequestURL();
			response.sendRedirect("login.jsp?url="+url);
			return;
		}
%>
<html>
<title>GuestBook</title>
<script type="text/javascript">

</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@include file="postGuestBook.jsp" %>
<table width="520" cellspacing="0" cellpadding="3">
	<tr bgcolor="#F5F5F5">
		<td><font size="2"><b><%=login.getName()%></b></font></td>
		<td align="right"><a href="logout.jsp">�α׾ƿ�</a></td>
	</tr>
</table>
<!-- GuestBook List Start -->
<%
		Vector<GuestBookBean> vlist = 
			mgr.listGuestBook(login.getId(), login.getGrade());
			//out.print(vlist.size());
%>
<%if(vlist.isEmpty()){%>
	<table width="520" cellspacing="0" cellpadding="7">
	<tr>
		<td>��ϵ� ���� �����ϴ�.</td>
	</tr>
</table>
<%}else{
		for(int i=0;i<vlist.size();i++){
			//����
			GuestBookBean bean = vlist.get(i);
			//���� �۾���
			JoinBean writer = mgr.getJoin(bean.getId());		
%>
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table bgcolor="#F5F5F5">
				<tr>
					<td width="225">NO : <%=vlist.size()-i%></td>					
					<td width="225">
						<img src="img/face.bmp" border="0" alt="�̸�">
						<a href="mailto:<%=writer.getEmail()%>">
						<%=writer.getName() %></a>
					</td>					
					<td width="150" align="center">
						<%if(writer.getHp()==null||writer.getHp().equals("")){
							out.print("Ȩ�������� ���׿�.");
						}else{
						%>
						<a href="http://<%=writer.getHp()%>">
							<img alt="Ȩ������ " src="img/hp.bmp" border="0">
						</a>
						<%}%>
					</td>					
				</tr>
				<tr>
					<td colspan="3"><%=bean.getContents() %></td>					
				</tr>
				<tr>
					<td>IP : <%=bean.getIp()%></td>					
					<td><%=bean.getRegdate()+" "+bean.getRegtime()%></td>					
					<td>
					<%
							//����, ���� : �α��� id�� �۾� id�� ���� 
							//���� : ������
							boolean chk = login.getId().equals(writer.getId());
							if(chk||login.getGrade().equals("1")){//if2
								if(chk){//if3
							%>
								<a href="">[����]</a>
							<%}//if3%>
								<a href="">[����]</a>
							<%if(bean.getSecret().equals("1")){//if4%>
								��б�
							<%
								}//if4	
							}//if2
					%>
					</td>						
				</tr>
			</table>
		</td>
	</tr>
</table>	
<%
		   }//for
		}//if1
%>
<!-- GuestBook List End -->
</div>
</body>
</html>
















