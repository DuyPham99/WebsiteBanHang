<%@page import="com.cart.Cart"%>
<%@page import="com.customer.register.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng kí</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="img/favicon1.ico">
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Ionicons css -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- linearicons css -->
    <link rel="stylesheet" href="css/linearicons.css">
    <!-- Nice select css -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- Jquery fancybox css -->
    <link rel="stylesheet" href="css/jquery.fancybox.css">
    <!-- Jquery ui price slider css -->
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <!-- Meanmenu css -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- Nivo slider css -->
    <link rel="stylesheet" href="css/nivo-slider.css">
    <!-- Owl carousel css -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Custom css -->
    <link rel="stylesheet" href="css/default.css">
    <!-- Main css -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">

    <!-- Modernizer js -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
    <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

    <!-- Main Wrapper Start Here -->
    <div class="wrapper">
        <!-- Banner Popup Start -->
         <div class="popup_banner">
             <span class="popup_off_banner">×</span>
             <div class="banner_popup_area">
                     <img class="banner" src="img/banner/banner2.jpg" alt="">
             </div>
         </div>
         <!-- Banner Popup End -->

 
         <!-- Main Header Area Start Here -->
         <header>
             <!-- Header Top Start Here -->
             <div class="header-top-area home-4">
                 <div class="container">
                     <!-- Header Top Start -->
                     <div class="header-top">
                         <ul>
                             <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>    97 Man Thiện, P.Hiệp Phú, Q.9, TP.HCM</a></li>
                             <li><a href="#"><i class="fa fa-mobile" aria-hidden="true"></i> Hotline: 19006969 </a></li>
                         </ul>
                     </div>
                     <!-- Header Top End -->
                 </div>
                 <!-- Container End -->
             </div>
             <!-- Header Top End Here -->
             <!-- Header Middle Start Here -->
             <div class="header-middle ptb-15 black-bg2 home-4">
                 <div class="container">
                     <div class="row align-items-center no-gutters">
                         <div class="col-lg-2 col-md-12">
                             <div class="logo mb-all-30">
                                 <a href="index-4.jsp"><img src="img/logo/logo3.jpg" alt="logo-image"></a>
                             </div>
                         </div>
                         <!-- Categorie Search Box Start Here -->
                         <div class="col-lg-6 col-md-8 ml-auto mr-auto col-10">
                             <h3 class="dancing" style="color:white; font-size: 28px;">"Sự hài lòng của khách hàng  là niềm vui với chúng tôi"</h3>
                         </div>
                         <!-- Categorie Search Box End Here -->
                         <!-- Cart Box Start Here -->
                         <div class="col-lg-4 col-md-12">
                             <div class="cart-box mt-all-30">
                                 <ul class="d-flex justify-content-lg-end justify-content-center align-items-center">
                                 <%
								Cart cart = new Cart();
								if(session.getAttribute("cart")!=null) cart = (Cart) session.getAttribute("cart");
								
								%>
                                     <li><a href="cart.jsp"><i class="lnr lnr-cart"></i><span class="my-cart"><span class="total-pro"><%=cart.getQuantity()%></span><span>Giỏ hàng</span></span></a>
                                         
                                     </li>
                                
 
                                 </ul>
                             </div>
                         </div>
                         <!-- Cart Box End Here -->
                     </div>
                     <!-- Row End -->
                 </div>
                 <!-- Container End -->
             </div>
             <!-- Header Middle End Here -->
             <!-- Header Bottom Start Here -->
             <div class="header-bottom  header-sticky black-bg2 home-4">
                 <div class="container">
                     <div class="row align-items-center">
                          <!-- <div class="col-xl-3 col-lg-4 col-md-6 vertical-menu d-none d-lg-block">
                             <span class="categorie-title">Shop by Categories</span>
                         </div>                        -->
                         <div class="col-xl-12 col-lg-12 col-md-12 ">
                            <nav class="d-none d-lg-block">
                                <ul class="header-bottom-list d-flex roboto">
                                    <li><a href="index-4.jsp"  style="font-size: 20px;">Trang chủ</a></li>
                                    <li><a href="about.jsp" style="font-size: 20px;">Giới thiệu</a></li>
                                    <li><a href="#" style="font-size: 20px;">Mẫu tóc<i class="fa fa-angle-down"></i></a>
                                        <!-- Home Version Dropdown Start -->
                                        <ul class="ht-dropdown dropdown-style-two">
                                            <li><a href="men.jsp" style="font-size: 20px;">Mẫu tóc nam</a></li>
                                            <li><a href="women.jsp" style="font-size: 20px;">Mẫu tóc nữ</a></li>
                                        </ul>
                                        <!-- Home Version Dropdown End -->
                                    </li>
                                    <li><a href="search.jsp" style="font-size: 20px;">Tất cả sản phẩm</a></li>
                                </ul>
                            </nav>
                            <div class="mobile-menu d-block d-lg-none">
                                <nav>
                                    <ul>
                                        <li><a href="index-4.jsp">Trang chủ</a></li>
                                        <li><a href="contact.jsp">Giới thiệu</a></li>
                                        <li><a href="#">Mẫu tóc</a>
                                            <!-- Home Version Dropdown Start -->
                                            <ul>
                                                <li><a href="contact.jsp">Mẫu tóc nam</a></li>
                                                <li><a href="register.jsp">Mẫu tóc nữ</a></li>
                                            </ul>
                                            <!-- Home Version Dropdown End -->
                                        </li>
                                        <li><a href="single-blog.jsp">Blog</a></li>
                                        <li><a href="about.jsp">Phản hồi</a></li>
                                        <li><a href="contact.jsp">Liên hệ</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                     </div>
                     <!-- Row End -->
                 </div>
                 <!-- Container End -->
             </div>
             <!-- Header Bottom End Here -->
          <!-- Breadcrumb Start -->
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="index-4.jsp">Trang chủ</a></li>
                        <li class="active"><a href="register.jsp">Đăng kí</a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
       <!-- Register Account Start -->
        <div class="register-account ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="register-title">
                            <h3 class="mb-10 roboto" style="font-weight:bold">ĐĂNG KÍ TÀI KHOẢN</h3>
                            <p class="mb-10">Nếu bạn đã có tài khoản, vui lòng bỏ qua bước này.</p>
                        </div>
                    </div>
                </div>
                <!-- Row End -->
                <div class="row">
                    <div class="col-sm-12">
                        <form class="form-register" name="register" method="post" action="Register.java">
                            <fieldset>
                                <legend>Vui lòng điền thông tin sau:</legend>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="f-name"><span class="require">*</span>Họ và tên đệm</label>
                                    <div class="col-md-5">
                                        <input type="text" oninput="check_FirstName()" class="form-control" 
                                        id="f-name" placeholder="Họ và tên đệm" minlength="2" maxlength="30" 
                                        onkeyup="checkName(this)" name="firstName" required>
                                    </div>
                                    <label class="control-label col-md-5" id="checkFirstName" style="text-align: left; color: orange;"></label>
                                </div>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="l-name"><span class="require">*</span>Tên</label>
                                    <div class="col-md-5">
                                        <input type="text" oninput="check_LastName()" class="form-control" 
                                        id="l-name" placeholder="Tên" minlength="2" maxlength="20" 
                                        onkeyup="checkName(this)" name="lastName" required>
                                    </div>
                                    <label class="control-label col-md-5" id="checkLastName" style="text-align: left; color: orange;"></label>
                                </div>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="email"><span class="require">*</span>Email</label>
                                    <div class="col-md-5">
                                        <input type="email" oninput="check_Email()" class="form-control" 
                                        id="email" placeholder="Email" minlength="10" maxlength="40" required name="email" required>
                                    </div>
                                    <label class="control-label col-md-5" id="checkEmail" style="text-align: left; color: orange;"></label>
                                </div>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="phone"><span class="require">*</span>Số điện thoại</label>
                                    <div class="col-md-5">
                                        <input type="text" oninput="check_Phone()" name="phoneNumber" class="form-control" 
                                        id="phone" placeholder="Số điện thoại" minlength="10" maxlength="13" 
                                        onkeyup="checkPhone(this)" required>
                                    </div>
                                    <label class="control-label col-md-5" id="checkPhone" style="text-align: left; color: orange;"></label>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>Nhập mật khẩu: </legend>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="pwd"><span class="require">*</span>Mật khẩu:</label>
                                    <div class="col-md-5">
                                            <input type="password" name="password"oninput="check_Password()" class="form-control" 
                                            id="password" placeholder="Mật khẩu" minlength="5" maxlength="25" required>
                                    </div>
                                    <label class="control-label col-md-5" id="checkPassword" style="text-align: left; color: orange;"></label>
                                </div>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="pwd-confirm"><span class="require">*</span>Nhập lại mật khẩu</label>
                                    <div class="col-md-5">
                                        <input type="password" oninput="retype_Password()" class="form-control" 
                                        id="password2" placeholder="Nhập lại mật khẩu" minlength="5" maxlength="25" required>
                                    </div>
                                    <label class="control-label col-md-5" id="retypePassword" style="text-align: left; color: orange;"></label>
                                </div>
                            </fieldset>
                            <div class="terms">
                                <div class="float-md-center">
                                    <button type="submit" class="return-customer-btn" disabled>XÁC NHẬN</button>
                                </div>
                              
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Row End -->
            </div>
            <!-- Container End -->
        </div>
        <!-- Register Account End -->
        <button  class="readmore" style="margin-left: 90px;">Bảng giá</button>      
        <!-- Support Area Start Here -->
        <div class="support-area bdr-top">
            <div class="container">
                <div class="d-flex flex-wrap text-center">
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo4.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Cắt tóc</h5>
                            <h4 style="font-weight: bold">100k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo5.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Nhuộm màu</h5>
                            <h4 style="font-weight: bold">180k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo12.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Tẩy tóc/lần</h5>
                            <h4 style="font-weight: bold">100k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo7.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Uốn tóc</h5>
                            <h4 style="font-weight: bold">260k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo8.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Phục hồi tóc</h5>
                            <h4 style="font-weight: bold">99k</h4>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Support Area End Here -->
        <!-- New Support Area 2 Start Here -->
        <div class="support-area bdr-top">
            <div class="container">
                <div class="d-flex flex-wrap text-center">
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo9.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Tẩy da chết</h5>
                            <h4 style="font-weight: bold">20k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo10.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Lấy mụn mũi</h5>
                            <h4 style="font-weight: bold">20k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo11.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Gồi đầu</h5>
                            <h4 style="font-weight: bold">50k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo6.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Đắp mặt nạ</h5>
                            <h4 style="font-weight: bold">20k</h4>
                        </div>
                    </div>
                    <div class="single-support">
                        <div class="support-icon">
                            <a href="single-blog.jsp"><img src="img/logo/logo13.png" alt="logo-image"></a>
                        </div>
                        <div class="support-desc">
                            <h5>Kid Combo</h5>
                            <h4 style="font-weight: bold">69k</h4>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Footer Area Start Here -->
        <footer class="off-white-bg2 pt-95 bdr-top pt-sm-55">
            <!-- Footer Top Start -->
            <div class="footer-top">
                <div class="container">
                    <!-- Signup Newsletter Start -->
                    <div class="row mb-60">
                         <div class="col-xl-7 col-lg-7 ml-auto mr-auto col-md-8">
                            <div class="news-desc text-center mb-30">
                                 <h3>Nhận ưu đãi</h3>
                                 <p>Để nhận được những ưu đãi sớm nhất, vui lòng nhập email của bạn vào dưới</p>
                             </div>
                             <div class="newsletter-box">
                                 <form action="#">
                                      <input class="subscribe" placeholder="Your Email" name="email" id="subscribe" type="text">
                                      <button type="submit" class="submit">Xác nhận</button>
                                 </form>
                             </div>
                         </div>
                    </div> 
                    <!-- Signup-Newsletter End -->                   
                    <div class="row">
                        <!-- Single Footer Start -->
                        <div class="col-lg-1 col-md-4 col-sm-6">
                            <div class="single-footer mb-sm-40">
                                <h3 class="footer-title">Ngày</h3>
                                <div class="footer-content">
                                    <ul class="footer-list">
                                        <li>Thứ Hai</li>
                                        <li>Thứ Ba</li>
                                        <li>Thứ Tư</li>
                                        <li>Thứ Năm</li>
                                        <li>Thứ Sáu</li>
                                        <li>Thứ Bảy</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Start -->
                        <!-- Single Footer Start -->
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer mb-sm-40">
                                <h3 class="footer-title">Giờ hoạt động</h3>
                                <div class="footer-content">
                                    <ul class="footer-list">
                                        <li>8.00 A.M - 18h00 P.M</li>
                                        <li>8.00 A.M - 18h00 P.M</li>
                                        <li>8.00 A.M - 18h00 P.M</li>
                                        <li>8.00 A.M - 18h00 P.M</li>
                                        <li>8.00 A.M - 18h00 P.M</li>
                                        <li>8.00 A.M - 16h00 P.M</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Start -->
                        <!-- Single Footer Start -->
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="single-footer mb-sm-40">
                                <h3 class="footer-title">Tri ân khách hàng:</h3>
                                <div class="footer-content">
                                    <ul class="footer-list" style="display: flex; flex-wrap: wrap;">
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/12.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/13.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/14.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/15.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/16.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/18.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/13.jpg" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="img/banner/12.jpg" alt="">
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Start -->
                        <!-- Single Footer Start -->
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="single-footer mb-sm-40">
                                <h3 class="footer-title">Liên hệ chúng tôi: </h3>
                                <div class="footer-content">
                                    <ul class="footer-list address-content">
                                        <li><i class="lnr lnr-map-marker"></i>Địa chỉ: 97 Man Thiện, Phường Hiệp Phú, Quận 9, TP. Hồ CHí Minh.</li>
                                        <li><i class="lnr lnr-envelope"></i><a href="#"> Mail: Support@barbershop.com </a></li>
                                        <li>
                                            <i class="lnr lnr-phone-handset"></i> Hotline: (+800) 123 456 789)
                                        </li>
                                    </ul>
                                    <div class="payment mt-25 bdr-top pt-30">
                                        <a href="#"><img class="img" src="img/payment/1.png" alt="payment-image"></a>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                        <!-- Single Footer Start -->
                    </div>
                    <!-- Row End -->
                </div>
                <!-- Container End -->
            </div>
            <!-- Footer Top End -->
            <!-- Footer Middle Start -->
            <div class="footer-middle text-center">
                <div class="container">
                    <div class="footer-middle-content pt-20 pb-30">
                            <ul class="social-footer">
                                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://plus.google.com/"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><img src="img/icon/social-img1.png" alt="google play"></a></li>
                                <li><a href="#"><img src="img/icon/social-img2.png" alt="app store"></a></li>
                            </ul>
                    </div>
                </div>
                <!-- Container End -->
            </div>
            <!-- Footer Middle End -->
        </footer>
        <!-- Footer Area End Here -->
    </div>
    <!-- Main Wrapper End Here -->

    <!-- jquery 3.2.1 -->
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <!-- Countdown js -->
    <script src="js/jquery.countdown.min.js"></script>
    <!-- Mobile menu js -->
    <script src="js/jquery.meanmenu.min.js"></script>
    <!-- ScrollUp js -->
    <script src="js/jquery.scrollUp.js"></script>
    <!-- Nivo slider js -->
    <script src="js/jquery.nivo.slider.js"></script>
    <!-- Fancybox js -->
    <script src="js/jquery.fancybox.min.js"></script>
    <!-- Jquery nice select js -->
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- Jquery ui price slider js -->
    <script src="js/jquery-ui.min.js"></script>
    <!-- Owl carousel -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- Bootstrap popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugin js -->
    <script src="js/plugins.js"></script>
    <!-- Main activaion js -->
    <script src="js/main.js"></script>
    <script language="javascript">
        // Regex for First Name
       function check_FirstName()
        {
            var x = document.getElementById("f-name").value;
            var button = document.querySelector('.return-customer-btn');
            if(x.length < 5) {
                document.getElementById("checkFirstName").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Họ và tên phải lớn hơn 4 ký tự, không dấu và không bao gồm ký tự đặc biệt</i>'
                document.getElementById("f-name").style.borderColor = "red";
                button.disabled = true;
            }else{
                document.getElementById("checkFirstName").innerHTML="";
                document.getElementById("f-name").style.borderColor = "green";
            }   
        }
         // Regex for Last Name
        function check_LastName()
        {
            var x = document.getElementById("l-name").value;
            var button = document.querySelector('.return-customer-btn');
            if(x.length < 3) {
                document.getElementById("checkLastName").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Tên phải lớn hơn 2 ký tự, không dấu và không bao gồm ký tự đặc biệt</i>'
                document.getElementById("l-name").style.borderColor = "red";
                button.disabled = true;
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
            var button = document.querySelector('.return-customer-btn');
            regex = /^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/gi;
            if(regex.test(x) == false) {
                document.getElementById("checkEmail").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Email lớn hơn 5 ký tự, không dấu và đúng định dạng email</i>'
                document.getElementById("email").style.borderColor = "red";
                button.disabled = true;
            }else{
                document.getElementById("checkEmail").innerHTML="";
                document.getElementById("email").style.borderColor = "green";
            }   
        }
        //Regex for Phone
        function check_Phone()
        {
            var x = document.getElementById("phone").value;
            var button = document.querySelector('.return-customer-btn');
            if(x.length < 10) {
                document.getElementById("checkPhone").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Số điện thoại phải ít nhất 10 chữ số</i>'
                document.getElementById("phone").style.borderColor = "red";
                button.disabled = true;
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
            var button = document.querySelector('.return-customer-btn');
            regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/gi;
            if(regex.test(x) == false) {
                document.getElementById("checkPassword").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Ít nhất 1 ký tự thường,1 ký tự số và không chứa khoảng trắng</i>'
                document.getElementById("password").style.borderColor = "red";
                button.disabled = true;
            }else{
                document.getElementById("checkPassword").innerHTML="";
                document.getElementById("password").style.borderColor = "green";
            }   
        }
        //Check for Retype Password
        function retype_Password() {
            var pass = document.getElementById("password").value;
            var rePass = document.getElementById("password2").value;
            var button = document.querySelector('.return-customer-btn');
            // regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/gi;
            if(pass != rePass) {
                document.getElementById("retypePassword").innerHTML =  '<i class="fa fa-exclamation-circle" aria-hidden="true" style="color: orangered;">     Mật khẩu nhập lại chưa đúng</i>'
                document.getElementById("password2").style.borderColor = "red";
                button.disabled = true;
            }else{
                document.getElementById("retypePassword").innerHTML="";
                document.getElementById("password2").style.borderColor = "green";
                button.disabled = false;
            }   
        }
        
        
        </script>



</body>
</html>