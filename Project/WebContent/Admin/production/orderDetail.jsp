<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cart.Item"%>
<%@page import="com.admin.product.ProductDAOImp"%>
<%@page import="com.transaction.TransactionDAOImp"%>
<%@page import="com.transaction.Transaction"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
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
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link href="../build/css/order.css" rel="stylesheet">
	<%
		
		Transaction transaction = new TransactionDAOImp().getTransaction(request.getParameter("idTransaction"));
		pageContext.setAttribute("list", transaction.getList());
		pageContext.setAttribute("transaction", transaction);
		pageContext.setAttribute("id", request.getParameter("idTransaction"));
		int stt=0;
		
		
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		String date = formatter.format(transaction.getDate());
	%>
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
          <div style="width:100%; margin: 40px 0px;font-family: Helvetica; line-height: 30px; font-size:12px">
          
          <div style="float: left; margin: 0 0 1.5em 0; ">
           <strong style="font-size: 18px;">THE BARBER SHOP</strong>
            <br />
            <strong>Địa chỉ:</strong> 97 Man Thiện, Phường Hiệp Phú, Q.9, TP.HCM
            <br/>
            <strong>Đường dây nóng:</strong> (+800) 123 456 789)
            <br/>
            <strong>Website:</strong> www.thebarbershop.com
            <br/>
            <strong>Email:</strong> Support@Barbershop.Com
          </div>
          
          <table style="width: 100%"><tr><td valign="top" style="width: 65%">
          <h3 style="font-size: 14px;margin: 1.5em 0 1em 0; font-weight: bold;">Chi tiết đơn hàng</h3>
          <hr style="border: none; border-top: 2px solid #0975BD;"/>
          
          <table style="margin: 0 0 1.5em 0;font-size: 12px;" width="100%">
            <thead>
              <tr>
                <th style="width:10%;text-align: left;padding: 5px 0px">ID</th>
                <th style="width:35%;text-align: left;padding: 5px 0px">Sản phẩm</th>
                <th style="width:10%;text-align: right;padding: 5px 0px">Số lượng</th>
                <th style="width:15%;text-align: center;padding: 5px 0px">Giá</th>
                <th style="width:10%;text-align: right;padding: 5px 0px">Giảm giá</th>
                <th style="width:20%;text-align: right;padding: 5px 0px">Tổng</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="x" items="${list}">
	              <tr valign="top" style="border-top: 1px solid #d9d9d9;">
	                <td align="left" style="padding: 5px 0px"><%=stt++ %></td>
	                <td align="left" style="padding: 5px 5px 5px 0px;white-space: pre-line;">${x.value.getName()}</td>
	                <td align="center" style="padding: 5px 0px">${x.value.getQuantity()}</td>
	                <c:set var="price" value="${x.value.getPrice()}"></c:set>
	                <td align="center" style="padding: 5px 0px"><%= new ProductDAOImp().getFormatMoney((int)pageContext.getAttribute("price"))%></td>
	                <td align="center" style="padding: 5px 0px"> ${x.value.getDiscount()}% </td>
	                <c:set var="total" value="${x.value.getTotal()}"></c:set>
	                <td align="right" style="padding: 5px 0px"><%= new ProductDAOImp().getFormatMoney((int)pageContext.getAttribute("total"))%></td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <h3 style="font-size: 18px;margin: 0 0 1em 0; font-weight: bold;">Thông tin thanh toán</h3>
          
          <table style="font-size: 12px;width: 100%; margin: 0 0 1.5em 0;">
            <tr>
              <td style="padding: 5px 0px">Tổng tiền:</td>
              <td style="text-align:right"><%= new ProductDAOImp().getFormatMoney(transaction.getTotal() + transaction.getDiscount()) %></td>
            </tr>
       		<tr>
              <td style="padding: 5px 0px">Giá giảm:</td>
              <td style="text-align:right">-<%= new ProductDAOImp().getFormatMoney(transaction.getDiscount()) %></td>
            </tr>
            <tr>
              <td style="padding: 5px 0px"><strong>Còn lại:</strong></td>
              <td style="text-align:right;padding: 5px 0px"><strong><%= new ProductDAOImp().getFormatMoney(transaction.getTotal()) %></strong></td>
            </tr>
          </table>
            <h3 style="font-size: 14px;margin: 0 0 1em 0;">Ghi chú</h3>
            <p style="line-height: 30px"><%=transaction.getNote()%></p>
          
          </td><td valign="top" style="padding: 0px 20px">
           <h3 style="font-size: 14px;margin: 1.5em 0 1em 0; font-weight: bold;">Thông tin đơn hàng</h3>
          <hr style="border: none; border-top: 2px solid #0975BD;"/>
          
            <div style="margin: 0 0 1em 0; padding: 1em; border: 1px solid #d9d9d9;">
              <strong>Mã đơn hàng:</strong><br/><%=request.getParameter("idTransaction")%><br/>
            <strong>Ngày đặt hàng:</strong><br/><%=date%><br />
              <strong>Phương thức thanh toán</strong><br/>Thanh toán khi giao hàng(COD)
              <br/>
              <strong>Phương thức vận chuyển</strong><br/>Giao hàng tận nơi<br/>
              <strong>Trạng thái</strong><br/>
              <div class="select">
                <select name="slct" id="slct" form="ACBC" onchange="myFunction(this.value)">
                  <option value="1" <%if(transaction.getStatus() == 1){%> selected <%}%>>Đang xử lí </option>
                  <option value="2" <%if(transaction.getStatus() == 2){%> selected <%}%>>Đang giao hàng</option>
                  <option value="3" <%if(transaction.getStatus() == 3){%> selected <%}%>>Hoàn tất</option>
                  <option value="4" <%if(transaction.getStatus() == 4){%> selected <%}%>>Thất bại</option>
                </select>
              </div>
            </div>
            <h3 style="font-size: 14px;margin: 1.5em 0 1em 0; font-weight: bold;">Thông tin mua hàng</h3>
          <hr style="border: none; border-top: 2px solid #0975BD;"/>
          
            <div style="margin: 0 0 1em 0; padding: 1em; border: 1px solid #d9d9d9;  white-space: normal;">
              <strong><%=transaction.getFullName() %></strong><br/><%=transaction.getAddress()%><br/>
              Điện thoại: <%=transaction.getPhoneNumber()%><br/>
              Email: <%=transaction.getEmailCustomer() %>
            </div>
            
        </div>
      </div>
        <!-- /page content -->
      </div>
    </div>

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
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <script src="../vendors/moment/min/moment.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script> 
		function myFunction(val) {
		  window.location.href = "ChangeStatus?idTransaction="+ ${id} + "&value=" + val;	 
		}
		
</script>
	
  </body>
</html>
