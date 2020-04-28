<!-- showGuestBook.jsp -->
<%@page import="guestbook.CommentBean"%>
<%@page import="guestbook.GuestBookBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){
			StringBuffer url = request.getRequestURL();
			response.sendRedirect("login.jsp?url="+url);
			return;
		}
%>
<html>
<title>GuestBook</title>
<script type="text/javascript">
	function updateFn(num) {
		url = "updateGuestBook.jsp?num="+num;
		window.open(url,"GuestBook Update","width=520,height=300");
	}
	function commentFn(frm) { //this.form
		if(frm.comment.value==""){
			alert("내용을 입력하세요.");
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	function disFn(num) {
		var v = "cmt"+num;
		var e = document.getElementById(v);
		if(e.style.display=='none')
			e.style.display='block';//펼쳐짐.
		else
			e.style.display='none';//안보임.		
	}
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<div align="center">
<%@include file="postGuestBook.jsp" %>
<table width="520" cellspacing="0" cellpadding="3">
	<tr bgcolor="#F5F5F5">
		<td><font size="2"><b><%=login.getName()%></b></font></td>
		<td align="right"><a href="logout.jsp">로그아웃</a></td>
	</tr>
</table>
<!-- GuestBook List Start -->
<%
		Vector<GuestBookBean> vlist = 
			mgr.listGuestBook(login.getId(), login.getGrade());
			//out.print(vlist.size());
%>
<%if(vlist.isEmpty()){%>
	<table width="520" cellspacing="0" cellpadding="7">
	<tr>
		<td>등록된 글이 없습니다.</td>
	</tr>
</table>
<%}else{
		for(int i=0;i<vlist.size();i++){
			//방명록
			GuestBookBean bean = vlist.get(i);
			//방명록 글쓴이
			JoinBean writer = mgr.getJoin(bean.getId());		
%>
<table  width="520" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table bgcolor="#F5F5F5">
				<tr>
					<td width="225">NO : <%=vlist.size()-i%></td>					
					<td width="225">
						<img src="img/face.bmp" border="0" alt="이름">
						<a href="mailto:<%=writer.getEmail()%>">
						<%=writer.getName() %></a>
					</td>					
					<td width="150" align="center">
						<%if(writer.getHp()==null||writer.getHp().equals("")){
							out.print("홈페이지가 없네요.");
						}else{
						%>
						<a href="http://<%=writer.getHp()%>">
							<img alt="홈페이지 " src="img/hp.bmp" border="0">
						</a>
						<%}%>
					</td>					
				</tr>
				<tr>
					<td colspan="3"><%=bean.getContents() %></td>					
				</tr>
				<tr>
					<td>IP : <%=bean.getIp()%></td>					
					<td><%=bean.getRegdate()+" "+bean.getRegtime()%></td>					
					<td>
					<%
							//수정, 삭제 : 로그인 id와 글쓴 id가 동일 
							//삭제 : 관리자
							boolean chk = login.getId().equals(writer.getId());
							if(chk||login.getGrade().equals("1")){//if2
								if(chk){//if3
							%>
								<a href="javascript:updateFn('<%=bean.getNum()%>')">[수정]</a>
							<%}//if3%>
								<a href="deleteGuestBook.jsp?num=<%=bean.getNum()%>">[삭제]</a>
							<%if(bean.getSecret().equals("1")){//if4%>
								비밀글
							<%
								}//if4	
							}//if2
					%>
					</td>						
				</tr>
			</table>
		</td>
	</tr>
</table>	
<!-- Comment List Start -->
<div id="cmt<%=bean.getNum()%>" style="display: none">
<%
		Vector<CommentBean> cvlit 
			= mgr.listComment(bean.getNum());
		if(!cvlit.isEmpty()){
%>
		<table width="500" bgcolor="#F5F5F5">
		<%
				for(int j=0;j<cvlit.size();j++){
					CommentBean cbean = cvlit.get(j);
		%>
			<tr>
				<td>
					<table width="500">
						<tr>
							<td><b><%=cbean.getCid()%></b>	</td>
							<td align="right">
							<!-- 로그인 id와 댓글 쓴사람의 id가 동일 -->
							<%if(cbean.getCid().equals(login.getId())){ %>
								<a href="commentProc.jsp?flag=delete&cnum=<%=cbean.getCnum()%>">
								[삭제]</a>
							<%} %>
							</td>
						</tr>
						<tr>
							<td colspan="2"><%=cbean.getComment() %></td>
						</tr>
						<tr>
							<td><%=cbean.getCip()%></td>
							<td align="right"><%=cbean.getCregDate()%></td>
						</tr>
					</table>
				<hr>	
				</td>
			</tr>
		<%}//for(comment)%>	
		</table>	
<%}//if(comment )%>	
</div>
<table width="500">
<tr><td>
<button onclick="disFn('<%=bean.getNum()%>')">댓글<%=cvlit.size()>0?cvlit.size():""%></button>
</td></tr>
</table>
<!-- Comment List End -->
<!-- Comment Form Start -->
<form name="cFrm" method="post" action="commentProc.jsp">
<table>
	<tr>
		<td>
			<textarea placeholder="댓글입력..." name="comment" rows="2" 
			cols="65" maxlength="1000"></textarea>
		</td>
		<td>
			<input type="button" value="댓글" onclick="commentFn(this.form)">
			<input type="hidden" name="flag" value="insert">
			<!-- 방명록 글번호 -->
			<input type="hidden" name="num" value="<%=bean.getNum()%>">
			<!-- 로그인 id -->
			<input type="hidden" name="cid" value="<%=login.getId()%>">
			<!-- 댓글 입력 ip 주소 -->
			<input type="hidden" name="cip" value="<%=request.getRemoteAddr()%>">
		</td>
	</tr>
</table>	
</form>
<!-- Comment Form End -->
<%
		   }//for
		}//if1
%>
<!-- GuestBook List End -->
</div>
</body>
</html>




