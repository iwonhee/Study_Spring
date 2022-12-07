package customer;

import java.util.List;

import org.springframework.stereotype.Service;

//@Component
@Service
public class CustomerServiceImpl implements CustomerService {
//	@Autowired 
	private CustomerDAO dao;
	public CustomerServiceImpl(CustomerDAO dao) {	//권장(생성자)
		this.dao = dao;
	}
	
	@Override
	public void customer_insert(CustomerVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CustomerVO> customer_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO customer_info(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void customer_update(CustomerVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void customer_delete(int id) {
		// TODO Auto-generated method stub

	}

}
