<!-- viewSession.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//저장한 세션만 확인 위해서는 지정한 name(key)값만 알면 됨
		String id=(String)session.getAttribute("logID");
		String pwd=(String)session.getAttribute("logPWD");
		out.println("id: "+id+", pwd :"+pwd+"<p>");
		//세션에 저장된 객체를 접근 할 수 있는 방법은 name 사용
		Enumeration<String> en=session.getAttributeNames();
		while(en.hasMoreElements()){
			String name=en.nextElement();
			Object obj=session.getAttribute(name);
			out.println("session name:"+name+"<br>");
			out.println("session value:"+obj+"<p>");
			
		}
%>
<a href="createSession.jsp">세션객체생성</a>