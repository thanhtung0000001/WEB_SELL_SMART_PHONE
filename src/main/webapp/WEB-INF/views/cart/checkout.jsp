<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">

	<h2 class="breadcrumb text-center">
		<small> <a href="/cart/view">Shopping Cart</a> <span
			class="glyphicon glyphicon-menu-right"></span> <mark>
				<b>Checkout Details</b>
			</mark>
		</small>
	</h2>
	<div class="row">
		<div class="col-xs-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3>Thông Tin Thanh Toán</h3>
				</div>
				<div class="panel-body">
					<form:form action="/checkout/save" method="POST"
						modelAttribute="order">

						<div class="form-group">
							<label for="name">Họ và Tên *</label>
							<!-- ID Tai khoan  -->
							<div hidden="">
								<form:input path="accounts" value="${account.id}" />

							</div>

							<input type="text" class="form-control form-control-large"
								id="name" name="fullname" readonly="true"
								value="${account.hoten}" />
						</div>
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label for="phone">Số Điện Thoại *(bắt buộc)</label>
									<form:input type="text" class="form-control form-control-small"
										id="phone" path="phone" placeholder="Số điện thoại của bạn" />

								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<label for="email">Địa chỉ Email * </label> <input
										path="accounts" class="form-control form-control-large"
										id="email" readonly="true" value="${account.email}" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="state" class="control-label">Địa chỉ giao
								hàng * (bắt buộc)</label>
							<form:textarea type="text" class="form-control" id="state"
								path="diachi"
								placeholder="Ví dụ: Cầu vượt Quang Trung 1Quận 12, Thành phố Hồ Chí Minh" />
						</div>
						<h3>Thông tin bổ sung</h3>
						<div class="form-group">
							<label for="note" class="control-label">Ghi chú đơn hàng
								(Không bắt buộc)</label>
							<form:textarea class="form-control" rows="5" id="note"
								path="Note"
								placeholder="Ghi chú về đơn hàng (thời gian nhận hàng hoặc điểm giao hàng chi tiết hơn)." />
						</div>
						<div class="well">
							<button formaction="/checkout/save" type="submit"
								class="btn btn-lg btn-success btn-block">Đặt Hàng</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3>Đơn Hàng Của Bạn</h3>
				</div>
				<div class="panel-body">

					<table class="table col-sm-3" style="height: 500px">
						<thead>
							<tr>

								<th hidden="" scope="col">ID</th>
								<th scope="col" style="width: 300px">Tên sản phẩm</th>
								<th scope="col" style="width: 300px">Giá sản phẩm</th>
								<th scope="col" style="width: 300px">Số lượng sản phẩm</th>
								<th scope="col" style="width: 300px">Giảm giá</th>
								<th scope="col" style="width: 300px">Hình sản phẩm</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${list}" var="cart">
								<tr>
									<td hidden="">${cart.id}</td>
									<td>${cart.tensp}</td>
									<td>${cart.giasp}VNĐ</td>
									<td>${cart.soluong}</td>
									<c:if test="${cart.khuyenmai_id.phantram != null}">
										<td>${cart.khuyenmai_id.phantram}%</td>
									</c:if>
									<c:if test="${cart.khuyenmai_id.phantram == null}">
										<td>${cart.khuyenmai_id.phantram}</td>
									</c:if>
									<td><img alt="" style="width: 30%"
										src="/images/${cart.hinhsp}"></td>
								</tr>

							</c:forEach>

							<tr>
								<td></td>
								<td></td>

							</tr>
						</tbody>

						<tfoot>
							<tr>
								<td>Tổng Sản Phẩm:</td>
								<td></td>
								<td><b>${cartCount}</b></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><h4>Tổng Tiền</h4></td>
								<td></td>
								<td align="right" style="color: red"><h4>${cartAmount}
										VNĐ</h4></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					<hr>
					<b>Trả tiền mặt khi nhận hàng (Hóa đơn chưa kèm phí ship. Quý
						khách vui lòng thanh toán thêm phí ship khi nhận hàng)</b>
					<hr>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="/WEB-INF/views/common/footer.jsp"%>