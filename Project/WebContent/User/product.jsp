<%@page import="com.cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.customer.register.Customer"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.admin.product.ProductDAOImp"%>
<%@page import="com.admin.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Chi tiết sản phẩm</title>
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
 <%
 		
 		Product product = new ProductDAOImp().getProduct(request.getParameter("idProduct"));
 		String[] pathImage = new ProductDAOImp().getPathImage(product.getPathImage());
 		System.out.print("sasfd");
 		String[] discription = new ProductDAOImp().getDiscription(product.getDescription());
 		ArrayList<Product> list = new ProductDAOImp().getKindProduct(product.getKind(),product.getIdProduct());
 		pageContext.setAttribute("list", list);
 		
 %>
 	<%!
   		public String getFormatMoney(int price){
   			Locale 	locale = new Locale("vi","VN");
   			NumberFormat format = NumberFormat.getCurrencyInstance(locale);
   			format.setRoundingMode(RoundingMode.HALF_UP);
   			return format.format(price);
   		}
   	%>
    
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
                             <li><a href="#" style="margin-left: 40px;"><i class="fa fa-mobile" aria-hidden="true"></i> Hotline: 19006969 </a></li>
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
                                          <%    	
                                         	Customer customer = (Customer) session.getAttribute("customer");
                                            pageContext.setAttribute("check", (String) session.getAttribute("email"));                                      
                               %>
                              
                               <c:choose>	
                               		<c:when test="${check==null}">  	
			                                <li><a href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>  Đăng kí</a>
			                                </li>
			                                <li><a href="login.jsp"><i class="fa fa-user" aria-hidden="true"></i>  Đăng nhập</a>
			                                </li>
									</c:when>
									<c:otherwise>
										  <li class="nav-item dropdown open" style="padding-left: 15px;">
                                        <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">       
                                          <img src="img/logo/user.png" alt=""><%=customer.getFullName()%>
                                         </a>
                                        <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                           <a class="dropdown-item"  href="changePassword.jsp?<%=customer.getEmail()%>">Đổi mật khẩu<i class="fa fa-address-book"></i></a>
                                          <a class="dropdown-item"  href="orderUser.jsp"><i class="fa fa-sign-out pull-right"></i> Xem đơn hàng</a>
                                             <a class="dropdown-item"  href="SignOut"><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a>
                                        </div>
                                      </li>
									</c:otherwise>
								</c:choose>
 
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
                        <li class="active"><a href="product.jsp">Sản phẩm</a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- Product Thumbnail Start -->
        <div class="main-product-thumbnail ptb-100 ptb-sm-60">
            <div class="container">
                <div class="thumb-bg">
                    <div class="row">
                        <!-- Main Thumbnail Image Start -->
                        <div class="col-lg-5 mb-all-40">
                            <!-- Thumbnail Large Image start -->
                            <div class="tab-content">
                            
                                <div id="thumb1" class="tab-pane fade show active">
                                    <a data-fancybox="images" href="${initParam['file-display']}<%=pathImage[0]%>"><img src="${initParam['file-display']}<%=pathImage[0]%>" alt="product-view"></a>
                                </div>
                                <c:forEach var="i" begin="1" end="<%=pathImage.length-1 %>">
                                <div id="thumb${i+1}" class="tab-pane fade">
                                    <a data-fancybox="images" href="${initParam['file-display']}<%=pathImage[(int)pageContext.getAttribute("i")]%>"><img src="${initParam['file-display']}<%=pathImage[(int)pageContext.getAttribute("i")]%>" alt="product-view"></a>
                                </div>
                                </c:forEach>
                            </div>
                            <!-- Thumbnail Large Image End -->
                            <!-- Thumbnail Image End -->
                            <div class="product-thumbnail mt-15">
                                <div class="thumb-menu owl-carousel nav tabs-area" role="tablist">
                                    <a class="active" data-toggle="tab" href="#thumb1"><img src="${initParam['file-display']}<%=pathImage[0]%>" alt="product-thumbnail"></a>
                                  
                                    <c:forEach var="i" begin="1" end="<%=pathImage.length-1 %>">
                                    <a data-toggle="tab" href="#thumb${i+1}"><img src="${initParam['file-display']}<%=pathImage[(int)pageContext.getAttribute("i")]%>" alt="product-thumbnail"></a>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Thumbnail image end -->
                        </div>
                        <!-- Main Thumbnail Image End -->
                        <!-- Thumbnail Description Start -->
                        <div class="col-lg-7">
                            <div class="thubnail-desc fix">
                                <h3 class="product-header"><%=product.getName()%></h3>
                                <div class="rating-summary fix mtb-10">
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </div>
                                <div class="pro-price mtb-30">
                                
                                	<% 
                                		pageContext.setAttribute("price","");
                                		if(product.getDiscount()>0) pageContext.setAttribute("price", getFormatMoney(product.getPrice()));
                                		
                                	%>
                                    <p class="d-flex align-items-center"><span class="prev-price">${price}</span><span class="price"><%= getFormatMoney(product.getPrice() - (product.getPrice()*product.getDiscount()/100)) %></span><span class="saving-price"><%=product.getDiscount() + "%" %></span></p>
                                </div>
                                         <% 
							             String[] disciption = new ProductDAOImp().getDiscription(product.getDescription());
							              %>
							           <c:forEach var = "i" begin="0" end="<%=disciption.length-1%>">
								        <p class="mb-30 pro-desc-details">► <%=disciption[(int) pageContext.getAttribute("i")]%></p>
										</c:forEach>  
                                <div class="socila-sharing mt-25">
                                    <button type="button" class="btn btn-dark" onclick="location.href='CartServlet?idProduct=<%=product.getIdProduct()%>';" "> Thêm vào giỏ hàng</button>
                                </div>
                            </div>
                        </div>
           
                        <!-- Thumbnail Description End -->
                    </div>
                    <!-- Row End -->
                </div>
            </div>
            <!-- Container End -->
        </div>
           
   
            <!-- Container End -->
        </div>
        <!-- Product Thumbnail Description End -->
        <!-- Realted Products Start Here -->
        <div class="hot-deal-products off-white-bg pt-100 pb-90 pt-sm-60 pb-sm-50">
            <div class="container">
               <!-- Product Title Start -->
               <div class="post-title pb-30">
                   <h2>Sản phẩm liên quan</h2>
               </div>
               <!-- Product Title End -->
                <!-- Hot Deal Product Activation Start -->
                <div class="best-seller-pro-active owl-carousel">
                	<c:forEach var="x" items="${list}">
                	<% Product temp = (Product) pageContext.getAttribute("x"); %>
                    <!-- Single Product Start -->
                    <div class="single-product">
                        <!-- Product Image Start -->
                        <div class="pro-img">
                            <a href="product.jsp?idProduct=<%=temp.getIdProduct()%>">
                                <img width="100px" height="300px" class="primary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(temp.getPathImage())[0] %>" alt="single-product">                                    
                                <img width="100px" height="300px"  class="secondary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(temp.getPathImage())[0]%>" alt="single-product">
                         	 
                            </a>
                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                        </div>
                        <!-- Product Image End -->
                        <!-- Product Content Start -->
                        <div class="pro-content">
                            <div class="pro-info">
                                <h4><a href="product.jsp?idProduct=<%=temp.getIdProduct()%>"><%=temp.getName()%></a></h4>
                                <p><span class="price"><%= new ProductDAOImp().getFormatMoney(temp.getPrice()) %></span></p>
                            </div>
                            <div class="pro-actions">
                                <div class="actions-primary">
                                    <a href="CartServlet?idProduct=<%=temp.getIdProduct()%>" title="Add to Cart"> + Thêm vào giỏ hàng</a>
                                </div>
                                <div class="actions-secondary">
                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                </div>
                            </div>
                        </div>
                        <!-- Product Content End -->
                    </div>
                  </c:forEach>
                </div>               
                <!-- Hot Deal Product Active End -->

            </div>
            <!-- Container End -->
        </div>
        <!-- Realated Products End Here -->
       <!-- Support Area Start Here -->
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
        <!-- Quick View Content End -->
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
</body>

</html>