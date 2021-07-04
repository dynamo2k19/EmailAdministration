<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<link rel="stylesheet" href="./css/default.css">
		
<title>Delete User</title>
</head>
<body>
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<h1 align="center">Delete User From User Records</h1>
	<div class="container bg-danger"><br/>
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
				<td><button type="button" onclick="setId(<%= rs.getInt(1) %>);" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal">DELETE</button></td>
				<!--  <td><a href="deletedata.jsp?id=<%= rs.getInt(1) %>" class="btn btn-danger btn-lg">DELETE</a></td> -->
			</tr>
		<% 
		}
		%>
		</table>
		<%
		for (int i = 0; i <= totalEmp/total; i++)
	 	{
	 		out.println("<ul class='pagination'><li><a href='delete.jsp?page=" + (i+1) + "'>" + (i+1) + "</a></li></ul>");
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
	
	<script type="text/javascript">
  		function setId(id)
  		{
  			document.getElementById("message").innerHTML = "Are You Sure You Want To Delete Data Of Employee ID " + id + "?";
  			document.getElementById("id").value = id;
  			//document.getElementById("id").style.display = "none";
  		}
  	</script>
	
	<!-- Modal for delete -->
  	<div class="modal fade" id="deleteModal" role="dialog">
    	<div class="modal-dialog">
        	<!-- Modal content-->
	      	<div class="modal-content">
	      		<div class="modal-header" style="height:50px;">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
	        	<div class="modal-body">
	        		<div id="message"></div>
		        	<form action="deletedata.jsp" method="get">
		        		<input type="hidden" name="id" id="id" class="form-control"><br/>
		        		<input type="submit" class="btn btn-danger form-control" value="Delete">
		        	</form>  
	        	</div>
	      	</div>
        </div>
	</div>
	
	
	
	<br/>
	<div class="text-center">
  		<a href="home.jsp" class="btn btn-lg btn-primary">Go Back</a>
  	</div>
</body>
</html>