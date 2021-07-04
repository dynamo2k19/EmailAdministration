<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	String id = request.getParameter("adminId");
	String pass = request.getParameter("pass");
	
	if (id.equalsIgnoreCase("admin101") && pass.equals("12345"))	//if matches create session for admin
	{
		session.setAttribute("adminId", id);
 		response.sendRedirect("home.jsp");
	}
	else
	{
		response.sendRedirect("index.jsp?status=false");
	}
	
%>