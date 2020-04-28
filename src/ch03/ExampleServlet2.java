package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ch03/ExampleServlet2")
public class ExampleServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override//���� ��ü �����ɶ� ó������ �ѹ� ȣ��
	public void init() throws ServletException{
	System.out.println("init ȣ��");
	}
	
	
	@Override//���� ���� �� ���� ��� �ѹ� ȣ��
	public void destroy() {
		System.out.println("destroy ȣ��");
	}
	
	@Override//���� ȣ�� �ҋ����� ����
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		System.out.println("service ȣ��");
	}
}
