
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
������ �����ϱ��? �����ϱ��?<%=(h<12)?"����":"����"%><br>
a�� b�߿� ū���ڸ� ǥ���϶�<%=max(a,b)%>