<!-- updateGuestBookProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	//secret 체크하면 secrty=1 값이넘어와서 빈즈 저장
	//그러니 체크하지 않으면 secret 값 자체가 넘어오지 않음
	if(bean.getSecret()==null){
		bean.setSecret("0");
	}
	mgr.updateGuestBook(bean);
	//창은 close showGuestBook.jsp가 자동으로 새로고침되어야 한다.
%>
<script>
	opener.location.reload();//reload는 새로고침
	self.close();
</script>