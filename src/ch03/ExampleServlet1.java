package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 

@WebServlet("/ch03/ExampleServlet1")
public class ExampleServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//���� ����� �ڵ������� main ó�� �ڵ������� ȣ��	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=EUC-KR");
		//���佺Ʈ��
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		//html����
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>��Ŭ������ ���� �����</h1>");
		out.println("����"+session.getId());
		out.println("</body>");
		out.println("</html>");
		System.out.println("��𼭺��ϱ��?");

	}
}
