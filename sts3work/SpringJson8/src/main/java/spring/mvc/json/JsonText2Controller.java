package spring.mvc.json;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController    //json전용이므로 일반메서드 안됨
public class JsonText2Controller {

	@GetMapping("list2")
	public List<PhotoDto> list2(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("드림", "드림.jpg"));
		list.add(new PhotoDto("두두다쿵 후후섬의 비밀", "두다다쿵%20후후섬의%20비밀.jpg"));
		list.add(new PhotoDto("더 퍼스트 슬램덩크", "더%20퍼스트%20슬램덩크.jpeg"));
		list.add(new PhotoDto("라라랜드", "라라랜드.jpg"));
		list.add(new PhotoDto("럭키", "럭키.jpeg"));
		
		return list;
		
		
	} 
	
	@GetMapping("list3")
	public List<PhotoDto> list3(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		
		list.add(new PhotoDto("드림", "드림.jpg"));
		list.add(new PhotoDto("두두다쿵 후후섬의 비밀", "두다다쿵%20후후섬의%20비밀.jpg"));
		list.add(new PhotoDto("더 퍼스트 슬램덩크", "더%20퍼스트%20슬램덩크.jpeg"));
		list.add(new PhotoDto("라라랜드", "라라랜드.jpg"));
		list.add(new PhotoDto("럭키", "럭키.jpeg"));
		
		return list;
		
		
	} 
	
}
