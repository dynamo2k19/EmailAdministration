<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">

<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<%
	
		String mail = (String)session.getAttribute("email");
	
		int mailBoxCap = 500, eid = 0;
		String name = "", department = "", altmail = "";
	
	
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
			department = rs.getString(3);
			mailBoxCap = rs.getInt(6);
			altmail = rs.getString(7);
			
			if (altmail.equals(" "))
			{
				altmail = "Add Your Alternate Email Address";
			}
			
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	
	%>
	
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<br/>
	
	<div class="container text-info" style="font-family:times new roman;">
		<div class="well">
		<h3>Employee ID: &nbsp;&nbsp;<span><%=eid%></span></h3>
		<h3>Name: &nbsp;&nbsp;<span><%=name%></span></h3>
		<h3>Department: &nbsp;&nbsp;<span><%=department%></span></h3>
		<h3>Email: &nbsp;&nbsp;<span><%=mail%></span></h3>
		<h3>Alternate Email: &nbsp;&nbsp;<span><%=altmail%></span></h3>
		<h3>Mail Box Capacity: &nbsp;&nbsp;<span><%=mailBoxCap%></span></h3>
		</div>
	</div><br/><br/>
	<div class="text-center">
		  	<a href="EmpHome.jsp" class="btn btn-lg btn-primary">Go Back</a>
		  </div>
</body>
</html>