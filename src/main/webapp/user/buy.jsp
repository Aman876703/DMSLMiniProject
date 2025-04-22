<%@page import="com.mysql.cj.protocol.Resultset"%>
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
                     <h1 class="fashion_taital">Details</h1>
                     <div class="fashion_section_2">
                        <div class="row">

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
	PreparedStatement pst=cn.prepareStatement("select * from product where pid="+s);
	ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
    	String pname,cname,price,details,ptype,section,size,pimage;
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
    
    %>
    <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                              </div>
                           </div>
                            <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Product information</h4><br><br>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p><br>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p><br>
                                 <p class="price_text">Details  <span style="color: #262626;"><%=details %></span></p><br>
                                 <p class="price_text">Type  <span style="color: #262626;"><%=ptype %></span></p><br>
                                 <p class="price_text">Section  <span style="color: #262626;"><%=section %></span></p><br>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p><br>
                                
                                 <p class="price_text">Product id  <span style="color: #262626;"><%=pid %></span></p><br>
                              
                              </div>
                           </div>
                           
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <center>
										<form method=post>
														<div class="container">
															<p class="price_text">choose quantity  </p>
					                                 <div class="input-group quantity-selector">
													  <input type="number" id="quantity" class="form-control" aria-live="polite" data-bs-step="counter" name="quantity" title="quantity" value="0" min="0" max="1000" step="1" data-bs-round="0" aria-label="Quantity selector" onchange="cal()">
													  
													  <script type="text/javascript">
													  function cal()
													  {
														  var amt,price,quantity;
														  price=parseInt(document.getElementById("price").value);
														  quantity=parseInt(document.getElementById("quantity").value);
														  amt=price*quantity;
														  document.getElementById("amount").value=amt;
													  }
													  </script>
													  
													  
													</div><br>
													<input type=hidden name=tpi value="<%=pid%>"> 
												
													<!--- India states -->
													<label
													for="email"style:" class="price_text">Select state</label>
														<select id="country-state" name="state" class="form-control">
														    <option value="">Select state</option>
														    <option value="AN">Andaman and Nicobar Islands</option>
														    <option value="AP">Andhra Pradesh</option>
														    <option value="AR">Arunachal Pradesh</option>
														    <option value="AS">Assam</option>
														    <option value="BR">Bihar</option>
														    <option value="CH">Chandigarh</option>
														    <option value="CT">Chhattisgarh</option>
														    <option value="DN">Dadra and Nagar Haveli</option>
														    <option value="DD">Daman and Diu</option>
														    <option value="DL">Delhi</option>
														    <option value="GA">Goa</option>
														    <option value="GJ">Gujarat</option>
														    <option value="HR">Haryana</option>
														    <option value="HP">Himachal Pradesh</option>
														    <option value="JK">Jammu and Kashmir</option>
														    <option value="JH">Jharkhand</option>
														    <option value="KA">Karnataka</option>
														    <option value="KL">Kerala</option>
														    <option value="LA">Ladakh</option>
														    <option value="LD">Lakshadweep</option>
														    <option value="MP">Madhya Pradesh</option>
														    <option value="MH">Maharashtra</option>
														    <option value="MN">Manipur</option>
														    <option value="ML">Meghalaya</option>
														    <option value="MZ">Mizoram</option>
														    <option value="NL">Nagaland</option>
														    <option value="OR">Odisha</option>
														    <option value="PY">Puducherry</option>
														    <option value="PB">Punjab</option>
														    <option value="RJ">Rajasthan</option>
														    <option value="SK">Sikkim</option>
														    <option value="TN">Tamil Nadu</option>
														    <option value="TG">Telangana</option>
														    <option value="TR">Tripura</option>
														    <option value="UP">Uttar Pradesh</option>
														    <option value="UT">Uttarakhand</option>
														    <option value="WB">West Bengal</option>
														</select><br>
                                                    <label
													for="email"style:" class="price_text">District</label><br> <input
													type="text" placeholder="Enter District" name="district"
													id="district" required class="form-control"> <br>
                                                    <label
													for="email"style:" class="price_text">Address</label><br> <input
													type="text" placeholder="Enter Address" name="address"
													id="address" required class="form-control"> <br>
													
													<label for="email"style:" class="price_text">Phone number</label><br> <input
													type="text" placeholder="Enter Phone number" name="number"
													id="number" required class="form-control"> <br>
													<input type="hidden" name="price" id="price" value="<%=price %>">
													<label
													for="email"style:" class="price_text">Total amount</label><br><input
													type="text" placeholder="" name="amount"
													id="amount" value="" required class="form-control"> <br>
													<div class="btn_main">
                                    <div class="buy_bt" align="center"><input class="buy_bt price_text" type=submit name=btnsub value="Add to cart"></div>
                                 </div>
											</div>

											
										</form>
									</center>
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
	int id=Integer.parseInt(request.getParameter("productid"));
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
		PreparedStatement pstq=cn.prepareStatement("select quantity from product where pid="+id);
		ResultSet rs=pstq.executeQuery();
		int qt=0;
		if(rs.next())
		{
			qt=rs.getInt(1);
			
		}
		if(Integer.parseInt(quantity)>qt)
		{
			out.println("<script>alert('Insufficient Quantity')</script>");
		}
		else
		{
			
		
		PreparedStatement pst=cn.prepareStatement("insert into carttt values(?,?,?,?,?,?,?,?)");
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
		out.println("<script>alert('Added to Cart Successfully');window.location='index.jsp'</script>");
		else
			out.println("<script>alert('Error');window.location='Cart.jsp'</script>");
		}
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
}
%>

<%@ include file="footer.jsp"%>
