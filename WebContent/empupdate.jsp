<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BootstrapCDN.jsp" %>
<script src="./js/checkpassword.js"></script>
<link rel="stylesheet" href="./css/default.css">
<meta charset="ISO-8859-1">
<title>Update Profile</title>
</head>
<body>
	<%
	
		String mail = (String)session.getAttribute("email");
	
		String name = "", department = "", alterEmail = "";
	
	
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "select * from user where email = ?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, mail);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			name = rs.getString(2);
			department = rs.getString(3);
			alterEmail = rs.getString(7);
			
			if (alterEmail.equals(" "))
			{
				alterEmail = "Add Alternate Email Address";
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
	
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="updatedata.jsp" method="post" name="updateForm">
				  <div class="form-group">
				    <label style="font-size:20px;">New Password</label>
				    <input type="password" class="form-control" name="pass1" placeholder="*******" style="height: 35px;">
				    <input type="hidden" name="m" id="m" value = "ok" class="form-control">
				  </div>
				  <div class="form-group">
				    <label style="font-size:20px;">Re-Enter New Password</label>
				    <input type="password" class="form-control" onkeyup="checkPassword()" name="pass2" placeholder="*******" style="height: 35px;">
				  	<span id="msg"></span>
				  </div>
				  <div class="form-group">
				    <label style="font-size:20px;">Alternate Email</label>
				    <input type="email" class="form-control" name="alteremail" placeholder="<%= alterEmail %>" style="height: 35px;">
				    <input type="hidden" name="mail" id="mail" value = "<%= mail %>" class="form-control">
				  </div><br/>
				  <div class="text-center">
				  	<button type="submit" class="btn btn-success btn-lg btn-block" style="height: 40px;">UPDATE</button>
				  </div>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	
	<br/><br/>
	<div class="text-center">
		  	<a href="EmpHome.jsp" class="btn btn-lg btn-primary">Go Back</a>
		  </div>
	
	
</body>
</html>