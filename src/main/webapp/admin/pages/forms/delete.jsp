<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
String pid=request.getParameter("pid");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
}
catch(ClassNotFoundException ex)
{
	ex.printStackTrace();
}
try
{
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedbxy","root","Root@123");
	PreparedStatement pst=cn.prepareStatement("delete from product where pid=?");
	pst.setString(1,pid);
	pst.executeUpdate();
	out.println("<script>alert('deleted successfully');window.location='manage.jsp' </script>");
}
catch(SQLException ex)
{
	ex.printStackTrace();
}
%>
