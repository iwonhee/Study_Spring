package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("notice")
public class NoticeServiceImpl implements NoticeService {

	@Autowired private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> list() {
		return dao.list();
	}

	@Override
	public NoticeVO info(int id) {
		return dao.info(id);
	}

	@Override
	public void insert(NoticeVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(NoticeVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public void readcnt(int id) {
		dao.readcnt(id);
	}

}
