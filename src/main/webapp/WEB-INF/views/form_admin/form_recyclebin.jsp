<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	padding-top: 50px;
}

.find {
	width: 800px;
	flex: content;
	margin: auto;
	margin-bottom: 40px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<form action="/form/recycle" method="post">
			<div class="find">
				<input type="text" name="keyword" style="width: 500px;" />
				<button formaction="/recycle/search">Search</button>
				<a href="/admin/form">Back Home</a>
			</div>
			<table id="dtBasicExample"
				class="table table-striped table-bordered table-sm" cellspacing="0"
				width="100%">

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

					<c:forEach items="${recycle}" var="bin">
						<tr>

							<td>${bin.id}</td>
							<td>${bin.tensp}</td>
							<td><img alt="hinhanh" src="/images/${bin.hinhsp}"
								style="width: 50px"></td>
							<td>${bin.giasp}</td>
							<td>${bin.soluong}</td>
							<td>${bin.mota}</td>
							<td>${bin.ngaytao}</td>
							<td>${bin.catagory.tendanhmuc}</td>
							<td>${bin.brand.tennhanhang}</td>
							<td>${bin.khuyenmai_id.phantram}</td>
							<td>${bin.active ?"Chưa xóa": "Đã xóa"}</td>
							<td><a href="/restore/${bin.id}" style="padding: 30px">Khôi phục</a></td>
							<td><a href="/delete/bin/${bin.id}" style="padding: 30px">Delete</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</form>
	</div>

</body>
</html>