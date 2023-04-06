package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		LogicController logic1=(LogicController)app.getBean("logicController");
		
		logic1.insert("Happy Friday");
		logic1.delete("3");
	}
}
