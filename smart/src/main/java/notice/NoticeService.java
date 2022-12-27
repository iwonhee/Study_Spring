package notice;

import java.util.List;

public interface NoticeService {

	List<NoticeVO> list(); 		//공지글 목록 조회
	NoticePageVO list(NoticePageVO page); 		//공지글 목록 페이지 처리
	NoticeVO info(int id); 		//선택한 공지글 정보 조회
	void insert(NoticeVO vo);	//공지글 입력
	void update(NoticeVO vo);		//공지글 정보 변경
	void delete(int id);		//공지글 삭제
	int reply_insert(NoticeVO vo);  //답글 신규저장
	
	void readcnt(int id);		//조회수 증가
	
	
}
