package spring.anno.ex4;

import javax.annotation.Resource;


import org.springframework.stereotype.Component;

@Component    //logicController 이름으로 자동등록   @Component("name")을 주어도된다
public class LogicController {

	//@Autowired
	@Resource(name="myDao")   //정확한 빈의 아이디로 주입_모호성이 잇을때 사용
	DaoInter daoInter;
	
	
	public LogicController(MyDao dao) {

		this.daoInter=dao;
	}
	
	//insert
	public void insert(String str) {
		
		daoInter.insertData(str);
	}
	
	public void delete(String num) {
		
		daoInter.deleteData(num);
	}
}
