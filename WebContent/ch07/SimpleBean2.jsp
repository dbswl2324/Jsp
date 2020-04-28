<%@page import="ch07.SimpleBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!-- SimpleBean 按眉 积己 -->
<jsp:useBean id="bean" class="ch07.SimpleBean"/>
<!-- SimpleBean bean = new SimpleBean() -->
<!-- 夸没等 msg客 cnt甫 罐绊 bean 历厘 -->

<% 
		SimpleBean bean1 = new SimpleBean();
%>

<jsp:setProperty property="msg" name="bean"/>
<!--  bean.setMsg(reqeust.getParameter("msg")) -->
<jsp:setProperty property="cnt" name="bean"/>
<!--  bean.setCnt(Integer.parseInt(request.getParameter("cnt"))) -->

<jsp:setProperty property="*" name="bean"/>

msg2 : <jsp:getProperty property="msg" name="bean"/><br>
msg2 : <%=bean.getMsg()%><br>
cnt2 : <jsp:getProperty property="cnt" name="bean"/><br>