// CREATE USER 'miniProjectUser'@'localhost' IDENTIFIED BY 'password';
// GRANT ALL PRIVILEGES ON * . * TO 'miniProjectUser'@'localhost';
// sudo mysql -u miniProjectUser -p
// password: password
// source schema.sql

package com.ks2334;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class Home extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(!isLoggedIn){
				response.sendRedirect(request.getContextPath()+"/login");
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
				rd.forward(request, response);
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
