package ice.fire.smart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberServiceImpl;
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
	public String insert(NoticeVO vo, MultipartFile file, HttpServletRequest request) {
		//첨부된 파일이 있는 경우
		if( ! file.isEmpty() ) {
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.fileUpload("notice", file, request) );
		}
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
		//화면에서 사용할 수 있도록 enter키값을 저장
		model.addAttribute("crlf", "\r\n");
		
		//조회수 증가처리
		service.readcnt(id);
		model.addAttribute("info", service.info(id));
		return "notice/info";
	}
	
	@Autowired private MemberServiceImpl member;
	@Autowired private CommonService common;
	
	//공지글 목록화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model) {
		//테스트를 위한 임시로그인처리----------------
//		String userid = "admin";
//		String userpw = "651022bc8872";
//		HashMap<String, String> map = new HashMap<>();
//		map.put("userid", userid);
//		//입력한 비번을 salt를 사용해 암호화 후 map에 담기
//		String salt = member.member_salt(userid);
//		userpw = common.getEncrypt(salt, userpw);
//		map.put("userpw", userpw);
//		MemberVO vo = member.member_login(map);
//		session.setAttribute("loginInfo", vo);
		//--------------------------------------------
		session.setAttribute("category", "no");
		model.addAttribute("list", service.list());
		return "notice/list";
	}
	
}
