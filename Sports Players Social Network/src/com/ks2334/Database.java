package com.ks2334;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpSession;

public class Database {
	private Connection con;
	private PreparedStatement stmt;
	
	public void createConnection() throws ClassNotFoundException, SQLException {
		String databaseUrl = "jdbc:mysql://localhost:3306/sportify";
		String user = "miniProjectUser";
		String password = "password";
		Class.forName("com.mysql.cj.jdbc.Driver");  
		con=DriverManager.getConnection(databaseUrl,user,password);
	}
	
	public void closeConnections() throws SQLException {
		con.close();
		stmt.close();
	}
	
	public int addUser(User u) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "insert into User (username, firstName, lastName, email, password, phone, dob, description,address,profilePicture) values (?,?,?,?,?,?,STR_TO_DATE(?,'%Y-%m-%d'),?,?,?);";
			stmt = con.prepareStatement(query);
			
			stmt.setString(1, u.username);
			stmt.setString(2, u.fname);
			stmt.setString(3, u.lname);
			stmt.setString(4, u.email);
			stmt.setString(5, u.password);
			stmt.setLong(6, u.phone);
			stmt.setString(7, u.dob);
			stmt.setString(8, u.description);
			stmt.setString(9, u.address);
			stmt.setBoolean(10, u.isProfilePicUploaded);
			
			int i=stmt.executeUpdate();
			
			for(String s:u.sports){  
				query = "insert into SportUser (sportName,username) values ((select sportName from Sport where sportName=?),(select username from User where username=?))";
				stmt = con.prepareStatement(query);
				stmt.setString(1, s);
				stmt.setString(2, u.username);
				stmt.executeUpdate();
			}
			stmt.close();
			con.close(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			con.close(); 
			return 0;
		} 
	}
	
	public String authenticateUser(String username, String password) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select username from User where username=? and password=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();			
			if(rs.next()) {
				username = rs.getString(1);
				stmt.close();
				con.close();
				return username;
			}
			
			stmt.close();
			con.close();
			return null;
			
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			con.close();
		}
		
		return null;
	}
	
	public ResultSet getUserData(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select username,firstName,lastName,address,email,phone,description,dob from User where username=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();			
			return rs;
			
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
		}
		
		return null;
	}
	
	public ResultSet getSuggestions(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select username,firstName,lastName,description,address from User where username!=?;";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			stmt.close();
			con.close();
			return null;
		}
	}
	
	public int isFriend(String user1, String user2) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			if(user1.equals(user2)) {
				return -1;
			}
			String query = "select * from Friends where user1=(select username from User where username=?) and user2=(select username from User where username=?)";
			stmt = con.prepareStatement(query);
			stmt.setString(1, user1);
			stmt.setString(2, user2);
			ResultSet rs = stmt.executeQuery();
			int val = 0;
			if(rs.next()) {
				if(rs.getBoolean(3)) {
					// If Friend Request Accepted
					return 1;
				}
				else {
					val =  2;
				}
			}
			query = "select * from Friends where user1=(select username from User where username=?) and user2=(select username from User where username=?)";
			stmt = con.prepareStatement(query);
			stmt.setString(1, user2);
			stmt.setString(2, user1);
			rs = stmt.executeQuery();
			if(rs.next()) {
				if(rs.getBoolean(3)) {
					// If Friend Request Accepted
					return 1;
				}
				else {
					val =  3;
				}
			}
			
			
			return val;
			
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		}
	}
	
	public int sendFriendRequest(String user1,String user2) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "insert into Friends (user1, user2,isAccepted) values ((select username from User where username=?),(select username from User where username=?),false);";
			stmt = con.prepareStatement(query);
			stmt.setString(1, user1);
			stmt.setString(2, user2);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public int acceptFriendRequest(boolean isAccepted, String user1, String user2) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query;
			if(isAccepted) {
				query = "update Friends set isAccepted=true where user1=(select username from User where username=?) and user2=(select username from User where username=?)";
			}
			else {
				query = "delete from Friends where user1=(select username from User where username=?) and user2=(select username from User where username=?)";
			}
			stmt = con.prepareStatement(query);
			stmt.setString(1, user1);
			stmt.setString(2, user2);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public ResultSet[] getFriendsUser(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		ResultSet[] rs = new ResultSet[2];
		String query;
		try {
			query = "select User.username,User.firstName,User.lastName from Friends inner join User on Friends.user1=User.username where user2=? and isAccepted=true";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			rs[0] = stmt.executeQuery();
			
			query = "select User.username,User.firstName,User.lastName from Friends inner join User on Friends.user2=User.username where user1=? and isAccepted=true";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			rs[1] = stmt.executeQuery();	
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getFriendRequests(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		ResultSet rs;
		String query;
		try {
			query = "select User.username,User.firstName,User.lastName from Friends inner join User on Friends.user1=User.username where user2=? and isAccepted=false";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getVenues() throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select venueName,venueAddress from Venue";
			stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getSports() throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select sportName from Sport";
			stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getUserSports(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select sportName from SportUser where username=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1,username);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public int createTeam(String teamName, String sportName, String teamDetails, String teamStats,String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "insert into Team values (?,(select sportName from Sport where sportName=?),?,?)";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			stmt.setString(2, sportName);
			stmt.setString(3, teamDetails);
			stmt.setString(4, teamStats);
			int i = stmt.executeUpdate();   
			
			query = "insert into TeamPlayer (playerName,teamName,isCaptain,isAccepted) values ((select username from User where username=?),(select teamName from Team where teamName=?),true,true)";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, teamName);
			i = stmt.executeUpdate();
			
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public ResultSet getUserTeams(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select Team.teamName,Team.sportName,Team.teamDetails,Team.teamStats from TeamPlayer inner join User on User.username=TeamPlayer.playerName inner join Team on TeamPlayer.teamName=Team.teamName where User.username=?;";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getTeamSuggestions(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select teamName,sportName,teamDetails,teamStats from Team";
			stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getTeamPlayers(String teamName,boolean isAccepted) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select User.username,User.firstName,User.lastName,TeamPlayer.isCaptain from Team inner join TeamPlayer on Team.teamName=TeamPlayer.teamName inner join User on TeamPlayer.playerName=User.username where Team.teamName=? and TeamPlayer.isAccepted=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			stmt.setBoolean(2, isAccepted);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public int joinTeamRequest(String playerName,String teamName) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "insert into TeamPlayer (playerName,teamName) values ((select username from User where username=?),(select teamName from Team where teamName=?))";
			stmt = con.prepareStatement(query);
			stmt.setString(1, playerName);
			stmt.setString(2, teamName);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public ResultSet getTeamDetails(String teamName) throws ClassNotFoundException, SQLException {
		//Returns Teams Details and Stats
		createConnection();
		try {
			String query = "select * from Team where teamName=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public int accceptTeamRequest(boolean isAccepted, String playerName, String teamName) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query;
			if(isAccepted) {
				query = "update TeamPlayer set isAccepted=true where playerName=(select username from User where username=?) and teamName=(select teamName from Team where teamName=?)";
			}
			else {
				query = "delete from TeamPlayer where playerName=(select username from User where username=?) and teamName=(select teamName from Team where teamName=?)";
			}
			stmt = con.prepareStatement(query);
			stmt.setString(1, playerName);
			stmt.setString(2, teamName);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public int dropTeam(String teamName) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "delete from Team where teamName=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}

	public ResultSet getTeamJoinRequests(String teamName) throws ClassNotFoundException, SQLException {
		createConnection();
		ResultSet rs;
		String query;
		try {
			query = "select User.username,User.firstName,User.lastName from Team inner join TeamPlayer on Team.teamName=TeamPlayer.teamName inner join User on User.username=TeamPlayer.playerName where TeamPlayer.teamName=? and isAccepted=false;";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			rs = stmt.executeQuery();
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public int isTeamMember(String teamName,String username) throws ClassNotFoundException, SQLException {
		//0-Not Member
		//1-Join Request Sent
		//2-Team Member
		//3-Team Captain
		createConnection();
		try {
			String query = "select * from TeamPlayer where teamName=(select teamName from Team where teamName=?) and playerName=(select username from User where username=?)";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			stmt.setString(2, username);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				if(rs.getBoolean(3)) {
					// Captain
					return 3;
				}
				else {
					if(rs.getBoolean(4)) {
						return 2;
					}
					else {
						return 1;
					}
				}
			}
			
			return 0;
			
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		}
	}

	public int sendTeamMatchRequest(String team1, String team2, String sportName, String venue, String matchDateTime) throws ClassNotFoundException, SQLException {
		//Send Match Reuqest from Team 1 to Team 2
		createConnection();
		try {
			String query = "insert into Matches (team1, team2, sport, venue, matchDate) values ((select teamName from Team where teamName=?),(select teamName from Team where teamName=?),(select sportName from Sport where sportName=?), (select venueId from Venue where venueName=?), CONVERT(?, DATETIME))";
			stmt = con.prepareStatement(query);
			stmt.setString(1, team1);
			stmt.setString(2,team2);
			stmt.setString(3, sportName);
			stmt.setString(4, venue);
			stmt.setString(5, matchDateTime);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		}
	}
	
	public int broadcastMatchRequest(String username,String sport,String venue,String datetime) throws ClassNotFoundException, SQLException {
		//Broadcast Match Request
		createConnection();
		try {
			String query = "insert into UserMatches (user1, sport, venue, matchDate) values ((select username from User where username=?),(select sportName from Sport where sportName=?),(select venueId from Venue where venueName=?),CONVERT(?, DATETIME))";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2,sport);
			stmt.setString(3, venue);
			stmt.setString(4, datetime);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		}
	}
	
	public int sendUserMatchRequest(String user1,String user2,String sport,String venue,String datetime) throws ClassNotFoundException, SQLException {
		//Send Match Reuqest from User 1 to User 2
		createConnection();
		try {
			String query = "insert into UserMatches (user1, user2, sport, venue, matchDate) values ((select username from User where username=?),(select username from User where username=?),(select sportName from Sport where sportName=?),(select venueId from Venue where venueName=?),CONVERT(?, DATETIME))";
			stmt = con.prepareStatement(query);
			stmt.setString(1, user1);
			stmt.setString(2, user2);
			stmt.setString(3,sport);
			stmt.setString(4, venue);
			stmt.setString(5, datetime);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		}
	}
	
	public int acceptUserMatchRequest(boolean isAccepted, int matchId,boolean isNull,String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query;
			if(isAccepted) {
				if(isNull) {
					query = "update UserMatches set isAccepted=true,user2=? where matchId=?";
					stmt = con.prepareStatement(query);
					stmt.setString(1, username);
					stmt.setInt(2, matchId);
				}
				else {
					query = "update UserMatches set isAccepted=true where matchId=?";
					stmt = con.prepareStatement(query);
					stmt.setInt(1, matchId);
				}
			}
			else {
				if(isNull) {
					return 1;
				}
				else {
					query = "delete from UserMatches where matchId=?";
					stmt = con.prepareStatement(query);
					stmt.setInt(1, matchId);
				}
				
			}
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public int acceptTeamMatchRequest(boolean isAccepted, int matchId) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query;
			if(isAccepted) {
				query = "update Matches set isAccepted=true where matchId=?";
			}
			else {
				query = "delete from Matches where matchId=?";
			}
			stmt = con.prepareStatement(query);
			stmt.setInt(1, matchId);
			int i = stmt.executeUpdate();   
			closeConnections(); 
			return i;
		}
		catch(SQLException ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return 0;
		} 
	}
	
	public ResultSet getUserMatchRequests(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select UserMatches.matchId,UserMatches.user1,UserMatches.user2,UserMatches.sport,Venue.venueName,Venue.venueAddress,UserMatches.matchDate from UserMatches inner join Venue on Venue.venueId=UserMatches.venue where (user2=? or (user2 is null and user1!=?)) and isAccepted=false";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, username);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getTeamMatchRequests(String teamName) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query = "select Matches.matchId,Matches.team1,Matches.team2,Matches.sport,Venue.venueName,Venue.venueAddress,Matches.matchDate from Matches inner join Venue on Venue.venueId=Matches.venue where team2=? and isAccepted=false";
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public ResultSet getMatches(String teamName,boolean isDone) throws ClassNotFoundException, SQLException {
		createConnection();
		try {
			String query;
			if(isDone) {
				query = "select * from Matches where (team1=? or team2=?) and isAccepted=true";
			}
			else {
				query = "select * from Matches where (team1=? or team2=?) and isDone=false and isAccepted=true";
			}
			stmt = con.prepareStatement(query);
			stmt.setString(1, teamName);
			stmt.setString(2, teamName);
			ResultSet rs = stmt.executeQuery();			
			return rs;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return null;
		}
	}
	
	public int[] getUserStats(String username) throws ClassNotFoundException, SQLException {
		createConnection();
		int s[] = new int[4];
		String query;
		try {
			query = "select count(user1) from Friends where (user1=? or user2=?) and isAccepted=true";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, username);
			ResultSet rs = stmt.executeQuery();			
			if(rs.next()) {
				s[0] = rs.getInt(1);
			}
			
			query = "select level from User where username=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			rs = stmt.executeQuery();			
			if(rs.next()) {
				s[1] = rs.getInt(1);
			}
			
			query = "";
			s[2]=0;
			query = "";
			s[3]=0;
			closeConnections();
			return s;
		}
		catch(Exception ex) {
			System.out.println("Exception: "+ex);
			closeConnections();
			return s;
		}
	}
}


class User {
	public String username;
	public String fname;
	public String lname;
	public String email;
	public String password;
	public long phone;
	public String dob; // yyyy-mm-dd
	public String description;
	public String address;
	public String cpassword;
	public boolean isProfilePicUploaded;
	public List<String> sports=new ArrayList<String>();  
	
	
	public boolean validateUser() {
		// password==cpassword
		// phone length = 10
		// email validation
		// dob greater than some date
		// username does not exist
		return true;
	}
}

