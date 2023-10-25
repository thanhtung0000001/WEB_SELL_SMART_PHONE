<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<meta charset="UTF-8">
<title>Login</title>
<!-- <link rel="stylesheet" href="/WEB-INF/views/css/login.css" /> -->

<style>
.color {
	color: red;
}
</style>
</head>
<body>
	<!-- Header-->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Header-->
	<div class="container" style="width: 352px;">
		<form:form modelAttribute="account" method="post">
			<!-- Email input -->
			
			<h3 style="align-items: center;">Login</h3>
			<div class="form-outline mb-4">
				<h4 class="color">${message}</h4>
				<label class="form-label" for="form2Example1">Tên Đăng Nhâp
					:</label>
				<form:input path="tendangnhap" type="text" id="form2Example1"
					class="form-control" />
				<form:errors class="color" path="tendangnhap" />
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">

				<label class="form-label" for="form2Example2">Mật Khẩu :</label>
				<form:input path="matkhaudangnhap" type="password"
					id="form2Example2" class="form-control" />
				<form:errors class="color" path="matkhaudangnhap" />
			</div>

			<!-- 2 column grid layout for inline styling -->
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					<!-- Checkbox -->
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="form2Example31" checked /> <label class="form-check-label"
							for="form2Example31"> Remember me </label>
					</div>
				</div>

				<div class="col">
					<!-- Simple link -->
					<a href="#!">Forgot password?</a>
				</div>
			</div>

			<!-- Submit button -->
			<button formaction="/check/form" type="submit"
				class="btn btn-primary btn-block mb-4">Sign in</button>

			<!-- Register buttons -->
			<div class="text-center">
				<p>
					Not a member? <a href="#!">Register</a>
				</p>
				<p>or sign up with:</p>
				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-facebook-f"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-google"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-twitter"></i>
				</button>

				<button type="button" class="btn btn-link btn-floating mx-1">
					<i class="fab fa-github"></i>
				</button>
			</div>
		</form:form>
	</div>

	<!-- Footer-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Footer-->
</body>
</html>