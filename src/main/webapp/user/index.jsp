<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@include file="header.jsp" %>


      <!-- fashion section start -->
      <div class="fashion_section">
         <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Man & Woman Fashion</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='fashion' limit 0,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity %></span></p>
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
            
                           
                         
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Man & Woman Fashion</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='fashion' limit 3,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Man & Woman Fashion</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='fashion' limit 6,9");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
         </div>
      </div>
      <!-- fashion section end -->
      <!-- electronic section start -->
      <div class="fashion_section">
         <div id="electronic_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Electronics</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='electronics' limit 0,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Electronics</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='electronics' limit 3,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,
                	quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Electronics</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='electronics' limit 6,9");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,
                	quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#electronic_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#electronic_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
         </div>
         </div>
      
      <!-- electronic section end -->
      <!-- jewellery  section start -->
      <div class="jewellery_section">
         <div id="jewellery_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Jewellery Accessories</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='jewellery' limit 0,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,
                	quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Jewellery Accessories</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='jewellery' limit 3,3");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,
                	quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Jewellery Accessories</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='jewellery' limit 6,9");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                	String pname,cname,price,details,ptype,section,size,pimage;
                	int pid,
                	quantity;
                	pname=rs.getString("pname");
                	cname=rs.getString("cname");
                	price=rs.getString("price");
                	details=rs.getString("details");
                	ptype=rs.getString("ptype");
                	section=rs.getString("section");
                	size=rs.getString("size");
                	pimage=rs.getString("pimage");
                	pid=rs.getInt("pid");
                	quantity=rs.getInt("quantity");
                	
            
            %>
            
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=pname %></h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <p class="price_text">Company  <span style="color: #262626;"><%=cname %></span></p>
                                 <p class="price_text">Size  <span style="color: #262626;"><%=size %></span></p>
                                 <p class="price_text">Quantity remaining <span style="color: #262626;"><%=quantity%></span></p>
                                 
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="buy.jsp?productid=<%=pid%>">Add to Cart</a></div>
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
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#jewellery_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#jewellery_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
            <div class="loader_main">
               <div class="loader"></div>
            </div>
         </div>
      </div>
      <!-- jewellery  section end -->
      <%@include file="footer.jsp"%>