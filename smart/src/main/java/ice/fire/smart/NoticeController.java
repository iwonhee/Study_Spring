package ice.fire.smart;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberServiceImpl;
import notice.NoticePageVO;
import notice.NoticeService;
import notice.NoticeVO;

@Controller
public class NoticeController {
	
	private NoticeService service;
	public NoticeController(NoticeService notice) {
		this.service = notice;
	}
	
	//답글 저장처리
	@RequestMapping("/reply_insert.no")
	public String reply_insert(NoticeVO vo) {
		//화면에서 입력한 글 정보를 DB에 신규저장
		service.reply_insert(vo);
		return "redirect:list.no";
	}
	
	//답글쓰기 화면 요청
	@RequestMapping("/reply.no")
	public String reply(int id, Model model) {	//@RequestParam
		//원글의 정보 조회해서 답글쓰기화면에 사용할 수 있도록 모델에 담기
		model.addAttribute("vo", service.info(id));
		return "notice/reply";
	}
	
	//첨부파일 다운로드 요청
	@ResponseBody @RequestMapping(value="/download.no", produces="text/html; charset=utf-8")
	public String download(int id, String url, HttpServletRequest req
					, HttpServletResponse res) throws Exception {
		NoticeVO vo = service.info(id);
		boolean download
			= common.fileDownload(vo.getFilename(), vo.getFilepath(), req, res);
		
		if( ! download ) {	//첨부된 파일이 존재하지 않는 경우( 물리적 위치에서 )
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("'");
			msg.append("</script>");
			return msg.toString();
		}else {
			return null;
		}
		
	}
	
	//공지글 delete 처리
	@RequestMapping("/delete.no")
	public String delete(int id, HttpServletRequest req, NoticePageVO page) throws Exception {
		NoticeVO vo = service.info(id);
		service.delete(id);
		
		//첨부파일이 있었다면 물리적파일도 삭제
		fileDelete(vo.getFilepath(), req);
		
		return "redirect:list.no&curPage=" + page.getCurPage()
		+ "&search=" + page.getSearch()
		+ "&keyword=" + URLEncoder.encode(page.getKeyword(), "utf-8");
	}
	
	//파일삭제 메소드
	private void fileDelete(String filepath, HttpServletRequest req) {
		if( filepath != null ) {
			filepath = filepath.replace(common.appURL(req)
						, "d://app"+req.getContextPath());
			File file = new File(filepath);
			if( file.exists() ) file.delete();
		}
	}
	
	//공지글 update 처리
	@RequestMapping("/update.no")
	public String update(NoticeVO vo, NoticePageVO page, MultipartFile file, HttpServletRequest req) throws Exception {
		//수정전 게시글정보 조회
		NoticeVO before = service.info(vo.getId());
		
		//파일 첨부하는 경우
		if( ! file.isEmpty() ) {
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath(common.fileUpload("notice", file, req));
			//첨부되어있던 파일이 있으면 파일도 삭제
			fileDelete(before.getFilepath(), req);
		}else {
		//파일 첨부x
			if( vo.getFilename().isEmpty() ) {
				// 첨부파일 삭제 누름
				fileDelete(before.getFilepath(), req);
			}else {
				// 기존 첨부파일 사용
				vo.setFilename( before.getFilename() );
				vo.setFilepath( before.getFilepath() );
			}
		}
		
		service.update(vo);
		return "redirect:info.no?id=" + vo.getId()
			+ "&curPage=" + page.getCurPage()
			+ "&search=" + page.getSearch()
			+ "&keyword=" + URLEncoder.encode(page.getKeyword(), "utf-8") ;
	}
	
	//공지글 수정화면 연결
	@RequestMapping("/modify.no")
	public String modify(int id, Model model, NoticePageVO page) {
		model.addAttribute("modify", service.info(id));
		model.addAttribute("page", page);
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
	public String info(int id, Model model, NoticePageVO page) {
		//화면에서 사용할 수 있도록 enter키값을 저장
		model.addAttribute("crlf", "\r\n");
		
		//조회수 증가처리
		service.readcnt(id);
		model.addAttribute("info", service.info(id));
		model.addAttribute("page", page);
		return "notice/info";
	}
	
	@Autowired private MemberServiceImpl member;
	@Autowired private CommonService common;
	
	//공지글 목록화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model, NoticePageVO page) {
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
//		model.addAttribute("list", service.list());
		model.addAttribute("page", service.list(page));
		
		return "notice/list";
	}
	
}
