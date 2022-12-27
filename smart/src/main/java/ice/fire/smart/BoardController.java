package ice.fire.smart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardPageVO;
import board.BoardServiceImpl;
import board.BoardVO;

@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	
	
	//신규 글 저장처리
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo) {
		service.board_insert(vo);
		return "redirect:list.bo";
	}
	
	//신규 글쓰기화면 연결
	@RequestMapping("/new.bo")
	public String board() {
		return "board/new";
	}
	
	//방명록 목록화면 요청
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model, BoardPageVO page) {
		
		session.setAttribute("category", "bo");
		model.addAttribute("page", service.board_list(page));
		
		return "board/list";
	}
	
}
