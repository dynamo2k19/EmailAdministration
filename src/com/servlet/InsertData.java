package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

/**
 * Servlet implementation class InsertData
 */
@WebServlet("/InsertData")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String department = request.getParameter("department");
		
		String email = createEmail(fname, lname, department);
		
		String name = fname + " " + lname;
		
		String password = createPass();
		
		int mailboxCap = 500; 
		
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "insert into user(name, department, email, password, mailboxcap) values(?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, name);
			ps.setString(2, department);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setInt(5, mailboxCap);
			ps.execute();
			con.close();
		}
		catch (Exception e)
		{
			response.getWriter().print("CANNOT ADD MEMBER?USER DUE TO " + e);
			e.printStackTrace();
			return;
		}
		
		response.sendRedirect("home.jsp");
		
	}
	
	//Generate Default Password
	private String createPass()
	{
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%&*";
		char[] pass = new char[7];
		for (int i = 0; i < 7; i++)
		{
			int r = (int)(Math.random() * chars.length());
			pass[i] = chars.charAt(r);
		}
		return new String(pass);
	}
	
	//Create Company Email based on department
	private String createEmail(String fname, String lname, String department)
	{
		String dept = "";
		
		if (department.equals("Business Development"))
		{
			dept = "business";
		}
		else if (department.equals("Sales and Marketing"))
		{
			dept = "sales";
		}
		else if (department.equals("Development"))
		{
			dept = "dev";
		}
		else if (department.equals("Test Team"))
		{
			dept = "test";
		}
		else if (department.equals("Architecture"))
		{
			dept = "arch";
		}
		else if (department.equals("Customer Support"))
		{
			dept = "support";
		}
		else if (department.equals("Operations"))
		{
			dept = "ops";
		}
		
		String email = fname.toLowerCase() + "." + lname.toLowerCase() + "@" + dept + "." + "lexcorp.com";
		
		return email;
	}

}
