<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="BootstrapCDN.jsp" %>
<title>View</title>
<link rel="stylesheet" href="./css/default.css">

</head>
<body>
	<div class="header">
	  EMAIL ADMINISTRATION
	</div>
	<h1 align="center">User Records</h1>
	<div class="container bg-success"><br/>
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
		<table class="table table-hover table-striped table-bordered">
			<tr><th>ID</th> <th>NAME</th><th>DEPARTMENT</th><th>EMAIL</th><th>MAILBOX CAPACITY</th></tr>
		<% 
		while (rs.next())
		{%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getInt(6) %></td>
			</tr>
		<% 
		}
		%>
		</table>
		<%
		for (int i = 0; i <= totalEmp/total; i++)
	 	{
	 		out.println("<ul class='pagination'><li><a href='selectdata.jsp?page=" + (i+1) + "'>" + (i+1) + "</a></li></ul>");
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
	
</body>
</html>