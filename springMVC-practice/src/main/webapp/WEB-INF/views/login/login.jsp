<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Violet | Login</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/app/css/style.css"
	type="text/css">
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Search model -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="container-fluid">
			<div class="inner-header">
				<div class="logo">
					<a href="${pageContext.servletContext.contextPath}/home"> <img
						src="${pageContext.servletContext.contextPath}/resources/app/img/logo.png"
						alt="">
					</a>
				</div>
				<div class="header-right">
					<img
						src="${pageContext.servletContext.contextPath}/resources/app/img/icons/search.png"
						alt="Search your item" class="search-trigger"
						title="Search your item"> <img
						src="${pageContext.servletContext.contextPath}/resources/app/img/icons/man.png"
						alt="" title="Clothes"> <a href="#"> <img
						src="${pageContext.servletContext.contextPath}/resources/app/img/icons/bag.png"
						alt="" title="Bags"> <span>2</span>
					</a>
				</div>
				<div class="user-access">
					<a href="${pageContext.servletContext.contextPath}/register">Register</a>
					<a href="${pageContext.servletContext.contextPath}/login"
						class="in">Sign in</a>
				</div>
				<nav class="main-menu mobile-menu">
					<ul>
						<li><a class="active"
							href="${pageContext.servletContext.contextPath}/home">Home</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/categories.html">Categories</a>
							<ul class="sub-menu">
								<li><a href="product-page.html">Product Page</a></li>
								<li><a href="shopping-cart.html">Shopping Card</a></li>
								<li><a href="check-out.html">Check out</a></li>
							</ul></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/product-page.html">About</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/check-out.html">Blog</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header Info Begin -->
	<div class="header-info">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="header-item">
						<img
							src="${pageContext.servletContext.contextPath}/resources/app/img/icons/delivery.png"
							alt="">
						<p>Free shipping on orders over $30 in USA</p>
					</div>
				</div>
				<div class="col-md-4 text-left text-lg-center">
					<div class="header-item">
						<img
							src="${pageContext.servletContext.contextPath}/resources/app/img/icons/voucher.png"
							alt="">
						<p>20% Student Discount</p>
					</div>
				</div>
				<div class="col-md-4 text-left text-xl-right">
					<div class="header-item">
						<img
							src="${pageContext.servletContext.contextPath}/resources/app/img/icons/sales.png"
							alt="">
						<p>30% off on dresses. Use code: 30OFF</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header Info End -->
	<!-- Header End -->

	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="page-breadcrumb">
						<h2>
							Sign in<span>.</span>
						</h2>
					</div>
				</div>
				<div class="col-lg-8">
					<img
						src="${pageContext.servletContext.contextPath}/resources/app/img/add.jpg"
						alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- Page Add Section End -->

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="col-lg-12">
					<label id="errorMessages" class="warningEmailInvalid">${errorMessages}</label>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Section Begin -->
	<div class="login-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<form:form id="loginForm" name="loginForm" class="login-form" method="POST" >
						<div class="row">
							<div class="col-lg-12">
								<input id="email" type="text" name="email" placeholder="Email">

							</div>
							<div class="col-lg-12">
								<input id="password" type="password" name="password"
									maxlength="30" placeholder="Password">
							</div>
							<div class="col-lg-12">
								<label id="emailInvalid" class="warningEmailInvalid"></label> <label
									id="passwordInvalid" class="passwordInvalid"></label>
							</div>
							<div class="col-lg-12 text-center">
								<button id="buttonLoginSubmit" name="buttonLoginSubmit"
									type="submit">Login</button>
							</div>
						</div>
					</form:form>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="contact-widget">
						<div class="cw-item">
							<h5>Location</h5>
							<ul>
								<li>1525 Awesome Lane,</li>
								<li>Los Angeles, CA</li>
							</ul>
						</div>
						<div class="cw-item">
							<h5>Phone</h5>
							<ul>
								<li>+1 (603)535-4592</li>
								<li>+1 (603)535-4556</li>
							</ul>
						</div>
						<div class="cw-item">
							<h5>E-mail</h5>
							<ul>
								<li>contact@violetstore.com</li>
								<li>www.violetstore.com</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 
			<div class="map">
				<div class="row">
					<div class="col-lg-12">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26440.72384129847!2d-118.24906619231132!3d34.06719475913053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c659f50c318d%3A0xe2ffb80a9d3820ae!2sChinatown%2C%20Los%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1570213740685!5m2!1sen!2sbd"
							height="560" style="border: 0;" allowfullscreen=""></iframe>
					</div>
				</div>
			</div>
			-->
		</div>
	</div>
	<!-- Login Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer-section spad">
		<div class="container">
			<div class="newslatter-form">
				<div class="row">
					<div class="col-lg-12">
						<form action="#">
							<input type="text" placeholder="Your email address">
							<button type="submit">Subscribe to our newsletter</button>
						</form>
					</div>
				</div>
			</div>
			<div class="footer-widget">
				<div class="row">
					<div class="col-lg-3 col-sm-6">
						<div class="single-footer-widget">
							<h4>About us</h4>
							<ul>
								<li>About Us</li>
								<li>Community</li>
								<li>Jobs</li>
								<li>Shipping</li>
								<li>Contact Us</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="single-footer-widget">
							<h4>Customer Care</h4>
							<ul>
								<li>Search</li>
								<li>Privacy Policy</li>
								<li>2019 Lookbook</li>
								<li>Shipping and Delivery</li>
								<li>Gallery</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="single-footer-widget">
							<h4>Our Services</h4>
							<ul>
								<li>Free Shipping</li>
								<li>Free Returnes</li>
								<li>Our Franchising</li>
								<li>Terms and conditions</li>
								<li>Privacy Policy</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="single-footer-widget">
							<h4>Information</h4>
							<ul>
								<li>Payment methods</li>
								<li>Times and shipping costs</li>
								<li>Product Returns</li>
								<li>Shipping methods</li>
								<li>Conformity of the products</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="social-links-warp">
			<div class="container">
				<div class="social-links">
					<a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
					<a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
					<a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
					<a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
					<a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
					<a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
				</div>
			</div>

			<div class="container text-center pt-5">
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart color-danger" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>


		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/mixitup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/main.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/app/js/app.js"></script>

</body>

<script>
	$(document)
			.ready(
					function() {
						$('#emailInvalid').hide();
						$('#passwordTooLong').hide();
						$('#passwordTooShort').hide();
						if ('${errorMessages}' != '') {
							$('#errorMessages').text('${errorMessages}');
							$('#errorMessages').show();
						} else {
							$('#errorMessages').hide();
						}
						$('#buttonLoginSubmit')
								.on(
										'click',
										function(e) {
											e.preventDefault();
											var email = $('#email').val();
											var password = $('#password').val();

											var checkEmail = isEmail(email);
											var checkPass = checkValidPassword(password);
											
											var thanh = $('#loginForm').val();

											if (checkEmail && checkPass) {
												//$('#loginForm').attr('action', '${pageContext.servletContext.contextPath}/login?form');
												//$('#loginForm').attr('modelAttribute', 'loginForm');
												//$('#loginForm').submit();
												submitEditAction('#loginForm', '${pageContext.servletContext.contextPath}/login?form');
											}
										});
					});

	function isEmail(email) {
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if (email == "") {
			$('#emailInvalid').text('Please insert your email to sign in.');
			$('#emailInvalid').show();
			return false;
		}
		/* if (regex.test(email)) {
			$('#emailInvalid')
					.text(
							'Your email is invalid. Please provide the correct email address that you in use.');
			$('#emailInvalid').show();
			return false;
		} */
		return true;
	}

	function checkValidPassword(password) {
		if (password == "") {
			$('#passwordInvalid').text('Password can not be empty.');
			$('#passwordInvalid').show();
			return false;
		}
		if (password.length < 8) {
			$('#passwordInvalid').text(
					'Please insert your password at least 8 characters.');
			$('#passwordInvalid').show();
			return false;
		}
		if (password.length > 32) {
			$('#passwordInvalid').text(
					'Please insert your password within 32 characters.');
			$('#passwordInvalid').show();
			return false;
		}
		if (/^[a-zA-Z0-9- ]*$/.test(password) == false) {
			$('#passwordInvalid').text(
					'Your password contains illegal characters.');
			$('#passwordInvalid').show();
			return false;
		}
		return true;
	}
</script>



</html>