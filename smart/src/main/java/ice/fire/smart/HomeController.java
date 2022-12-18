package ice.fire.smart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.CommonService;
import member.MemberService;
import member.MemberVO;

@Controller
public class HomeController {
	@Autowired @Qualifier("member") private MemberService service;
	@Autowired private CommonService common;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		//암호화 하지 않은 비밀번호를 암호화해서 저장
//		List<MemberVO> list = service.member_list();
//		for( MemberVO vo : list ) {
//			//비밀번호가 있는 회원의 비밀번호 암호화에 사용할 salt 생성
//			if( vo.getUserpw() != null ) {
//				String salt = common.generateSalt();
//				String pw = common.getEncrypt(salt, vo.getUserpw());
//				vo.setSalt(salt);
//				vo.setUserpw(pw);
//				service.member_myInfo_update(vo);
//			}
//		}
		//-----------------처리후 삭제-------------------
		
		session.setAttribute("category", "");
		return "home";
	}
	
}
