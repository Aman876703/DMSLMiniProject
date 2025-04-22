<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLClientInfoException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp" %>

      <!-- fashion section start -->
      <div class="fashion_section">
         <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Jewellery</h1>
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
            	PreparedStatement pst=cn.prepareStatement("select * from product where ptype='jewellery'");
            	ResultSet rs=pst.executeQuery();
                while(rs.next())
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
                                 <p class="price_text">Price  <span style="color: #262626;"><%=price %></span></p>
                                 <div class="tshirt_img"><img src="http://localhost:8080/ecom1/images/<%=pimage%>" width="330" height="330"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="login.jsp">Buy Now</a></div>
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
            
         </div>
      </div>
      <!-- fashion section end -->
      <%@include file="footer.jsp"%>S