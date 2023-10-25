<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>
img {
	width: 40%
}

.product__price--percent {
	
}

.product__price--percent-detail {
	background-color: #d70018;
	border-radius: 10px;
	height: 26px;
	margin: 0px 0px 10px 10px;
	width: 80px;
	color: white;
}

.card-disscount {
	text-decoration: line-through;
	color: gray;
}
.card-text{
color: red;
}
</style>
<meta charset="UTF-8">
<title>Trang Chủ</title>
</head>
<body>
	<!-- Header-->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Header-->
	<ul class="list-group">
		<c:forEach items="${List_DanhMuc}" var="category">
			<li class="list-group-item"><a
				href="/form/index?param=${category.id}">${category.tendanhmuc}</a></li>
		</c:forEach>
	</ul>
	<div class="container">

		<p class="text-center">Thương hiệu</p>
		<ul class="nav justify-content-center">
			<c:forEach items="${List_Brand}" var="brand">
				<li class="nav-item"><a class="nav-link"
					href="/form/brand?param=${brand}">${brand}></a></li>
			</c:forEach>
		</ul>


	</div>

	<nav style="padding-top: 30px; padding-bottom: 50px">
		<div class="container">
			<div class="row" style="padding-left: 150px">

				<c:forEach items="${list}" var="pro">

					<div class=" card col-md-3"
						style="margin-right: 30px; margin-bottom: 30px">

						<c:if test="${pro.khuyenmai_id.phantram != null}">
							<div class="product__price--percent">
								<p class="product__price--percent-detail">Giảm&nbsp;${pro.khuyenmai_id.phantram}%</p>
							</div>
						</c:if>

						<a href="/form/detail/${pro.id}?param=${pro.catagory.id}"> <img
							class="card-img-top" src="/images/${pro.hinhsp}"
							alt="Card image cap">
						</a>
						<div class="card-body">
							<h5 class="card-title">${pro.tensp}</h5>
							
							<c:if test="${pro.khuyenmai_id.phantram != null}">
								<h5 class="card-text">${pro.giasp - (pro.giasp * (pro.khuyenmai_id.phantram / 100)).intValue()}
									VNĐ</h5>
								<h6 class="card-disscount">${pro.giasp} VNĐ</h6>
							</c:if>
							
							<c:if test="${pro.khuyenmai_id.phantram == null}">
								<h5 class="card-text">${pro.giasp} VNĐ</h5>
							</c:if>
							
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>

					</div>

				</c:forEach>

			</div>
		</div>

	</nav>
	<!-- Footer-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Footer-->
</body>
</html>