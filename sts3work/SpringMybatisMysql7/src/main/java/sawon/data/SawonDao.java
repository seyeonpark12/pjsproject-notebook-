package sawon.data;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SawonDao implements SawonDaoInter {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("sawon.getTotalCount");
	}
	
	@Override
	public void insert(SawonDto dto) {
		// TODO Auto-generated method stub
		session.insert("sawon.insert", dto);
	}
	
	@Override
	public List<SawonDto> getAllDatas() {
		// TODO Auto-generated method stub
		return session.selectList("sawon.getAllDatas");
	}

	@Override
	public SawonDto getData(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("sawon.getData", num);
	}
	
	@Override
	public void update(SawonDto dto) {
		// TODO Auto-generated method stub
		session.update("sawon.update", dto);
	}
	
	@Override
	public void delete(String num) {
		// TODO Auto-generated method stub
		session.delete("sawon.delete",num);
		}

	@Override
	public List<SawonDto> getDatasTitle(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList("sawon.getDatasTitle", map);
	}
}
