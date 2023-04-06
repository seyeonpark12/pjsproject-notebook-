package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class CarMemberDao {

	@Autowired
	private SqlSession session;
	
	//총갯수
	public int getTotalCount() {
		
		return session.selectOne("carmember.getTotalCount");
	}
	
	//전체데이타
	public List<CarMemberDto> getAllDatas(){
		
		return session.selectList("carmember.getAllDatas");
	}
	
	//insert
	public void insert(CarMemberDto dto) {
		
		session.insert("carmember.insert",dto );  //id,파라메터
	}
	
	//delete
	public void delete(String num) {
		
		session.delete("carmember.delete",num);
	}
	
	//수정값 받아오기
	public CarMemberDto getData(String num) {
		
		return session.selectOne("carmember.getOneData", num);
	}
	
	public void update(CarMemberDto dto) {
		
		session.update("carmember.update",dto);
	}
	
}
