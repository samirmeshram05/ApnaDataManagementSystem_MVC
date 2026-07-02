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
	padding: 30px;
	font-family: Arial, Helvetica, sans-serif;
}

.card {
	width: 700px;
	border: none;
	border-radius: 18px;
	box-shadow: 0 10px 30px rgba(0,0,0,.35);
}

.card-header {
	background: #0d6efd;
	color: white;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	padding: 18px;
}

.form-label {
	font-weight: bold;
}

.required {
	color: red;
}

.error {
	color: red;
	font-size: 14px;
	font-weight: bold;
}

.btn {
	font-weight: bold;
}
</style>

</head>

<body>

	<div class="card">

		<div class="card-header">

			<i class="bi bi-person-plus-fill"></i>
			Student Registration

		</div>

		<div class="card-body">

			<form:form
				action="${pageContext.request.contextPath}/save"
				method="post"
				modelAttribute="student"
				enctype="multipart/form-data">

				<!-- Profile Photo -->

				<div class="mb-3">

					<label class="form-label">
						Profile Photo
					</label>

					<input
						type="file"
						name="image"
						class="form-control">

				</div>

				<!-- Name -->

				<div class="mb-3">

					<label class="form-label">

						Student Name

						<span class="required">*</span>

					</label>

					<form:input
						path="name"
						cssClass="form-control"
						placeholder="Enter Student Name"/>

					<form:errors
						path="name"
						cssClass="error"/>

				</div>

				<!-- Email -->

				<div class="mb-3">

					<label class="form-label">

						Email Address

						<span class="required">*</span>

					</label>

					<form:input
						path="email"
						type="email"
						cssClass="form-control"
						placeholder="Enter Email"/>

					<form:errors
						path="email"
						cssClass="error"/>

				</div>

				<!-- Gender -->

				<div class="mb-3">

					<label class="form-label">

						Gender

						<span class="required">*</span>

					</label>

					<div class="form-check">

						<form:radiobutton
							path="gender"
							value="Male"
							cssClass="form-check-input"/>

						<label class="form-check-label">
							Male
						</label>

					</div>

					<div class="form-check">

						<form:radiobutton
							path="gender"
							value="Female"
							cssClass="form-check-input"/>

						<label class="form-check-label">
							Female
						</label>

					</div>

					<form:errors
						path="gender"
						cssClass="error"/>

				</div>

				<!-- Course -->

				<div class="mb-3">

					<label class="form-label">

						Course

						<span class="required">*</span>

					</label>

					<form:select
						path="course"
						cssClass="form-select">

						<form:option value="">
							-- Select Course --
						</form:option>

						<form:options items="${courses}"/>

					</form:select>

					<form:errors
						path="course"
						cssClass="error"/>

				</div>

				<!-- Timing -->

				<div class="mb-4">

					<label class="form-label">

						Preferred Timing

						<span class="required">*</span>

					</label>

					<form:select
						path="timing"
						cssClass="form-select">

						<form:option value="">
							-- Select Timing --
						</form:option>

						<form:options items="${timings}"/>

					</form:select>

					<form:errors
						path="timing"
						cssClass="error"/>

				</div>

				<!-- Buttons -->

				<div class="row">

					<div class="col-md-4 d-grid">

						<button
							type="submit"
							class="btn btn-success">

							<i class="bi bi-check-circle-fill"></i>

							Register

						</button>

					</div>

					<div class="col-md-4 d-grid">

						<button
							type="reset"
							class="btn btn-warning">

							<i class="bi bi-arrow-clockwise"></i>

							Reset

						</button>

					</div>

					<div class="col-md-4 d-grid">

						<a
							href="${pageContext.request.contextPath}/"
							class="btn btn-secondary">

							<i class="bi bi-house-fill"></i>

							Home

						</a>

					</div>

				</div>

			</form:form>

		</div>

	</div>

</body>

</html>