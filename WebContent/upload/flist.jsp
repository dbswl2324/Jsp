<%@page import="upload.UtilMgr"%>
<%@page import="upload.FileloadBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	Vector<FileloadBean> vlist= mgr.listFile();
%>
<!doctype html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function allChk(){
		f=document.frm;
		if(f.allCh.checked)//üũ�� ����
			{
			for(i=0;i<f.fch.length;i++){
				f.fch[i].checked=true;
			}
			f.btn.disabled=false;//��ư�� Ȱ��ȭ
			f.btn.style.color="blue";
			}else{
				for(i=0;i<f.fch.length;i++){
					f.fch[i].checked=false;
				}
				f.btn.disabled=true;//��ư�� ��Ȱ��ȭ
				f.btn.style.color="gray";

			}
		}
	function chk(){
		f=document.frm;
		for(i=1;i<f.fch.length;i++){//fch 0�� �����̶� 1���� �����ؾ��Ѵ�.
			if(f.fch[i].checked){//fch üũ�ڽ��� üũ�� ���
				f.btn.disabled=false;//��ư�� Ȱ��ȭ
				f.btn.style.color="blue";
				return;
			}
		}
		f.allCh.checked=false;
		f.btn.disabled=true;
		f.btn.style.color="gray";
	}
	function downFn(upFile) {
		df=document.downFrm;
		df.upFile.value=upFile;
		df.submit();
	}
</script>
</head>
<body>

<div align="center">
<h2>File List</h2>
<form name="frm" action="fdeleteProc.jsp">
<input type="hidden" name="fch" value="0"><!-- üũ�ڽ��� �̸��� fch �̰��̿��ؼ� �迭�� �ν��ϰ� �ؼ� ������ �����ϰ� �Ѵ�. -->
<table border="1" width="300">
<tr align="center">
		<td><input type="checkbox" name="allCh" onclick="allChk()"></td>
		<td>��ȣ</td>
		<td>���ϸ�</td>
		<td>����ũ��</td>
</tr>
<% 
	for(int i=0; i<vlist.size();i++){
		FileloadBean bean=vlist.get(i);
		int num =bean.getNum();
		String upFile= bean.getUpFile();
		int size = bean.getSize();
%>
<tr align="center">
		<td><input type="checkbox" name="fch" onclick="chk()" value=<%=num%>></td>
		<td><%=i+1%></td>
		<%-- <a href="storage/><%=upFile%>" download><%=upFile %></a>--%>
		<td><a href="javascript:downFn('<%=upFile%>')"><%=upFile %></a></td> 
		<td><%=UtilMgr.monFormat(size) %>byte</td>
</tr>
<% 		
	}//for
%>
<tr>
	<td colspan="4">
		<input type="submit" name="btn" value="DELETE" disabled>
	</td>
</tr>
</table>
</form>
<a href="fupload.jsp">�Է���</a>
<form name="downFrm" method="post" action="fdownload.jsp">
	<input type="hidden" name="upFile">
</form>
</div>
</body>
</html>

