<%@ page contentType="text/html; charset=EUC-KR"
					isErrorPage="true"
%>
<%
		request.setCharacterEncoding("EUC-KR");
		//Execption 객체가 내부적으로 제공: isErrorPage="true"
		String msg=exception.getMessage();

%>
<%=msg%>