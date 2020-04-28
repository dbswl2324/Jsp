<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String msg=request.getParameter("msg");
	//	int number=Integer.parseInt(request.getParameter("number"));
		int cnt=0;
		for(int i=1;i<11;i++)
		{
			out.println(i+"+");
			cnt+=i;
		}
		out.println("="+cnt);
%>
