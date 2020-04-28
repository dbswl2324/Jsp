<%@page import="member.MemberMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:setProperty property="*" name="bean"/>

<%

	boolean result = mgr.insertMember(bean);
	String msg = "회원가입에 실패 하였습니다.";
	String url = "member.jsp";
	if(result){
	msg = "회원가입을 하였습니다.";
	url = "login.jsp";
	session.setAttribute("idKey", bean.getId());//가입과 동시에 로그인되는 코드
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>