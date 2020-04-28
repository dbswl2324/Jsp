<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<% 

		String name="강호동";
		String bloodType=request.getParameter("bloodType");
%>
<!--표현식에서 ""값이 있을떄는 ''으로 시작한다.  -->
<jsp:include page='<%=bloodType+".jsp" %>'>
	<jsp:param value="<%=name%>" name="name"/>
</jsp:include>