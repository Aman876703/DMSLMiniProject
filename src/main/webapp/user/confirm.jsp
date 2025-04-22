<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<div class="container-fluid">

<%
String total=request.getParameter("total");
String em=(String)session.getAttribute("email");
int date;

try
{
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedbxy","root","Root@123");
	PreparedStatement pst=cn.prepareStatement("insert into ordermaster(emailid,totalamount,orderdate) values (?,?,?)");
	pst.setString(1,em);
	pst.setString(2,total);
	pst.setString(3,(new java.util.Date()).toString());
	int ans=pst.executeUpdate();
	PreparedStatement pst1=cn.prepareStatement("select max(orderno) from ordermaster");
	ResultSet rs1=pst1.executeQuery();
	int ono=0;
	if(rs1.next())
	{
		ono=rs1.getInt(1);
	}
	
	PreparedStatement pst2=cn.prepareStatement("select carttt.product_id,carttt.quantity,pname,pimage,ptype,cname,price from product,carttt where product.pid=carttt.product_id and email=?");
	pst2.setString(1, em);
	ResultSet rs2=pst2.executeQuery();
	while(rs2.next())
	{
		String pid,si;
		int qty,pamt,pr;
		pid=rs2.getString("product_id");
		qty=rs2.getInt("quantity");
		pr=rs2.getInt("price");
		pamt=pr*qty;
		PreparedStatement pst3=cn.prepareStatement("insert into orderdetails values(?,?,?,?)");
		pst3.setInt(1, ono);
		pst3.setString(2, pid);
		pst3.setInt(3,qty);
		pst3.setInt(4,pamt);
	
		pst3.executeUpdate();
		PreparedStatement pst4=cn.prepareStatement("update product set quantity=quantity-"+qty+" where pid="+pid);
		pst4.executeUpdate();
		
		
	}
	PreparedStatement pst4=cn.prepareStatement("delete from carttt where email=?");
	pst4.setString(1, em);
	pst4.executeUpdate();
	
	out.println("<script>alert('Order placed successfully');window.location='index.jsp'</script>");
}
catch(Exception ex)
{
	ex.printStackTrace();
}

%>
</div>

<%@include file="footer.jsp"%>