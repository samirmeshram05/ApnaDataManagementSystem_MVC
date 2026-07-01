<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Student Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">

</head>

<body>

	<div class="container mt-5">

		<div class="card shadow">

			<div class="card-header bg-primary text-white text-center">

				<h2>Student Details</h2>

			</div>

			<div class="card-body">

				<table class="table table-bordered table-hover table-striped">

					<thead class="table-dark">

						<tr>

							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Gender</th>
							<th>Course</th>
							<th>Timing</th>
							<th>Action</th>

						</tr>

					</thead>

					<tbody>

						<c:forEach var="std" items="${students}">

							<tr>

								<td>${std.sid}</td>
								<td>${std.name}</td>
								<td>${std.email}</td>
								<td>${std.gender}</td>
								<td>${std.course}</td>
								<td>${std.timing}</td>

								<td><a href="update?sid=${std.sid}"
									class="btn btn-warning btn-sm"> Update </a> <a
									href="delete?sid=${std.sid}" class="btn btn-danger btn-sm">

										Delete </a></td>

							</tr>

						</c:forEach>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</body>
</html>