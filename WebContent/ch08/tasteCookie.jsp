<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//응답된 쿠키의 정보는 다시 서버로 요청이된다.
		Cookie cookies[] = request.getCookies();
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
		%>
	Cookie Name=<%=cookies[i].getName()%><br>
	Cookie Value=<%=cookies[i].getValue()%><p>
	<%
			}
	}
%>
<a href="cookCookie">쿠키요리</a>