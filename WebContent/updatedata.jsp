<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.db.DBConnection" %>
<%
String mail = request.getParameter("m");
String id = "", department = "", pageNo = "";
int mailboxCap = 500;
try
{
	Connection con = DBConnection.getConnection();
	String qry;
	PreparedStatement ps;
	if (mail.equals("success"))
	{
		id = request.getParameter("id");
		department = request.getParameter("dept");
		mailboxCap = Integer.parseInt(request.getParameter("mailboxcap"));
		pageNo = request.getParameter("page");
		qry = "update user set department = ?, mailboxcap = ? where eid = ?";	
		ps = con.prepareStatement(qry);
		ps.setString(3, id);
		ps.setString(1, department);
		ps.setInt(2, mailboxCap);
	}
	else
	{
		String pass = request.getParameter("pass1");
		String alteremail = request.getParameter("alteremail");
		String email = request.getParameter("mail");
		qry = "update user set password = ?, alteremail = ? where email = ?";
		ps = con.prepareStatement(qry);
		ps.setString(3, email);
		ps.setString(1, pass);
		ps.setString(2, alteremail);
	}
	
	
	ps.executeUpdate();
	con.close();
}
catch (Exception e)
{
	System.out.println("IN CATCH");
	e.printStackTrace();
}


if (mail.equals("success"))
{
	response.sendRedirect("update.jsp?page="+pageNo);	
}
else
{
	response.sendRedirect("EmpHome.jsp");
}

%>