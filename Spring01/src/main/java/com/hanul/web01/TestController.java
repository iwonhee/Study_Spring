package com.hanul.web01;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@RequestMapping("/joinRequest")
	public void join() {
		// 파라미터 정보 담기
		
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
