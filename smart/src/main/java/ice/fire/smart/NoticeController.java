package ice.fire.smart;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import notice.NoticeService;
import notice.NoticeVO;

@Controller
public class NoticeController {
	
	private NoticeService service;
	public NoticeController(NoticeService notice) {
		this.service = notice;
	}
	
	//공지글 delete 처리
	@RequestMapping("/delete.no")
	public String delete(int id) {
		service.delete(id);
		return "redirect:list.no";
	}
	
	//공지글 update 처리
	@RequestMapping("/update.no")
	public String update(NoticeVO vo) {
		service.update(vo);
		return "redirect:info.no?id=" + vo.getId();
	}
	
	//공지글 수정화면 연결
	@RequestMapping("/modify.no")
	public String modify(int id, Model model) {
		model.addAttribute("modify", service.info(id));
		return "notice/modify";
	}
	
	//공지글 insert 처리
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo) {
		service.insert(vo);
		return "redirect:list.no";
	}
	
	//공지글 등록화면 연결
	@RequestMapping("/new.no")
	public String newNotice() {
		return "notice/insert";
	}
	
	//선택한 공지글 정보화면 요청
	@RequestMapping("/info.no")
	public String info(int id, Model model) {
		service.readcnt(id);
		model.addAttribute("info", service.info(id));
		return "notice/info";
	}
	
	//공지글 목록화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "no");
		model.addAttribute("list", service.list());
		return "notice/list";
	}
	
}
