package visual;

import java.util.HashMap;
import java.util.List;

public interface VIsualService {
	
	List<HashMap<String, Object>> department();      //부서별 사원수 조회
	List<HashMap<String, Object>> hirement_year();   //채용인원수(연도별) 조회
	List<HashMap<String, Object>> hirement_month();  //채용인원수(월별) 조회
	List<HashMap<String, Object>> hirement_top3_month();  //채용인원수(월별) 조회
	List<HashMap<String, Object>> hirement_top3_year();  //채용인원수(월별) 조회
	
}
