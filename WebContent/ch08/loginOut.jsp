<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch08.RegisterMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id="";
		String pwd="";
		//login.jsp���� id�� pwd�� ��û
	
		boolean result = mgr.loginRegister(id, pwd);
		String msg="�α׾ƿ��ϼ̽��ϴ�.";
		String url="login.jsp";
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>