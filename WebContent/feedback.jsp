<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<title>Feedback!</title>
<link rel="stylesheet" href="./css/default.css">
<style>
 
  #feedback
  {
  	background-color: #00C851;
  	height: 200px; 
  	cursor: pointer;
  	text-align: center;
  	padding: 70px 0;
  	font-family: cursive;
  	font-size: 32px;
  	font-weight: bold;
  }
	
</style>
</head>
<body>

	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	
	<!--  <h1 class="text-center">Enter Feedback</h1><br/><br/>  -->
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="feedbackhandler.jsp" method="post">
					<div class="form-group">
					  <label style="font-size:40px;">Enter Feedback:</label><br/>
					  <textarea name="feedback" class="form-control" rows="7" style="font-size: 32px; background-color:#9ae59a;"></textarea>
					</div>
					<div class="text-center">
				  	<button type="submit" class="btn btn-success btn-lg" style="height: 40px;">Submit</button>
				  </div>
				</form>
				
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row"><br/>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="text-center">
			  		<a href="EmpHome.jsp" class="btn btn-lg btn-primary">Go Back</a>
			  	</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	
	
</body>
</html>