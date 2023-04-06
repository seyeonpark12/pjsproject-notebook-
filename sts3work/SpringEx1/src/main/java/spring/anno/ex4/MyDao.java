package spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component   //자동으로 빈에 등록(id는 클래스명, 첫글자만 소문자로 등록(myDao))
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
	
		System.out.println(str+"_데이타를 db에 추가성공!!!");
	}

	@Override
	public void deleteData(String num) {

		System.out.println(num+"_에 해당하는 데이타 삭제 성공!!!");
	}

}
