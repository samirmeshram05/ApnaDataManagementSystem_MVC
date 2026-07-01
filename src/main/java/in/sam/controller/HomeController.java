package in.sam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import in.sam.entity.Student;
import in.sam.service.StdService;

@Controller
public class HomeController {

	@Autowired
	private StdService service;

	@GetMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping("/registration")
	public String loadForm(Model model) {

	    List<String> courses = List.of(
	            "Java",
	            "Python",
	            "React",
	            "DevOps",
	            "MERN"
	    );

	    List<String> timings = List.of(
	            "Morning",
	            "Afternoon",
	            "Evening"
	    );

	    model.addAttribute("student", new Student());
	    model.addAttribute("courses", courses);
	    model.addAttribute("timings", timings);

	    return "registration";
	}

	@PostMapping("/save")
	public String registration(@ModelAttribute("student") Student std) {

	    service.stdsave(std);

	    return "redirect:/display";
	}

	@GetMapping("/display")
	public String displaystd(Model model) {

		List<Student> students = service.stdFindAll();

		model.addAttribute("students", students);

		return "display";
	}
}