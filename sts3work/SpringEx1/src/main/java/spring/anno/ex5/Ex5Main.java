package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		MySqlController mysql=(MySqlController)app.getBean("mysql");
		
		mysql.insert("������");
		mysql.select("������");
		mysql.delete("1");

	}

}
