<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<title>Home</title>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/buttons_admin.css">

</head>
<body>
	<%
		String adminId = (String)session.getAttribute("adminId");
		if (adminId == null)
		{
			response.sendRedirect("index.jsp");
		}
		
	%>
	
	
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<br/><br/>
	<div class="container">
		<div class="row">
			<div class="col-md-3" onclick="location.href='insert.jsp'" id="insert">Create New</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" onclick="location.href='update.jsp?page=1'" id="update">Update Existing Employee</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" onclick="location.href='selectdata.jsp?page=1'" id="select">View Employee Data></div>
		</div>
		<div class="row"><br/><br/><br/>
			<div class="col-md-2"></div>
			<div class="col-md-3" onclick="location.href='delete.jsp?page=1'" id="delete">Delete Employee Data</div>
			<div class="col-md-1"></div>
			<div class="col-md-3" onclick="location.href='feedbackview.jsp?page=1'" id="feedback">View Feedback</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row"><br/>
			<div class="col-lg-5"></div>
			<div class="col-lg-2"><a href="logout.jsp" class="btn btn-primary btn-lg">Logout</a></div>
			<div class="col-lg-5"></div>
		</div>
	</div>
	<br/><br/><br/>
	<!--<div id="footer">
		Lex Corp 2021
	</div>-->
	
</body>
</html>