<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: rgb(#cd1818);">
	<a class="navbar-brand" href="/form/index">FPTSHOP</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="/form/index">Home <span class="sr-only">(current)</span></a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" value="${keyword}" name="keyword"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0"
				formaction="/form/search">Search</button>
		</form>

		<ul class="navbar-nav mr-auto ">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Account ${account.hoten} </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:if test="${account == null}">
						<a class="dropdown-item" href="/form/login">Đăng nhập</a>
						<a class="dropdown-item" href="/form/register">Đăng kí</a>
					</c:if>
					 
					<c:if test="${account != null}">
						<a class="dropdown-item" href="/logout">Đăng xuất</a>
						<a class="dropdown-item" href="/form/order/${account.id}">Lịch sử đơn hàng</a>
						<a class="dropdown-item" href="/form/Profile">Cá nhân</a>
					</c:if>

				</div></li>
		</ul>
		<a href="/cart/view"
			style="text-decoration: none; text-align: center; color: orangered;">
			<div class="gio" style="width: 50px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
			              <path
						d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
			            </svg>
				<span class="badge tn"></span>

				<div style="font-size: 10px; width: 50px">Giỏ Hàng</div>
			</div>
		</a>
	</div>

</nav>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>