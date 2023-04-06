package spring.db.car;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	//총갯수
	public int getTotalCount() {
		
		return session.selectOne("mycar.getTotalCount");
	}
	
	//전체데이타
	public List<MyCarDto> getAllDatas(){
		
		return session.selectList("mycar.getAllDatas");
	}
	
	//insert
	public void insert(MyCarDto dto) {
		
		session.insert("mycar.insert",dto );  //id,파라메터
	}
	
	
	//수정폼
	public MyCarDto getData(String num) {
		
		return session.selectOne("mycar.getOneData", num);
	}
	
	//수정
	public void update(MyCarDto dto) {
		
		session.update("mycar.update",dto);
	}
	
	public void delete(String num) {
		
		session.delete("mycar.delete",num);
	}
	
	
	
}
