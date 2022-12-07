package customer;

import java.util.List;

public interface CustomerService {
	//CRUD
	void customer_insert(CustomerVO vo);	//신규고객 저장
	List<CustomerVO> customer_list();		//고객목록 조회
	CustomerVO customer_info(int id);		//선택한 고객정보 조회
 	void customer_update(CustomerVO vo);	//고객정보 수정저장
	void customer_delete(int id);			//고객정보 삭제
}
