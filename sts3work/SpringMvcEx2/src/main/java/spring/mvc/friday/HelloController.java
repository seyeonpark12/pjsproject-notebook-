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
		
		model.addAttribute("msg","HelloController�κ��� �������");
		model.addAttribute("today", new Date());
		return "home";
	}
	
	@GetMapping("/apple/list")  //list�ڿ� .do .nhn������ ������ ��ȣ���
	public String hello1(Model model) {
		
		//Model:request�� ����Ÿ�� �����ϱ� ���� �������̽�
		//�������� �ڵ��ߴ� request.setAttribute�� ����
		
		model.addAttribute("name", "������");
		model.addAttribute("addr","����� ��걸");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView one() {
		
		//ModelAndView�� request�� �����ϱ����� model�� �������ϱ����� View�� ��ģ���̴�
		ModelAndView mview=new ModelAndView();
		
		//1.request������
		mview.addObject("java",88);
		mview.addObject("spring",100);
		
		//2.�������ϱ� ���� View
		mview.setViewName("result2");

		return mview;
	}
	
	@GetMapping("/orange/delete")
	public String two(Model model,HttpSession session){
		
		//request������
		model.addAttribute("name","������");
		
		//session�� ����
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
