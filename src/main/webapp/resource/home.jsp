<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">

</head>

<body>

	<div class="overlay">

		<div class="card-box">

			<h1>Welcome To Samir Web Portal</h1>

			<form action="HomeServlet" method="get">

				<button type="submit" name="action" value="Registration"
					class="btn btn-success btn-lg">Registration</button>

				<button type="submit" name="action" value="Display"
					class="btn btn-primary btn-lg">Display</button>

			</form>

		</div>

	</div>

</body>

</html>