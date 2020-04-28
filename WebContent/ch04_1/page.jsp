<%@ page contentType="text/html; charset=EUC-KR" 
		pageEncoding="UTF-8"
		isELIgnored="true"
	
		%>

<!--      
	charset : Client가 받아볼 html 소스의 인코딩 방식
	pageEncoding: 현재 JSP소스의 인코딩 방식
	그러나 pageEncoing 선언되지 않으면 charset이 두가지를 다 세팅함
-->
<%
		request.setCharacterEncoding("EUC-KR");
		//request 저장 공간에 site이름으로 jsptudy값을 저장
		request.setAttribute("site","jspstudy");
%>
세션ID:<%=session.getId()%><br>
사이트명:${site}