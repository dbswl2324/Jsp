<!-- updateGuestBookProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	//secret üũ�ϸ� secrty=1 ���̳Ѿ�ͼ� ���� ����
	//�׷��� üũ���� ������ secret �� ��ü�� �Ѿ���� ����
	if(bean.getSecret()==null){
		bean.setSecret("0");
	}
	mgr.updateGuestBook(bean);
	//â�� close showGuestBook.jsp�� �ڵ����� ���ΰ�ħ�Ǿ�� �Ѵ�.
%>
<script>
	opener.location.reload();//reload�� ���ΰ�ħ
	self.close();
</script>