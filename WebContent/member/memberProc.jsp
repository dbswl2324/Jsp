<%@page import="member.MemberMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:setProperty property="*" name="bean"/>

<%

	boolean result = mgr.insertMember(bean);
	String msg = "ȸ�����Կ� ���� �Ͽ����ϴ�.";
	String url = "member.jsp";
	if(result){
	msg = "ȸ�������� �Ͽ����ϴ�.";
	url = "login.jsp";
	session.setAttribute("idKey", bean.getId());//���԰� ���ÿ� �α��εǴ� �ڵ�
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>