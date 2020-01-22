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

@WebServlet("/logout")
public class Logout extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("isLoggedIn", false);
		response.sendRedirect(request.getContextPath()+"/login");
	}
}
