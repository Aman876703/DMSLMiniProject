<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp" %>

<div class="container-fluid">
<h1 class=text-center>Your Orders</h1>
	<div class="accordion" id="accordionExample">
<%
try
{
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedbxy","root","Root@123");
	PreparedStatement pst=cn.prepareStatement("select orderno from ordermaster where emailid=?");
	pst.setString(1, (String)session.getAttribute("emailid"));
	out.println("<h2>"+(String)session.getAttribute("email"));
	ResultSet rs=pst.executeQuery();
while(rs.next())
{
	 String or=rs.getString("orderno");

		%>
	
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<%=or %>" aria-expanded="true" aria-controls="collapseOne">
        Order No #<%=or %>
      </button>
    </h2>
    <div id="<%=or %>" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      <table class="table table-bordered">
<thead>
<tr>
<th>Product Id</th><th>Product Name</th><th>Image</th><th>Brand</th><th>Color</th><th>Size</th><th>Price</th><th>Quantity</th><th>Amount</th>
</tr>
</thead>
<tbody>
      <%
      PreparedStatement pst2=cn.prepareStatement("select ordermaster.orderno,ordermaster.totalamount,ordermaster.orderdate,orderdetails.pid,orderdetails.qty,orderdetails.pamt,product.pname,product.Pimage,product.price,product.cname from ordermaster ,orderdetails ,product  where ordermaster.orderno=orderdetails.orderno and orderdetails.pid=product.product_id and emailid=? and ordermaster.orderno=?");
	pst2.setString(1, (String)session.getAttribute("email"));
	
	pst2.setString(2, or);
	ResultSet rs1=pst2.executeQuery();
	String od,pid,sz,pn,im,br,cl;
	int tm=0,qt,pa,pz;
	while(rs1.next())
	{
		
	     or=rs1.getString("orderno");
		tm=rs1.getInt("totalamount");
		od=rs1.getString("orderdate");
		pid=rs1.getString("pid");
		qt=rs1.getInt("qty");
		pa=rs1.getInt("pamt");
		sz=rs1.getString("size");
		pn=rs1.getString("productname");
		im=rs1.getString("image");
		pz=rs1.getInt("price");
		br=rs1.getString("brand");
		cl=rs1.getString("color");
		
		%>
		<tr>
		<td><%=pid %></td><td><%=pn %></td>
		<td><img src="<%=im %>" width=100 height=120></td>
		<td><%=br %></td>
		<td><%=cl %></td>
		<td><%=sz %></td>
		<td><%=pz %></td>
		<td><%=qt %></td>
		<td><%=pa %></td>
		</tr>
		<%
		
      }
	 %>
	 <tr>
<td colspan=8 align=right>Total Amount</td>
<td><%=tm %></td>
</tr>
	 </tbody>
	 </table>
      </div>
    </div>
  </div>
  
 

		<%
	}
		
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</div>
</div>

<%@include file="footer.jsp"%>