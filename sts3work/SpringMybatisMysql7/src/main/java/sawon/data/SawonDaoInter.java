package sawon.data;

import java.util.List;
import java.util.Map;

public interface SawonDaoInter {

	public int getTotalCount();
	public void insert(SawonDto dto);
	public List<SawonDto> getAllDatas();
	public SawonDto getData(String num);
	public void update(SawonDto dto);
	public void delete(String num);
	public List<SawonDto> getDatasTitle(Map<String, String> map);
}
