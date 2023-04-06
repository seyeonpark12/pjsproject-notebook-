package spring.db.car;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	
	@GetMapping("samsung/list")
	public String list(Model model) {
		
		//��ü�ټ�
		int totalCount=dao.getTotalCount();
		
		//��� ��������
		List<MyCarDto> list=dao.getAllDatas();
		
		//request�� ����
		model.addAttribute("totalcount",totalCount);
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	@GetMapping("samsung/writeform")
	public String writeform() {
		
		return "car/writeform";
	}
	
	//insert
	@PostMapping("samsung/write")
	public String insert(@ModelAttribute MyCarDto dto) {
		
		dao.insert(dto);
		return "redirect:list";
	}
	
	//���������� ����
	@GetMapping("samsung/updateform")
	public String updatefrom(@RequestParam String num,Model model) {
		
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto",dto);
		
		return "car/updateform";
	}
	
	
	//�����ϱ�
	@PostMapping("samsung/update")
	public String update(@ModelAttribute MyCarDto dto) {
		
		dao.update(dto);
		return "redirect:list";
	}
	
	
	//�����ϱ�
	@GetMapping("samsung/delete")
	public String delete(@RequestParam String num) {
		
		
		dao.delete(num);
		return "redirect:list";
	}
	
	
	
	
}
