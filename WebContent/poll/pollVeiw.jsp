<%@page import="java.util.Random"%>
<%@page import="poll.PollItemBean"%>
<%@page import="poll.PollListBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%request.setCharacterEncoding("EUC-KR");
	int listNum=Integer.parseInt(request.getParameter("num"));
	PollListBean plBean=mgr.getPoll(listNum);
	Vector<PollItemBean> vlist=mgr.getView(listNum);
	//현재 설문에 sum 투표수
	int sumCnt = mgr.sumCount(listNum);
	//현재 설문에 가장 높은 투표수
	int maxCnt =mgr.getMaxCount(listNum);
%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>투표 결과</h2>
<table border="1" width="400">
	<tr>
		<td colspan="4">Q : <%=plBean.getQuestion() %></td>
	</tr>
	<tr>
	<td colspan="3"><b>총 투표자:<%=sumCnt%></b></td>
	<td width="40"><b>count(%)</b></td>
	</tr>
	<%
		Random r=new Random();
		for(int i=0;i<vlist.size();i++){
			PollItemBean piBean =vlist.get(i);
			String item[]=piBean.getItem();
			int count =piBean.getCount();
			//비율
			int ratio= new Double(Math.round((double)count/sumCnt*100)).intValue();
			int ratio1 =(int)(Math.round((double)count/sumCnt*100));
			//랜덤한 색상을 16진수 리턴 코드
			String rgb="#"+Integer.toHexString(r.nextInt(255*255*255));
		//	out.print(Math.round((double)count/sumCnt*100));
			%>
	<tr>
		<td width="20" align="center"><%=i+1 %></td>
		<td width="120">
		<%if(maxCnt==count){ %><font color="red"><b><%} %>
		<%=item[0]%>
		<%if(maxCnt==count){ %></b></font><%}%>
		</td>
		<td>
			<table width="<%=ratio%>" height="15">
				<tr>
					<td bgcolor="<%=rgb%>"></td>
				</tr>
			</table>
		</td>
		<td width="40"><%=count%>(<%=ratio%>)</td>
	</tr>
	<%}//for %>
</table>
<a href="javcript:window.close()">닫기</a>
</div> 
</body>
</html>