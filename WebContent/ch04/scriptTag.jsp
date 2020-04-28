<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String s= new String();
%>
<jsp:useBean id="s1" class="java.lang.String"/>
<jsp:declartion>
	public int mas(int a, int b){
	return a>b?a:b;
	}
</jsp:declaration>
<jsp:scriptlet>
	int a=22;
	int b=23;
</jsp:scriptlet>
a=<jsp:expression>a</jsp:expression>와
b=<jsp:expression>b</jsp:expression>중에 더큰 숫자는?
<jsp:expression>max(a,b)</jsp:expression>