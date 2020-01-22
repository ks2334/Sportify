package com.ks2334;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/team")
public class TeamPage extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(isLoggedIn){
				RequestDispatcher rd = request.getRequestDispatcher("/team.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect(request.getContextPath()+"/login");
			}
		}
		catch(NullPointerException e) {
			response.sendRedirect(request.getContextPath()+"/login");
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}
}
