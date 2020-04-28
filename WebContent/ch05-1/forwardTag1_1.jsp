<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
현재의 페이지는 동적인 값으로 인한 다른 페이지 전달(경유)의 목적으로 존재
현재 페이지으 ㅣ텍스트는 보이지 않음.
forwardTag1.html에서 요청된 id,pwd도 같이 전달된다

<jsp:forward page="forwardTag1_2.jsp"/>