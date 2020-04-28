
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
	public int max(int a, int b){
	return a>b?a:b;
}
%>
<%
	Date d=new Date();
	int h=d.getHours();
	int a=10;
	int b=20;
	
%>
지금은 오전일까요? 오후일까요?<%=(h<12)?"오전":"오후"%><br>
a와 b중에 큰숫자를 표시하라<%=max(a,b)%>