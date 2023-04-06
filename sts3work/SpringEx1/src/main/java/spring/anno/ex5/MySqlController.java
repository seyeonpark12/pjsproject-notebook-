package spring.anno.ex5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mysql")
public class MySqlController {
	
	@Autowired
	TestDao testdao;
	
	public void insert(String name) {
		
		testdao.insert(name);
	}
	
	public void select(String name) {
		
		testdao.select(name);
	}
	
	public void delete(String num) {
		
		testdao.delete(num);
	}
	
}
