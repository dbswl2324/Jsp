<!-- if.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<%
request.setCharacterEncoding("EUC-KR");
String name =request.getParameter("name");
String color =request.getParameter("color");
String msg="";
if(color.equals("blue")){
	msg="�Ķ���";
}else if(color.equals("red")){
	msg="������";
}else if(color.equals("orange")){
	msg="��������";
}else{
	msg="��Ÿ��";
	color="white";
}

%>
<body bgcolor="<%=color%>">
<%=name%>�� �����ϴ� ������ <%=msg%>�Դϴ�.
</body>