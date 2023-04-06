package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.SawonDto;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String sawonform() {
		
		return "sawonform";
	}
	
	@PostMapping("read1")
	public ModelAndView read1(@ModelAttribute SawonDto dto) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto", dto);
		mview.setViewName("sawonresult");
		
		return mview;
	}
}
