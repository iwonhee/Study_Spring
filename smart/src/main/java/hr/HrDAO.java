package hr;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HrDAO implements HrService {
//	@Autowired private SqlSession sql;
	private SqlSession sql;
	public HrDAO(@Qualifier("hr") SqlSession sql) {
		this.sql = sql;
	}
	

	@Override
	public void employee_insert(EmpVO vo) {
		sql.insert("hr.insert", vo);
	}

	@Override
	public List<EmpVO> employee_list() {
		return sql.selectList("hr.list");
	}

	@Override
	public EmpVO employee_info(int employee_id) {
		return sql.selectOne("hr.info", employee_id);
	}

	@Override
	public void employee_update(EmpVO vo) {
		sql.update("hr.update", vo);
	}

	@Override
	public void employee_delete(int employee_id) {
		sql.delete("hr.delete", employee_id);
	}


	@Override
	public List<DeptVO> dept_list() {
		return sql.selectList("hr.dept_list");
	}


	@Override
	public List<JobVO> jobs_list() {
		return sql.selectList("hr.jobs_list");
	}

}
