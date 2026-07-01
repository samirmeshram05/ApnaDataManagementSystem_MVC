<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Samir Apna Database Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	padding: 0;
	height: 100vh;
	background: linear-gradient(135deg, #4facfe, #00f2fe);
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: Arial, Helvetica, sans-serif;
}

.card {
	width: 550px;
	border: none;
	border-radius: 20px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
	overflow: hidden;
}

.card-header {
	background: #0d6efd;
	color: white;
	padding: 25px;
	text-align: center;
}

.card-header h1 {
	margin: 0;
	font-weight: bold;
}

.card-body {
	padding: 40px;
}

.btn {
	width: 220px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 10px;
	padding: 12px;
	transition: 0.3s;
}

.btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
}

.footer {
	margin-top: 25px;
	color: gray;
	font-size: 14px;
}
</style>

</head>

<body>

	<div class="card">

		<div class="card-header">

			<h1>
				<i class="bi bi-mortarboard-fill"></i> Samir Apna Database Management
			</h1>

		</div>

		<div class="card-body text-center">

			<h3 class="mb-4 text-primary">
				Student Management System
			</h3>

			<p class="text-muted mb-4">Manage student records efficiently using
				Spring MVC & Bootstrap.</p>

			<div class="d-grid gap-3">

				<a href="${pageContext.request.contextPath}/registration"
					class="btn btn-success">

					<i class="bi bi-person-plus-fill"></i>
					Register Student

				</a>

				<a href="${pageContext.request.contextPath}/display"
					class="btn btn-primary">

					<i class="bi bi-table"></i>
					View Students

				</a>

			</div>

			<div class="footer">
				© 2026 Samir Apna Database Management | Developed by <strong>Samir Meshram</strong>
			</div>

		</div>

	</div>

</body>
</html>