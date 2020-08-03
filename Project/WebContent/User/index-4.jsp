<%@page import="com.cart.Cart"%>
<%@page import="com.transaction.TransactionDAOImp"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.customer.register.Customer"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="com.admin.product.ProductDAOImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.admin.product.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang chủ</title>
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
    <!-- Font-Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;400&display=swap" rel="stylesheet">

    <!-- Modernizer js -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<%
	    List<Product> listProduct = new ArrayList<Product>();
		listProduct = new ProductDAOImp().getListProduct();
		// 1: sáp 2:phụ kiện 3: dao cạo 4:làm đẹp
		List<Product> list1 = new ArrayList<Product>();
		List<Product> list2 = new ArrayList<Product>();
		List<Product> list3 = new ArrayList<Product>();
		List<Product> list4 = new ArrayList<Product>();
		List<Product> listBestSeller = new TransactionDAOImp().getBestSeller();
		List<Product> listNewProduct =  new ProductDAOImp().getNewProduct();
		List<Product> listBigDiscount =  new ProductDAOImp().getBigDiscount();
		List<Product> listProductRandom =  new ProductDAOImp().getProductRandom();
		
		Cart cart = new Cart();
		if(session.getAttribute("cart")!=null) cart = (Cart) session.getAttribute("cart");
		
		for(Product temp: listProduct){
			switch (temp.getKind()){
				case "sapvuottoc":{
					list1.add(temp);
					break;
				}
				case "phukientoc":{
					list2.add(temp);
					break;
				}
				case "daocaorau":{
					list3.add(temp);
					break;
				}
				case "lamdep":{
					list4.add(temp);
					break;
				}
				
			}
		}
		
		pageContext.setAttribute("list1", list1);	
		pageContext.setAttribute("list2", list2);	
		pageContext.setAttribute("list3", list3);	
		pageContext.setAttribute("list4", list4);	
		pageContext.setAttribute("listBestSeller", listBestSeller);
		pageContext.setAttribute("listNewProduct", listNewProduct);
		pageContext.setAttribute("listBigDiscount", listBigDiscount);
		pageContext.setAttribute("listProductRandom", listProductRandom);
		//pageContext.getServletContext().getInitParameter("file-display");
		
    %>
   	<%!
   		public String getPath(String path, int index){
   			
   			String[] temp = path.split("\\?");
   			if(index>=temp.length){
   				return null;
   			}
   			return  temp[index];
   	}
   	
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
    <!-- Subiz -->
<script>
	(function(s, u, b, i, z){
		u[i]=u[i]||function(){
			u[i].t=+new Date();
			(u[i].q=u[i].q||[]).push(arguments);
		};
		z=s.createElement('script');
		var zz=s.getElementsByTagName('script')[0];
		z.async=1; z.src=b; z.id='subiz-script';
		zz.parentNode.insertBefore(z,zz);
	})(document, window, 'https://widgetv4.subiz.com/static/js/app.js', 'subiz');
	subiz('setAccount', 'acqribjjwtyuhxgxwsbp');
</script>
<!-- End Subiz -->

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
                    <!-- Cart Box End Here -->>
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
            
            <!-- Slider Area Start Here -->
            <div class="slider_box">
                <div class="slider-wrapper theme-default">
                    <!-- Slider Background  Image Start-->
                    <div id="slider" class="nivoSlider">
                        <a href="index-4.jsp"><img src="img/slider/14.jpg" data-thumb="img/slider/14.jpg" alt="" title="#htmlcaption" /></a>
                        <a href="index-4.jsp"><img src="img/slider/18.jpg" data-thumb="img/slider/18.jpg" alt="" title="#htmlcaption2" /></a>
                        <a href="index-4.jsp"><img src="img/slider/20.jpg" data-thumb="img/slider/20.jpg" alt="" title="#htmlcaption2" /></a>
                        <a href="index-4.jsp"><img src="img/slider/7.jpg" data-thumb="img/slider/7.jpg" alt="" title="#htmlcaption2" /></a>
                    </div>
                    <!-- Slider Background  Image Start-->
                </div>
            </div>
            <!-- Slider Area End Here -->

        <!-- Like Products Area Start Here -->
        <div class="like-product ptb-95 ptb-sm-55 off-white-bg">
            <div class="container">
                <div class="like-product-area"> 
                    <h2 class="section-ttitle2 mb-30">Sản Phẩm Bán Chạy</h2>
                    <!-- Like Product Activation Start Here -->
                    <div class="like-pro-active owl-carousel">
                    <c:forEach var="bestseller" items="${listBestSeller}">
                        <!-- Single Product Start -->
                        <c:set var="product" value="${bestseller}"></c:set>
                        <% Product product = (Product) pageContext.getAttribute("product"); %>
                        <div class="single-product">
                            <!-- Product Image Start -->
                            <div class="pro-img">
                                <a href="product.jsp?idProduct=<%= product.getIdProduct()%>">          
                                    <img width="300px" height="250px" class="primary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(product.getPathImage())[0] %>" alt="single-product">
                         
                                    <img width="300px" height="250px" class="secondary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(product.getPathImage())[0]%> " alt="single-product">
                                </a>
                                <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                            </div>
                            <!-- Product Image End -->
                            <!-- Product Content Start -->
                            <div class="pro-content">
                                <div class="pro-info">
                                    <h4><a href="product.jsp?idProduct=<%= product.getIdProduct()%>"><%=product.getName() %></a></h4>
                                    <%
                                   		 pageContext.setAttribute("price", "");
                            			pageContext.setAttribute("discount", "");
                                    	if(product.getDiscount()>0){
                                    		pageContext.setAttribute("price", product.getPrice());
                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
                                    	}
                                    %>
                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                </div>
                                <div class="pro-actions">
                                    <div class="actions-primary">
                                        <a href="CartServlet?idProduct=<%=product.getIdProduct()%>" title="Add to Cart"> + Thêm vào giỏ hàng</a>
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
                        <!-- Single Product End -->                        
                       
                    </div>                    
                    <!-- Like Product Activation End Here -->
                </div>
                <!-- main-product-tab-area-->
            </div>
            <!-- Container End -->
        </div>
        <!-- Like Products Area End Here -->   
        <!-- Big Banner Start Here -->
        <div class="big-banner mt-100 pb-85 mt-sm-60 pb-sm-40">
            <div class="container banner-2">
                <div class="banner-box">
                    <div class="col-img">
                        <a href="#"><img src="img/banner/5.jpg" alt="banner 3"></a>
                    </div>
                    <div class="col-img">
                        <a href="#"><img src="img/banner/6.jpg" alt="banner 3"></a>
                    </div>
                </div>
                <div class="banner-box">
                    <div class="col-img">
                        <a href="#"><img src="img/banner/2.jpg" alt="banner 3"></a>
                    </div>
                </div>
                <div class="banner-box">
                    <div class="col-img">
                        <a href="#"><img src="img/banner/7.jpg" alt="banner 3"></a>
                    </div>
                </div>
                <div class="banner-box">
                    <div class="col-img">
                        <a href="#"><img src="img/banner/3.jpg" alt="banner 3"></a>
                    </div>
                </div>
                <div class="banner-box">
                    <div class="col-img">
                        <a href="#"><img src="img/banner/9.jpg" alt="banner 3"></a>
                    </div>
                    <div class="col-img">
                        <a href="#"><img src="img/banner/8.jpg" alt="banner 3"></a>
                    </div>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Big Banner End Here -->   
        <!-- Product sidebaer Start Here -->
        <div class="product-sidebar-area home-4">
            <div class="container">
                <div class="row">
                    <!-- Product sidebar Start -->
                    <div class="col-lg-3">
                        <div class="sidebar">
                            <div class="side-pro-box">
                                
                                <!-- Single Product Start -->
                                <div class="col-img mb-30">
                                <a href="shop.jsp"><img src="img/banner/quangcao1.PNG" alt="slider-banner"></a>
                                </div>
                                <!-- Single Product End -->                                
                            </div>
                            <div class="side-pro-box mt-30">
                                <h3 class="sidebar-title mb-30">Sản phẩm nổi bật</h3>
                                <div class="side-product-active owl-carousel">
                                    <!-- Side Item Start -->
                                  
                                    <div class="side-pro-item">
                                        <!-- Single Product Start -->
                                          <c:forEach var="x" items="${listProductRandom}">
                                    <% Product product = (Product) pageContext.getAttribute("x"); 
                                    	String[] path = new ProductDAOImp().getPathImage(product.getPathImage());
                                    %>
                                        <div class="single-product single-product-sidebar">
                                            <!-- Product Image Start -->
                                            <div class="pro-img">
                                                <a href="product.jsp?idProduct=<%=product.getIdProduct()%>">
                                                	
                                                    <img width="50px" height="80px" class="primary-img" src="${initParam['file-display']}<%=path[0]%>" alt="single-product">

                                                    <img width="50px" height="80px" class="secondary-img" src="${initParam['file-display']}<%=path[0]%>" alt="single-product">
                                                    
                                                </a>
                                               
                                            </div>
                                            <!-- Product Image End -->
                                            <!-- Product Content Start -->
                                            <div class="pro-content">
                                                <h4><a href="product.jsp?idProduct=<%=product.getIdProduct()%>"><%=product.getName() %></a></h4>
                                              <%
                                   		 pageContext.setAttribute("price", "");
                            			pageContext.setAttribute("discount", "");
                                    	if(product.getDiscount()>0){
                                    		pageContext.setAttribute("price", product.getPrice());
                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
                                    	}
                                    %>
                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                            </div>
                                            <!-- Product Content End -->
                                        </div>
                                              </c:forEach>                               
                                    </div>
                                    
                                    <!-- Side Item End -->
                                </div>
                            </div>
                            <div class="side-pro-box">
                                <h3 class="sidebar-title mt-30">Thương hiệu nổi tiếng </h3>
                                <!-- Brand Banner Start -->
                                <div class="brand-banner-sidebar owl-carousel">
                                    <div class="single-brand">
                                        <a href="#"><img class="img" src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img class="img" src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>

                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                    <div class="single-brand">
                                        <a href="#"><img src="img/brand/12.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/10.png" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/13.jpg" alt="brand-image"></a>
                                        <a href="#"><img src="img/brand/11.jpg" alt="brand-image"></a>
                                    </div>
                                </div>
                                <!-- Brand Banner End -->                               
                            </div>                             
                        </div>
                    </div>
                    <!-- Product sidebar End -->
                    <!-- Product List Start -->
                    <div class="col-lg-9 mt-sm-60">
                        <div class="all-border">
                           <!-- Product Title Start -->
                            <div class="post-title pb-30">
                               <h2>Ưu đãi khủng</h2>
                           </div>
                           <!-- Product Title End -->
                            <!-- Hot Deal Product Activation Start -->
                            <div class="hot-deal-active3 owl-carousel">
                            <c:forEach var="x" items="${listBigDiscount}">
                            	<% Product product = (Product) pageContext.getAttribute("x"); 
                            	pageContext.setAttribute("price","");
                            	%>
                            	 <% if(product.getDiscount()>0) pageContext.setAttribute("price", new ProductDAOImp().getFormatMoney(product.getPrice()));%>
                                <div class="row">
                                    <!-- Main Thumbnail Image Start -->
                                    <div class="col-lg-6 mb-all-40 hot-product3 ">
                                        <div class="single-product">
                                            <!-- Product Image Start -->
                                            <div class="pro-img">
                                                <a href="product.jsp?idProduct=<%=product.getIdProduct()%>">
                                                    <img class="primary-img" src="${initParam['file-display']}<%= new ProductDAOImp().getPathImage(product.getPathImage())[0] %>" alt="single-product">
                                                </a>
                                                <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                            </div>
                                            <!-- Product Image End -->
                                            <span class="sticker-new">new</span>
                                        </div>
                                    </div>
                                    <!-- Main Thumbnail Image End -->
                                    <!-- Thumbnail Description Start -->
                                    <div class="col-lg-6 hot-product2">
                                        <div class="thubnail-desc fix">
                                            <div class="countdown" data-countdown="2025/03/01"></div>
                                            <h3><a href="product.jsp?idProduct=<%=product.getIdProduct()%>"><%=product.getName()%></a></h3>
                                            <div class="pro-price mtb-20">
                                           
                                                 <%
                                   					 pageContext.setAttribute("price", "");
                            						 pageContext.setAttribute("discount", "");
                                    				 if(product.getDiscount()>0){
                                    					pageContext.setAttribute("price", product.getPrice());
                                    					pageContext.setAttribute("discount", product.getDiscount() + "%");
                                    				}
                                    %>
                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                            </div>                                                                                                     
                                                <% 
                                             		String[] disciption = new ProductDAOImp().getDiscription(product.getDescription());

                                                %>
                                                	 <c:forEach var = "i" begin="0" end="<%=disciption.length-1%>">
					                                <p class="mb-30 pro-desc-details">► <%=disciption[(int) pageContext.getAttribute("i")]%></p>
					                       			</c:forEach>                                                           
                                            <div class="pro-actions">
                                                <div class="actions-primary">
                                                    <a href="cart.jsp?idProduct=<%=product.getIdProduct()%>" title="Add to Cart"> +Thêm vào giỏ hàng</a>
                                                </div>
                                                <div class="actions-secondary">
                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                </div>
                                            </div>                                
                                        </div>
                                    </div>
                                    <!-- Thumbnail Description End -->                        
                                </div>
                                
                               </c:forEach>
                            </div>
                            <!-- Hot Deal Product Active End -->
                        </div> 
                        <!-- main-product-tab-area-->  
                        <div class="main-product-tab-area mt-100 mt-sm-60">                
                                   <!-- Arrivals Products Area Start Here -->
                        <div class="second-arrivals-product pb-45 pb-sm-5">
                            <div class="container">
                                <div class="main-product-tab-area">
                                    <div class="tab-menu mb-25">
                                        <div class="section-ttitle">
                                            <h2>Sản phẩm</h2>
                                    </div>
                                        <!-- Nav tabs -->
                                        <ul class="nav tabs-area" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#sap">Sáp vuốt tóc</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#phukientoc">Phụ kiện tóc</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#daocaorau">Dao dạo râu</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#lamdep">Làm đẹp</a>
                                            </li>
                                        </ul>                       

                                    </div> 

                                    <!-- Tab Contetn Start -->
                                    <div class="tab-content">
                                        <div id="lamdep" class="tab-pane fade">
                                            <!-- Arrivals Product Activation Start Here -->
                                            <div class="best-seller-pro-active owl-carousel">
                                                <!-- Double Product Start -->
                                               <c:forEach var="x" items="${list4}" step="2" varStatus="i">  <!-- ${list[i.index+1].getIdProduct()} ${initParam['file-display']} -->                                             
                                                <div class="double-product">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${x.getIdProduct()}">
                                                            <!-- Anh 1 -->
                                                            	<c:set  var="path" value="${x.getPathImage()}" />
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                            	<c:set var="money" value="${x.getPrice()}"/>
                                                                <h4><a href="product.jsp?idProduct=${x.getIdProduct()}">${x.getName()}</a></h4>
                                                                 <%
                                                            	 Product product = (Product) pageContext.getAttribute("x");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${x.getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    <!-- Single Product End -->
                                                    <c:if test="${list4[i.index+1]!=NULL}">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${list4[i.index+1].getIdProduct()}">
                                                           		 <!-- Anh 2 -->
                                                           		 <c:set var="path" value="${list4[i.index+1].getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                                <h4><a href="product.jsp?idProduct=${list4[i.index+1].getIdProduct()}"> ${list4[i.index+1].getName()} </a></h4>
                                                                <c:set var="product" value="${ list4[i.index+1]}" />
                                                                 <%
                                                            	 product = (Product) pageContext.getAttribute("product");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${list4[i.index+1].getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    </c:if>
                                                    <!-- Single Product End -->
                                                </div>
                                                </c:forEach>          
                                            </div>
                                            <!-- Arrivals Product Activation End Here -->
                                        </div>
                                        <!-- #fshion End Here -->
                                        <div id="daocaorau" class="tab-pane fade">
                                            <!-- Arrivals Product Activation Start Here -->
                                            <div class="best-seller-pro-active owl-carousel">
                                                <!-- Double Product Start -->
                                                 <c:forEach var="x" items="${list3}" step="2" varStatus="i">  <!-- ${list[i.index+1].getIdProduct()} ${initParam['file-display']} -->
                                                <div class="double-product">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${x.getIdProduct()}">
                                                            <!-- Anh 1 -->
                                                            	<c:set  var="path" value="${x.getPathImage()}" />
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0) %>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                            	<c:set var="money" value="${x.getPrice()}"/>
                                                                <h4><a href="product.jsp${x.getIdProduct()}">${x.getName()}</a></h4>
                                                                <%
                                                            	 Product product = (Product) pageContext.getAttribute("x");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${x.getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    <!-- Single Product End -->
                                                    <c:if test="${list3[i.index+1]!=null}">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${list3[i.index+1].getIdProduct()}">
                                                           		 <!-- Anh 2 -->
                                                           		 <c:set var="path" value="${list3[i.index+1].getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                                <h4><a href="product.jsp?idProduct=${list3[i.index+1].getIdProduct()}"> ${list3[i.index+1].getName()} </a></h4>
                                                                <c:set var="product" value="${list3[i.index+1]}" />
                                                                 <%
                                                            	 product = (Product) pageContext.getAttribute("product");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${list3[i.index+1].getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    </c:if>
                                                    <!-- Single Product End -->
                                                </div>
                                                </c:forEach>      
                                                <!-- Double Product End -->                             
                                            </div>
                                            <!-- Arrivals Product Activation End Here -->
                                        </div>
                                        <!-- #fshion End Here -->
                                        <div id="phukientoc" class="tab-pane fade">
                                            <!-- Arrivals Product Activation Start Here -->
                                            <div class="best-seller-pro-active owl-carousel">
                                               <c:forEach var="x" items="${list2}" step="2" varStatus="i">  <!-- ${list[i.index+1].getIdProduct()} ${initParam['file-display']} -->                                             
                                                <div class="double-product">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${x.getIdProduct()}">
                                                            <!-- Anh 1 -->
                                                            	<c:set  var="path" value="${x.getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                            	<c:set var="money" value="${x.getPrice()}"/>
                                                                <h4><a href="product.jsp?idProduct=${x.getIdProduct()}">${x.getName()}</a></h4>
                                                                 <%
                                                            	 Product product = (Product) pageContext.getAttribute("x");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${x.getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    <!-- Single Product End -->
                                                    <c:if test="${list2[i.index+1]!=NULL}">
                                                    <!-- Single Product Start -->
                                                  
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${list2[i.index+1].getIdProduct()}">
                                                           		 <!-- Anh 2 -->
                                                           		 <c:set var="path" value="${list2[i.index+1].getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                                <h4><a href="product.jsp?idProduct=${list2[i.index+1].getIdProduct()}"> ${list2[i.index+1].getName()} </a></h4>
                                                                <c:set var="product" value="${ list2[i.index+1]}" />
                                                                 <%
                                                            	 product = (Product) pageContext.getAttribute("product");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${list2[i.index+1].getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         
                                                        <!-- Product Content End -->
                                                    </div>
                                                    </c:if>
                                                    <!-- Single Product End -->
                                                </div>
                                                </c:forEach>   
                                            </div>
                                            <!-- Arrivals Product Activation End Here -->
                                        </div>
                                        <!-- #beauty End Here -->
                                        <div id="sap" class="tab-pane fade show active">
                                            <!-- Arrivals Product Activation Start Here -->
                                            <div class="best-seller-pro-active owl-carousel">
                                                <!-- Double Product Start -->
                                                <c:forEach var="x" items="${list1}" step="2" varStatus="i">  <!-- ${list[i.index+1].getIdProduct()} ${initParam['file-display']} -->                                             
                                                <div class="double-product">
                                                    <!-- Single Product Start -->
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${x.getIdProduct()}">
                                                            <!-- Anh 1 -->
                                                            	<c:set  var="path" value="${x.getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                            	<c:set var="money" value="${x.getPrice()}"/>
                                                                <h4><a href="product.jsp?idProduct=${x.getIdProduct()}">${x.getName()}</a></h4>
                                                                 <%
                                                            	 Product product = (Product) pageContext.getAttribute("x");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${x.getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Product Content End -->
                                                    </div>
                                                    <!-- Single Product End -->
                                                    <c:if test="${list1[i.index+1]!=NULL}">
                                                    <!-- Single Product Start -->
                                                  
                                                    <div class="single-product">
                                                        <!-- Product Image Start -->
                                                        <div class="pro-img">
                                                            <a href="product.jsp?idProduct=${list1[i.index+1].getIdProduct()}">
                                                           		 <!-- Anh 2 -->
                                                           		 <c:set var="path" value="${list1[i.index+1].getPathImage()}"/>
                                                                <img class="primary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),0)%>" alt="single-product" width="225" height="180">
                                                                <img class="secondary-img" src="${initParam['file-display']}<%=getPath((String)pageContext.getAttribute("path"),1)%>" alt="single-product" width="225" height="180">
                                                            </a>
                                                            <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                                                        </div>
                                                        <!-- Product Image End -->
                                                        <!-- Product Content Start -->
                                                        <div class="pro-content">
                                                            <div class="pro-info">
                                                                <h4><a href="product.jsp?idProduct=${list1[i.index+1].getIdProduct()}"> ${list1[i.index+1].getName()} </a></h4>
                                                                <c:set var="product" value="${ list1[i.index+1]}" />
                                                                 <%
                                                            	 product = (Product) pageContext.getAttribute("product");
                                   								 pageContext.setAttribute("price", "");
                            									 pageContext.setAttribute("discount", "");
						                                    	 if(product.getDiscount()>0){
						                                    		pageContext.setAttribute("price", product.getPrice());
						                                    		pageContext.setAttribute("discount", product.getDiscount() + "%");
						                                    	 }
                                 								 %>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                                            </div>
                                                            <div class="pro-actions">
                                                                <div class="actions-primary">
                                                                    <a href="CartServlet?idProduct=${list1[i.index+1].getIdProduct()}" title="Add to Cart"> + Thêm vào giỏ</a>
                                                                </div>
                                                                <div class="actions-secondary">
                                                                    <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                                                    <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         
                                                        <!-- Product Content End -->
                                                    </div>
                                                    </c:if>
                                                    <!-- Single Product End -->
                                                </div>
                                                </c:forEach>  
                                               
                                            </div>
                                            <!-- Arrivals Product Activation End Here -->
                                        </div>
                                        <!-- #electronics End Here -->
                                    </div>
                                    <!-- Tab Content End -->
                </div>
                <!-- main-product-tab-area-->
            </div>
            <!-- Container End -->
        </div>
        <!-- Arrivals Products Area End Here -->
                        </div>
                        <!-- main-product-tab-area-->                                                                       
                    </div>
                    <!-- Product List End -->
                </div>
            </div>
        </div>   
        <!-- Product sidebaer End Here -->
         <!-- Banner Area Start Here -->
        <div class="big-banner pb-100 pt-95 pb-sm-60 pt-sm-55">
            <div class="container big-banner-box">
                <div class="col-img">
                    <a href="#">
                    <img src="img/banner/10.jpg" alt="">
                    </a>
                </div>
                <div class="col-img">
                    <a href="#">
                    <img src="img/banner/11.jpg" alt="">
                    </a>
                </div>
            </div>
        </div>
        <!-- Banner Area End Here -->           
        <!-- Arrivals Products Area Start Here -->
        <div class="second-arrivals-product pb-45 pb-sm-5">
            <div class="container">
                <div class="main-product-tab-area">
                    <div class="tab-menu mb-25">
                        <div class="section-ttitle">
                            <h2>Hàng mới</h2>
                       </div>                    
                    </div> 

                    <!-- Arrivals Product Activation Start Here -->
                    <div class="electronics-pro-active owl-carousel" >
                                
                        <!-- Single Product Start -->
                        <c:forEach var="product" items="${listNewProduct}">
                        <% Product product = (Product) pageContext.getAttribute("product"); %>
                        <div class="single-product">
                            <!-- Product Image Start -->
                            <div class="pro-img">
                                <a href="product.jsp?idProduct=<%=product.getIdProduct()%>">
                                    <img width="100px" height="250px" class="primary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(product.getPathImage())[0]%>" alt="single-product">
                                    <img width="100px" height="250px" class="secondary-img" src="${initParam['file-display']}<%=new ProductDAOImp().getPathImage(product.getPathImage())[0] %>" alt="single-product">
                                </a>
                                <a href="#" class="quick_view" data-toggle="modal" data-target="#myModal" title="Quick View"><i class="lnr lnr-magnifier"></i></a>
                            </div>
                            <!-- Product Image End -->
                            <!-- Product Content Start -->
                            <div class="pro-content">
                                <div class="pro-info">
                                    <h4><a href="product.jsp?idProduct<%=product.getIdProduct()%>"><%=product.getName()  %></a></h4>
                                     <%
                                       pageContext.setAttribute("price", "");
                            		   pageContext.setAttribute("discount", "");
						               if(product.getDiscount()>0){
						               pageContext.setAttribute("price", product.getPrice());
						                pageContext.setAttribute("discount", product.getDiscount() + "%");
						                 }
                                 		%>
							                                    <p><span class="price"><%= new ProductDAOImp().getFormatMoney(product.getPrice() - (product.getPrice() * product.getDiscount() /100)) %></span><del class="prev-price">${price}</del></p>
							                                    <c:if test="${discount!=''}"> <div class="label-product l_sale">${discount}<span class="symbol-percent"></span></div> </c:if>
                                    
                                </div>
                                <div class="pro-actions">
                                    <div class="actions-primary">
                                        <a href="CartServlet?idProduct=<%=product.getIdProduct()%>" title="Add to Cart"> + Thêm vào giỏ hàng</a>
                                    </div>
                                    <div class="actions-secondary">
                                        <a href="compare.jsp" title="Compare"><i class="lnr lnr-sync"></i> <span>So sánh</span></a>
                                        <a href="wishlist.jsp" title="WishList"><i class="lnr lnr-heart"></i> <span>Yêu thích</span></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Product Content End -->
                            <span class="sticker-new">new</span>
                        </div>
                        </c:forEach>
                        <!-- Single Product End -->
                      
                 
                        
                </div>
                <!-- Arrivals Product Activation End Here -->
                </div>
                <!-- main-product-tab-area-->
            </div>
            <!-- Container End -->
        </div>
        <!-- Arrivals Products Area End Here -->
        <!-- Latest Blog Area Start Here -->
        <div class="blog-area ptb-95 off-white-bg ptb-sm-55">
            <div class="container">
                <div class="like-product-area"> 
                    <h2 class="section-ttitle2 mb-30">Phản hồi khách hàng </h2>
               <!-- Latest Blog Active Start Here -->
               <div class="latest-blog-active owl-carousel">
                   <!-- Single Blog Start -->
                   <div class="single-latest-blog">
                       <div class="blog-img">
                           <a href="single-blog.jsp"><img src="img/blog/1.jpg" alt="blog-image"></a>
                       </div>
                       <div class="blog-desc">
                           <h4><a href="single-blog.jsp">Phản hồi về dịch vụ.</a></h4>
                            <ul class="meta-box d-flex">
                                <li><a href="#">By Barber</a></li>
                            </ul>
                            <p>Dịch vụ khá oke, ko phải nói nhiều. 10 điểm cho nhóm này</p>
                            <a  class="readmore" href="single-blog.jsp">Xem thêm</a>
                       </div>
                       <div class="blog-date">
                            <span>30</span>
                            Apr
                        </div>
                   </div>
                   <!-- Single Blog End -->
                   <!-- Single Blog Start -->
                   <div class="single-latest-blog">
                       <div class="blog-img">
                           <a href="single-blog.jsp"><img src="img/blog/2.jpg" alt="blog-image"></a>
                       </div>
                       <div class="blog-desc">
                           <h4><a href="single-blog.jsp">Phản hồi về sản phẩm.</a></h4>
                            <ul class="meta-box d-flex">
                                <li><a href="#">By Barber</a></li>
                            </ul>
                            <p>Hàng đẹp, y hình....</p>
                            <a  class="readmore" href="single-blog.jsp">Xem thêm</a>
                       </div>
                       <div class="blog-date">
                            <span>11</span>
                            May
                        </div>
                   </div>
                   <!-- Single Blog End -->
                   <!-- Single Blog Start -->
                   <div class="single-latest-blog">
                       <div class="blog-img">
                           <a href="single-blog.jsp"><img src="img/blog/1.jpg" alt="blog-image"></a>
                       </div>
                       <div class="blog-desc">
                           <h4><a href="single-blog.jsp">Phản hồi về nhân viên.</a></h4>
                            <ul class="meta-box d-flex">
                                <li><a href="#">By Barber</a></li>
                            </ul>
                            <p>Nhân viên chu đáo, nhiệt tình, tận tâm....</p>
                            <a  class="readmore" href="single-blog.jsp">Xem thêm</a>
                       </div>
                       <div class="blog-date">
                            <span>30</span>
                            Apr
                        </div>
                   </div>
                   <!-- Single Blog End -->
                   <!-- Single Blog Start -->
                   <div class="single-latest-blog">
                       <div class="blog-img">
                           <a href="single-blog.jsp"><img src="img/blog/2.jpg" alt="blog-image"></a>
                       </div>
                       <div class="blog-desc">
                           <h4><a href="single-blog.jsp">Phản hồi về chât lượng.</a></h4>
                            <ul class="meta-box d-flex">
                                <li><a href="#">By Barber</a></li>
                            </ul>
                            <p>Sản phẩm của shop chất lượng, phù hợp với giá tiền</p>
                            <a  class="readmore" href="single-blog.jsp">Xem thêm</a>
                       </div>
                       <div class="blog-date">
                            <span>28</span>
                            Apr
                        </div>
                   </div>
                   <!-- Single Blog End -->

               </div>
               <!-- Latest Blog Active End Here -->
                </div>
                <!-- main-product-tab-area-->
            </div>
            <!-- Container End -->
        </div>
        <!-- Latest Blog s Area End Here -->  
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
<!-- ${list[i.index+1].getIdProduct()} -->
</html>