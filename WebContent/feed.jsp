<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>

<%
	
		String pageNo = request.getParameter("page");
		String fid = request.getParameter("fid");		

		String feedback = "";
	
	
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "select feedback from eafeedback where fid = ?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, fid);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next())
			{
				feedback = rs.getString(1);
			}
			
			con.close();
			
			//response.sendRedirect("feedbackview.jsp?page="+pageNo);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	
	%>

<html>
<head>
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
	  EEMAIL ADMINISTRATION
	</div>
	
	<!--  <h1 class="text-center">Enter Feedback</h1><br/><br/>  -->
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				
					<div class="form-group">
					  <label style="font-size:40px;">Feedback:</label><br/>
					  <textarea name="feedback" class="form-control" rows="7" style="font-size: 32px;" readonly><%= feedback %></textarea>
					</div>
				
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row"><br/>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="text-center">
			  		<a href="feedbackview.jsp?page=<%= pageNo %>" class="btn btn-lg btn-primary">Go Back</a>
			  	</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

</body>

</html>