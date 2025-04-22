<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp"%>
<!-- jewellery  section start -->
<div class="jewellery_section">
	<div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="container">
					<h1 class="fashion_taital">Sign Up</h1>
					<div class="fashion_section_2">
						<div class="row">
							<div class="col-lg-12 col-sm-12">
								<div class="box_main">
									<center>
										<form method=post>
											<div class="container">
												<h1 align="center">Register</h1>
												<p>Please fill in this form to create an account.</p>
												<hr>

												<label for="name"style:"><b>Name</b></label><br> <input
													type="text" placeholder="Enter Name" name="name" id="name"
													required class="form-control"> <br>
													 <label
													for="email"style:"><b>Email</b></label><br> <input
													type="text" placeholder="Enter Email" name="email"
													id="email" required class="form-control"> <br>

												<label for="address"style:"><b>Address</b></label><br>
												<select class="form-control" name="address">
													<option>Mumbai</option>
													<option>Pune</option>
													<option>Satara</option>
													<option>Kolhapur</option>
												</select> <br> <label for="Gender"style:"><b>Gender</b></label><br>
												<div class="form-check">
													<input type="radio" id="gender" name="gender" value="male"
														checked>Male <input type="radio" id="gender"
														name="gender" value="female">Female
												</div>
												<br> <label for="psw"><b>Password</b></label> <input
													type="password" placeholder="Enter Password" name="password"
													id="psw" required class="form-control"> <br>
												<hr>
												<p>
													By creating an account you agree to our <a href="#">Terms
														& Privacy</a>.
												</p>

												<button type="submit" class="registerbtn" name="sub">Register</button>
											</div>

											<div class="container signin">
												<p>
													Already have an account? <a href="login.jsp">Sign in</a>.
												</p>
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
<%@ include file="footer.jsp"%>

<%
if(request.getParameter("sub")!=null)
{
	String n,a,g,e,p;
	n=request.getParameter("name");
	a=request.getParameter("address");
	g=request.getParameter("gender");
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
		PreparedStatement pst=cn.prepareStatement("insert into register(nm,address,gender,email,password) values(?,?,?,?,?)");
		pst.setString(1,n);
		pst.setString(2,a);
		pst.setString(3,g);
		pst.setString(4,e);
		pst.setString(5,p);
		int ans=pst.executeUpdate();
		if(ans>0)
		{
			out.println("<script>alert('Registration Successful')</script>");
		}
		else
			out.println("<script>alert('Problem occured ')</script>");
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
}

%>