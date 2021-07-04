package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection()
	{
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			String user = "root";
			String pass = "rootwdp";
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailadmin", user, pass);	
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
}
