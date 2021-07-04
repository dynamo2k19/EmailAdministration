package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.LoginBean;

public class LoginDetails {

	public static String checkLogin(LoginBean ob)
	{
		try
		{
			Connection con = DBConnection.getConnection();
			
			String qry = "select * from user where email = ? and password = ?";
			
			PreparedStatement ps = con.prepareStatement(qry);
			
			ps.setString(1, ob.getEmail());
			ps.setString(2, ob.getPassword());
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next())
			{
				return "true";
			}
			else
			{
				return "false";
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "ERROR";
		
	}
	
}
