package sawon.data;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SawonController {

	@Autowired
	SawonDaoInter dao;
	
	@GetMapping("sawon/list")
	public ModelAndView list(@RequestParam(required = false) String title  ,@RequestParam(required = false) String search) {
		
		ModelAndView model=new ModelAndView();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("title",title);
		map.put("search",search);
		
		//전체개수
		int totalCount=dao.getTotalCount();
		//List<SawonDto> list=dao.getAllDatas();
		List<SawonDto> list=dao.getDatasTitle(map);
		
		model.addObject("totalCount",totalCount);
		model.addObject("list",list);
		
		
		model.setViewName("sawon/sawonlist");
		return model;
	}
	
	@GetMapping("sawon/addform")
	public String addform() {
		
		return "sawon/addform";
	}
	
	@PostMapping("sawon/insert")
	public String insert(@ModelAttribute SawonDto dto,@RequestParam MultipartFile upload,HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);
		
		//dto에 담을변수
		String photoName;
		
		//사진선택을 안했을경우 no
		if(upload.getOriginalFilename().equals("")) {
			
			photoName="no";
		}else {
			
			String fName=upload.getOriginalFilename();
			photoName=fName;
			
			//업로드
			try {
				upload.transferTo(new File(path+"\\"+photoName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto image에 업로드한 photoName 넣어주기
		dto.setImage(photoName);
		
		dao.insert(dto);
		return "redirect:list";
	}
	
	
	@GetMapping("sawon/updateform")
	public String updateform(String num,Model model) {
		
		SawonDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "sawon/updateform";
	}
	
	
	@PostMapping("sawon/update")
	public String update(@ModelAttribute SawonDto dto,@RequestParam MultipartFile upload,HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/WEB-INF/image");
		System.out.println(path);
		
		//dto에 담을변수
		String photoName;
		
		//사진선택을 안했을경우 no
		if(upload.getOriginalFilename().equals("")) {
			
			photoName=null;
		}else {
			
			String fName=upload.getOriginalFilename();
			photoName=fName;
			
			//업로드
			try {
				upload.transferTo(new File(path+"\\"+photoName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto image에 업로드한 photoName 넣어주기
		dto.setImage(photoName);
		
		dao.update(dto);
		return "redirect:list";
	}
	
	@GetMapping("sawon/delete")
	public String delete(String num,HttpSession session) {
		
		String image=dao.getData(num).getImage();
		String path=session.getServletContext().getRealPath("/WEB-INF/image");
		File file = new File(path + "\\" + image);
		if (file.exists()) {
			file.delete();
		}
		
		dao.delete(num);
		return "redirect:list";
	}
	
	
	
	
	
}
