<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Registration</title>

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
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	width: 650px;
	border-radius: 15px;
	box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
}

.card-header {
	text-align: center;
	font-size: 28px;
	font-weight: bold;
	background: #0d6efd;
	color: white;
	padding: 20px;
}

.form-label {
	font-weight: bold;
}

.btn {
	width: 100%;
}
</style>

</head>

<body>

	<div class="card">

		<div class="card-header">
			<i class="bi bi-person-plus-fill"></i> Student Registration
		</div>

		<div class="card-body">

			<form:form action="${pageContext.request.contextPath}/save"
				method="post" modelAttribute="student">

				<div class="mb-3">
					<label class="form-label">Student Name</label>

					<form:input path="name" cssClass="form-control"
						placeholder="Enter Student Name" />
				</div>

				<div class="mb-3">
					<label class="form-label">Email Address</label>

					<form:input path="email" type="email" cssClass="form-control"
						placeholder="Enter Email" />
				</div>

				<div class="mb-3">

					<label class="form-label">Gender</label>

					<div class="form-check">

						<form:radiobutton path="gender" value="Male"
							cssClass="form-check-input" />

						<label class="form-check-label"> Male </label>

					</div>

					<div class="form-check">

						<form:radiobutton path="gender" value="Female"
							cssClass="form-check-input" />

						<label class="form-check-label"> Female </label>

					</div>

				</div>

				<div class="mb-3">

					<label class="form-label">Course</label>

					<form:select path="course" cssClass="form-select">

						<form:option value="">
							-- Select Course --
						</form:option>

						<form:options items="${courses}" />

					</form:select>

				</div>

				<div class="mb-3">

					<label class="form-label">Preferred Timing</label>

					<form:select path="timing" cssClass="form-select">

						<form:option value="">
							-- Select Timing --
						</form:option>

						<form:options items="${timings}" />

					</form:select>

				</div>

				<div class="d-grid">

					<button type="submit" class="btn btn-success btn-lg">

						<i class="bi bi-check-circle-fill"></i> Register Student

					</button>

				</div>

			</form:form>

		</div>

	</div>

</body>

</html>