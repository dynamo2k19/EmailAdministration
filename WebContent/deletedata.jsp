<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		System.out.println(id);
		try
		{
			Connection con = DBConnection.getConnection();
			String qry = "delete from user where eid = ?";
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1, id);
			ps.executeUpdate();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		response.sendRedirect("delete.jsp?page=1");
	%>
</body>
</html>