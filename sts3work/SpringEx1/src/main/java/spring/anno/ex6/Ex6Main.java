package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		//Manggo manggo=(PhilipinManggo)app.getBean("pmanggo");
		Manggo manggo=(TaiwanManggo)app.getBean("taiwanManggo");
		manggo.writeManggoName();
		
		ManggoController mcon=(ManggoController)app.getBean("manggoController");
		mcon.writeManggo();

	}

}
