<%@page import="java.util.Collections"%>
<%@page import="java.util.TreeMap"%>
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
    <%
    	HashMap<String, Transaction> listTransaction = new TransactionDAOImp().getListTransaction();
		TreeMap<String, Transaction> listTransactionSorted = new TreeMap<String, Transaction>(Collections.reverseOrder());
		listTransactionSorted.putAll(listTransaction);
    	int stt=1;
    	pageContext.setAttribute("list", listTransactionSorted);
    	
    	
    
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
          <div class="container">
            <div class="row">
              <h1>Quản lí đơn hàng</h1>
              <div class="col-12">
                <table class="table table-image table-hover">
                  <thead>
                    <tr>
                      <th scope="col">STT</th>
                      <th scope="col">Khách hàng</th>
                      <th scope="col">SĐT</th>
                      <th scope="col">Trạng thái</th>
                      <th scope="col">Xóa đơn</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="i" items="${list}">
                    <tr > 
                      <th scope="row" onclick="DoNav('orderDetail.jsp?idTransaction=${i.key}');"><%= stt++ %></th>             
                      <td class="w-20" onclick="DoNav('orderDetail.jsp?idTransaction=${i.key}');">${i.value.getFullName()}</td>
                      <td>${i.value.getPhoneNumber()}</td>
                      <td style="font-size: 17px;">
                        <c:if test="${i.value.getStatus() == 1}"> <span class="badge badge-warning">Xử lí</span> </c:if> 
                        <c:if test="${i.value.getStatus() == 2}"> <span class="badge badge-primary">Giao hàng</span></c:if>
                        <c:if test="${i.value.getStatus() == 3}"> <span class="badge badge-success">Hoàn tất</span></c:if>
                        <c:if test="${i.value.getStatus() == 4}"> <span class="badge badge-danger">Thất bại</span> </c:if>
                       </td>
                      
                      <td><button type="button" class="btn btn-round btn-danger" onclick="window.location.href = 'DeleteTransaction?idTransaction=${i.key}'"><i class="fa fa-trash-o"></i> Xóa đơn</button></td>
                    </tr>
                   
                   </c:forEach>
                  </tbody>
                </table>  
              </div>
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
    function DoNav(theUrl){
        document.location.href = theUrl;
     }
    </script>
     
	
  </body>
</html>
