package spring.mvc.json;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody  //json처리후 브라우저로 출력 할 수 있음(일반컨트롤러인 경우에만)
	public Map<String, String> list1(){
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "박종수");
		map.put("addr", "서울시 용산구 용산동2가");
		map.put("hp", "010-4847-8613");
		
		
		return map;
	}
	
	
	
	
	
	
	
}
