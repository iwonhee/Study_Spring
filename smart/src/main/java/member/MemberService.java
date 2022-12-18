package member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	int member_join(MemberVO vo); //회원가입
	MemberVO member_login(HashMap<String, String> map); //로그인
	MemberVO member_myInfo(String userid); //내정보 보기
	int member_idCheck(String userid); //회원가입시 아이디 중복확인
	int member_myInfo_update(MemberVO vo); //회원정보 변경 : 마이페이지
	int member_delete(String userid); //회원탈퇴
	int member_password_update(MemberVO vo); //비밀번호변경저장-임시비번발급,비번변경
	
	String member_userid_email(MemberVO vo);
	
	//비밀번호 암호화에 사용한 salt 조회
	String member_salt(String userid);
	
	//관리자모드에서는 전체 회원목록 확인
	List<MemberVO> member_list();
}
