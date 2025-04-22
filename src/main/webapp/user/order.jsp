<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp"%>

<%
String s=request.getParameter("productid");
%>



<div class="fashion_section">
         <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Orders</h1>
                     <div class="fashion_section_2">
                        

<%
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
	PreparedStatement pst=cn.prepareStatement("select porder.pid,product.pid,quantity,email,state,district,address,number,amount,pname,cname,price,details,ptype,section,size,pimage from porder,product where (product.pid=porder.pid and email=?)");
	String email=(String)session.getAttribute("email");
	pst.setString(1, email);
	ResultSet rs=pst.executeQuery();
    while(rs.next())
    {
    	String pname,cname,price,details,ptype,section,size,pimage,quantity;   
    	int pid;
    	pname=rs.getString("pname");
    	cname=rs.getString("cname");
    	price=rs.getString("price");
    	details=rs.getString("details");
    	ptype=rs.getString("ptype");
    	section=rs.getString("section");
    	size=rs.getString("size");
    	pimage=rs.getString("pimage");
    	pid=rs.getInt("pid");
        quantity=rs.getString("quantity");
    %>
    <div class="row">
    <div class="col-lg-6 col-sm-6">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                              </div>
                           </div>
                            <div class="col-lg-6 col-sm-6">
                              <div class="box_main">
                                 <h4 class="shirt_text">Product information</h4><br><br>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p><br>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p><br>
                                 <p class="price_text">Details  <span style="color: #262626;"><%=details %></span></p><br>
                                 <p class="price_text">Type  <span style="color: #262626;"><%=ptype %></span></p><br>
                                 <p class="price_text">Section  <span style="color: #262626;"><%=section %></span></p><br>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p><br>
                                
                                 <p class="price_text">Product id  <span style="color: #262626;"><%=pid %></span></p><br>
                                 <p class="price_text">Quantity <span style="color: #262626;"><%=quantity %></span></p><br>
                              </div>
                           </div>
                           </div>
                           
                           
                              
<% 
    }
}
catch(SQLException ex)
{
	ex.printStackTrace();
}

%>

<%
if(request.getParameter("btnsub")!=null)
{
	String quantity,email,state,district,address,number,amount;
	quantity=request.getParameter("quantity");
	state=request.getParameter("state");
	district=request.getParameter("district");
	address=request.getParameter("address");
	number=request.getParameter("number");
	amount=request.getParameter("amount");
	int id=Integer.parseInt(request.getParameter("tpi"));
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
		PreparedStatement pst=cn.prepareStatement("insert into porder values(?,?,?,?,?,?,?,?)");
		pst.setInt(1,id);
		pst.setString(2, quantity);
		email=(String)session.getAttribute("email");
		pst.setString(3, email);
		pst.setString(4,state);
		pst.setString(5,district);
		pst.setString(6,address);
		pst.setString(7,number);
		pst.setString(8,amount);
		int ans=pst.executeUpdate();
		if(ans>0)
		out.println("<script>alert('Order placed Successfully');window.location='index.jsp'</script>");
		else
			out.println("<script>alert('Error');window.location='index.jsp'</script>");
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
}
%>

<%@ include file="footer.jsp"%>
