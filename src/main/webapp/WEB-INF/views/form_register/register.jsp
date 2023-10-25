<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.color{
	color: red;
}
</style>
</head>
<body>
	<!-- Header-->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Header-->
	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng
										kí</p>

									<form:form action="/register/account" modelAttribute="register"
										method="post" class="mx-1 mx-md-4">

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1c">Họ và
													tên:</label>
												<form:input path="hoten" type="text" id="form3Example1c"
													class="form-control" />
												<form:errors path="hoten" class="color" />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example3c">Tên
													đăng nhập:</label>
												<form:input path="tendangnhap" id="form3Example3c"
													class="form-control" />
												<form:errors path="tendangnhap"  class="color"/>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4c">Mật
													khẩu</label>
												<form:input path="matkhaudangnhap" type="password"
													id="form3Example4c" class="form-control" />
												<form:errors path="matkhaudangnhap" class="color" />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4cd">Nhập
													lại mật khẩu</label> 
										<input name="pass" type="password" id="form3Example4cd" class="form-control" />
												<h6 style="color: red;">${message}</h6>
											</div>
										</div>

										<div class="form-check d-flex justify-content-center mb-5">
											  <label class="form-check-label"
												for="form2Example3"   > I agree all statements in <a
												href="#!">Terms of service</a>
												<input style="margin-left: 10px" class="form-check-input me-2" type="checkbox" value=""
												id="form2Example3c" />
											</label>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button formaction="/register/account" type="submit"
												class="btn btn-primary btn-lg">Register</button>
										</div>

									</form:form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Footer-->
</body>
</html>