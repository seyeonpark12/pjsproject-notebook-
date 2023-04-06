package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class CarMemberDao {

	@Autowired
	private SqlSession session;
	
	//�Ѱ���
	public int getTotalCount() {
		
		return session.selectOne("carmember.getTotalCount");
	}
	
	//��ü����Ÿ
	public List<CarMemberDto> getAllDatas(){
		
		return session.selectList("carmember.getAllDatas");
	}
	
	//insert
	public void insert(CarMemberDto dto) {
		
		session.insert("carmember.insert",dto );  //id,�Ķ����
	}
	
	//delete
	public void delete(String num) {
		
		session.delete("carmember.delete",num);
	}
	
	//������ �޾ƿ���
	public CarMemberDto getData(String num) {
		
		return session.selectOne("carmember.getOneData", num);
	}
	
	public void update(CarMemberDto dto) {
		
		session.update("carmember.update",dto);
	}
	
}
