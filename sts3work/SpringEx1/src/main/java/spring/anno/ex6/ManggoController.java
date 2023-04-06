package spring.anno.ex6;

import javax.annotation.Resource;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ManggoController {

	//@Autowired    //인터페이스 Manggo를 구현한 클래스가 pmango 한개일때는 자동주입이 되는데 
	//만약 구현한 클래스가 여러개가 있을 경우에는 자동주입에 문제가 발생한다
	//정확한 bean의 이름으로 주입하려면 @Resource(name="정확한 이름");
	
	//@Resource(name="pmanggo")
	@Resource(name="taiwanManggo")
	Manggo manggo;
	
	public void writeManggo() {
		
		System.out.println("내가 좋아하는 망고는 ***");
		manggo.writeManggoName();
	}
}
