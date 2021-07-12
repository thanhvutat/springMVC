<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<li><a href="#">Categories</a>
							<ul class="sub-menu">
								<li><a href="product-page.html">Product Page</a></li>
								<li><a href="shopping-cart.html">Shopping Card</a></li>
								<li><a href="check-out.html">Check out</a></li>
							</ul></li>
						<li><a href="./product-page.html">About</a></li>
						<li><a href="./check-out.html">Blog</a></li>
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
</body>
</html>