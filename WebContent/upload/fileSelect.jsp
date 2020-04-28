<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!-- 아래 두가지가 들어가지 않으면 업로드가 안된다. -->
<!-- 파일업로드 : post, enctype="multipart/form-data" -->
<form method="post" enctype="multipart/form-data"
action="viewPage.jsp">	
	user : <input name="user" value="홍길동"><br>
	title : <input name="title" value="파일업로드"><br>
	file : <input type="file" name="upload"><br>
	<input type="submit" value="UPLOAD">
</form>