<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch08.RegisterMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id="";
		String pwd="";
		//login.jsp에서 id와 pwd를 요청
	
		boolean result = mgr.loginRegister(id, pwd);
		String msg="로그아웃하셨습니다.";
		String url="login.jsp";
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>