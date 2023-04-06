package spring.mvc.json;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController    //json�����̹Ƿ� �Ϲݸ޼��� �ȵ�
public class JsonText2Controller {

	@GetMapping("list2")
	public List<PhotoDto> list2(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("�帲", "�帲.jpg"));
		list.add(new PhotoDto("�εδ��� ���ļ��� ���", "�δٴ���%20���ļ���%20���.jpg"));
		list.add(new PhotoDto("�� �۽�Ʈ ������ũ", "��%20�۽�Ʈ%20������ũ.jpeg"));
		list.add(new PhotoDto("��󷣵�", "��󷣵�.jpg"));
		list.add(new PhotoDto("��Ű", "��Ű.jpeg"));
		
		return list;
		
		
	} 
	
	@GetMapping("list3")
	public List<PhotoDto> list3(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		
		list.add(new PhotoDto("�帲", "�帲.jpg"));
		list.add(new PhotoDto("�εδ��� ���ļ��� ���", "�δٴ���%20���ļ���%20���.jpg"));
		list.add(new PhotoDto("�� �۽�Ʈ ������ũ", "��%20�۽�Ʈ%20������ũ.jpeg"));
		list.add(new PhotoDto("��󷣵�", "��󷣵�.jpg"));
		list.add(new PhotoDto("��Ű", "��Ű.jpeg"));
		
		return list;
		
		
	} 
	
}
