package spring.upload.dragon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/")
	public String menu() {
		
		return "form/menu";
	}
	

}
