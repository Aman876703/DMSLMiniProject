<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@include file="header.jsp" %>



      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            All orders
            <small>Preview</small>
          </h1>
          
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="box box-info">
              <table border=1 width=100%>
                   <thead>
                   <tr>
                       <th>product id</th>
                       <th>quantity</th>
                       <th>email</th>
                       <th>state</th>
                       <th>district</th>
                       <th>address</th>
                       <th>contact</th> 
                       <th>amount</th>
                       <th>product name</th>
                       <th>company name</th>
                       <th>price</th>
                       <th>product details</th>
                       <th>product type</th>
                       <th>section</th>
                       <th>image</th>
                     </tr>
                     </thead>  
                     <tbody>
                                  
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
	PreparedStatement pst=cn.prepareStatement("select porder.pid,product.pid,quantity,email,state,district,address,number,amount,pname,cname,price,details,ptype,section,size,pimage from porder,product where (product.pid=porder.pid)");
	String email=(String)session.getAttribute("email");
	ResultSet rs=pst.executeQuery();
    while(rs.next())
    {
    	String pname,cname,price,details,ptype,section,size,pimage,quantity,state,district,address,number,amount;   
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
        email=rs.getString("email");
        state=rs.getString("state");
        district=rs.getString("district");
        address=rs.getString("address");
        number=rs.getString("number");
        amount=rs.getString("amount");
        %>
        <tr>
            <td><%=pid %></td>
            <td><%=quantity %></td>
        <td><%=email %></td>
        <td><%=state %></td>
        <td><%=district %></td>
        <td><%=address %></td>
        <td><%=number%></td>
        <td><%=amount%></td>
        <td><%=pname %></td>
        <td><%=cname%></td>
        <td><%=price %></td>
        <td><%=details %></td>
        <td><%=ptype%></td>
        <td><%=section%></td>
        <td><img src="http://localhost:8080/ecom1/images/<%=pimage%>" height=125 width=125></td>
        </tr>      
        <% 
        
    }
}
catch(SQLException ex)
{
	ex.printStackTrace();
}

%>
</tbody></table>

              </div><!-- /.box -->
            </div><!-- /.col (left) -->
          </div><!-- /.row -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Aman Studio</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->


    <!-- jQuery 2.1.3 -->
    <script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- InputMask -->
    <script src="../../plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
    <script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="../../plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
    <!-- date-range-picker -->
    <script src="../../plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- bootstrap color picker -->
    <script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
    <!-- bootstrap time picker -->
    <script src="../../plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../../plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- iCheck 1.0.1 -->
    <script src="../../plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../dist/js/demo.js" type="text/javascript"></script>
    <!-- Page script -->
    <script type="text/javascript">
      $(function () {
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                  ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                  },
                  startDate: moment().subtract('days', 29),
                  endDate: moment()
                },
        function (start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
          checkboxClass: 'icheckbox_minimal-red',
          radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
          showInputs: false
        });
      });
    </script>

  </body>
</html>
    