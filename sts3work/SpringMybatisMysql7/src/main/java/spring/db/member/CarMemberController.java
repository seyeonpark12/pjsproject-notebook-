package spring.db.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CarMemberController {

	@Autowired
	CarMemberDao dao;
	
	@GetMapping("member/memberlist")
	public String memberlist(Model model) {
		
		//전체겟수
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<CarMemberDto> list=dao.getAllDatas();
		
		//request에 저장
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list", list);		
		
		return "carmember/memberlist";
	}
	
	@GetMapping("member/writeform")
	public String writeform() {
		
		return "carmember/writeform";
	}
	
	@PostMapping("member/mwrite")
	public String insert(@ModelAttribute CarMemberDto dto) {
		
		dao.insert(dto);
		return "redirect:memberlist";
	}
	
	@GetMapping("member/delete")
	public String delete(@RequestParam String num) {
		
		dao.delete(num);
		return "redirect:memberlist";
	}
	
	@GetMapping("member/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		CarMemberDto dto=dao.getData(num);
		model.addAttribute("dto",dto);
		return "carmember/updateform";
		
	}
	
	@PostMapping("member/mupdate")
	public String update(@ModelAttribute CarMemberDto dto) {
		
		dao.update(dto);
		return "redirect:memberlist";
	}
	
	
	
}
