<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		for(int i=0;i<10;i++){
			out.println("꿈은 이루어 진다.<br>");
		}
%>
<script>
	function a(){
		alert("실행...");
	}
</script>
<body onload="a()">
<font style="font-size: 50">Front 기술</font>
</body>