package com.ks2334;

import java.sql.*;  

public class MysqlConnection{
	
	public static Connection createConnection() throws ClassNotFoundException, SQLException {
		String databaseName = "jdbc:mysql://localhost:3306/sportify";
		String user = "miniProjectUser";
		String password = "password";
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection(databaseName,user,password);
		return con;
	}
	
	public static void main(String args[]){  
		try{  
			Connection con = createConnection(); 
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select * from User;"); //executeUpdate("insert ")
			while(rs.next()) {
				System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
			}    
			
			con.close();
		}
		catch(Exception e)
		{ 
			System.out.println(e);
		}  
	}  
}  

// Connection con = MysqlConnection.createConnection()
