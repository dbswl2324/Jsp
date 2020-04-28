package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/ch03/loginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  if(id!=null&&pwd!=null)
		  {
			  HttpSession session=request.getSession();
			  session.setAttribute("idKey", id);
			  
		  }
		  //¼¼¼Ç¿¡ idKey
		   response.sendRedirect("login.jsp");
	}

}
