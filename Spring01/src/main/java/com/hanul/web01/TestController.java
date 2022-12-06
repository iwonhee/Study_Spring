package com.hanul.web01;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.MemberVO;

@Controller
public class TestController {
	
	// 로그인처리 요청
	@RequestMapping("/login_result")
	public String login(String id, String pw) {
		if(id.equals("admin") && pw.equals("0000")) {
			//로그인 성공 (admin, 0000)
			// return "home";  	// forward
			return "redirect:/";
		}else {
			//로그인 실패
			return "redirect:login";
		}
		
	}
	
	// 로그인화면 요청
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 경로의 형태로 데이터 접근
	@RequestMapping("/joinPath/{name}/{g}/{email}")
	public String join(@PathVariable String name, Model model
					, @PathVariable("g") String gender
					, @PathVariable String email) {
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		model.addAttribute("method", "@PathVariable 방식");
		
		return "member/info";
	}
	
	// 데이터객체 방식으로 파라미터 접근
	@RequestMapping("/joinDataObject")
	public String join(Model model, MemberVO vo) {		// vo 선언만 하고 넘겨주면 getter, setter 안써도 됨
		
		model.addAttribute("method", "데이터객체 방식");
		model.addAttribute("vo", vo);
		
		return "member/info";
	}
	
	// ReqeustParam 방식으로 파라미터 접근
	@RequestMapping("/joinParam")
	public String join(String name	// 변수명이 같아야 자동으로 담긴다 (@RequestParam 안써도 됨)
						, @RequestParam String email
						, @RequestParam("gender") String gender		// 새로운 변수명 쓰기
						, Model model) {	//필요한 정보만 파라미터로 접근
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		model.addAttribute("method", "ReqeustParam 방식");
		
		return "member/info";
	}
	
	// HttpServletRequest 방식으로 파라미터 접근
	@RequestMapping("/joinRequest")
	public String join(HttpServletRequest request, Model model) {
		// 파라미터 정보 담기
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("gender", request.getParameter("gender"));
		model.addAttribute("email", request.getParameter("email"));
		
		model.addAttribute("method", "HttpServletRequest 방식");
		
		return "member/info";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "member/join";
	}
	
	@RequestMapping("/third")
	public ModelAndView third() {
		// 날짜, 시각 정보 출력
		ModelAndView model = new ModelAndView();
		String todayNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		model.addObject("todayNow", todayNow);
		// 화면연결
		model.setViewName("index");
		return model;
	}
	
	// 웹 브라우저 주소에 '/first' 라고 요청할 때 이 메소드를 실행
	// 요청에 대해 이 메소드를 연결
	@RequestMapping("/first")
	public String first( Model m ) {
		// 오늘 날짜 출력하도록 저장 (비즈니스 로직)
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		m.addAttribute("today", today);
		
		return "index";
	}
	
	// '/second' 요청시
	@RequestMapping("/second")
	public String second( Model model ) {
		// 현재 시각 정보 출력
		String now = new SimpleDateFormat("HH:mm:ss").format(new Date());
		model.addAttribute("now", now);
		
		return "index";
	}
}
