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
	
	@Override//서블릿 객체 생성될때 처음으로 한번 호출
	public void init() throws ServletException{
	System.out.println("init 호출");
	}
	
	
	@Override//서블릿 종료 및 수정 됬대 한번 호출
	public void destroy() {
		System.out.println("destroy 호출");
	}
	
	@Override//서블릿 호출 할떄마다 실행
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		System.out.println("service 호출");
	}
}
