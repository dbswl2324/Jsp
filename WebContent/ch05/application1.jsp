<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//외부 환경 정보를 가지는 내부 객체
		String realPath=application.getRealPath("/");
		application.log("application 내부 객체 로그 테스트");
		//application>session>reqeust>page
		application.setAttribute("aaa", "테스트");
%>

서블릿 컨테이너 이름과 버전<%=application.getServerInfo()%><br>
로컬파일 시스템 경로<%=realPath%>