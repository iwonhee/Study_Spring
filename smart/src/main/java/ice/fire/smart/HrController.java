package ice.fire.smart;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.EmpVO;
import hr.HrService;

@Controller
public class HrController {
	
	private HrService service;
	public HrController(HrService hr) {
		this.service = hr;
	}
	
	//신규사원 등록처리
	@RequestMapping("/insert.hr")
	public String insert(EmpVO vo) {
		service.employee_insert(vo);
		return "redirect:list.hr";
	}
	
	//신규사원 등록화면 연결
	@RequestMapping("/new.hr")
	public String newEmp(Model model) {
		model.addAttribute("jobs_list", service.jobs_list());
		model.addAttribute("dept_list", service.dept_list());
		return "employee/insert";
	}
	
	//사원정보 수정저장
	@RequestMapping("/update.hr")
	public String update(EmpVO vo) {
		service.employee_update(vo);
		return "redirect:info.hr?id=" + vo.getEmployee_id();
	}
	
	//사원정보 수정화면 연결
	@RequestMapping("/modify.hr")
	public String modify(int id, Model model) {
		model.addAttribute("jobs_list", service.jobs_list());
		model.addAttribute("dept_list", service.dept_list());
		model.addAttribute("vo", service.employee_info(id));
		return "employee/modify";
	}
	
	//사원정보 삭제
	@RequestMapping("/delete.hr")
	public String delete(int id) {
		service.employee_delete(id);
		return "redirect:list.hr";
	}
	
	//사원정보화면 요청
	@RequestMapping("/info.hr")
	public String info(Model model, int id) {
		model.addAttribute("vo", service.employee_info(id));
		return "employee/info";
	}
	
	//사원목록화면 요청
	@RequestMapping("/list.hr")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "hr");
		
		model.addAttribute("list", service.employee_list());
		
		return "employee/list";
	}
	
	
	
}
