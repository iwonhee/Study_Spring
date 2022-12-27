package board;

public interface BoardService {
	
	int board_insert(BoardVO vo); //글 신규저장
	BoardPageVO board_list(BoardPageVO page); //글 목록조회(페이지처리)
	BoardVO board_info(int id); //특정 글 정보조회
	int board_read(int id); //글 조회수 처리
	int board_update(BoardVO vo); //글 변경저장
	int board_delete(int id); //글 삭제
	
}
