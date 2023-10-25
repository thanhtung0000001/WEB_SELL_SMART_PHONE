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
<title>Insert title here</title>
</head>
<body>
	<form:form action="/form/disscount/save" modelAttribute="disscount"
		method="post">
		<div hidden="">
			<form:input path="id" />
		</div>
		<h5>Ngày bắt đầu:</h5>
		<form:input path="ngaybatdau" type="date"></form:input>

		<h5>Ngày kết thúc:</h5>
		<form:input path="ngayketthuc" type="date"></form:input>

		<h5>Phần trăm Giảm giá</h5>
		<form:input path="phantram" />



		<button>Save</button>

	<a href="/admin/form">Back To Admin</a>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Ngày bắt đầu</th>
					<th scope="col">Ngày kết thúc</th>
					<th scope="col">Ngày tạo</th>
					<th scope="col">Phần trăm giảm giá</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${diss}" var="diss">
					<tr>
						<td>${diss.id}</td>
						<td>${diss.ngaybatdau}</td>
						<td>${diss.ngayketthuc}</td>
						<td>${diss.ngaytao}</td>
						<td>${diss.phantram}%</td>
						<td><a href="/form/disscount/delete/${diss.id}">Delete</a></td>
						<td><a href="/form/disscount/edit/${diss.id}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form:form>
</body>
</html>