package notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService {

	@Autowired @Qualifier("hanul") SqlSession sql;
	
	@Override
	public List<NoticeVO> list() {
		return sql.selectList("no.list");
	}

	@Override
	public NoticeVO info(int id) {
		return sql.selectOne("no.info", id);
	}

	@Override
	public void insert(NoticeVO vo) {
		sql.insert("no.insert", vo);
	}

	@Override
	public void update(NoticeVO vo) {
		sql.update("no.update", vo);
	}

	@Override
	public void delete(int id) {
		sql.delete("no.delete", id);
	}

	@Override
	public void readcnt(int id) {
		sql.update("no.readcnt", id);
	}

}
