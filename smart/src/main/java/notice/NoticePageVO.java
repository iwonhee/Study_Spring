package notice;

import java.util.List;

import common.PageVO;

public class NoticePageVO extends PageVO {
	private List<NoticeVO> list;

	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
	}
	
}
