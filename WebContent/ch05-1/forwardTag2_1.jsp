<!-- forwardTag2_1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String name="ȫ�浿";
		String bloodType=request.getParameter("bloodType");
		
%>
<jsp:forward page='<%=bloodType+".jsp"%>'>
	<jsp:param value="<%=name%>" name="name"/>
</jsp:forward>