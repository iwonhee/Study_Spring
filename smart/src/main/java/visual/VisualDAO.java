package visual;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class VisualDAO implements VIsualService {
	@Autowired @Qualifier("hr") SqlSession sql;
	
	@Override
	public List<HashMap<String, Object>> department() {
		return sql.selectList("visual.department");
	}

	@Override
	public List<HashMap<String, Object>> hirement_year() {
		return sql.selectList("visual.year");
	}

	@Override
	public List<HashMap<String, Object>> hirement_month() {
		return sql.selectList("visual.month");
	}

	@Override
	public List<HashMap<String, Object>> hirement_top3_month() {
		return sql.selectList("visual.top3_month");
	}

	@Override
	public List<HashMap<String, Object>> hirement_top3_year() {
		return sql.selectList("visual.top3_year");
	}

}
