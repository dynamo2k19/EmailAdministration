<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>

<%
	
		String mail = (String)session.getAttribute("email");
		
		String feedback = request.getParameter("feedback");		

		int eid = 0;
		String name = "";
	
	
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "select * from user where email = ?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, mail);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			eid = rs.getInt(1);
			name = rs.getString(2);
			
			String qry2 = "insert into eafeedback (eid, name, feedback) values (?, ?, ?)";
			PreparedStatement ps2 = con.prepareStatement(qry2);
			
			ps2.setInt(1, eid);
			ps2.setString(2, name);
			ps2.setString(3, feedback);
			
			ps2.executeUpdate();
			
			con.close();
			
			response.sendRedirect("EmpHome.jsp");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	
	%>