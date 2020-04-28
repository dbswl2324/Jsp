<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
	String name=team+"파이팅";
%>
<%!/*선언문ㅇ 영역에 선언된 변수 및 메소드: 번수-> 필드, 메소드(메소드 안에 메소드 선언 불가*/
	String team="코리아";
	public void service(){
		String name=team+"파이팅";
		
	}
%>
출력되는 결과는?<%=name%>