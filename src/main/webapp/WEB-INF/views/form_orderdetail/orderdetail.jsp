<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- header -->

	<table class="table" style="height: 500px;">
		<thead>
			<tr>

				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Giá sản phẩm</th>
				<th scope="col">Số lượng</th>
				<th scope="col">Hình sản phẩm</th>
				<th scope="col">Thành tiền</th>
				<th scope="col">Trang thái
				<th>
			</tr>
		</thead>
		<tbody></tbody>
		<c:forEach items="${orderDetail}" var="detail">
			<tr>

				<td hidden="">${detail.id}</td>
				<td>${detail.product.tensp}</td>
				<td>${detail.price}</td>
				<td>${detail.quantity}</td>
				<td style="width: 200px"><img style="width: 40%;" alt=""
					src="/images/${detail.product.hinhsp}"></td>
				<td style="width: 150px">${detail.price * detail.quantity}VNĐ</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
			<td></td>
			</tr>
			<tr>
				<td><b>Tổng tiền</b></td>
				<td><b></b></td>
				<td><b></b></td>
				<td><b></b></td>
				<td style="color: red;font-size: 20px;width: 200px"><b>${Tong} VNĐ</b></td>
			</tr>
		</tfoot>
	</table>
	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- footer -->
</body>
</html>