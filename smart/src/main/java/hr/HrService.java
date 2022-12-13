package hr;

import java.util.List;

public interface HrService {
	//CRUD
	void employee_insert(EmpVO vo);
	List<EmpVO> employee_list();
	EmpVO employee_info(int employee_id);
	void employee_update(EmpVO vo);
	void employee_delete(int employee_id);
	
	List<DeptVO> dept_list(); //전체 부서목록 조회
	List<JobVO> jobs_list(); //전체 업무목록 조회
}
