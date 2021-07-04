<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">
		
<title>View Feedback</title>
</head>
<body>
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<h1 align="center">View Feedback Of Employees</h1>
	<div class="container bg-warning"><br/>
	
	<%
	String pageNo = request.getParameter("page");  // "1" initially
	
	int pageId = Integer.parseInt(pageNo);  //1  changed to int
	int total = 7;
	if (pageId == 1)
	{
		
	}
	else
	{
		pageId = pageId - 1;
		pageId = pageId * total + 1;
	}
	try
	{
		Connection con = DBConnection.getConnection();
		String qry = "select * from eafeedback order by fid limit ?, ?";
		
		PreparedStatement ps = con.prepareStatement(qry);
		ps.setInt(1, pageId - 1);
		ps.setInt(2, total);
		ResultSet rs = ps.executeQuery();
		
		String qry2 = "select count(*) from eafeedback";
		PreparedStatement ps2 = con.prepareStatement(qry2);
		ResultSet rs2 = ps2.executeQuery();
		rs2.next();
		int totalEmp = rs2.getInt(1);
	%>
		<table class="table table-hover table-bordered table-striped">
			<tr><th>Feedback ID</th> <th>Employee ID</th> <th>Name</th> <th>Action</th></tr>
		<% 
		while (rs.next())
		{
		%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td class="text-center"><button type="button" onclick="setFeed(<%= rs.getInt(1) %>);" class="btn btn-warning btn-sm">VIEW FEEDBACK</button></td>
			</tr>
		<%
		}
		%>
		</table>
		<%
			for (int i = 0; i <= totalEmp/total; i++)
		 	{
		 		out.println("<ul class='pagination'><li><a href='feedbackview.jsp?page=" + (i+1) + "'>" + (i+1) + "</a></li></ul>");
		 	}
		%>
		</div>
		<% 
		con.close();
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	%>
	<br/>
	<div class="text-center">
  		<a href="home.jsp" class="btn btn-lg btn-primary">Go Back</a>
  	</div>
  	
  	<script type="text/javascript">
  		function setFeed(fid)
  		{
  				var page = <%= pageNo %>;
  	  			window.location.href = "feed.jsp?page="+page+"&fid="+fid;
  	  		
  		}
  	</script>
  	
  	<!--  <div class="modal fade" id="feedbackModal" role="dialog">
    	<div class="modal-dialog">
	      	<div class="modal-content">
	      		<div class="modal-header" style="height:50px;">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
	        	<div class="modal-body">
	        		<div id="message"></div>
	        		<div class="form-group">
					  <textarea name="feedback" id="feedback" class="form-control" rows="7" style="font-size: 22px;" readonly></textarea>
					</div>
	        	</div>
	      	</div>
        </div>
	</div> -->
  	
</body>
</html>