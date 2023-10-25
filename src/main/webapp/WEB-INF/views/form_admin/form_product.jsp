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
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>

	<h1>ADMINNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN</h1>
	<div class="container">

		<form:form action="/admin/form" modelAttribute="product" method="post"
			enctype="multipart/form-data">
			<div hidden="">
				<form:input path="id" />
			</div>
			<div class="card" style="width: 500px; height: 500px; float: right">
				<img class="card-img-top" src="/images/${product.hinhsp}"
					alt="Card image cap">
			</div>
			<h4 style="width: 150px">Tên sản phẩm</h4>
			<form:input path="tensp" />
			<h4 style="width: 170px">Hình sản phẩm</h4>


			<input name="photo_hinh" type="file" />
			 
			 <div hidden=""><form:input path="hinhsp" /></div>
			 


			<h4 style="width: 150px">Giá sản phẩm</h4>
			<form:input path="giasp" />
			<h4 style="width: 190px">Số lượng sản phẩm</h4>
			<form:input path="soluong" />

			<h4 style="width: 180px">Mô tả sản phẩm</h4>

			<form:textarea path="mota" style="width: 600px;height:170px" />
			<form:select path="catagory.id">
				<c:forEach items="${list_catagory}" var="category">
					<form:option value="${category.id}">${category.tendanhmuc}</form:option>
				</c:forEach>
			</form:select>

			<form:select path="brand.id">
				<c:forEach items="${list_brand}" var="brand">
					<form:option value="${brand.id}">${brand.tennhanhang}</form:option>
				</c:forEach>
			</form:select>

			<form:select path="khuyenmai_id.id">
				<c:forEach items="${list_khuyenmai}" var="km">
					<form:option value="${km.id}">${km.phantram} %</form:option>
				</c:forEach>
				<form:option value="">khác</form:option>
			</form:select>
			<button formaction="/admin/save">Save</button>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Hình sản phẩm</th>
						<th scope="col">Giá sản phẩm</th>
						<th scope="col">Số lượng sản phẩm</th>
						<th scope="col">Mô tả</th>
						<th scope="col">Ngày tạo</th>
						<th scope="col">Danh mục</th>
						<th scope="col">Nhãn hàng</th>
						<th scope="col">Khuyến mãi</th>
						<th scope="col">Hoạt động</th>
						<th scope="col">Hành động</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="prod">
						<tr>

							<td>${prod.id}</td>
							<td>${prod.tensp}</td>
							<td hidden="">${prod.hinhsp}</td>
							<td><img alt="hinhanh" src="/images/${prod.hinhsp}"
								style="width: 50px"></td>

							<td>${prod.giasp}</td>
							<td>${prod.soluong}</td>
							<td>${prod.mota}</td>
							<td>${prod.ngaytao}</td>
							<td>${prod.catagory.tendanhmuc}</td>
							<td>${prod.brand.tennhanhang}</td>
							<td>${prod.khuyenmai_id.phantram}</td>
							<td>${prod.active ?"Chưa xóa": "Đã xóa"}</td>
							<td><a href="/edit/${prod.id}" style="padding: 30px">Edit</a>
								<a href="/delete/${prod.id}" style="padding: 30px">Delete</a> <a
								href="/view/product/${prod.id}" style="padding: 30px">VIEW</a></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</form:form>
	</div>
</body>
</html>