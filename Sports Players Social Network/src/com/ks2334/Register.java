package com.ks2334;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.ks2334.User;
import com.ks2334.Database;

@WebServlet("/register")
public class Register extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
		rd.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User();
		Database db = new Database();
		String filePath = getServletContext().getRealPath(File.separator);
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload( factory );
		List<FileItem> uploadItems;
		try {
			uploadItems = upload.parseRequest(new ServletRequestContext(request));
			for( FileItem uploadItem : uploadItems )
			{
			  if( uploadItem.isFormField() )
			  {
			    String fieldName = uploadItem.getFieldName();
			    String value = uploadItem.getString();
			    System.out.println("Upload: "+fieldName+" "+value);
			    if(fieldName.equals("username")) {
			    	u.username = value;
			    }
			    else if(fieldName.equals("fname")) {
			    	u.fname = value;
			    }
			    else if(fieldName.equals("lname")) {
			    	u.lname = value;
			    }
			    else if(fieldName.equals("email")) {
			    	u.email = value;
			    }
			    else if(fieldName.equals("phone")) {
			    	u.phone = Long.parseLong(value);
			    }
			    else if(fieldName.equals("password")) {
			    	u.password = value;
			    }
			    else if(fieldName.equals("cpassword")) {
			    	u.cpassword = value;
			    }
			    else if(fieldName.equals("date")) {
			    	u.dob = value;
			    }
			    else if(fieldName.equals("description")) {
			    	u.description = value;
			    }
			    else if(fieldName.equals("address")) {
			    	u.address = value;
			    }
			    else if(fieldName.equals("sport")) {
			    	u.sports.add(value);
			    }
			  }
			  else{
				  if(uploadItem.getSize()==0) {
					  System.out.println("No Profile Pic Uploaded");
					  u.isProfilePicUploaded = false;
				  }
				  else {
					  u.isProfilePicUploaded = true;
				  }
			  }
			}
			
			if(u.isProfilePicUploaded) {
			  String name = uploadItems.get(0).getName();
			  File file = new File(filePath+"assets/media/profilePics/"+u.username);
			  boolean t = file.createNewFile();
			  uploadItems.get(0).write(file);	  
			}
			
			if(u.validateUser()){
				int i = db.addUser(u);
				if(i>0) {
					System.out.println("User Registered Successfully");
					HttpSession session = request.getSession();
					session.setAttribute("isLoggedIn", true);
					session.setAttribute("loggedInUser",u.username);
					response.sendRedirect(request.getContextPath()+"/home");
				}
				else {
					System.out.println("Registration Failed");
					HttpSession session = request.getSession();
					request.setAttribute("errMessage", "Registration Failed");
					RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
					rd.forward(request, response);
				}
			}
			
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
//		u.username = request.getParameter("username");
//		u.fname = request.getParameter("fname");
//		u.lname = request.getParameter("lname");
//		u.email = request.getParameter("email");
//		u.password = request.getParameter("password");
//		u.cpassword = request.getParameter("cpassword");
//		u.phone = Long.valueOf(request.getParameter("phone"));
//		u.dob = request.getParameter("date");
//		u.description = request.getParameter("description");
//		
//		
//		try {
//			if(u.validateUser()){
//				int i = db.addUser(u);
//				if(i>0) {
//					System.out.println("User Registered Successfully");
//					HttpSession session = request.getSession();
//					session.setAttribute("isLoggedIn", true);
//					session.setAttribute("loggedInUser",u.username);
//					response.sendRedirect(request.getContextPath()+"/home");
//				}
//				else {
//					System.out.println("Registration Failed");
//					HttpSession session = request.getSession();
//					request.setAttribute("errMessage", "Registration Failed");
//					RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
//					rd.forward(request, response);
//				}
//			}
//			
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
}
