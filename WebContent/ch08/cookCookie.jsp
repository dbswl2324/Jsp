<!-- cookCookie.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String cookieName="myCookie";
		//쿠키 객체를 생성 
		Cookie cookie =new Cookie(cookieName,"Apple");
		cookie.setMaxAge(60);//1분
		//쿠키의 값을 변경
		cookie.setValue("Melone");
		//쿠키는 서버에서 객체를 생성->>Client로 보낸다
		response.addCookie(cookie);
%>
쿠키를 만듭니다.<br>
쿠키 내용은<a href="tasteCookie.jsp">여기로!!!</a>