<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link href="../build/css/client.css" rel="stylesheet">
  
  
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>BARBER SHOP</span></a>
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
                  <a class="dropdown-item"  href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a>
                </div>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" role="main">
        <h1>Thêm sản phẩm</h1>
        <form class="form-register" name="register" method="post" action="InsertProduct" enctype="multipart/form-data" onsubmit="return validateForm()"> <!-- enctype="multipart/form-data"-->
          <fieldset>
          	

              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="f-name"><span class="require">*</span>ID</label>
                  <div class="col-md-5">
                      <input type="text" class="form-control" name="id" id="name" placeholder="Mã sản phẩm" required>
                  </div>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Tên sản phẩm</label>
                  <div class="col-md-5">
                      <input type="text" class="form-control" name="name" id="name" placeholder="Tên sản phẩm" required>
                  </div>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                <label class="control-label col-md-2" for="phone"><span class="require">*</span>Số lượng</label>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="amount" name="amount" placeholder="Số lượng" maxlength="20" 
                    onkeyup="checkNumber(this)" required>
                </div>
               </div>
              <div class="form-group d-md-flex align-items-md-center">
                 <label class="control-label col-md-2" for="phone"><span class="require">*</span>Đơn giá</label>
                 <div class="col-md-5">
                    <input type="text" class="form-control" id="price" name="price" placeholder="Đơn giá" maxlength="20" 
                    onkeyup="checkNumber(this)" required>
                 </div>
              </div>
              <div class="form-group d-md-flex align-items-md-center">
                <label class="control-label col-md-2" for="sale"><span class="require">*</span>Giảm giá</label>
                <div class="col-md-5">
                   <input type="text" class="form-control" id="sale" name="discount" placeholder="Giảm giá" maxlength="20" 
                   onkeyup="checkNumber(this)" required>
                </div>
             </div>
              <div class="form-group d-md-flex align-items-md-center">
                <label class="control-label col-md-2" for="kind"><span class="require">*</span>Loại</label>
                <div class="col-md-5">
                      <select class="wide" name="kind">
                          <option value="sapvuottoc">Sáp vuốt tóc</option>
                          <option value="phukientoc">Phụ kiện tóc</option>
                          <option value="daocaorau">Dao cạo râu</option>
                          <option value="lamdep">Làm đẹp</option>
                      </select>
                </div>
             </div>
              <div class="form-group d-md-flex align-items-md-center">
                  <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Mô tả</label>
                  <div class="col-md-5">
                    <textarea style="height: 200px;" name="description" class="form-control" placeholder="Mô tả sản phẩm"></textarea>
                  </div>
              </div> 
               <div class="form-group d-md-flex align-items-md-center">
                <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Ảnh sản phẩm</label>
                <div class="col-md-5">
                  <input type="file"id="file" name="file" accept="image/*" multiple required>           
              </div>
              </div> 
          </fieldset>
          <div class="terms">
              <div class="float-md-center">
                <button type="submit"  class="btn btn-dark" style="margin-left: 390px;">XÁC NHẬN</button>
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
    function checkNumber(input) {
        var regex = /[^0-9]/gi;
        input.value = input.value.replace(regex, "");
    } 
    </script>
  <script>
	function validateForm() {
	  var $fileUpload = $("input[type='file']");
	  if (parseInt($fileUpload.get(0).files.length) > 5) {
	    alert("Số lượng không vượt quá 5 ảnh!!!");
	    return false;
	  }
	}
	</script>
	<script>
    $('input[type="file"]'). change(function(e){
    	var fileList = document.getElementById("hidden").files;
    	var pathFile;
    	for(var i=0; i<fileList.length; i++ ){
	    var fileName = e.target.files[i].name;
    	pathFile+=fileName+",";
    	}
	    document.getElementById(hidden).value="sdf";  
	    });
    </script>
  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- FastClick -->
  <script src="../vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="../vendors/nprogress/nprogress.js"></script>
  <!-- validator -->
  <!-- <script src="../vendors/validator/validator.js"></script> -->

  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>

</body>

</html>