<!-- includeTag1.jsp-->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
	//	String name= request.getParameter("name");
%>
<!-- includeTag.jsp의 요청된 정보도 같이 넘어간다. -->
<jsp:include page="includeTagTop1.jsp"/>
include Action Tag의 Body입니다.
