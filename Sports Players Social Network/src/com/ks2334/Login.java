package com.ks2334;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ks2334.MysqlConnection;
import java.sql.*;
import com.ks2334.User;
import com.ks2334.Database;

@WebServlet("/login")
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(!isLoggedIn){
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect(request.getContextPath()+"/home");
			}
		}
		catch(NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try {
			Database db = new Database();
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			username = db.authenticateUser(username, password);
			
			if(username != null) {
				System.out.println("User Logged In");
				HttpSession session = request.getSession();
				session.setAttribute("isLoggedIn", true);
				session.setAttribute("loggedInUser",username);
				response.sendRedirect(request.getContextPath()+"/home");
			}
			else {
				System.out.println("Invalid Login/Password");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
