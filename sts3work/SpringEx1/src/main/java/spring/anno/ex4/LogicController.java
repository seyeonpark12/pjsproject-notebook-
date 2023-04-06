package spring.anno.ex4;

import javax.annotation.Resource;


import org.springframework.stereotype.Component;

@Component    //logicController �̸����� �ڵ����   @Component("name")�� �־�ȴ�
public class LogicController {

	//@Autowired
	@Resource(name="myDao")   //��Ȯ�� ���� ���̵�� ����_��ȣ���� ������ ���
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
