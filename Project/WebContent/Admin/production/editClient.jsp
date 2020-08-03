<%@page import="java.sql.ResultSet"%>
<%@page import="com.customer.register.MyConnectionProvider"%>
<%@page import="com.customer.register.Customer"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <%!String firstName;
	String lastName; %>
  <%
  {
			 Customer newCus= new Customer();
			Connection conn;
			PreparedStatement ps;
			try {
				conn = MyConnectionProvider.getConnection();
				ps = conn.prepareStatement("select * from Account where mail=?");		
				ps.setString(1, request.getParameter("mail"));
				ResultSet rs = ps.executeQuery();	
				while(rs.next()) {
					newCus.setEmail(rs.getString(1));
					newCus.setPassword(rs.getString(2));
					newCus.setFullName(rs.getString(3));
					newCus.setPhoneNumber(rs.getString(4));
				}
				pageContext.setAttribute("customer", newCus);
				
			}catch (Exception e) {
				System.out.println(e);
			}	
		}
		%>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="icon" href="images/favicon1.ico" type="image/ico" />
  <title>The Barber Shop</title>

  <!-- Bootstrap -->
  <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- bootstrap-progressbar -->
  <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="../build/css/custom.min.css" rel="stylesheet">
  <link href="../build/css/client.css" rel="stylesheet">

</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="indexAdmin.jsp" class="site_title"><img src="images/favicon1.ico" style="height: 40%; width: 11%;">
               <span>BARBER SHOP</span></a>
          </div>

          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
              <span>Xin chào,</span>
              <h2>BarberShop</h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <ul class="nav side-menu">
                <li><a href="indexAdmin.jsp"><i class="fa fa-home"></i> Trang chủ </a></li>
                <li><a><i class="fa fa-edit"></i> Quản lí cửa hàng <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu">
                    <li><a href="client.jsp">Quản lí khách hàng</a></li>
                    <li><a href="productAdmin.jsp">Quản lí sản phẩm</a></li>
                  </ul>
                </li>
                <li><a href="order.jsp"><i class="fa fa-calendar-o"></i> Quản lí đơn hàng </a></li>
              </ul>
            </div>
          </div>
          <!-- /sidebar menu -->

        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <nav class="nav navbar-nav">
            <ul class=" navbar-right">
              <li class="nav-item dropdown open" style="padding-left: 15px;">
                <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                  <img src="images/img.jpg" alt="">BarberShop
                </a>
                <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item"  href="javascript:;"> Thông tin</a>
                  <a class="dropdown-item"  href="../../User/login.jsp"><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a>
                </div>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" role="main">
        <h1>Chỉnh sửa khách hàng</h1>
        
        <% Customer tempCus = (Customer) pageContext.getAttribute("customer"); 	
			String tempString=tempCus.getFullName().trim();
			for(int i=tempString.length()-1; i>=0; i--){
				if(tempString.charAt(i) == ' '){
					firstName= tempString.substring(0,i);
					lastName= tempString.substring(i+1,tempString.length());
					break;
				}
			}		
        %>
        <form class="form-register" name="register" method="post" action="EditClientAdmin">
          <fieldset>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Họ và tên đệm</label>
                  <div class="col-md-5">
            
                      <input type="text" oninput="check_FirstName()" class="form-control" 
                      id="f-name" placeholder="Họ và tên đệm" minlength="2" maxlength="30" 
                      onkeyup="checkName(this)" name="firstName" value="<%=firstName%>" required>                    
                  		
                  </div>
                  <label class="control-label col-md-5" id="checkFirstName" style="text-align: left; color: orange;"></label>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Tên</label>
                  <div class="col-md-5">
                      <input type="text" oninput="check_LastName()" class="form-control" 
                      id="l-name" placeholder="Tên" minlength="2" maxlength="15" 
                      onkeyup="checkName(this)" name="lastName" value="<%=lastName%>" required>
                  </div>
                  <label class="control-label col-md-5" id="checkLastName" style="text-align: left; color: orange;"></label>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="email"><span class="require">*</span>Email</label>
                  <div class="col-md-5">
                      <input type="email" oninput="check_Email()" class="form-control" 
                      id="email" placeholder="Email" minlength="10" maxlength="40" name="email" value='<%=tempCus.getEmail()%>' readonly required>
                  </div>
                  <label class="control-label col-md-5" id="checkEmail" style="text-align: left; color: orange;"></label>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="phone"><span class="require">*</span>Số điện thoại</label>
                  <div class="col-md-5">
                      <input type="text" oninput="check_Phone()" class="form-control" 
                      id="phone" placeholder="Số điện thoại" minlength="10" maxlength="13" 
                      onkeyup="checkPhone(this)" name="phoneNumber" value='<%=tempCus.getPhoneNumber()%>' required>
                  </div>
                  <label class="control-label col-md-5" id="checkPhone" style="text-align: left; color: orange;"></label>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="pwd"><span class="require">*</span>Mật khẩu:</label>
                  <div class="col-md-5">
                          <input type="password" oninput="check_Password()" class="form-control" 
                          id="password" placeholder="Mật khẩu" minlength="5" maxlength="40" name="password" required>
                  </div>
                  <label class="control-label col-md-5" id="checkPassword" style="text-align: left; color: orange;"></label>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="pwd-confirm"><span class="require">*</span>Nhập lại mật khẩu</label>
                  <div class="col-md-5">
                      <input type="password" oninput="retype_Password()" class="form-control" 
                      id="password2" placeholder="Nhập lại mật khẩu" minlength="10" maxlength="40" required>
                  </div>
                  <label class="control-label col-md-5" id="retypePassword" style="text-align: left; color: orange;"></label>
              </div>
          </fieldset>
          <div class="terms">
              <div class="float-md-center">
                  <button type="submit" class="btn btn-dark" style="margin-left: 390px;">XÁC NHẬN</button>
              </div>
          </div>
      </form>
      </div>
      <!-- /page content -->
    </div>
  </div>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="../vendors/validator/multifield.js"></script>
  <script src="../vendors/validator/validator.js"></script>

  <script language="javascript">
    // Regex for First Name
   function check_FirstName()
    {
        var x = document.getElementById("f-name").value;
        if(x.length < 5) {
            document.getElementById("checkFirstName").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Họ và tên phải lớn hơn 4 ký tự, không dấu và không bao gồm ký tự đặc biệt</i>'
            document.getElementById("f-name").style.borderColor = "red";
        }else{
            document.getElementById("checkFirstName").innerHTML="";
            document.getElementById("f-name").style.borderColor = "green";
        }   
    }
     // Regex for Last Name
    function check_LastName()
    {
        var x = document.getElementById("l-name").value;
        if(x.length < 3) {
            document.getElementById("checkLastName").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Tên phải lớn hơn 2 ký tự, không dấu và không bao gồm ký tự đặc biệt</i>'
            document.getElementById("l-name").style.borderColor = "red";
        }else{
            document.getElementById("checkLastName").innerHTML="";
            document.getElementById("l-name").style.borderColor = "green";
        }   
    }
    function checkName(input) {
        var regex = /[^a-zA-Z ]/gi;
        input.value = input.value.replace(regex, "");
    }   
    //Regex for Email
    function check_Email() {
        var x = document.getElementById("email").value;
        regex = /^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/gi;
        if(regex.test(x) == false) {
            document.getElementById("checkEmail").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Email lớn hơn 4 ký tự, không dấu và đúng định dạng email</i>'
            document.getElementById("email").style.borderColor = "red";
        }else{
            document.getElementById("checkEmail").innerHTML="";
            document.getElementById("email").style.borderColor = "green";
        }   
    }
    //Regex for Phone
    function check_Phone()
    {
        var x = document.getElementById("phone").value;
        if(x.length < 10) {
            document.getElementById("checkPhone").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Số điện thoại phải ít nhất 10 chữ số</i>'
            document.getElementById("phone").style.borderColor = "red";
        }else{
            document.getElementById("checkPhone").innerHTML="";
            document.getElementById("phone").style.borderColor = "green";
        }   
    }
    function checkPhone(input) {
        var regex = /[^0-9]/gi;
        input.value = input.value.replace(regex, "");
    } 
    //Regex for Password
    function check_Password() {
        var x = document.getElementById("password").value;
        regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/gi;
        if(regex.test(x) == false) {
            document.getElementById("checkPassword").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Ít nhất 1 ký tự hoa, 1 ký tự thường,1 ký tự số và không chứa khoảng trắng</i>'
            document.getElementById("password").style.borderColor = "red";
        }else{
            document.getElementById("checkPassword").innerHTML="";
            document.getElementById("password").style.borderColor = "green";
        }   
    }
    //Check for Retype Password
    function retype_Password() {
        var pass = document.getElementById("password").value;
        var rePass = document.getElementById("password2").value;
        // regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/gi;
        if(pass != rePass) {
            document.getElementById("retypePassword").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Mật khẩu nhập lại chưa đúng</i>'
            document.getElementById("password2").style.borderColor = "red";
        }else{
            document.getElementById("retypePassword").innerHTML="";
            document.getElementById("password2").style.borderColor = "green";
        }   
    }
    
    
    </script>

  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- FastClick -->
  <script src="../vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="../vendors/nprogress/nprogress.js"></script>
  <!-- bootstrap-progressbar -->
  <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  <!-- validator -->
  <!-- <script src="../vendors/validator/validator.js"></script> -->

  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>

</body>

</html>