<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<style>
img {
	width: 10%;
}
</style>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<form action="/cart/view" method="post">
		<table class="table col-sm-3" style="height: 500px">
			<thead>
				<tr>

					<th hidden="" scope="col">ID</th>
					<th scope="col">Tên SP</th>
					<th scope="col">Giá SP</th>
					<th scope="col">Số lượng SP</th>
					 
					<th scope="col">Hình</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="cart">
					<tr>
						<td hidden="">${cart.id}</td>
						<td>${cart.tensp}</td>
						<td>${cart.giasp}VNĐ</td>
						<td><a href="/cart/update/${cart.id}/plus?param=plus">+ </a>${cart.soluong}<a
							href="/cart/update/${cart.id}/discount?param=dis"> -</a></td>
						<td><img alt="" src="/images/${cart.hinhsp}"></td>
					</tr>

				</c:forEach>

				<tr>
					<td></td>
					<td></td>

				</tr>
			</tbody>

		</table>
		<a></a>

	</form>
	<div class="col-sm-4">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Cộng Giỏ Hàng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Tạm Tính</td>
						<td align="right"><b>${cartAmount} VNĐ</b></td>
					</tr>
					<tr>
						<td>Tổng Sản Phẩm</td>
						<td align="right"><b>${cartCount}</b></td>
					</tr>

				</tbody>
				<tfoot>
					<tr>
						<td><h4>Tổng Tiền</h4></td>
						<td align="right">
							<h4>${ cartAmount }VNĐ</h4>
						</td>
					</tr>
				</tfoot>
			</table>
			<hr>
			<a href="/form/checkout">
				<button class="btn btn-primary" style="width: 100%;">
					<b>Tiến Hành Đặt Hàng</b>
				</button>
			</a>
			<a href="/create_payment">
				<button class="btn btn-primary" style="width: 100%;">
					<b>ChekPayMent</b>
				</button>
			</a>
		</div>
	</div>
	<a href="/form/index"> Back To Home</a>


	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>