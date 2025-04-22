<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
String pid=request.getParameter("pid");
String em=(String)session.getAttribute("email");
try
{
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedbxy","root","Root@123");
	PreparedStatement pst=cn.prepareStatement("delete from carttt where product_id=? and email=?");
	pst.setString(1, pid);
	pst.setString(2, em);
	pst.executeUpdate();
	response.sendRedirect("cart.jsp");
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>