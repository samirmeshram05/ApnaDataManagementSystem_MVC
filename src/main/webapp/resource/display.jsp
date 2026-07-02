<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Management System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #4facfe, #00f2fe);
	min-height: 100vh;
	padding: 35px;
	font-family: Arial, Helvetica, sans-serif;
}

.card {
	border: none;
	border-radius: 20px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .25);
	overflow: hidden;
}

.card-header {
	background: linear-gradient(90deg, #0d6efd, #6610f2);
	color: white;
	padding: 20px;
}

.table th {
	text-align: center;
	vertical-align: middle;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

.table tbody tr:hover {
	background: #eef7ff;
	transform: scale(1.01);
	transition: .3s;
}

.btn {
	border-radius: 10px;
	font-weight: bold;
}

.search-box input {
	border-radius: 8px 0 0 8px;
}

.search-box button {
	border-radius: 0 8px 8px 0;
}

.badge {
	font-size: 16px;
}

.profile {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid #0d6efd;
}
</style>

</head>

<body>

	<div class="container-fluid">

		<div class="card">

			<div class="card-header">

				<div class="row align-items-center">

					<div class="col-md-3">

						<h2>
							<i class="bi bi-mortarboard-fill"></i> Student Dashboard
						</h2>

					</div>

					<div class="col-md-4">

						<form action="${pageContext.request.contextPath}/search"
							method="get">

							<div class="input-group search-box">

								<input type="text" class="form-control" name="keyword"
									placeholder="Search Name, Email or Course">

								<button class="btn btn-warning">

									<i class="bi bi-search"></i>

								</button>

							</div>

						</form>

					</div>

					<div class="col-md-5 text-end">

						<a href="${pageContext.request.contextPath}/registration"
							class="btn btn-success"> <i class="bi bi-person-plus-fill"></i>

							Add Student

						</a> <a href="${pageContext.request.contextPath}/display"
							class="btn btn-info text-white"> <i
							class="bi bi-arrow-clockwise"></i> Refresh

						</a> <a href="${pageContext.request.contextPath}/"
							class="btn btn-secondary"> <i class="bi bi-house-door-fill"></i>

							Home

						</a>

					</div>

				</div>

			</div>

			<div class="card-body">

				<div class="row mb-4">

					<div class="col-md-6">

						<h4>

							<i class="bi bi-people-fill text-primary"></i> Total Students <span
								class="badge bg-success"> ${students.size()} </span>

						</h4>

					</div>

					<div class="col-md-6 text-end">

						<button class="btn btn-outline-danger">

							<i class="bi bi-file-earmark-pdf-fill"></i> PDF

						</button>

						<a href="${pageContext.request.contextPath}/export/excel"
							class="btn btn-outline-success"> <i
							class="bi bi-file-earmark-excel-fill"></i> Export Excel

						</a>

					</div>

				</div>

				<div class="row mb-3">

					<div class="col-md-6">

						<strong>Sort By :</strong> <a
							href="display?page=0&sortField=sid&sortDir=${reverseSortDir}"
							class="btn btn-outline-primary btn-sm"> ID </a> <a
							href="display?page=0&sortField=name&sortDir=${reverseSortDir}"
							class="btn btn-outline-success btn-sm"> Name </a> <a
							href="display?page=0&sortField=course&sortDir=${reverseSortDir}"
							class="btn btn-outline-warning btn-sm"> Course </a>

					</div>

				</div>

				<div class="table-responsive">

					<table class="table table-bordered table-hover table-striped">

						<thead class="table-dark">

							<tr>

								<th>Photo</th>
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

							<c:choose>

								<c:when test="${not empty students}">

									<c:forEach var="std" items="${students}">

										<tr>

											<td><c:choose>

													<c:when test="${not empty std.photo}">

														<img
															src="${pageContext.request.contextPath}/images/${std.photo}"
															class="profile">

													</c:when>

													<c:otherwise>

														<img
															src="${pageContext.request.contextPath}/images/default.png"
															class="profile">

													</c:otherwise>

												</c:choose></td>

											<td>${std.sid}</td>

											<td>${std.name}</td>

											<td>${std.email}</td>

											<td><c:choose>

													<c:when test="${std.gender=='Male'}">

														<span class="badge bg-primary"> Male </span>

													</c:when>

													<c:otherwise>

														<span class="badge bg-danger"> Female </span>

													</c:otherwise>

												</c:choose></td>

											<td>${std.course}</td>

											<td>${std.timing}</td>

											<td><a
												href="${pageContext.request.contextPath}/update?id=${std.sid}"
												class="btn btn-warning btn-sm"> <i
													class="bi bi-pencil-square"></i>

											</a> <a
												href="${pageContext.request.contextPath}/delete?id=${std.sid}"
												class="btn btn-danger btn-sm"
												onclick="return confirm('Delete this student?');"> <i
													class="bi bi-trash-fill"></i>

											</a></td>

										</tr>

									</c:forEach>

								</c:when>

								<c:otherwise>

									<tr>

										<td colspan="8">

											<h4 class="text-danger">

												<i class="bi bi-exclamation-circle-fill"></i> No Student
												Records Found

											</h4>

										</td>

									</tr>

								</c:otherwise>

							</c:choose>

						</tbody>

					</table>

				</div>

				<nav>

					<ul class="pagination justify-content-center">

						<c:if test="${currentPage>0}">

							<li class="page-item"><a class="page-link"
								href="display?page=${currentPage-1}&sortField=${sortField}&sortDir=${sortDir}">

									Previous </a></li>

						</c:if>

						<c:forEach begin="0" end="${totalPages-1}" var="i">

							<li class="page-item ${i==currentPage?'active':''}"><a
								class="page-link"
								href="display?page=${i}&sortField=${sortField}&sortDir=${sortDir}">

									${i+1} </a></li>

						</c:forEach>

						<c:if test="${currentPage<totalPages-1}">

							<li class="page-item"><a class="page-link"
								href="display?page=${currentPage+1}&sortField=${sortField}&sortDir=${sortDir}">

									Next </a></li>

						</c:if>

					</ul>

				</nav>

			</div>

			<div class="card-footer text-center">

				<b> Student Management System | Spring Boot MVC | Developed by
					Samir Sindhimeshram </b>

			</div>

		</div>

	</div>

</body>
</html>