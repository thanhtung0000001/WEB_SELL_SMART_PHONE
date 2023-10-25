<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<meta charset="UTF-8">
<title>Trang Chi tiết Sản Phẩm</title>
<style>
.card-disscount {
	text-decoration: line-through;
	color: gray;
}

.card-text {
	color: red;
}
</style>


</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="card col-5" style="width: 30rem; margin-right: 30px">
				<img class="card-img-top" src="/images/${list.hinhsp}"
					alt="Card image cap">
				<div class="card-body">
					<h3>Thông tin sản phẩm</h3>
				
					<ul><li>${list.mota}</li></ul>
					  
				</div>
			</div>


			<div class="card col-5" style="width: 30rem">

				<div class="card-body">

					<c:if test="${list.khuyenmai_id.phantram != null}">
						<h2 class="card-text">${list.giasp - (list.giasp * (list.khuyenmai_id.phantram / 100)).intValue()}
							VNĐ</h2>
						<h6 class="card-disscount">${list.giasp}VNĐ</h6>
					</c:if>

					<c:if test="${list.khuyenmai_id.phantram == null}">
						<h5 class="card-text">${list.giasp}VNĐ</h5>
					</c:if>

					<a href="/cart/add/${list.id}">Add To Cart </a> <a
						href="/cart/view"
						style="text-decoration: none; margin-top: 51px; text-align: center; color: orangered;">
					</a>
					<div style="display: flex;">
						<button>Thanh Toán</button>
					</div>
				</div>
			</div>
		</div>
		<h1>Danh Mục Liên Quan</h1>



		<div class="row" style="padding-left: 150px">

			<c:forEach items="${list_related}" var="pro">

				<div class=" card col-md-3"
					style="margin-right: 30px; margin-bottom: 30px">

					<a href="/form/detail/${pro.id}?param=${pro.catagory.id}"> <img
						class="card-img-top" src="/images/${pro.hinhsp}"
						alt="Card image cap">
					</a>
					<div class="card-body">
						<h5 class="card-title">${pro.tensp}</h5>
						<c:if test="${pro.khuyenmai_id.phantram != null}">
							<h5 class="card-text">${pro.giasp - (pro.giasp * (pro.khuyenmai_id.phantram / 100)).intValue()}
								VNĐ</h5>
							<h6 class="card-disscount">${pro.giasp}VNĐ</h6>
						</c:if>

						<c:if test="${pro.khuyenmai_id.phantram == null}">
							<h5 class="card-text">${pro.giasp}VNĐ</h5>
						</c:if>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>

				</div>

			</c:forEach>

		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>