package in.sam.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lowagie.text.DocumentException;

import in.sam.entity.Student;
import in.sam.service.EmailService;
import in.sam.service.StdService;
import in.sam.util.StudentExcelExporter;
import in.sam.util.StudentPdfExporter;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	private StdService service;

	@Autowired
	private EmailService emailService;

	// Common data for Registration & Update pages
	@ModelAttribute
	public void loadCommonData(Model model) {

		model.addAttribute("courses", List.of("Java", "Python", "React", "DevOps", "MERN"));

		model.addAttribute("timings", List.of("Morning", "Afternoon", "Evening"));
	}

	// Home Page
	@GetMapping("/")
	public String home() {
		return "home";
	}

	// Registration Form
	@GetMapping("/registration")
	public String loadForm(Model model) {

		model.addAttribute("student", new Student());

		return "registration";
	}

	// Save Student
	@PostMapping("/save")
	public String registration(@Valid @ModelAttribute("student") Student std, BindingResult result, Model model,
			@RequestParam("image") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {

		if (result.hasErrors()) {
			return "registration";
		}

		// Upload Image
		if (!file.isEmpty()) {

			String fileName = file.getOriginalFilename();

			String uploadDir = "src/main/resources/static/images/";

			Files.createDirectories(Paths.get(uploadDir));

			Path path = Paths.get(uploadDir, fileName);

			Files.write(path, file.getBytes());

			std.setPhoto(fileName);
		}

		// Save Student
		service.stdsave(std);

		// ================= Send Email =================

		String subject = "🎉 Welcome to Student Management System";

		String body = """
		<!DOCTYPE html>
		<html>

		<head>

		<style>

		body{

		background:#f4f7fb;

		font-family:Arial,Helvetica,sans-serif;

		margin:0;

		padding:40px;

		}

		.card{

		width:650px;

		margin:auto;

		background:#ffffff;

		border-radius:15px;

		overflow:hidden;

		box-shadow:0 10px 30px rgba(0,0,0,.25);

		}

		.header{

		background:linear-gradient(90deg,#0d6efd,#6610f2);

		padding:25px;

		text-align:center;

		color:white;

		font-size:28px;

		font-weight:bold;

		}

		.content{

		padding:35px;

		}

		.content h2{

		color:#198754;

		text-align:center;

		}

		table{

		width:100%%;

		border-collapse:collapse;

		margin-top:25px;

		}

		table td{

		padding:12px;

		border:1px solid #ddd;

		}

		.label{

		background:#f8f9fa;

		font-weight:bold;

		width:180px;

		}

		.button{

		display:inline-block;

		padding:12px 30px;

		background:#198754;

		color:white!important;

		text-decoration:none;

		border-radius:8px;

		font-size:18px;

		margin-top:25px;

		}

		.footer{

		background:#f8f9fa;

		padding:20px;

		text-align:center;

		color:#666;

		font-size:14px;

		}

		</style>

		</head>

		<body>

		<div class="card">

		<div class="header">

		🎓 Student Management System

		</div>

		<div class="content">

		<h2>Registration Successful 🎉</h2>

		<p>Hello <b>%s</b>,</p>

		<p>

		Congratulations!

		Your registration has been completed successfully.

		</p>

		<table>

		<tr>

		<td class="label">Student Name</td>

		<td>%s</td>

		</tr>

		<tr>

		<td class="label">Email</td>

		<td>%s</td>

		</tr>

		<tr>

		<td class="label">Course</td>

		<td>%s</td>

		</tr>

		<tr>

		<td class="label">Timing</td>

		<td>%s</td>

		</tr>

		</table>

		<div style="text-align:center;">

		<a class="button" href="https://github.com">

		Visit Portal

		</a>

		</div>

		</div>

		<div class="footer">

		<b>Samir Student Management System</b>

		<br><br>

		Thank you for registering with us.

		<br><br>

		This is an automatically generated email.

		</div>

		</div>

		</body>

		</html>
		"""
		.formatted(
		        std.getName(),
		        std.getName(),
		        std.getEmail(),
		        std.getCourse(),
		        std.getTiming());

		emailService.sendMail(std.getEmail(), subject, body);
		
		// ==============================================

		redirectAttributes.addFlashAttribute("success",
				"🎉 Student Registered Successfully! Welcome email has been sent.");
		return "redirect:/display";
	}

	/*
	 * // Display Students
	 * 
	 * @GetMapping("/display") public String displaystd(Model model) {
	 * 
	 * model.addAttribute("students", service.stdFindAll());
	 * 
	 * return "display"; }
	 */

	// Load Update Form
	@GetMapping("/update")
	public String edit(@RequestParam("id") Integer id, Model model) {

		Student student = service.stdFindID(id);

		model.addAttribute("student", student);

		return "update";
	}

	// Update Student
	@PostMapping("/updateStudent")
	public String update(@ModelAttribute("student") Student std) {

		service.stdupdate(std);

		return "redirect:/display";
	}

	// Delete Student
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Integer id) {

		service.stdDelete(id);

		return "redirect:/display";
	}

	@GetMapping("/search")
	public String searchStudent(@RequestParam("keyword") String keyword, Model model) {

		List<Student> students = service.searchStudent(keyword);

		model.addAttribute("students", students);

		return "display";
	}

	@GetMapping("/display")
	public String displayStudents(

			@RequestParam(defaultValue = "0") int page,

			@RequestParam(defaultValue = "sid") String sortField,

			@RequestParam(defaultValue = "asc") String sortDir,

			Model model) {

		Page<Student> studentPage = service.getStudents(page, sortField, sortDir);

		model.addAttribute("students", studentPage.getContent());

		model.addAttribute("currentPage", page);

		model.addAttribute("totalPages", studentPage.getTotalPages());

		model.addAttribute("sortField", sortField);

		model.addAttribute("sortDir", sortDir);

		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

		return "display";
	}

	@GetMapping("/export/excel")
	public void exportExcel(HttpServletResponse response) throws IOException {

		response.setContentType("application/octet-stream");

		String headerKey = "Content-Disposition";

		String headerValue = "attachment; filename=students.xlsx";

		response.setHeader(headerKey, headerValue);

		List<Student> listStudents = service.stdFindAll();

		StudentExcelExporter excelExporter = new StudentExcelExporter(listStudents);

		excelExporter.export(response);
	}

	@GetMapping("/export/pdf")
	public void exportPdf(HttpServletResponse response) throws DocumentException, IOException {

		response.setContentType("application/pdf");

		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");

		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";

		String headerValue = "attachment; filename=students_" + currentDateTime + ".pdf";

		response.setHeader(headerKey, headerValue);

		List<Student> students = service.stdFindAll();

		StudentPdfExporter exporter = new StudentPdfExporter(students);

		exporter.export(response);
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {

	    model.addAttribute("totalStudents", service.getTotalStudents());

	    model.addAttribute("maleStudents", service.getMaleStudents());

	    model.addAttribute("femaleStudents", service.getFemaleStudents());

	    model.addAttribute("javaStudents", service.getCourseCount("Java"));

	    model.addAttribute("pythonStudents", service.getCourseCount("Python"));

	    model.addAttribute("reactStudents", service.getCourseCount("React"));

	    model.addAttribute("devopsStudents", service.getCourseCount("DevOps"));

	    model.addAttribute("mernStudents", service.getCourseCount("MERN"));

	    model.addAttribute("morningStudents", service.getTimingCount("Morning"));

	    model.addAttribute("afternoonStudents", service.getTimingCount("Afternoon"));

	    model.addAttribute("eveningStudents", service.getTimingCount("Evening"));

	    return "dashboard";
	}
}
