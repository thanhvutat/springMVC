<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<!-- Start header session -->
<jsp:include page="/WEB-INF/views/common/common-header.jsp"></jsp:include>
<!-- End of header session -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="/WEB-INF/views/common/common-header-selection.jsp"></jsp:include>
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
					<form:form id="loginForm" name="loginForm" class="login-form"
						action="${pageContext.servletContext.contextPath}/login/form"
						method="POST">
						<div class="row">
							<div class="col-lg-12">
								<input id="email" type="text" name="email" placeholder="Email" />

							</div>
							<div class="col-lg-12">
								<input id="password" type="password" name="password"
									placeholder="Password" />
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
	<jsp:include page="/WEB-INF/views/common/common-footer.jsp"></jsp:include>
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
<!-- 
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
												submitEditAction('#loginForm',
														'${pageContext.servletContext.contextPath}/login?form');
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
 -->


</html>