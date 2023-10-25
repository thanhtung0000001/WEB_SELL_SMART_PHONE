<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.error-template {
	padding: 40px 15px;
	text-align: center;
}

.error-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.error-actions .btn {
	margin-right: 10px;
}

.container {
	padding-bottom: 90px
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Header-->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Header-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="error-template">
					<h1>Oops!</h1>
					<h2>Không tìm thấy sản phẩm</h2>
					<div class="error-details">
						Tìm thấy 0 sản phẩm cho từ khoá
						  <b style="font-size: 18px">${error}</b>
					</div>
					<div class="error-actions">
						<a href="/form/index" class="btn btn-primary btn-lg"><span
							class="glyphicon glyphicon-home"></span> Quay lại trang chủ </a><a
							href="http://www.jquery2dotnet.com"
							class="btn btn-default btn-lg"><span
							class="glyphicon glyphicon-envelope"></span> Liên hệ </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Footer-->
</body>
</html>