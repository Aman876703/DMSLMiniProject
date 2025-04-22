<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp"%>
<!-- jewellery  section start -->
<div class="jewellery_section">
	<div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="container">
					<h1 class="fashion_taital">Log in</h1>
					<div class="fashion_section_2">
						<div class="row">
							<div class="col-lg-12 col-sm-12">
								<div class="box_main">
									<center>
										<form method=post>
											<div class="container">
												
												<p>Please fill in this form to log in.</p>
												<hr>

													 <label
													for="email"style:"><b>Email</b></label><br> <input
													type="text" placeholder="Enter Email" name="email"
													id="email" required class="form-control"> <br>

												
												<br> <label for="psw"><b>Password</b></label> <input
													type="password" placeholder="Enter Password" name="password"
													id="psw" required class="form-control"> <br>
												<hr>
												<p>
													By logging into an account you agree to our <a href="#">Terms
														& Privacy</a>.
												</p>

												<button type="submit" class="registerbtn" name="sub">Login</button>
											</div>

											
										</form>
									</center>

								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- jewellery  section end -->
<%@include file="footer.jsp"%>
    
<%

if(request.getParameter("sub")!=null)
{
	String e,p;
	e=request.getParameter("email");
	p=request.getParameter("password");
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
		PreparedStatement pst=cn.prepareStatement("select * from register where emailid=? and password=?");
		pst.setString(1,e);
		pst.setString(2,p);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("email", e);
			session.setAttribute("name", rs.getString("nm"));
			out.println("<script>alert('Login Successful');window.location='user/index.jsp'</script>");
		}
		else
		{
			out.println("<script>alert('Invalid Emailid or password')</script>");
			
		}
		
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
}
%>    
    