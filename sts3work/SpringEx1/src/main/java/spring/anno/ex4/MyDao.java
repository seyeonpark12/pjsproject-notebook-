package spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component   //�ڵ����� �� ���(id�� Ŭ������, ù���ڸ� �ҹ��ڷ� ���(myDao))
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
	
		System.out.println(str+"_����Ÿ�� db�� �߰�����!!!");
	}

	@Override
	public void deleteData(String num) {

		System.out.println(num+"_�� �ش��ϴ� ����Ÿ ���� ����!!!");
	}

}
