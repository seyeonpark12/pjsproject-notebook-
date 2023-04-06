package spring.mvc.friday;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.servlet.ModelAndView;


@Controller
public class HelloController {

	
	//@RequestMapping(value="/",method = RequestMethod.GET)
	@GetMapping("/")
	public String home(Model model) {
		
		model.addAttribute("msg","HelloController로부터 포워드됨");
		model.addAttribute("today", new Date());
		return "home";
	}
	
	@GetMapping("/apple/list")  //list뒤에 .do .nhn무엇을 붙히던 다호출됨
	public String hello1(Model model) {
		
		//Model:request에 데이타를 저장하기 위한 인터페이스
		//서블릿에서 코딩했던 request.setAttribute와 같다
		
		model.addAttribute("name", "박종수");
		model.addAttribute("addr","서울시 용산구");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView one() {
		
		//ModelAndView는 request에 저장하기위한 model과 포워드하기위한 View를 합친것이다
		ModelAndView mview=new ModelAndView();
		
		//1.request에저장
		mview.addObject("java",88);
		mview.addObject("spring",100);
		
		//2.포워드하기 위한 View
		mview.setViewName("result2");

		return mview;
	}
	
	@GetMapping("/orange/delete")
	public String two(Model model,HttpSession session){
		
		//request에저장
		model.addAttribute("name","박종수");
		
		//session에 저장
		session.setAttribute("myid", "admin");
		
		return "result3";
	}
	
	@GetMapping("/shop/detail")
	public String three() {
		
		return "result4";
	}
	
	@GetMapping("/board/add/data")
	public String four() {
		
		return "result5";
	}
}
