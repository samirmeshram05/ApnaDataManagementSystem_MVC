<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Student</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #667eea, #764ba2);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: Arial, Helvetica, sans-serif;
}

.card {
	width: 700px;
	border: none;
	border-radius: 18px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .3);
	overflow: hidden;
}

.card-header {
	background: #ffc107;
	color: #212529;
	padding: 22px;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
}

.form-label {
	font-weight: bold;
}

.btn {
	border-radius: 10px;
	font-weight: bold;
}

.back-btn {
	text-decoration: none;
}
</style>

</head>

<body>

	<div class="card">

		<div class="card-header">

			<i class="bi bi-pencil-square"></i> Update Student Details

		</div>

		<div class="card-body">

			<form:form action="${pageContext.request.contextPath}/updateStudent"
				method="post" modelAttribute="student">

				<!-- Hidden Student ID -->

				<form:hidden path="sid" />

				<div class="mb-3">

					<label class="form-label"> Student Name </label>

					<form:input path="name" cssClass="form-control"
						placeholder="Enter Student Name" />

				</div>

				<div class="mb-3">

					<label class="form-label"> Email Address </label>

					<form:input path="email" type="email" cssClass="form-control"
						placeholder="Enter Email" />

				</div>

				<div class="mb-3">

					<label class="form-label"> Gender </label>

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

					<label class="form-label"> Course </label>

					<form:select path="course" cssClass="form-select">

						<form:option value="">

						-- Select Course --

					</form:option>

						<form:options items="${courses}" />

					</form:select>

				</div>

				<div class="mb-4">

					<label class="form-label"> Preferred Timing </label>

					<form:select path="timing" cssClass="form-select">

						<form:option value="">

						-- Select Timing --

					</form:option>

						<form:options items="${timings}" />

					</form:select>

				</div>

				<div class="row">

					<div class="col-md-6 d-grid">

						<button type="submit" class="btn btn-warning btn-lg">

							<i class="bi bi-arrow-repeat"></i> Update Student

						</button>

					</div>

					<div class="col-md-6 d-grid">

						<a href="${pageContext.request.contextPath}/display"
							class="btn btn-secondary btn-lg back-btn"> <i
							class="bi bi-arrow-left-circle"></i> Back

						</a>

					</div>

				</div>

			</form:form>

		</div>

	</div>

</body>
</html>