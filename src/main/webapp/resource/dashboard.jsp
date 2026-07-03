<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
	background: #f5f7fb;
	font-family: Arial, Helvetica, sans-serif;
}

.dashboard-title {
	font-size: 34px;
	font-weight: bold;
	margin-bottom: 30px;
}

.card {
	border: none;
	border-radius: 15px;
	transition: .3s;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, .15);
}

.card:hover {
	transform: translateY(-8px);
}

.card i {
	font-size: 40px;
}

.count {
	font-size: 35px;
	font-weight: bold;
}

.chart-card {
	padding: 20px;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<div class="dashboard-title text-center">🎓 Student Management
			Dashboard</div>

		<div class="row g-4">

			<div class="col-md-3">

				<div class="card bg-primary text-white p-4">

					<i class="bi bi-people-fill"></i>

					<h5>Total Students</h5>

					<div class="count">${totalStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-success text-white p-4">

					<i class="bi bi-gender-male"></i>

					<h5>Male</h5>

					<div class="count">${maleStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-danger text-white p-4">

					<i class="bi bi-gender-female"></i>

					<h5>Female</h5>

					<div class="count">${femaleStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-warning text-dark p-4">

					<i class="bi bi-book-fill"></i>

					<h5>Java</h5>

					<div class="count">${javaStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-info text-white p-4">

					<i class="bi bi-filetype-py"></i>

					<h5>Python</h5>

					<div class="count">${pythonStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-secondary text-white p-4">

					<i class="bi bi-code-slash"></i>

					<h5>React</h5>

					<div class="count">${reactStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-dark text-white p-4">

					<i class="bi bi-cloud-fill"></i>

					<h5>DevOps</h5>

					<div class="count">${devopsStudents}</div>

				</div>

			</div>

			<div class="col-md-3">

				<div class="card bg-success text-white p-4">

					<i class="bi bi-laptop-fill"></i>

					<h5>MERN</h5>

					<div class="count">${mernStudents}</div>

				</div>

			</div>

		</div>

		<hr class="my-5">

		<div class="row">

			<div class="col-md-6">

				<div class="card chart-card">

					<h4 class="text-center">Gender Distribution</h4>

					<canvas id="genderChart"></canvas>

				</div>

			</div>

			<div class="col-md-6">

				<div class="card chart-card">

					<h4 class="text-center">Course Distribution</h4>

					<canvas id="courseChart"></canvas>

				</div>

			</div>

		</div>

		<div class="text-center mt-5">

			<a href="${pageContext.request.contextPath}/display"
				class="btn btn-primary btn-lg"> Back to Students </a>

		</div>

	</div>

	<script>

new Chart(document.getElementById('genderChart'),{

type:'pie',

data:{

labels:['Male','Female'],

datasets:[{

data:[${maleStudents},${femaleStudents}]

}]

}

});

new Chart(document.getElementById('courseChart'),{

type:'bar',

data:{

labels:['Java','Python','React','DevOps','MERN'],

datasets:[{

label:'Students',

data:[

${javaStudents},

${pythonStudents},

${reactStudents},

${devopsStudents},

${mernStudents}

]

}]

}

});

</script>

</body>

</html>