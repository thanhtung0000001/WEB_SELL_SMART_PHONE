<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: #fbfbfb;
}

@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 240px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}
</style>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Admin</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />
<!-- Custom styles -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
	crossorigin="anonymous"></script>
</head>

<body>
	<!--Main Navigation-->
	<header>
		<!-- Sidebar -->
		<nav id="sidebarMenu"
			class="collapse d-lg-block sidebar collapse bg-white">
			<div class="position-sticky" style="padding: 12px">

				<div class="list-group list-group-flush mx-3 mt-4">
					<a href="/admin/form?p=product_form"
						class="list-group-item list-group-item-action py-2 ripple active">
						<i class="fas fa-chart-area fa-fw me-3"></i><span>Quản Lý
							Sản Phẩm </span>
					</a> <a href="/admin/form?p=product_gallery"
						class="list-group-item list-group-item-action py-2 ripple"><i
						class="fas fa-lock fa-fw me-3"></i><span>Quản Lý Hình Ảnh</span></a> <a
						href="/admin/form?p=product_color"
						class="list-group-item list-group-item-action py-2 ripple"><i
						class="fas fa-chart-line fa-fw me-3"></i><span>Quản Lý Màu
							Sắc</span></a> <a href="/form/disscount?p=product_discount"
						class="list-group-item list-group-item-action py-2 ripple"> <i
						class="fas fa-chart-pie fa-fw me-3"></i><span>Quản Lý
							Khuyến Mãi</span>
					</a> <a href="/form/recycle?p=product_recycle_bin"
						class="list-group-item list-group-item-action py-2 ripple"> <i
						class="fas fa-chart-pie fa-fw me-3"></i><span>Quản Lý
							Rác</span>
					</a>
				</div>

			</div>

		</nav>
		<!-- Sidebar -->

		<!-- Navbar -->
		<nav id="main-navbar"
			class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
			<!-- Container wrapper -->
			<div class="container-fluid">
				<!-- Toggle button -->
				<button class="navbar-toggler" type="button"
					data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
					aria-controls="sidebarMenu" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>

				<!-- Brand -->
				<a class="navbar-brand" href="#"> <img
					src="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png"
					height="25" alt="" loading="lazy" />
				</a>
				<!-- Search form -->
				<form class="d-none d-md-flex input-group w-auto my-auto">
					<input autocomplete="off" type="search"
						class="form-control rounded"
						placeholder='Search (ctrl + "/" to focus)'
						style="min-width: 225px" /> <span
						class="input-group-text border-0"><i class="fas fa-search"></i></span>
				</form>

				<!-- Right links -->
				<ul class="navbar-nav ms-auto d-flex flex-row">
					<!-- Notification dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow"
						href="#" id="navbarDropdownMenuLink" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <i
							class="fas fa-bell"></i> <span
							class="badge rounded-pill badge-notification bg-danger">1</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">Some news</a></li>
							<li><a class="dropdown-item" href="#">Another news</a></li>
							<li><a class="dropdown-item" href="#">Something else</a></li>
						</ul></li>

					<!-- Icon -->
					<li class="nav-item"><a class="nav-link me-3 me-lg-0" href="#">
							<i class="fas fa-fill-drip"></i>
					</a></li>
					<!-- Icon -->
					<li class="nav-item me-3 me-lg-0"><a class="nav-link" href="#">
							<i class="fab fa-github"></i>
					</a></li>

					<!-- Icon dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow"
						href="#" id="navbarDropdown" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <i
							class="united kingdom flag m-0"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#"><i
									class="united kingdom flag"></i>English <i
									class="fa fa-check text-success ms-2"></i></a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item" href="#"><i
									class="poland flag"></i>Polski</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="china flag"></i>中文</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="japan flag"></i>日本語</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="germany flag"></i>Deutsch</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="france flag"></i>Français</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="spain flag"></i>Español</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="russia flag"></i>Русский</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="portugal flag"></i>Português</a></li>
						</ul></li>

					<!-- Avatar -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
						href="#" id="navbarDropdownMenuLink" role="button"
						data-mdb-toggle="dropdown" aria-expanded="false"> <img
							src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
							class="rounded-circle" height="22" alt="" loading="lazy" />
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">My profile</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="#">Logout</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- Container wrapper -->
		</nav>
		<!-- Navbar -->
	</header>
	<!--Main Navigation-->

	<!--Main layout-->
	<main style="margin-top: 58px">
		<%
		if (request.getParameter("p") != null && request.getParameter("p").equals("product_form")) {
		%>
		<jsp:include page="form_product.jsp"></jsp:include>
		<%
		} else if (request.getParameter("p") != null && request.getParameter("p").equals("product_color")) {
		%>
		<jsp:include page="form_color.jsp"></jsp:include>
		<%
		}else if(request.getParameter("p") != null && request.getParameter("p").equals("product_gallery")){
		%>
		<jsp:include page="form_gallery.jsp"></jsp:include>
		<%
		} else if(request.getParameter("p") != null && request.getParameter("p").equals("product_discount")){
		%>
		<jsp:include page="form_discount.jsp"></jsp:include>
		
		<%}else if(request.getParameter("p") != null && request.getParameter("p").equals("product_recycle_bin")){
		%>
		<jsp:include page="form_recyclebin.jsp"></jsp:include>
		<% }else { %>
		 
		<jsp:include page="form_product.jsp"></jsp:include>
		<%
		}
		%>
	</main>
	<!--Main layout-->
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/admin.js"></script>

</body>

</html>