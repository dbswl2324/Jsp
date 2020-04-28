<%@ page contentType="text/html; charset=EUC-KR"%>
<%
      request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"></jsp:useBean>
<jsp:useBean id="login" class="guestbook.JoinBean"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>
<%
   String url="login.jsp";
   if(request.getParameter("url")!=null && !request.getParameter("url").equals("null")){
      url=request.getParameter("url");
   }
   boolean result=mgr.loginJoin(login.getId(),login.getPwd());
   String msg="로그인 실패";
   if(result){
      msg="로그인 성공";
      login=mgr.getJoin(login.getId());
      //로그인 된 정보를 세션에 저장
      session.setAttribute("idKey", login.getId());
      session.setAttribute("login", login);
   }
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>