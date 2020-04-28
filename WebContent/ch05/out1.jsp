<%@ page contentType="text/html; charset=EUC-KR"
		buffer="5kb"
		%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer =out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer-remainBuffer;
		out.print("출력 버퍼의 전체 크기: "+totalBuffer+"<br>");
		out.println("남은 버퍼의 전체 크기:"+remainBuffer+"<br>");
		out.println("현재 버퍼 사용량:"+useBuffer+"<br>");

%>