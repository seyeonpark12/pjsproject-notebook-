package spring.mvc.today;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		
		return "index";
	}
	
	@GetMapping("/happy")
	public String happy() {
		
		return "happy";
	}
	
	@GetMapping("/hello")
	public String hello(Model model) {
		model.addAttribute("msg","서버가 왜 문제일까...");
		
		return "hello";
	}
	
	@GetMapping("/nice/hi")
	public String nice(Model model) {
		model.addAttribute("name","박종수");
		model.addAttribute("age","26");
		return "nice";
	}
	
}
