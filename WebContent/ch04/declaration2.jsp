<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<%!/*선언문 영역의 변수는 필드(멤버변수)이고 초기화 되자 않으면 
	*자바 기본형 타임(8가지)의 0이고 참조형(클래스타입)null이 된다.
	*/ 
	int one;
	int two=1;
	public int plus(){
		return one+two;
	}
%>
<%
	//스크립트릿 영역의 변수는 지역변수이고 반드시 초기화
	int one1;
	int two1=1;
//	int three1=one1+two1;
%>
