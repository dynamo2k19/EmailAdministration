<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">

<title>WELCOME</title>
</head>
<body>

	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<br/>
<%

	String adminId = (String)session.getAttribute("adminId");
	if (adminId != null)
	{
		response.sendRedirect("home.jsp");
	}
	
	String status = request.getParameter("status");
	
	if (status != null)
	{
		if (status.equals("false"))
		{%>
			<div class="alert alert-danger">
			  Invalid Login Credentials!!! Please Try Again
			</div>
		<%}
		else
		{
			out.println("Something went wrong!");
		}
	}
	

%>

<%

	String email = (String) session.getAttribute("email");
	if (email != null)
	{
		response.sendRedirect("EmpHome.jsp");
	}
	
	String status2 = request.getParameter("status2");
	
	if (status2 != null)
	{
		if (status2.equals("false"))
		{%>
			<div class="alert alert-danger">
			  Invalid Login Credentials!!! Please Try Again
			</div>
		<%}
		else
		{
			out.println("Something went wrong!");
		}
	}
	

%>
<div class="container"><br/>
  <div class="row">
  	<div class="col-md-3"></div>
  	<div class="col-md-6">
  		<ul class="nav nav-pills">
		    <li style="font-weight:bold; font-size:25px; font-family:arial;" class="active"><a data-toggle="pill" href="#admin">Administrator</a></li>
		    <li style="font-weight:bold; font-size:25px; font-family:arial;"><a data-toggle="pill" href="#emp">Employee</a></li>
		  </ul>
		  
		  <div class="tab-content">
		    <div id="admin" class="tab-pane fade in active">
		      <br/>
		      <form action="AdminValidate.jsp" method="post">
				  <div class="form-group">
				    <label style="font-size:30px;">Admin ID</label>
				    <input type="text" class="form-control" name="adminId" placeholder="Enter your admin ID here" required style="height: 45px;">
				  </div>
				  <div class="form-group">
				    <label style="font-size:30px;">Password</label>
				    <input type="password" class="form-control" name="pass" placeholder="Enter your password here" required style="height: 45px;">
				  </div><br/>
				  <div class="text-center">
				  	<button type="submit" class="btn btn-success btn-lg btn-block" style="height: 50px;">Login</button>
				  </div>
				</form>
		    </div>
		    <div id="emp" class="tab-pane fade">
		      <br/>
     			<form action="EmpLoginHandler.jsp" method="post">
				  <div class="form-group">
				    <label style="font-size:30px;">Employee Email</label>
				    <input type="email" class="form-control" name="email" required placeholder="Enter your registered email ID here" style="height: 45px;">
				  </div>
				  <div class="form-group">
				    <label style="font-size:30px;">Password</label>
				    <input type="password" class="form-control" name="password" required placeholder="Enter your password here" style="height: 45px;">
				  </div><br/>
				  <div class="text-center">
				  	<button type="submit" class="btn btn-success btn-lg btn-block" style="height: 50px;">Login</button>
				  </div>
				</form>
		    </div>
		  </div>
  	</div>
  	<div class="col-md-1"></div>	
  	<div class="col-md-1"></div>
  	<div class="col-md-1"></div>
  </div>
</div>
</body>
</html>