package in.sam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sam.entity.Student;
import in.sam.service.StdService;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	private StdService service;

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
	public String registration(@Valid @ModelAttribute("student") Student std, BindingResult result, Model model) {
		if (result.hasErrors()) {
			System.out.println("Error Occur in Save block While filling Filds....");
			return "registration";
		}
		service.stdsave(std);

		return "redirect:/display";
	}

	// Display Students
	@GetMapping("/display")
	public String displaystd(Model model) {

		model.addAttribute("students", service.stdFindAll());

		return "display";
	}

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
	public String searchStudent(@RequestParam("keyword") String keyword,
	                            Model model) {

	    List<Student> students = service.searchStudent(keyword);

	    model.addAttribute("students", students);

	    return "display";
	}
}