<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.LoginDetails" %>
 <jsp:useBean id="ob" class="com.bean.LoginBean" scope="session"/>
 <jsp:setProperty property="*" name="ob"/>
 
 <%
 	String res = LoginDetails.checkLogin(ob);
 	//System.out.println(ob.getEmail());
 	//System.out.println(ob.getPassword());
 	if (res.equals("true"))
 	{
 		session.setAttribute("email", ob.getEmail());
 		response.sendRedirect("EmpHome.jsp?email="+ob.getEmail());
 	}
 	if (res.equals("false"))
 	{
 		response.sendRedirect("index.jsp?status2=false");
 	}
 	if (res.equals("ERROR"))
 	{
 		response.sendRedirect("index.jsp?status2=error");
 	}
 
 %>  