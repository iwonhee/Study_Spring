package hr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("hr")
public class HrServiceImpl implements HrService {
	@Autowired private HrDAO dao;
	
	@Override
	public void employee_insert(EmpVO vo) {
		dao.employee_insert(vo);
	}

	@Override
	public List<EmpVO> employee_list() {
		return dao.employee_list();
	}

	@Override
	public EmpVO employee_info(int employee_id) {
		return dao.employee_info(employee_id);
	}

	@Override
	public void employee_update(EmpVO vo) {
		dao.employee_update(vo);
	}

	@Override
	public void employee_delete(int employee_id) {
		dao.employee_delete(employee_id);
	}

	@Override
	public List<DeptVO> dept_list() {
		return dao.dept_list();
	}

	@Override
	public List<JobVO> jobs_list() {
		return dao.jobs_list();
	}

	

}
