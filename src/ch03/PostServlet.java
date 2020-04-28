package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch03/postServlet")
public class PostServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  String email=request.getParameter("email");
		  
		  PrintWriter out=response.getWriter();
		   out.println("<h1>Post Servlet</h1>");
		   out.println("id"+id+"<br>");
		   out.println("pwd"+pwd+"<br>");
		   out.println("email"+email+"<br>");
		   
	}

}
