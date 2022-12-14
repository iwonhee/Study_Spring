package customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO implements CustomerService {
//	@Autowired private SqlSession sql;
	private SqlSession sql;
	public CustomerDAO(@Qualifier("hanul") SqlSession sql) {
		this.sql = sql;
	}
	
	@Override
	public void customer_insert(CustomerVO vo) {
		sql.insert("customer.insert", vo);
	}

	@Override
	public List<CustomerVO> customer_list() {
		return sql.selectList("customer.list");
	}

	@Override
	public CustomerVO customer_info(int id) {
		return sql.selectOne("customer.info", id);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		sql.update("customer.update", vo);
	}

	@Override
	public void customer_delete(int id) {
		sql.delete("customer.delete", id);
	}

}
