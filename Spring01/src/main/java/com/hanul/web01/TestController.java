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
	
	// �α���ó�� ��û
	@RequestMapping("/login_result")
	public String login(String id, String pw) {
		if(id.equals("admin") && pw.equals("0000")) {
			//�α��� ���� (admin, 0000)
			// return "home";  	// forward
			return "redirect:/";
		}else {
			//�α��� ����
			return "redirect:login";
		}
		
	}
	
	// �α���ȭ�� ��û
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// ����� ���·� ������ ����
	@RequestMapping("/joinPath/{name}/{g}/{email}")
	public String join(@PathVariable String name, Model model
					, @PathVariable("g") String gender
					, @PathVariable String email) {
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		model.addAttribute("method", "@PathVariable ���");
		
		return "member/info";
	}
	
	// �����Ͱ�ü ������� �Ķ���� ����
	@RequestMapping("/joinDataObject")
	public String join(Model model, MemberVO vo) {		// vo ���� �ϰ� �Ѱ��ָ� getter, setter �Ƚᵵ ��
		
		model.addAttribute("method", "�����Ͱ�ü ���");
		model.addAttribute("vo", vo);
		
		return "member/info";
	}
	
	// ReqeustParam ������� �Ķ���� ����
	@RequestMapping("/joinParam")
	public String join(String name	// �������� ���ƾ� �ڵ����� ���� (@RequestParam �Ƚᵵ ��)
						, @RequestParam String email
						, @RequestParam("gender") String gender		// ���ο� ������ ����
						, Model model) {	//�ʿ��� ������ �Ķ���ͷ� ����
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		model.addAttribute("method", "ReqeustParam ���");
		
		return "member/info";
	}
	
	// HttpServletRequest ������� �Ķ���� ����
	@RequestMapping("/joinRequest")
	public String join(HttpServletRequest request, Model model) {
		// �Ķ���� ���� ���
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("gender", request.getParameter("gender"));
		model.addAttribute("email", request.getParameter("email"));
		
		model.addAttribute("method", "HttpServletRequest ���");
		
		return "member/info";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "member/join";
	}
	
	@RequestMapping("/third")
	public ModelAndView third() {
		// ��¥, �ð� ���� ���
		ModelAndView model = new ModelAndView();
		String todayNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		model.addObject("todayNow", todayNow);
		// ȭ�鿬��
		model.setViewName("index");
		return model;
	}
	
	// �� ������ �ּҿ� '/first' ��� ��û�� �� �� �޼ҵ带 ����
	// ��û�� ���� �� �޼ҵ带 ����
	@RequestMapping("/first")
	public String first( Model m ) {
		// ���� ��¥ ����ϵ��� ���� (����Ͻ� ����)
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		m.addAttribute("today", today);
		
		return "index";
	}
	
	// '/second' ��û��
	@RequestMapping("/second")
	public String second( Model model ) {
		// ���� �ð� ���� ���
		String now = new SimpleDateFormat("HH:mm:ss").format(new Date());
		model.addAttribute("now", now);
		
		return "index";
	}
}
