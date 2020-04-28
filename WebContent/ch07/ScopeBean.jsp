<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pBean" scope="page" class="ch07.ScopeBean"/>
<jsp:useBean id="sBean" scope="session" class="ch07.ScopeBean"/>
<jsp:setProperty property="num" name="pBean"
value="<%=pBean.getNum()+10%>"/>
<jsp:setProperty property="num" name="sBean"
value="<%=sBean.getNum()+10%>"/>

<h1>ScopeBean</h1>
pBean : <jsp:getProperty property="num" name="pBean"/><br/>
sBean : <jsp:getProperty property="num" name="sBean"/><br/>
<a href="ScopeBean2.jsp">세션종료</a>