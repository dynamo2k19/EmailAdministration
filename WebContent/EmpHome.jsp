<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<title>Home</title>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/buttons_emp.css">

</head>
<body>
	<%
		String mail = (String)session.getAttribute("email");
		if (mail == null)
		{
				response.sendRedirect("index.jsp");
		}
		
	%>
	
	<%
		int empId = 0;
	
	
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "select eid from user where email = ?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, mail);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			empId = rs.getInt(1);
			
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
	
	<div class="container">
		<br/><br/><br/><br/><br/><br/>
		<div class="row">
			
			<div class="col-md-3" onclick="location.href='empview.jsp'" id="select">View Your Profile</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" onclick="location.href='empupdate.jsp'" id="update">Update Your Profile</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" onclick="location.href='feedback.jsp'" id="feedback">Send Feedback</div>
			
		</div>
		<div class="row">
			<br/><br/><br/><br/>
			<div class="col-md-2"></div>
			<div class="col-md-3"></div>
			<div class="col-md-2"><a href="logout.jsp" class="btn btn-primary btn-lg">Logout</a></div>
			<div class="col-md-3"></div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>