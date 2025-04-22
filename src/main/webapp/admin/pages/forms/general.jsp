<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp" %>

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Upload product details
          </h1>
          <br><br>
          <ol class="breadcrumb">
            <li><a href="../../index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">Upload product image</h3><br><br>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form role="form" method="post" enctype="multipart/form-data" action="upload.jsp">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="exampleInputFile">File input</label><br><br>
                      <input type="file" id="exampleInputFile" name="file">
                    </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </form>
              </div><!-- /.box -->

              <!-- Form Element sizes -->
              
              
              <!-- Input addon -->
              
            </div><!--/.col (left) -->
            <!-- right column -->
            <div class="col-md-6">
              <!-- general form elements disabled -->
              <div class="box box-warning">
                <div class="box-header">
                  <h3 class="box-title">Product details</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form"  method="post">
                    <!-- text input -->
                    <div class="form-group">
                      <label>Product name </label>
                      <input type="text" class="form-control" placeholder="Enter ..."/ name="pname">
                    </div>
                    <div class="form-group">
                      <label>Company name </label>
                      <input type="text" class="form-control" placeholder="Enter ..."/ name="cname">
                    </div>
                    <div class="form-group">
                      <label>Price </label>
                      <input type="number" class="form-control" placeholder="Enter ..."/ name="price">
                    </div>

                    <!-- textarea -->
                    <div class="form-group">
                      <label>Product details</label>
                      <textarea class="form-control" rows="3" placeholder="Enter ..." name="details"></textarea>
                    </div>


                    <!-- select -->
                    <div class="form-group">
                      <label>Select type of product</label>
                      <select class="form-control" name="ptype">
                        <option>---select---</option>
                        <option>fashion </option>
                        <option>electronics </option>
                        <option>Jewellery</option>
                      </select>
                    </div>

                    <!-- select -->
                    <div class="form-group">
                      <label>Select Section</label>
                      <select class="form-control" name="section">
                        <option>---select---</option>
                        <option value="Best_Seller">Best Seller</option>
                        <option value="New_Arrival">New Arrival </option>
                        <option value="Todays_offer">Todays offer</option>
                      </select>
                    </div>
                    
                     
                    <!-- checkbox -->
                    <div class="form-group">
                    <label>Select Size</label>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" value="small"  name="size">
                          Small
                        </label>
                      </div>

                      <div class="checkbox">
                        <label>
                          <input type="checkbox" value="medium" name="size">
                          Medium
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" name="size" value="large">
                          Large
                        </label>
                      </div>
                    </div>
  <button type="submit" class="btn btn-success" name="submitbtn">Submit</button>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            
            </div><!--/.col (right) -->
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>

<%
if(request.getParameter("submitbtn")!=null)
{
	String pname,cname,price,details,ptype,section,size[];
	pname=request.getParameter("pname");
	cname=request.getParameter("cname");
	price=request.getParameter("price");
	details=request.getParameter("details");
	ptype=request.getParameter("ptype");
	section=request.getParameter("section");
	size=request.getParameterValues("size");
	String selsize="";
	for(String str:size)
	{
		selsize=selsize+str+",";
	}
	selsize=selsize.substring(0,selsize.length()-1);
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
		PreparedStatement pst=cn.prepareStatement("insert into product(pname,cname,price,details,ptype,section,size,pimage) values(?,?,?,?,?,?,?,?)");
		pst.setString(1,pname);
		pst.setString(2,cname);
		pst.setString(3,price);
		pst.setString(4,details);
		pst.setString(5,ptype);
		pst.setString(6,section);
		pst.setString(7,selsize);
		pst.setString(8,(String)session.getAttribute("filepath"));
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
    