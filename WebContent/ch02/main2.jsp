<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		for(int i=0;i<10;i++){
			out.println("���� �̷�� ����.<br>");
		}
%>
<script>
	function a(){
		alert("����...");
	}
</script>
<body onload="a()">
<font style="font-size: 50">Front ���</font>
</body>