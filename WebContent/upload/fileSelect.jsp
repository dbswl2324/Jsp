<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!-- �Ʒ� �ΰ����� ���� ������ ���ε尡 �ȵȴ�. -->
<!-- ���Ͼ��ε� : post, enctype="multipart/form-data" -->
<form method="post" enctype="multipart/form-data"
action="viewPage.jsp">	
	user : <input name="user" value="ȫ�浿"><br>
	title : <input name="title" value="���Ͼ��ε�"><br>
	file : <input type="file" name="upload"><br>
	<input type="submit" value="UPLOAD">
</form>