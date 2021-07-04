<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">
<title>Add New</title>
</head>
<body>
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
			<br/><br/><br/><br/>
		  <form action="save" method="post">
		  <div class="form-group">
		    <label style="font-size:30px;">First Name</label>
		    <input type="text" class="form-control" name="fname" placeholder="Enter First Name" style="height: 45px;" required pattern="[a-zA-Z ]+">
		  </div>
		  <div class="form-group">
		    <label style="font-size:30px;">Last Name</label>
		    <input type="text" class="form-control" name="lname" placeholder="Enter Last Name" style="height: 45px;" required pattern="[a-zA-Z ]+">
		  </div>
		  <div class="form-group">
		    <label style="font-size:30px;">Choose Department</label>
		    <select class="form-control" name="department" required>
		      <option selected="true" disabled="disabled">Select Department</option>
		      <option value="Business Development">Business Development</option>
		      <option value="Sales and Marketing">Sales and Marketing</option>
		      <option value="Development">Development</option>
		      <option value="Test Team">Test Team</option>
		      <option value="Architecture">Architecture</option>
		      <option value="Customer Support">Customer Support</option>
		      <option value="Operations">Operations</option>
		    </select>
		  </div><br/>
		  <div class="text-center">
		  	<button type="submit" class="btn btn-success btn-lg btn-block" style="height: 50px;">ADD</button>
		  </div><br/>
		  <div class="text-center">
		  	<a href="home.jsp" class="btn btn-lg btn-primary">Go Back</a>
		  </div>
		</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
   	
</body>
</html>