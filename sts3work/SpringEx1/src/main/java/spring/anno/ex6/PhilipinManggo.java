package spring.anno.ex6;

import org.springframework.stereotype.Component;

@Component("pmanggo")
public class PhilipinManggo implements Manggo {

	@Override
	public void writeManggoName() {
		
		System.out.println("�ʸ��� ����");
	}

}
