<%@ page contentType="text/html; charset=EUC-KR"%>
<%		request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>

<jsp:setProperty property="*" name="bean"/>
<%
		if(bean.getSecret()==null){
			bean.setSecret("0");
		}
		mgr.InsertGuestBook(bean);
		response.sendRedirect("showGuestBook.jsp");
%>