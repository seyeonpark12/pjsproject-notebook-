package spring.db.car;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	//�Ѱ���
	public int getTotalCount() {
		
		return session.selectOne("mycar.getTotalCount");
	}
	
	//��ü����Ÿ
	public List<MyCarDto> getAllDatas(){
		
		return session.selectList("mycar.getAllDatas");
	}
	
	//insert
	public void insert(MyCarDto dto) {
		
		session.insert("mycar.insert",dto );  //id,�Ķ����
	}
	
	
	//������
	public MyCarDto getData(String num) {
		
		return session.selectOne("mycar.getOneData", num);
	}
	
	//����
	public void update(MyCarDto dto) {
		
		session.update("mycar.update",dto);
	}
	
	public void delete(String num) {
		
		session.delete("mycar.delete",num);
	}
	
	
	
}
