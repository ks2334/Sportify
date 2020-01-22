// CREATE USER 'miniProjectUser'@'localhost' IDENTIFIED BY 'password';
// GRANT ALL PRIVILEGES ON * . * TO 'miniProjectUser'@'localhost';
// sudo mysql -u miniProjectUser -p
// password: password
// source schema.sql

package com.ks2334;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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

import com.ks2334.Database;

@WebServlet("/createTeam")
public class CreateTeam extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(!isLoggedIn){
				response.sendRedirect(request.getContextPath()+"/login");
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database db = new Database();
		String filePath = getServletContext().getRealPath(File.separator);
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload( factory );
		List<FileItem> uploadItems;
		boolean isProfilePicUploaded = false;
		String teamName="",teamDetails="",sportName="",teamStats="";
		try {
			uploadItems = upload.parseRequest(new ServletRequestContext(request));
			for( FileItem uploadItem : uploadItems )
			{
			  if( uploadItem.isFormField() )
			  {
			    String fieldName = uploadItem.getFieldName();
			    String value = uploadItem.getString();
			    System.out.println("Upload: "+fieldName+" "+value);
			    if(fieldName.equals("teamName")) {
			    	teamName = value;
			    }
			    else if(fieldName.equals("sportName")) {
			    	sportName = value;
			    }
			    else if(fieldName.equals("teamDetails")) {
			    	teamDetails = value;
			    }
			    else if(fieldName.equals("teamStats")) {
			    	teamStats = value;
			    }
			    
			  }
			  else{
				  System.out.println(uploadItem);
				  if(uploadItem.getSize()==0) {
					  System.out.println("No Profile Pic Uploaded");
					  isProfilePicUploaded = false;
				  }
				  else {
					  isProfilePicUploaded = true;
				  }
			  }
			}
			
			if(isProfilePicUploaded) {
			  System.out.println(filePath);
			  File file = new File(filePath+"assets/media/teamProfilePics/"+teamName);
			  boolean t = file.createNewFile();
			  uploadItems.get(0).write(file);	  
			}
			
			if(!teamName.equals("") && !teamDetails.equals("") && (sportName!=null && !sportName.equals("Select Sport"))){
				HttpSession session = request.getSession();
				String username = session.getAttribute("loggedInUser").toString();
				int i = db.createTeam(teamName, sportName, teamDetails, teamStats,username);
				if(i>0) {
					System.out.println("Team Created Sccessfully");
					request.setAttribute("errMessage", "Team Created Sccessfully");
					RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
					rd.forward(request, response);
				}
				else {
					System.out.println("Team Could Not be Created!");
					request.setAttribute("errMessage", "Team Could Not be Created!");
					RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
					rd.forward(request, response);
				}
			}
			else {
				System.out.println("Please Fill in All the Fields!");
				request.setAttribute("errMessage", "Please Fill in All the Fields!");
				RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
				rd.forward(request, response);
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

		
	}
	
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Database db = new Database();
//		String teamName = request.getParameter("teamName");
//		String sportName = request.getParameter("sportName");
//		String teamDetails = request.getParameter("teamDetails");
//		String teamStats = request.getParameter("teamStats");
//		HttpSession session = request.getSession();
//		try {
//			if(!teamName.equals("") && !teamDetails.equals("") && (sportName!=null && !sportName.equals("Select Sport"))) {
//				int i = db.createTeam(teamName, sportName, teamDetails, teamStats);
//				if(i>0) {
//					System.out.println("Team Created Sccessfully");
//					request.setAttribute("errMessage", "Team Created Sccessfully");
//					RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
//					rd.forward(request, response);
//				}
//				else {
//					System.out.println("Team Could Not be Created!");
//					request.setAttribute("errMessage", "Team Could Not be Created!");
//					RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
//					rd.forward(request, response);
//				}	
//			}
//			else {
//				System.out.println("Please Fill in All the Fields!");
//				request.setAttribute("errMessage", "Please Fill in All the Fields!");
//				RequestDispatcher rd = request.getRequestDispatcher("/createTeam.jsp");
//				rd.forward(request, response);
//			}
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
}
