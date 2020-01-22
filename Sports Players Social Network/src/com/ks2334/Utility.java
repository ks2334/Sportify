package com.ks2334;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ks2334.Database;

@WebServlet("/utility")
public class Utility extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(isLoggedIn){
				Database db = new Database();
				String type = request.getParameter("type");
				System.out.println("type:"+type);
				if(type.equals("AcceptFriendRequest")) {
					try {
						String user2 = request.getParameter("user");
						String user1 = session.getAttribute("loggedInUser").toString();
						db.acceptFriendRequest(true, user2, user1);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
					
				}
				else if(type.equals("DeclineFriendRequest")) {
					try {
						String user2 = request.getParameter("user");
						String user1 = session.getAttribute("loggedInUser").toString();
						db.acceptFriendRequest(false, user2, user1);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("SendFriendRequest")) {
					try {
						String user2 = request.getParameter("user");
						String user1 = session.getAttribute("loggedInUser").toString();
						db.sendFriendRequest(user1, user2);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("JoinTeamRequest")) {
					try {
						String user = request.getParameter("user");
						String team = request.getParameter("team");
						int val = db.joinTeamRequest(user, team);
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("AcceptTeamJoinRequest")) {
					try {
						String user = request.getParameter("user");
						String team = request.getParameter("team");
						int val = db.accceptTeamRequest(true, user, team);
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("DeclineTeamJoinRequest")) {
					try {
						String user = request.getParameter("user");
						String team = request.getParameter("team");
						int val = db.accceptTeamRequest(false, user, team);
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("DropTeam")) {
					try {
						String team = request.getParameter("team");
						int val = db.dropTeam(team);
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("AcceptUserMatchRequest")) {
					try {
						String matchId = request.getParameter("matchId");
						boolean isNull = Boolean.parseBoolean(request.getParameter("isNull"));
						int val = db.acceptUserMatchRequest(true, Integer.parseInt(matchId),isNull,session.getAttribute("loggedInUser").toString());
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("DeclineUserMatchRequest")) {
					try {
						String matchId = request.getParameter("matchId");
						boolean isNull = Boolean.parseBoolean(request.getParameter("isNull"));
						int val = db.acceptUserMatchRequest(false, Integer.parseInt(matchId),isNull,session.getAttribute("loggedInUser").toString());
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("AcceptTeamMatchRequest")) {
					try {
						String matchId = request.getParameter("matchId");
						int val = db.acceptTeamMatchRequest(true, Integer.parseInt(matchId));
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("DeclineTeamMatchRequest")) {
					try {
						String matchId = request.getParameter("matchId");
						int val = db.acceptTeamMatchRequest(false, Integer.parseInt(matchId));
						if(val>0) {
							response.setContentType("text/plain");
							response.getWriter().write("200");
						}
						else {
							response.setContentType("text/plain");
							response.getWriter().write("504");
						}
						
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
			}
			else {
				response.setContentType("text/plain");
				response.getWriter().write("401");
			}
		}
		catch(NullPointerException e) {
			response.setContentType("text/plain");
			response.getWriter().write("403");
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			boolean isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
			if(isLoggedIn){
				Database db = new Database();
				String type = request.getParameter("type");
				if(type.equals("BroadcastMatchRequest")) {
					try {			
						String user1 = session.getAttribute("loggedInUser").toString();
						String sportName = request.getParameter("sportName");
						String venueName = request.getParameter("venueName");
						String matchDateTime = request.getParameter("matchDateTime");
						db.broadcastMatchRequest(user1, sportName, venueName, matchDateTime);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("SendUserMatchRequest")) {
					try {			
						String user1 = session.getAttribute("loggedInUser").toString();
						String user2 = request.getParameter("user");						
						String sportName = request.getParameter("sportName");
						String venueName = request.getParameter("venueName");
						String matchDateTime = request.getParameter("matchDateTime");
						db.sendUserMatchRequest(user1, user2, sportName, venueName, matchDateTime);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
				else if(type.equals("SendTeamMatchRequest")) {
					try {			
						String team1 = request.getParameter("team1");
						String team2 = request.getParameter("team2");						
						String sportName = request.getParameter("sportName");
						String venueName = request.getParameter("venueName");
						String matchDateTime = request.getParameter("matchDateTime");
						db.sendTeamMatchRequest(team1, team2, sportName, venueName, matchDateTime);
						response.setContentType("text/plain");
						response.getWriter().write("200");
					}
					catch(Exception e) {
						response.setContentType("text/plain");
						response.getWriter().write("504");
					}
				}
			}
			else {
				response.setContentType("text/plain");
				response.getWriter().write("401");
			}
		}
		catch(NullPointerException e) {
			response.setContentType("text/plain");
			response.getWriter().write("403");
		}
		catch(Exception e) {
			System.out.println("Exception: " + e);
		}
	}
}
