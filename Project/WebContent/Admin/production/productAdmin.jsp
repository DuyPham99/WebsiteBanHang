<%@page import="com.admin.product.ProductDAOImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.admin.product.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link href="../build/css/product.css" rel="stylesheet">

    <%
    List<Product> listProduct = new ArrayList<Product>();
	listProduct = new ProductDAOImp().getListProduct();
	
	for(Product i:listProduct){
		String[] word = i.getPathImage().split("\\?");
		i.setPathImage(word[0]);
	}
	pageContext.setAttribute("list", listProduct);	
	pageContext.getServletContext().getInitParameter("file-display");
    %>
    
    
  </head>

  <body class="nav-md footer_fixed">
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
              <h1>Quản lí sản phẩm</h1>
              <button onclick="window.location.href='addProduct.jsp'" class="btn btn-round btn-success" style="margin-left: 915px;">
                <i class="fa fa-folder"></i>  Thêm sản phẩm
            </button>
              <div class="col-12">
              <table class="table table-image">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Xóa</th>
                    <th scope="col">Sửa</th>
                  </tr>
                </thead>              
				 <tbody>
                  <c:forEach var="x" items="${list}">
                  <tr>
                    <td> ${x.getIdProduct()}</td>
                    <td class="w-25">
                      <img width="150px" height="150px" runat="server" src="${initParam['file-display']}${x.getPathImage()}"  class="img-fluid img-thumbnail" alt="Sheep">
                    </td>
                    <td>${x.getName()}</td> 
                    
                    <td style="font-size: 20px;">       
                    	<c:if test="${x.getAmount()>5}"> <span class="badge badge-primary">${x.getAmount()}</span></c:if>             
                        <c:if test="${x.getAmount() <= 5 && x.getAmount() > 0}"> <span class="badge badge-warning">${x.getAmount()}</span></c:if>
                        <c:if test="${x.getAmount()==0}"> <span class="badge badge-danger">${x.getAmount()}</span> </c:if>
                      </td>
                    <td><button type="button" onclick="window.location.href='DeleteProduct?id=${x.getIdProduct()}'" class="btn btn-round btn-danger"><i class="fa fa-trash-o"></i> Xóa</button></td>
                    <td><button onclick="window.location.href='editProduct.jsp?id=${x.getIdProduct()}'" class="btn btn-round btn-warning"><i class="fa fa-pencil"></i>Sửa</button></td>
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

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>