<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Cá Nhân</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- header -->
	<hr>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-10">
				<h1>User name</h1>
			</div>
			<div class="col-sm-2">
				<a href="/users" class="pull-right"><img title="profile image"
					class="img-circle img-responsive"
					src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->


				<div class="text-center">
					<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
						class="avatar img-circle img-thumbnail" alt="avatar">
					<h6>Upload a different photo...</h6>
					<input type="file" class="text-center center-block file-upload">
				</div>
				</hr>
				<br>


				<div class="panel panel-default">
					<div class="panel-heading">
						Website <i class="fa fa-link fa-1x"></i>
					</div>
					<div class="panel-body">
						<a href="http://bootnipets.com">bootnipets.com</a>
					</div>
				</div>


				<ul class="list-group">
					<li class="list-group-item text-muted">Activity <i
						class="fa fa-dashboard fa-1x"></i></li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span>
						125</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span>
						13</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span>
						37</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span>
						78</li>
				</ul>

				<div class="panel panel-default">
					<div class="panel-heading">Social Media</div>
					<div class="panel-body">
						<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i>
						<i class="fa fa-twitter fa-2x"></i> <i
							class="fa fa-pinterest fa-2x"></i> <i
							class="fa fa-google-plus fa-2x"></i>
					</div>
				</div>

			</div>
			<!--/col-3-->
			<div class="col-sm-9">



				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>
						<form class="form" action="##" method="post" id="registrationForm">
							<div class="form-group">

								<div class="col-xs-6">
									<label for="first_name"><h4>Họ và Tên</h4></label> <input
										type="text" class="form-control" name="first_name"
										id="first_name" placeholder="Họ và tên"
										title="enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="last_name"><h4>Email</h4></label> <input
										type="text" class="form-control" name="last_name"
										id="last_name" placeholder="Email"
										title="enter your last name if any.">
								</div>
							</div>

							<div class="form-group">

								<div class="col-xs-6">
									<label for="phone"><h4>Phone</h4></label> <input type="text"
										class="form-control" name="phone" id="phone"
										placeholder="Số điện thoại"
										title="enter your phone number if any.">
								</div>
							</div>


							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success" type="submit">
										<i class="glyphicon glyphicon-ok-sign"></i> Save
									</button>
									<button class="btn btn-lg" type="reset">
										<a href="/form/Profile" class="glyphicon glyphicon-repeat">Reset</a>   
									</button>
								</div>
							</div>
						</form>


					</div>

				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->

		</div>
		<!--/col-9-->
	</div>
	<!--/row-->


	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>