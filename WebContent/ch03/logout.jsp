<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	//������ ������� ���� ��ü�� ���� ->���ο� ���� ��ü�� ����
	session.invalidate();
	//���� �������� login.jsp ȣ��
	response.sendRedirect("login.jsp");
%>