<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<%@ include file="header.jsp" %>

<div class="container-fluid">
<h1 class=text-center>Products In Cart</h1>
<table class="table table-bordered">
<thead>
<tr>
<th>Action</th><th>Product Id</th><th>Product Name</th><th>Image</th><th>Type</th><th>Size</th><th>Company</th><th>Price</th><th>Quantity</th><th>Amount<th>
</tr>
</thead>
<tbody>
<%
String n,im,ty,br,c,s,pid;
int pr,qt,total=0;
String em=(String)session.getAttribute("email");
try
{
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedbxy","root","Root@123");
	PreparedStatement pst=cn.prepareStatement("select carttt.product_id,carttt.quantity,carttt.email,pname,cname,price,details,ptype,section,size,pimage from product,carttt where product.pid=carttt.product_id and email=?");
	pst.setString(1, em);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		pid=rs.getString("product_id");
		n=rs.getString("pname");
		im=rs.getString("pimage");
		ty=rs.getString("ptype");
		br=rs.getString("details");
		pr=rs.getInt("price");
		c=rs.getString("size");
		s=rs.getString("cname");
		qt=rs.getInt("quantity");
		total=total+(pr*qt);
		%>
		<tr>
		<td> <a href="del.jsp?pid=<%=pid%>">Remove</a> </td>
		<td><%=pid %></td><td><%=n %></td>
		<td><img src="http://localhost:8080/ecom1/images/<%=im %>" width=100 height=120></td>
		<td><%=br %></td>
		<td><%=c %></td>
		<td><%=s %></td>
		<td><%=pr %></td>
		<td><%=qt %></td>
		<td><%=pr*qt %></td>
		</tr>
		<%
	}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
<tr>
<td colspan=9 align=right>Total Amount</td>
<td><%=total %></td>
</tr>
<tr>
<td colspan=10 align=center>
<a href="confirm.jsp?total=<%=total%>" class="btn btn-primary">Confirm Order</a>
</td>
</tr>
</tbody>
</table>

</div>

<%@include file="footer.jsp"%>