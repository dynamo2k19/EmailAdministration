<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">
		
<title>Update</title>
</head>
<body>
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<h1 align="center">Update User Records</h1>
	<div class="container bg-warning"><br/>
	<%
	String pageNo = request.getParameter("page");  // "1"
	int pageId = Integer.parseInt(pageNo);  //1
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
		String qry = "select * from user order by eid limit ?, ?";
		
		PreparedStatement ps = con.prepareStatement(qry);
		ps.setInt(1, pageId - 1);
		ps.setInt(2, total);
		ResultSet rs = ps.executeQuery();
		
		String qry2 = "select count(*) from user";
		PreparedStatement ps2 = con.prepareStatement(qry2);
		ResultSet rs2 = ps2.executeQuery();
		rs2.next();
		int totalEmp = rs2.getInt(1);
		%>
		<table class="table table-hover table-bordered table-striped">
			<tr><th>ID</th> <th>NAME</th><th>DEPARTMENT</th> <th>EMAIL</th> <th>MAILBOX CAPACITY</th> <th>Action</th></tr>
		<% 
		while (rs.next())
		{%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getInt(6) %></td>
				<td><button type="button" onclick="setId(<%= rs.getInt(1) %>);" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal">UPDATE</button></td>
			</tr>
		<% 
		}
		%>
		</table>
		<%
		for (int i = 0; i <= totalEmp/total; i++)
	 	{
	 		out.println("<ul class='pagination'><li><a href='update.jsp?page=" + (i+1) + "'>" + (i+1) + "</a></li></ul>");
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
  		function setId(id)
  		{
  			document.getElementById("id").value = id;
  		}
  	</script>
  	
  	<!-- Modal for update -->
  	<div class="modal fade" id="updateModal" role="dialog">
    	<div class="modal-dialog">
        	<!-- Modal content-->
	      	<div class="modal-content">
	      		<div class="modal-header" style="height:50px;">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
	        	<div class="modal-body">
		        	<form action="updatedata.jsp?m=success" method="post">
		        		<input type="text" name="id" id="id" class="form-control" readonly="readonly">
		        		<input type="hidden" name="m" id="m" value = "success" class="form-control">
		        		<input type="hidden" name="page" id="page" value = "<%= pageNo %>" class="form-control"><br/>
		        		<label style="font-size:20px;">Update Department</label>
					    <select class="form-control" name="dept" required>
					      <option selected="true" disabled="disabled">Select Department</option>
					      <option value="Business Development">Business Development</option>
					      <option value="Sales and Marketing">Sales and Marketing</option>
					      <option value="Development">Development</option>
					      <option value="Test Team">Test Team</option>
					      <option value="Architecture">Architecture</option>
					      <option value="Customer Support">Customer Support</option>
					      <option value="Operations">Operations</option>
					    </select><br/>
		        		<input type="number" name="mailboxcap" class="form-control" placeholder="Enter New Mailbox Capacity""><br/>
		        		<input type="submit" class="btn btn-warning form-control" value="Update">
		        	</form>  
	        	</div>
	      	</div>
        </div>
	</div>
  	
</body>
</html>